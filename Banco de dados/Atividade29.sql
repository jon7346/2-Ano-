
CREATE DATABASE FaculdadeDB;
GO
USE FaculdadeDB;
GO

go
-- Tabela de alunos
CREATE TABLE Alunos (
IdAluno INT IDENTITY PRIMARY KEY,
Nome VARCHAR(150) NOT NULL,
Email VARCHAR(150),
Telefone VARCHAR(30),
DataCadastro DATETIME DEFAULT GETDATE()
);

-- Tabela de disciplinas
CREATE TABLE Disciplinas (
IdDisciplina INT IDENTITY PRIMARY KEY,
Nome VARCHAR(150) NOT NULL,
CargaHoraria INT NOT NULL
);

-- Ofertas de disciplinas (turmas)

CREATE TABLE Ofertas (
IdOferta INT IDENTITY PRIMARY KEY,
IdDisciplina INT NOT NULL REFERENCES Disciplinas(IdDisciplina),
Semestre VARCHAR(10) NOT NULL, -- Exemplo: &#39;2025/1&#39;
VagasTotais INT NOT NULL,
VagasDisponiveis INT NOT NULL
);

-- Matrículas dos alunos nas disciplinas ofertadas
CREATE TABLE Matriculas (
IdMatricula INT IDENTITY PRIMARY KEY,
IdAluno INT NOT NULL REFERENCES Alunos(IdAluno),
IdOferta INT NOT NULL REFERENCES Ofertas(IdOferta),
DataMatricula DATETIME DEFAULT GETDATE()
);

-- Boletos / Títulos financeiros
CREATE TABLE Titulos (
IdTitulo INT IDENTITY PRIMARY KEY,
IdAluno INT NOT NULL REFERENCES Alunos(IdAluno),
Vencimento DATE NOT NULL,
Valor DECIMAL(10,2) NOT NULL,
ValorPago DECIMAL(10,2) DEFAULT 0,
Saldo DECIMAL(10,2) DEFAULT 0,
Status VARCHAR(20) DEFAULT 'EM_ABERTO' -- EM_ABERTO | PARCIAL | LIQUIDADO |VENCIDO
);

-- Pagamentos realizados
CREATE TABLE Pagamentos (
IdPagamento INT IDENTITY PRIMARY KEY,

IdTitulo INT NOT NULL REFERENCES Titulos(IdTitulo),
DataPgto DATE DEFAULT GETDATE(),
ValorPgto DECIMAL(10,2) NOT NULL
);

-- Log de auditoria
CREATE TABLE AuditLog (
IdLog INT IDENTITY PRIMARY KEY,
TabelaAfetada VARCHAR(50),
Acao VARCHAR(20),
Detalhes VARCHAR(MAX),
DataHora DATETIME DEFAULT GETDATE(),
Usuario VARCHAR(100) DEFAULT SUSER_SNAME()
);
go



go
--Deve listar todos os alunos com boletos vencidos e não pagos (Status = VENCIDO).
Create Procedure PROC_AlunosComBoletosVencidos
	AS BEGIN 
	--
	Select a.Nome, t.Vencimento, t.Valor, (GETDATE() - convert(datetime,t.Vencimento)) as Dias_Em_Atraso  from Alunos a join Titulos t on a.IdAluno = t.IdAluno WHERE
     t.Status = 'VENCIDO'
        

	end; 
go



go
Create Procedure PROC_ReajustarMensalidades
 @Reajuste decimal(7,2)
 as begin 
 
 -- Deve aplicar um reajuste de X% (percentual informado como parâmetro) sobre todos os boletos em aberto (Status = 'EM_ABERTO').
  update Titulos 
  --Ignore qualque erro pois dou
  set Valor = Valor * @Reajuste where status = 'EM_ABERTO'   
 -- Atualize o campo Valor e recalcule o Saldo.
	 update Titulos 
  set Saldo = valor * @Reajuste where Status = 'Em_ABERTO'  
	--Registre a operação na tabela AuditLog informando a data e o percentual aplicado.

	INSERT INTO [dbo].[AuditLog]
			   ([TabelaAfetada]
			   ,[Acao]
			   ,[Detalhes]
			   ,[DataHora]
			   ,[Usuario])
     VALUES
           (
		  'Titulos', --<TabelaAfetada, varchar(50),>
           'Reajuste em boletos em abertps',--<Acao, varchar(20),>
           'percentual: ' + Convert(varchar, @Reajuste) ,--<Detalhes, varchar(max),>
           GETDATE(),--<DataHora, datetime,>
           SUSER_NAME()--<Usuario, varchar(100),>)
		   )

	 end;

