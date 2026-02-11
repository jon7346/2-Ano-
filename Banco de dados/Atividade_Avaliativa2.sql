
--******************************************************************************************/

/*==============================*
 | 1) CRIAÇÃO DO BANCO/TABELAS  |
 *==============================*/
-- drop database HotelDB
CREATE DATABASE HotelDB;
GO
USE HotelDB;
GO

-- Clientes
CREATE TABLE Clientes (
    IdCliente INT IDENTITY PRIMARY KEY,
    Nome        VARCHAR(150) NOT NULL,
    Email       VARCHAR(150) NULL,
    Telefone    VARCHAR(30)  NULL,
    DataCadastro DATETIME DEFAULT GETDATE()
);
go

-- Tipos de quarto (tarifa base por diária)
CREATE TABLE TiposQuarto (
    IdTipo INT IDENTITY PRIMARY KEY,
    Descricao  VARCHAR(80) NOT NULL,
    TarifaBase DECIMAL(10,2) NOT NULL CHECK (TarifaBase >= 0)
);
go
-- Quartos
CREATE TABLE Quartos (
    IdQuarto INT IDENTITY PRIMARY KEY,
    Numero   VARCHAR(10) NOT NULL UNIQUE,
    IdTipo   INT NOT NULL REFERENCES TiposQuarto(IdTipo),
    Status   VARCHAR(15) NOT NULL DEFAULT 'LIVRE'  -- LIVRE | MANUTENCAO
        CHECK (Status IN ('LIVRE','MANUTENCAO'))
);
go

-- Reservas
CREATE TABLE Reservas (
    IdReserva INT IDENTITY PRIMARY KEY,
    IdCliente INT NOT NULL REFERENCES Clientes(IdCliente),
    IdQuarto  INT NOT NULL REFERENCES Quartos(IdQuarto),
    DataEntrada DATE NOT NULL,
    DataSaida   DATE NOT NULL,
    Status VARCHAR(15) NOT NULL DEFAULT 'PENDENTE' -- PENDENTE | CONFIRMADA | CHECKIN | CHECKOUT | CANCELADA
        CHECK (Status IN ('PENDENTE','CONFIRMADA','CHECKIN','CHECKOUT','CANCELADA')),
    Total DECIMAL(12,2) NOT NULL DEFAULT 0
);
go

-- Catálogo de extras (ex.: frigobar, lavanderia)
CREATE TABLE ExtrasCatalogo (
    IdExtra INT IDENTITY PRIMARY KEY,
    Descricao VARCHAR(100) NOT NULL,
    Preco DECIMAL(10,2) NOT NULL CHECK (Preco >= 0)
);
go
-- Consumos por reserva (extras)
CREATE TABLE Consumos (
    IdConsumo INT IDENTITY PRIMARY KEY,
    IdReserva INT NOT NULL REFERENCES Reservas(IdReserva),
    IdExtra   INT NOT NULL REFERENCES ExtrasCatalogo(IdExtra),
    Qtde      INT NOT NULL CHECK (Qtde > 0),
    PrecoUnit DECIMAL(10,2) NOT NULL CHECK (PrecoUnit >= 0)
);
go

-- Cobrança: títulos e pagamentos (podem ser por reserva)
CREATE TABLE Titulos (
    IdTitulo  INT IDENTITY PRIMARY KEY,
    IdReserva INT NOT NULL REFERENCES Reservas(IdReserva),
    Vencimento DATE NOT NULL,
    Valor DECIMAL(12,2) NOT NULL,
    ValorPago DECIMAL(12,2) NOT NULL DEFAULT 0,
    Saldo     DECIMAL(12,2) NOT NULL DEFAULT 0,
    Status    VARCHAR(15) NOT NULL DEFAULT 'EM_ABERTO'  -- EM_ABERTO | PARCIAL | LIQUIDADO | VENCIDO
        CHECK (Status IN ('EM_ABERTO','PARCIAL','LIQUIDADO','VENCIDO'))
);
go
CREATE TABLE Pagamentos (
    IdPagamento INT IDENTITY PRIMARY KEY,
    IdTitulo INT NOT NULL REFERENCES Titulos(IdTitulo),
    DataPgto DATE NOT NULL DEFAULT GETDATE(),
    ValorPgto DECIMAL(12,2) NOT NULL CHECK (ValorPgto > 0)
);
go

