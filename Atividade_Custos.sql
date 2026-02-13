CREATE DATABASE CustosTI_Auto;
GO
USE CustosTI_Auto;
GO

CREATE TABLE Estado_MPM (
    IdProduto INT PRIMARY KEY,
    SaldoQtd INT DEFAULT 0,
    SaldoValor DECIMAL(18,2) DEFAULT 0
);
go
-- Memória para devoluções (Grava qual era a média na hora da venda)
CREATE TABLE Log_Saidas_MPM (
    Id INT IDENTITY(1,1),
    IdMovOriginal INT,
    IdProduto INT,
    CustoMedioNaEpoca DECIMAL(10,2)
);
go
-- Relatório Final (Formato Simples: 1 linha por operação)
CREATE TABLE Relatorio_MPM (
    IdLinha INT IDENTITY(1,1) PRIMARY KEY,
    IdMov INT,
    Produto VARCHAR(50),
    Data DATE,
    Operacao VARCHAR(100),
    Entrada INT,
    Saida INT,
    CustoMovimento DECIMAL(10,2), -- CMV
    SaldoQtd INT,
    SaldoValorTotal DECIMAL(10,2),
    CustoUnitarioMedio DECIMAL(10,2)
);
GO

-- Tabela de Produtos (Onde cadastramos o SSD)
CREATE TABLE Produtos (
    IdProduto INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL
);

-- Tabela de Movimentações (Agora ligada ao Produto)
CREATE TABLE Movimentacoes (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    IdProduto INT NOT NULL REFERENCES Produtos(IdProduto), -- <--- NOVO
    DataMov DATE NOT NULL,
    Operacao VARCHAR(30) NOT NULL, 
    Quantidade INT NOT NULL,
    ValorUnitario DECIMAL(10,2) NULL 
);

-- Tabela de Lotes PEPS (Controla estoque por produto)
CREATE TABLE Estoque_Lotes_PEPS (
    IdLote INT IDENTITY(1,1) PRIMARY KEY,
    IdProduto INT NOT NULL, -- <--- NOVO
    DataEntrada DATE,
    QtdSaldo INT,
    CustoUnit DECIMAL(10,2)
);

-- Log para Devoluções
CREATE TABLE Log_Saidas_PEPS (
    Id INT IDENTITY(1,1),
    IdMovOriginal INT,
    IdProduto INT, -- <--- NOVO
    IdLoteOrigem INT,
    Qtd INT,
    CustoUnit DECIMAL(10,2)
);

-- Tabela Visual Final (Relatório)
CREATE TABLE Relatorio_PEPS (
    IdLinha INT IDENTITY(1,1) PRIMARY KEY,
    IdMov INT,
    Produto VARCHAR(50), -- <--- NOVO (Para mostrar o nome no relatório)
    Data DATE,
    Operacao VARCHAR(100),
    Entrada INT,
    Saida INT,
    CustoMovimento DECIMAL(10,2),
    SaldoQtd INT,
    SaldoValorTotal DECIMAL(10,2),
    CustoUnitarioAtual DECIMAL(10,2)
);
GO
/* ==========================================================================
   1. TRIGGER MPM 
   ========================================================================== */