go 


go 
Create trigger  TRG_Matriculas_AI_Vagas
on Matriculas
after insert as begin 
/*
-- set based  
 SELECT
    IdOferta,--campo a ser observado para a contagem 
    COUNT(*) AS NovasMatriculas -- Agrupa pelo id 
    INTO #NovasMatriculas -- Cria uma tabela temporia e insere os dados  
    FROM inserted -- seleciona o id oferta da tabela inserted 
    GROUP BY IdOferta; -- organiza pelo id oferta 
  
  IF EXISTS ( -- verifica se existe
        SELECT 1
        FROM Ofertas O
        JOIN #NovasMatriculas I ON O.IdOferta = I.IdOferta -- join nas tabelas
        WHERE (O.VagasDisponiveis - I.NovasMatriculas) < 0 -- apenas as diciplinas da vaga 
    )
    BEGIN
        -- 3. Se não houver, cancela tudo
        RAISERROR ('Não há vagas disponíveis para uma ou mais disciplinas.', 16, 1);
        ROLLBACK TRANSACTION;
        DROP TABLE #NovasMatriculas;
        RETURN;
    END;
	-- 4. Se houver vagas, atualiza o contador (Set-Based)
	else 
	begin 
    UPDATE Ofertas
    SET
        O.VagasDisponiveis = O.VagasDisponiveis - I.NovasMatriculas
    FROM
        Ofertas O JOIN #NovasMatriculas I ON O.IdOferta = I.IdOferta;

    -- 5. Limpa a tabela temporária
    DROP TABLE #NovasMatriculas;
	end;
END;
GO
*/ 
/*
go 
Create trigger  TRG_Matriculas_AI_Vagas
on Matriculas
after insert as begin 
  
 -- Minha solução 
  select i.idOferta , Count(*) as VagasNovas into #NovasMatriculas from inserted i group by i.IdOferta -- conta todas as vagas novas 
 --Verificar se ainda há vagas disponíveis na tabela Ofertas.
 if (select o.VagasDisponiveis - NM.VagasNovas  from Ofertas o inner join #NovasMatriculas NM on o.IdOferta = NM.IdOferta) > 0  
 begin
  --Se houver vagas, diminuir em 1 o campo VagasDisponiveis da oferta correspondente.
  update Ofertas 
  set Ofertas.VagasDisponiveis = VagasDisponiveis - NM.VagasNovas from #NovasMatriculas NM

 end;

 --Se não houver vagas, exibir a mensagem: “Não há vagas disponíveis para esta disciplina.”
 else
 begin
  print('Não há vagas disponíveis para esta disciplina.')
 end;
 end;
go 
*/
-- Minha solução 
 --Verificar se ainda há vagas disponíveis na tabela Ofertas.
  go 
Create trigger  TRG_Matriculas_AI_Vagas
on Matriculas
after insert as begin 
 if (Select VagasDisponiveis from Ofertas) > 0 
 begin
  --Se houver vagas, diminuir em 1 o campo VagasDisponiveis da oferta correspondente.
  update Ofertas 
  set VagasDisponiveis =- 1 where IdDisciplina = (select IdDisciplina from inserted)

 end;

 --Se não houver vagas, exibir a mensagem: “Não há vagas disponíveis para esta disciplina.”
 else
 begin
  print('Não há vagas disponíveis para esta disciplina.')
 end;
 end;
go 


go 
create trigger TRG_Pagamentos_AI_Baixa
on Pagamentos 
after insert as begin 
 --Atualize automaticamente o ValorPago, Saldo e Status do título na tabela Titulos.
 update Titulos
 set ValorPago = (Select i.ValorPgto from inserted i ) where (Select IdTitulo from Titulos) = (select i.IdTitulo from inserted i)
 
 update Titulos
 set Saldo = (select t.Valor from Titulos t ) - (select i.ValorPgto from inserted i)  where (Select IdTitulo from Titulos) = (select i.IdTitulo from inserted i)