-- Log simples (opcional)
CREATE TABLE AuditLog (
    IdLog INT IDENTITY PRIMARY KEY,
    TabelaAfetada VARCHAR(50),
    Acao VARCHAR(20),
    Detalhes VARCHAR(MAX),
    DataHora DATETIME DEFAULT GETDATE(),
    Usuario VARCHAR(100) DEFAULT SUSER_SNAME()
);
GO

--P1) PROC_QuartosDisponiveis-> Listar quartos livres no intervalo (sem sobreposição de reservas ativas).
create procedure PROC_QuartosDisponiveis 
@DataInicio date,
@DataFinal date 
as begin 
    
	select * from Quartos q left join Reservas r  on r.IdQuarto = q.IdQuarto  where (DataEntrada <> @DataInicio and DataSaida <> @DataFinal) or (DataEntrada is null and DataSaida is null) 


end;
go

 -- P2) PROC_ReajustarTarifas
 ---> Reajustar TiposQuarto.TarifaBase em @Percentual e retornar resumo.
create procedure  PROC_ReajustarTarifas 
@Percentual decimal 
as begin 
 
 update TiposQuarto set
 TarifaBase = TarifaBase * @Percentual

 select * from TiposQuarto;


end;
go
-- Clientes (até 10)
INSERT INTO Clientes (Nome, Email, Telefone) VALUES
('Ana Martins','ana@hotel.com','(16) 90000-0001'),
('Bruno Siqueira','bruno@hotel.com','(16) 90000-0002'),
('Carla Ramos','carla@hotel.com','(16) 90000-0003'),
('Diego Alves','diego@hotel.com','(16) 90000-0004'),
('Elisa Cunha','elisa@hotel.com','(16) 90000-0005'),
('Felipe Souza','felipe@hotel.com','(16) 90000-0006'),
('Gabriela Lopes','gabriela@hotel.com','(16) 90000-0007'),
('Henrique Teixeira','henrique@hotel.com','(16) 90000-0008'),
('Isabela Farias','isabela@hotel.com','(16) 90000-0009'),
('João Prado','joao@hotel.com','(16) 90000-0010');
go
-- Tipos de quarto (até 10)
INSERT INTO TiposQuarto (Descricao, TarifaBase) VALUES
('Standard', 220.00),
('Deluxe',   350.00),
('Suite',    550.00),
('Economy',  180.00),
('Premium',  420.00),
('Family',   300.00),
('Business', 400.00),
('Vista Mar', 600.00),
('Loft',     480.00),
('Master',   700.00);
go
-- Quartos (até 10)
INSERT INTO Quartos (Numero, IdTipo, Status) VALUES
('101', 1, 'LIVRE'),
('102', 1, 'LIVRE'),
('201', 2, 'LIVRE'),
('202', 2, 'LIVRE'),
('301', 3, 'LIVRE'),
('302', 4, 'LIVRE'),
('401', 5, 'LIVRE'),
('402', 6, 'LIVRE'),
('501', 7, 'LIVRE'),
('601', 8, 'LIVRE');
go
-- Reservas (até 6 – simples; triggers recalcularão Total)
INSERT INTO Reservas (IdCliente, IdQuarto, DataEntrada, DataSaida, Status) VALUES
(1, 1, '2025-03-10', '2025-03-12', 'PENDENTE'),
(2, 3, '2025-03-11', '2025-03-14', 'CONFIRMADA'),
(3, 5, '2025-03-15', '2025-03-18', 'PENDENTE'),
(4, 2, '2025-03-12', '2025-03-13', 'PENDENTE'),
(5, 4, '2025-03-20', '2025-03-22', 'PENDENTE'),
(6, 6, '2025-03-25', '2025-03-28', 'PENDENTE');
go