CREATE TRIGGER TRG_Calculo_MPM
ON Movimentacoes
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @Id INT, @IdProd INT, @Data DATE, @Op VARCHAR(30), @Qtd INT, @Val DECIMAL(10,2);
    
    DECLARE curMPM CURSOR LOCAL FAST_FORWARD FOR
        SELECT Id, IdProduto, DataMov, Operacao, Quantidade, ValorUnitario 
        FROM inserted ORDER BY DataMov, Id;

    OPEN curMPM;
    FETCH NEXT FROM curMPM INTO @Id, @IdProd, @Data, @Op, @Qtd, @Val;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- 1. Inicializa o estado do produto se não existir
        IF NOT EXISTS (SELECT 1 FROM Estado_MPM WHERE IdProduto = @IdProd)
        BEGIN
            INSERT INTO Estado_MPM (IdProduto, SaldoQtd, SaldoValor) VALUES (@IdProd, 0, 0);
        END

        -- 2. Carrega o saldo atual
        DECLARE @S_Qtd INT, @S_Val DECIMAL(18,2), @S_Medio DECIMAL(18,2);
        SELECT @S_Qtd = SaldoQtd, @S_Val = SaldoValor FROM Estado_MPM WHERE IdProduto = @IdProd;
        
        -- Calcula média atual antes da operação (para saídas)
        IF @S_Qtd > 0 SET @S_Medio = @S_Val / @S_Qtd ELSE SET @S_Medio = 0;

        DECLARE @CustoMov DECIMAL(10,2) = 0;
        DECLARE @Entrada INT = NULL, @Saida INT = NULL;
        DECLARE @NomeProd VARCHAR(50) = (SELECT Nome FROM Produtos WHERE IdProduto = @IdProd);

        -- ========================================================
        -- LÓGICA DO CUSTO MÉDIO
        -- ========================================================

        -- A. COMPRA (Entra valor novo -> Média muda)
        IF @Op = 'COMPRA'
        BEGIN
            SET @S_Qtd += @Qtd;
            SET @S_Val += (@Qtd * @Val);
            SET @CustoMov = @Qtd * @Val;
            SET @Entrada = @Qtd;
        END

        -- B. SAÍDAS (Sai valor pela Média Atual)
        ELSE IF @Op IN ('VENDA', 'PERDA', 'AJUSTE', 'PERDA/ROUBO')
        BEGIN
            SET @S_Qtd -= ABS(@Qtd);
            SET @CustoMov = ABS(@Qtd) * @S_Medio; -- Usa a média vigente
            SET @S_Val -= @CustoMov;
            SET @Saida = ABS(@Qtd);

            -- Se for Venda, guarda essa média para o caso de devolução futura
            IF @Op = 'VENDA' 
                INSERT INTO Log_Saidas_MPM (IdMovOriginal, IdProduto, CustoMedioNaEpoca) 
                VALUES (@Id, @IdProd, @S_Medio);
        END

        -- C. DEVOLUÇÃO VENDA (Volta com a média antiga)
        ELSE IF @Op = 'DEVOLUCAO_VENDA'
        BEGIN
            DECLARE @MedioAntigo DECIMAL(10,2);
            -- Busca a média que foi usada na última venda
            SELECT TOP 1 @MedioAntigo = CustoMedioNaEpoca 
            FROM Log_Saidas_MPM 
            WHERE IdProduto = @IdProd 
            ORDER BY IdMovOriginal DESC;
            
            SET @S_Qtd += @Qtd;
            SET @S_Val += (@Qtd * @MedioAntigo); -- Reverte valor histórico
            SET @CustoMov = @Qtd * @MedioAntigo;
            SET @Entrada = @Qtd;
        END

        -- D. DEVOLUÇÃO COMPRA (Sai com valor exato da nota)
        ELSE IF @Op = 'DEVOLUCAO_COMPRA'
        BEGIN
            SET @S_Qtd -= @Qtd;
            SET @S_Val -= (@Qtd * @Val); -- Tira o valor específico
            SET @CustoMov = @Qtd * @Val;
            SET @Saida = @Qtd;
        END

        -- 3. Recalcula a Média FINAL após a operação
        IF @S_Qtd > 0 SET @S_Medio = @S_Val / @S_Qtd ELSE SET @S_Medio = 0;

        -- 4. Atualiza a tabela de Estado
        UPDATE Estado_MPM SET SaldoQtd = @S_Qtd, SaldoValor = @S_Val WHERE IdProduto = @IdProd;
        
        -- 5. Grava no Relatório (Simples: 1 linha só)
        INSERT INTO Relatorio_MPM (IdMov, Produto, Data, Operacao, Entrada, Saida, CustoMovimento, SaldoQtd, SaldoValorTotal, CustoUnitarioMedio)
        VALUES (
            @Id, @NomeProd, @Data, UPPER(@Op), 
            @Entrada, @Saida, @CustoMov, 
            @S_Qtd, @S_Val, @S_Medio
        );

        FETCH NEXT FROM curMPM INTO @Id, @IdProd, @Data, @Op, @Qtd, @Val;
    END
    CLOSE curMPM; DEALLOCATE curMPM;
