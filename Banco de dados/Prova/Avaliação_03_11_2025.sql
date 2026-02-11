/*P1) PROC_OrcamentosPendentes 
-> Listar Ordens de Serviço com Status = 'ABERTA' 
abertas há mais de 7 Dias.

*/
create procedure PROC_OrcamentosPendentes 
as begin 
  
   select * from OrdensServico OS where Status = 'ABERTA' AND  -7 >= DATEDIFF(day, GETDATE(), os.DataAbertura) 
end;
select * from OrdensServico
-- Teste 
INSERT INTO [dbo].[Clientes]
           ([Nome]
           ,[Telefone]
           ,[Email]
           ,[DataCadastro])
     VALUES
           ('Jonathan',--<Nome, varchar(150),>
           '17 9808909',--<Telefone, varchar(30),>
           'jonathan@email.com',--<Email, varchar(150),>
           GETDATE() --<DataCadastro, datetime,>)

            )
GO

INSERT INTO [dbo].[Veiculos]
           ([IdCliente]
           ,[Placa]
           ,[Modelo]
           ,[Ano])
     VALUES
           (1, --<IdCliente, int,>
            'abc1234' ,--<Placa, varchar(8),>
            'Corsa',--<Modelo, varchar(100),>
             2000--<Ano, int,>
			 )
go



INSERT INTO [dbo].[OrdensServico]
           ([IdCliente]
           ,[IdVeiculo]
           ,[DataAbertura]
           ,[Status]
           ,[Total])
     VALUES
           ( 1 ,--<IdCliente, int,>
             1 ,--<IdVeiculo, int,>
            (GETDATE() - convert(datetime,30)),--<DataAbertura, datetime,>
           'ABERTA',--<Status, varchar(20),>
           12345.99--<Total, decimal(12,2),>)
)
GO


--P2) PROC_ReajustarPrecosServicos 
-- -> Reajustar ServicosCatalogo.PrecoBase pelo percentual informado e retornar resultado.

create procedure PROC_ReajustarPrecosServicos 
@Reajuste decimal(7,2)
as begin

 update ServicosCatalogo 
 set PrecoBase = PrecoBase * @Reajuste  

 select PrecoBase from ServicosCatalogo

end; 



INSERT INTO [dbo].[ServicosCatalogo]
           ([Descricao]
           ,[PrecoBase])
     VALUES
           ('Produto-teste',--<Descricao, varchar(150),>
           1000.00--<PrecoBase, decimal(10,2),>
		   )
GO

--P3) PROC_DetalharOS 
-- -> Retornar um relatório da OS: cabeçalho + itens de serviço + itens de peça + total.

create procedure PROC_DetalharOS  
as begin

Select os.IdOS, sc.Descricao ,ITS.Qtde, p.Descricao ,itp.Qtde, os.Total  from OrdensServico os 
join ItensServico ITS on ITS.IdOS = os.IdOS 
join ItensPeca itp on itp.IdOS = os.IdOS
join Pecas p on p.IdPeca = itp.IdPeca
join ServicosCatalogo sc on sc.IdServico  = ITS.IdServico

end; 

--teste
INSERT INTO [dbo].[ItensServico]
           ([IdOS]
           ,[IdServico]
           ,[Qtde]
           ,[PrecoUnit])
     VALUES
           (
		   1, --<IdOS, int,>
           1,--<IdServico, int,>
           10,--<Qtde, int,>
           100.00--<PrecoUnit, decimal(10,2),>
		   )
GO

INSERT INTO [dbo].[Pecas]
           ([Descricao]
           ,[Estoque]
           ,[PrecoCusto]
           ,[PrecoVenda])
     VALUES
           ('peça comum de corsa ', --<Descricao, varchar(150),>
           '100',--<Estoque, int,>
          10.00 ,--<PrecoCusto, decimal(10,2),>
          20.00--<PrecoVenda, decimal(10,2),>
		   )
GO