--Se o valor pago for igual ao valor → Status = 'LIQUIDADO'
 if ((select t.Valor from Titulos t ) - (select i.ValorPgto from inserted i)) = 0 
 begin
 update  Titulos
 set Status = 'LIQUIDADO'   where (Select IdTitulo from Titulos) = (select i.IdTitulo from inserted i)

 end;
--Se o valor pago for menor → Status = 'PARCIAL'
if ((select t.Valor from Titulos t ) - (select i.ValorPgto from inserted i)) > 0 
 begin
 update  Titulos
 set Status = 'PARCIAL'  where (Select IdTitulo from Titulos) = (select i.IdTitulo from inserted i)

 end;
--Se maior → impedir a operação e exibir: “Valor pago excede o valor do boleto.”
if ((select t.Valor from Titulos t ) - (select i.ValorPgto from inserted i)) < 0 
 begin

  RAISERROR ('Valor pago excede o valor do boleto.', 16, 1)
 
 end;


end;
go 

go
Create Trigger TRG_Pagamentos_AD_ReverterBaixa
on Pagamentos 
after delete as begin 
 --Ao excluir um pagamento, deve reverter o or pago no título.
 update titulos 
 set ValorPago = ValorPago - (select ValorPago from deleted) where IdTitulo = ((select d.IdTitulo from deleted d ))
 --O ValorPago e o Saldo devem voltar ao valor original antes do pagamento.
 update titulos 
 set Saldo = Saldo +(select ValorPago from deleted) where IdTitulo = ((select IdTitulo from deleted))
 
 --Atualize o status para:
 --'EM_ABERTO' se não houver mais pagamentos
	  if ((select t.Valor from Titulos t ) - (select d.ValorPgto from deleted d)) = (select ValorPgto from deleted)
	 begin
	 update  Titulos
	 set Status = 'EM_ABERTO'  where (Select IdTitulo from Titulos) = (select d.IdPagamento from deleted d)

	 end;

 --'PARCIAL' se ainda houver pagamentos parciais
	 if ((select t.Valor from Titulos t ) - (select d.ValorPgto from deleted d)) > 0 
	 begin
	 update  Titulos
	 set Status = 'PARCIAL'  where (Select IdTitulo from Titulos)  = (select d.IdTitulo from deleted d) 

	 end;



end;
go 


go 
create Trigger TRG_Alunos_AU_Audit
on alunos 
after update as begin
 
 Declare @DADOSALTERADOS varchar(255) = '';
 -- Se o nome for alterado 
if (select Nome from inserted ) <> (select Nome from deleted  )
begin
  select @DADOSALTERADOS =+ ' ' + 'Campo = nome ' + 'De : ' + (select Nome from deleted  ) +'Para:'+ (select Nome from inserted );   
end;
 --Se o email for alterado 
if (select Email from inserted) <> (select Email from deleted )
begin
 select @DADOSALTERADOS =+ ' ' + 'Campo = nome ' + 'De : ' + (select Email from deleted  ) +'Para:'+ (select email from inserted );   
end;

--Se o email for alterado 
if (select Telefone from inserted) <> (select Telefone from deleted  )
begin
 select @DADOSALTERADOS =+  ' ' + 'Campo = nome ' + 'De : ' + (select Telefone from deleted  ) +'Para:'+ (select Telefone from inserted );   
end;


INSERT INTO [dbo].[AuditLog]
           ([TabelaAfetada]
           ,[Acao]
           ,[Detalhes]
           ,[DataHora]
           ,[Usuario])
     VALUES
           (
		   'alunos',--<TabelaAfetada, varchar(50),>
           'alterar dados cadastrados',--<Acao, varchar(20),>
           @DADOSALTERADOS,--<Detalhes, varchar(max),>
           GETDATE(),--<DataHora, datetime,>
           SUSER_NAME()--<Usuario, varchar(100),>
		   );

		
end;
go 