END;
GO

/* ==========================================================================
   2. TRIGGER PEPS 
   ========================================================================== */
CREATE TRIGGER TRG_Calculo_PEPS
ON Movimentacoes
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Id INT, @IdProd INT, @Data DATE, @Op VARCHAR(30), @Qtd INT, @Val DECIMAL(10,2);
    
    DECLARE curPEPS CURSOR LOCAL FAST_FORWARD FOR
        SELECT Id, IdProduto, DataMov, Operacao, Quantidade, ValorUnitario 
        FROM inserted ORDER BY DataMov, Id;

    OPEN curPEPS;
    FETCH NEXT FROM curPEPS INTO @Id, @IdProd, @Data, @Op, @Qtd, @Val;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        DECLARE @CustoTotalMov DECIMAL(10,2) = 0;
        DECLARE @Entrada INT = NULL, @Saida INT = NULL;
        DECLARE @NomeProd VARCHAR(50) = (SELECT Nome FROM Produtos WHERE IdProduto = @IdProd);

        -- A. COMPRA
        IF @Op = 'COMPRA'
        BEGIN
            INSERT INTO Estoque_Lotes_PEPS (IdProduto, DataEntrada, QtdSaldo, CustoUnit) 
            VALUES (@IdProd, @Data, @Qtd, @Val);
            SET @CustoTotalMov = @Qtd * @Val;
            SET @Entrada = @Qtd;
        END

        -- B. SAÍDAS (VENDA, PERDA, ETC)
        ELSE IF @Op IN ('VENDA', 'PERDA', 'AJUSTE', 'PERDA/ROUBO')
        BEGIN
            DECLARE @QtdFalta INT = ABS(@Qtd);
            SET @Saida = ABS(@Qtd);
            
            WHILE @QtdFalta > 0
            BEGIN
                DECLARE @IdLote INT, @QtdLote INT, @CustoLote DECIMAL(10,2);
                
                -- Pega o lote mais velho DESTE PRODUTO (@IdProd)
                SELECT TOP 1 @IdLote=IdLote, @QtdLote=QtdSaldo, @CustoLote=CustoUnit 
                FROM Estoque_Lotes_PEPS 
                WHERE QtdSaldo > 0 AND IdProduto = @IdProd -- <--- FILTRO IMPORTANTE
                ORDER BY IdLote;

                IF @IdLote IS NULL BREAK; 

                DECLARE @Baixa INT = CASE WHEN @QtdLote >= @QtdFalta THEN @QtdFalta ELSE @QtdLote END;
                UPDATE Estoque_Lotes_PEPS SET QtdSaldo = QtdSaldo - @Baixa WHERE IdLote = @IdLote;
                
                INSERT INTO Log_Saidas_PEPS (IdMovOriginal, IdProduto, IdLoteOrigem, Qtd, CustoUnit) 
                VALUES (@Id, @IdProd, @IdLote, @Baixa, @CustoLote);

                SET @CustoTotalMov += (@Baixa * @CustoLote);
                SET @QtdFalta -= @Baixa;
            END
        END

        -- C. DEVOLUÇÃO VENDA
        ELSE IF @Op = 'DEVOLUCAO_VENDA'
        BEGIN
            DECLARE @CustoOrigem DECIMAL(10,2);
            -- Busca histórico DESTE PRODUTO
            SELECT TOP 1 @CustoOrigem = CustoUnit 
            FROM Log_Saidas_PEPS 
            WHERE IdProduto = @IdProd 
            ORDER BY IdMovOriginal DESC, Id DESC;

            INSERT INTO Estoque_Lotes_PEPS (IdProduto, DataEntrada, QtdSaldo, CustoUnit) 
            VALUES (@IdProd, @Data, @Qtd, @CustoOrigem);
            
            SET @CustoTotalMov = @Qtd * @CustoOrigem;
            SET @Entrada = @Qtd;
        END

        -- D. DEVOLUÇÃO COMPRA
        ELSE IF @Op = 'DEVOLUCAO_COMPRA'
        BEGIN
            UPDATE TOP(1) Estoque_Lotes_PEPS 
            SET QtdSaldo = QtdSaldo - @Qtd 
            WHERE CustoUnit = @Val AND QtdSaldo >= @Qtd AND IdProduto = @IdProd; -- <--- FILTRO
            
            SET @CustoTotalMov = @Qtd * @Val;
            SET @Saida = @Qtd;
        END

        -- ========================================================
        -- REGISTRO VISUAL (COM NOME DO PRODUTO)
        -- ========================================================
        
        -- Linha da Movimentação
        INSERT INTO Relatorio_PEPS (IdMov, Produto, Data, Operacao, Entrada, Saida, CustoMovimento)
        VALUES (@Id, @NomeProd, @Data, UPPER(@Op), @Entrada, @Saida, @CustoTotalMov);

        -- Linhas de Saldo Detalhado (Por Lote DESTE PRODUTO)
        INSERT INTO Relatorio_PEPS (IdMov, Produto, Data, Operacao, SaldoQtd, SaldoValorTotal, CustoUnitarioAtual)
        SELECT 
            @Id,
            @NomeProd,
            @Data, 
            '   => Lote de ' + CONVERT(VARCHAR, DataEntrada, 103), 
            QtdSaldo, 
            (QtdSaldo * CustoUnit), 
            CustoUnit
        FROM Estoque_Lotes_PEPS
        WHERE QtdSaldo > 0 AND IdProduto = @IdProd -- <--- FILTRO
        ORDER BY IdLote;

        FETCH NEXT FROM curPEPS INTO @Id, @IdProd, @Data, @Op, @Qtd, @Val;
    END
    CLOSE curPEPS; DEALLOCATE curPEPS;