-- Extras catálogo (até 10)
INSERT INTO ExtrasCatalogo (Descricao, Preco) VALUES
('Água Mineral', 6.00),
('Refrigerante', 10.00),
('Snack', 8.50),
('Lavanderia (kg)', 25.00),
('Café da Manhã', 35.00),
('Estacionamento', 20.00),
('Transfer Aeroporto', 120.00),
('Late Checkout', 150.00),
('Espumante', 180.00),
('Massagem', 220.00);
go
-- Consumos (até 6 – alguns para testar total)
INSERT INTO Consumos (IdReserva, IdExtra, Qtde, PrecoUnit) VALUES
(1, 1, 2, 6.00),
(1, 2, 1, 10.00),
(2, 5, 2, 35.00),
(3, 4, 1, 25.00),
(4, 6, 1, 20.00),
(6, 3, 3, 8.50);
go
-- Títulos (até 6 – 1 por reserva)
INSERT INTO Titulos (IdReserva, Vencimento, Valor, ValorPago, Saldo, Status) VALUES
(1, '2025-03-05', 0, 0, 0, 'EM_ABERTO'),
(2, '2025-03-06', 0, 0, 0, 'EM_ABERTO'),
(3, '2025-03-10', 0, 0, 0, 'EM_ABERTO'),
(4, '2025-03-10', 0, 0, 0, 'EM_ABERTO'),
(5, '2025-03-18', 0, 0, 0, 'EM_ABERTO'),
(6, '2025-03-22', 0, 0, 0, 'EM_ABERTO');

GO

 --P3) PROC_ExtratoReserva 
 --        -> Retornar capa da reserva + diárias + extras + total detalhado.
create procedure PROC_ExtratoReserva 
 as begin 
  select 
  r.IdReserva, 
  Sum(Datediff(DAY,r.DataEntrada,r.DataSaida)) as dias, 
  SUM(C.Qtde * C.PrecoUnit) as extras,  
  SUM((C.Qtde * C.PrecoUnit) + Total) as Total_Detalhado
  from Reservas r join Consumos C on C.IdReserva = r.IdReserva group by r.IdReserva
 end; 
go
-- P4) PROC_ClientesComTitulosVencidos
--         -> Listar clientes com títulos vencidos e em aberto (considerar @DataRef ou GETDATE())
create procedure PROC_ClientesComTitulosVencidos 
as begin 
 
  select c.*, t.Status from Clientes c join reservas r  on r.IdCliente = c.IdCliente join Titulos t on t.IdReserva = r.IdReserva where t.Status = 'EM_ABERTO' or t.Status = 'VENCIDO'
end; 

go
--    T1) TRG_Reservas_AI_ValidaECalcula (AFTER INSERT)
 --        -> Validar datas (saida > entrada), checar sobreposição do quarto, calcular diárias*tarifa.
 --        -> Em caso de violação: 'Quarto indisponivel no periodo' (ou mensagem clara).


create trigger TRG_Reservas_AI_ValidaECalcula on 
reservas 
after insert as begin 
  IF (SELECT DataSaida FROM inserted) <= (SELECT DataEntrada FROM inserted)
  begin
   print('A data de saida tem que ser maior que a data de entrada' )
  end; 
  else if(Select COUNT(*) from Reservas r join inserted i on i.IdReserva = i.IdReserva 
   where (r.DataEntrada = i.DataEntrada and i.DataSaida = r.DataSaida)) > 0
   begin
    
	print('quarto insdísponivel no periodo')
     
    end;
  else 
    update Reservas 
	set Total =  (DATEDIFF(day, i.DataEntrada, i.DataSaida) * tq.TarifaBase) from  inserted i  join Quartos q on q.IdQuarto = i.IdQuarto join TiposQuarto tq on tq.IdTipo = q.IdTipo   

 end;
go


-- T2) TRG_Reservas_AU_RevalidaERecalcula (AFTER UPDATE)
-- Repete validação e recálculo se datas/quarto mudarem

create trigger TRG_Reservas_AU_RevalidaERecalcula
on Reservas after update 
as begin 

