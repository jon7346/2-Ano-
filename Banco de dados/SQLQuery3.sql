USE [FaculdadeDB]
GO

INSERT INTO [dbo].[Disciplinas]
           ([Nome]
           ,[CargaHoraria])
     VALUES
           (
		   'Adiministração',--<Nome, varchar(150),>
           480--<CargaHoraria, int,>
		   )
GO


USE [FaculdadeDB]
GO

INSERT INTO [dbo].[Ofertas]
           ([IdDisciplina]
           ,[Semestre]
           ,[VagasTotais]
           ,[VagasDisponiveis])
     VALUES
           (
		   1,--<IdDisciplina, int,>
           'primeiro',--<Semestre, varchar(10),>
           18,--<VagasTotais, int,>
           18--<VagasDisponiveis, int,>
		   )


GO

USE [FaculdadeDB]
GO

INSERT INTO [dbo].[Pagamentos]
           ([IdTitulo]
           ,[DataPgto]
           ,[ValorPgto])
     VALUES
            --(<IdTitulo, int,>
           ,--<DataPgto, date,>
           ,--<ValorPgto, decimal(10,2),>)
GO

USE [FaculdadeDB]
GO

INSERT INTO [dbo].[Titulos]
           ([IdAluno]
           ,[Vencimento]
           ,[Valor]
           ,[ValorPago]
           ,[Saldo]
           ,[Status])
     VALUES
           (
		   1,--<IdAluno, int,>
           convert(date,Convert(int,GETDATE())+7),--<Vencimento, date,>
           ,--<Valor, decimal(10,2),>
           ,--<ValorPago, decimal(10,2),>
           ,--<Saldo, decimal(10,2),>
           --<Status, varchar(20),>)
GO