END;
GO

-- Inserimos o produto do trabalho
INSERT INTO Produtos (Nome) VALUES ('SSD 1TB');
/* ==========================================================================
   3. CARGA DE DADOS (CORRIGIDA COM ID DO PRODUTO)
   ========================================================================== */
-- Pegamos o ID do SSD (deve ser 1)
DECLARE @P INT = (SELECT IdProduto FROM Produtos WHERE Nome = 'SSD 1TB');

INSERT INTO Movimentacoes (IdProduto, DataMov, Operacao, Quantidade, ValorUnitario) VALUES
(@P,'2025-01-05','COMPRA',120,10.00),
(@P,'2025-01-20','VENDA',50,NULL),
(@P,'2025-02-10','COMPRA',80,11.00),
(@P,'2025-02-25','VENDA',60,NULL),
(@P,'2025-02-28','DEVOLUCAO_VENDA',10,NULL),
(@P,'2025-03-10','COMPRA',90,12.00),
(@P,'2025-03-18','VENDA',75,NULL),
(@P,'2025-03-30','PERDA',5,NULL),
(@P,'2025-04-05','COMPRA',100,12.50),
(@P,'2025-04-20','VENDA',90,NULL),
(@P,'2025-05-10','DEVOLUCAO_COMPRA',10,12.50),
(@P,'2025-05-25','VENDA',40,NULL),
(@P,'2025-06-15','PERDA',4,NULL),
(@P,'2025-06-30','COMPRA',70,13.00),
(@P,'2025-07-10','VENDA',60,NULL),
(@P,'2025-08-01','COMPRA',90,13.50),
(@P,'2025-08-18','VENDA',80,NULL),
(@P,'2025-09-30','COMPRA',100,14.00),
(@P,'2025-10-10','VENDA',100,NULL),
(@P,'2025-11-20','PERDA',6,NULL),
(@P,'2025-12-01','COMPRA',80,14.50),
(@P,'2025-12-15','VENDA',70,NULL),
(@P,'2025-12-28','AJUSTE',-8,NULL);
GO

--Relatóro do Peps
Select * from Relatorio_PEPS 
--Relatóro do MPM
Select * from Relatorio_MPM

Drop database CustosTI_Auto