if exists(select * from inserted ) and exists(select * from deleted)
begin 
  if (select IdQuarto from inserted)<>( select r.IdQuarto from deleted r) or  
     (select DataEntrada from inserted) <> (select DataEntrada from deleted) or 
     (select DataSaida from inserted) <> (select DataSaida from deleted) 

  begin
		 IF (SELECT DataSaida FROM inserted) <= (SELECT DataEntrada FROM inserted)
	  begin
	   print('A data de saida tem que ser maior que a data de entrada' )
	  end; 
		  else if(Select COUNT(*) from Reservas r join inserted i on i.IdReserva = i.IdReserva 
	   where (r.DataEntrada = i.DataEntrada and i.DataSaida = r.DataSaida)) > 0
	   begin
    
		print('quarto insdísponivel no periodo')
     
		end;
		else
		begin
		 UPDATE Reservas
            SET
                Total = (DATEDIFF(day, i.DataEntrada, i.DataSaida) * tq.TarifaBase) +
                        ISNULL((SELECT SUM(c.Qtde * c.PrecoUnit) FROM Consumos c WHERE c.IdReserva = i.IdReserva), 0)
            FROM
                Reservas R
            JOIN
                inserted i ON R.IdReserva = i.IdReserva
            JOIN
                Quartos q ON i.IdQuarto = q.IdQuarto
            JOIN
                TiposQuarto tq ON q.IdTipo = tq.IdTipo;
		end;
  end;
end;
end;
go
-- T3) TRG_Consumos_AUD_Total (AFTER INSERT, UPDATE, DELETE)
-- Recalcular Total da reserva somando extras
CREATE TRIGGER TRG_Consumos_AUD_Total
ON Consumos
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Reservas
    SET
        Total = ISNULL((SELECT (DATEDIFF(day, r.DataEntrada, r.DataSaida) * tq.TarifaBase)
                        FROM Reservas r
                        JOIN Quartos q ON r.IdQuarto = q.IdQuarto
                        JOIN TiposQuarto tq ON q.IdTipo = tq.IdTipo
                        WHERE r.IdReserva = R.IdReserva), 0)
                +
                ISNULL((SELECT SUM(c.Qtde * c.PrecoUnit)
                        FROM Consumos c
                        WHERE c.IdReserva = R.IdReserva), 0)
    FROM
        Reservas R
 
    WHERE
        R.IdReserva IN (SELECT IdReserva FROM inserted)
        OR R.IdReserva IN (SELECT IdReserva FROM deleted);
END;
GO

-- T4) TRG_Pagamentos_AI_Baixa (AFTER INSERT)
-- Impede pagamento acima do saldo; atualiza ValorPago/Saldo/Status
CREATE TRIGGER TRG_Pagamentos_AI_Baixa
ON Pagamentos
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

   
    IF (SELECT (t.Saldo - i.ValorPgto)
        FROM Titulos t
        JOIN inserted i ON t.IdTitulo = i.IdTitulo) < 0
    BEGIN
        PRINT 'Valor pago excede o saldo do titulo.';
    END
    ELSE
    BEGIN
        UPDATE Titulos 
        SET
            ValorPago = t.ValorPago + i.ValorPgto,
            Saldo = t.Saldo - i.ValorPgto,
            Status = CASE
                WHEN (t.Saldo - i.ValorPgto) = 0 THEN 'LIQUIDADO'
                ELSE 'PARCIAL'
            END
        FROM
            Titulos t
        JOIN
            inserted i ON t.IdTitulo = i.IdTitulo;
    END
END;
GO

-- Clientes (até 10)
INSERT INTO Clientes (Nome, Email, Telefone) VALUES
('Ana Martins','ana@hotel.com','(16) 90000-0001');

go
-- Tipos de quarto (até 10)
INSERT INTO TiposQuarto (Descricao, TarifaBase) VALUES
('Master',   700.00);
go
-- Quartos (até 10)
INSERT INTO Quartos (Numero, IdTipo, Status) VALUES
('602', 8, 'LIVRE');
go
-- Reservas (até 6 – simples; triggers recalcularão Total)
INSERT INTO Reservas (IdCliente, IdQuarto, DataEntrada, DataSaida, Status) VALUES
(7, 7, '2025-03-25', '2025-03-28', 'PENDENTE');
go

-- Extras catálogo (até 10)
INSERT INTO ExtrasCatalogo (Descricao, Preco) VALUES
('Massagem', 220.00);
go
-- Consumos (até 6 – alguns para testar total)
INSERT INTO Consumos (IdReserva, IdExtra, Qtde, PrecoUnit) VALUES
(7, 4, 3, 8.50);
go
-- Títulos (até 6 – 1 por reserva)
INSERT INTO Titulos (IdReserva, Vencimento, Valor, ValorPago, Saldo, Status) VALUES
(7, '2025-03-22', 0, 0, 0, 'EM_ABERTO');

GO