INSERT INTO [dbo].[ItensPeca]
           ([IdOS]
           ,[IdPeca]
           ,[Qtde]
           ,[PrecoUnit])
     VALUES
           (
		   1,--<IdOS, int,>
           1,--<IdPeca, int,>
           10,--<Qtde, int,>
           20.00--<PrecoUnit, decimal(10,2),>
		   )
GO


create trigger TRG_ItensPeca_AUD_EstoqueETotal 
on itenspeca
AFTER INSERT, UPDATE, DELETE as begin 

 if (select p.Estoque - i.Qtde  from pecas p join inserted i on i.IdPeca = p.IdPeca) > 0
 begin
  update Pecas 
  set Estoque = Estoque - (select Qtde from inserted) where (select IdPeca from inserted) = Pecas.IdPeca;
  update OrdensServico
  set Total = Total + (select Qtde * PrecoUnit from inserted) WHERE (SELECT IdOS FROM inserted) = IdOS ;

 end;
 else 
 begin
   print('o estoque de peças é insuficiente')
 end;

 if not exists(select 1 from inserted ) and exists (select 1 from deleted)
 begin
  update Pecas 
  set Estoque = Estoque - (select Qtde from deleted) where (select IdPeca from deleted) = Pecas.IdPeca;
  update OrdensServico
  set Total = Total - (select Qtde * PrecoUnit from deleted) WHERE (SELECT IdOS FROM deleted) = IdOS ;
 end;

  if  exists(select 1 from inserted ) and exists (select 1 from deleted)
  begin 
  update Pecas 
  set Estoque = Estoque + (select d.Qtde - i.Qtde from deleted d join inserted i on d.IdItemPeca = i.IdItemPeca ) where (select IdPeca from inserted) = Pecas.IdPeca;;
  update OrdensServico
  set Total = Total + (select (d.Qtde * d.PrecoUnit) - (i.Qtde * i.PrecoUnit) from deleted d join inserted i on d.IdItemPeca = i.IdItemPeca )WHERE (SELECT IdOS FROM inserted) = IdOS 

  end; 
 end;
 go
 select * from Pecas
 select * from OrdensServico
 --teste
 INSERT INTO [dbo].[ItensPeca]
           ([IdOS]
           ,[IdPeca]
           ,[Qtde]
           ,[PrecoUnit])
     VALUES
           (
		   1,--<IdOS, int,>
           1,--<IdPeca, int,>
           10,--<Qtde, int,>
           20.00--<PrecoUnit, decimal(10,2),>
		   )
GO
 select * from Pecas
 select * from OrdensServico



create trigger TRG_ItensServico_AUD_Total
on itensServico
AFTER INSERT, UPDATE, DELETe as begin 
  
  if exists(select 1 from inserted) and not exists(select 1 from deleted)
  begin 
    update OrdensServico 
	set Total = total  + (select i.PrecoUnit * i.Qtde from inserted i ) where IdOS = (select idOS from inserted)


  end;

   if exists(select 1 from inserted) and exists(select 1 from deleted)
  begin 
    update OrdensServico 
	set Total = total  + (select (i.PrecoUnit * i.Qtde) - (d.PrecoUnit * d.Qtde) from inserted i
	join deleted d on i.IdItemServ = d.IdItemServ ) where IdOS = (select idOS from deleted)


  end;
   if not exists(select 1 from inserted) and exists(select 1 from deleted)
  begin 
    update OrdensServico 
	set Total = total  + (select d.PrecoUnit * d.Qtde from deleted d ) where IdOS = (select idOS from deleted)
	end;

  end;
  go 
   select * from ItensServico
   select * from OrdensServico
  INSERT INTO [dbo].[ItensServico]
           ([IdOS]
           ,[IdServico]
           ,[Qtde]
           ,[PrecoUnit])
     VALUES
           (
		   1, --<IdOS, int,>
           1,--<IdServico, int,>
           10,--<Qtde, int,>
           100.00--<PrecoUnit, decimal(10,2),>
		   )
GO
 select * from Pecas
 select * from OrdensServico