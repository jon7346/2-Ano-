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



-- Minha solução 
 --Verificar se ainda há vagas disponíveis na tabela Ofertas.
 go 
Create trigger  TRG_Matriculas_AI_Vagas
on Matriculas
after insert as begin 
 if (Select VagasDisponiveis from Ofertas o inner join inserted i on i.IdOferta = o.IdOferta) > 0 
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
    set ValorPago = titulos.ValorPago +  i.ValorPgto from inserted i where titulos.IdTitulo = i.IdTitulo;

   update Titulos
    set Saldo = titulos.Saldo - i.ValorPgto from inserted i where titulos.IdTitulo = i.IdTitulo;
--Se o valor pago for igual ao valor → Status = 'LIQUIDADO'

	if ((select t.ValorPago - i.ValorPgto from Titulos t inner join inserted i on i.IdTitulo = t.IdTitulo)) = 0 
	begin
	update  Titulos
	set Status = 'LIQUIDADO'  where Titulos.IdTitulo = (Select i.IdTitulo from inserted i) 

    end; 
--Se o valor pago for menor → Status = 'PARCIAL'
	if ((select t.ValorPago - i.ValorPgto from Titulos t inner join inserted i on i.IdTitulo = t.IdTitulo)) > 0 
	 begin
	 update  Titulos
	 set Status = 'PARCIAL'  where  Titulos.IdTitulo  =(Select i.IdTitulo from inserted i)  

	 end;
--Se maior → impedir a operação e exibir: “Valor pago excede o valor do boleto.”
if ((select t.ValorPago - i.ValorPgto from Titulos t inner join inserted i on i.IdTitulo = t.IdTitulo)) < 0 
 begin

  /*RAISERROR ('Valor pago excede o valor do boleto.', 16, 1)*/
  print('Valor pago excede o valor do boleto.')
 
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
	  if ((select  t.ValorPago - d.ValorPgto  from Titulos t inner join deleted d on d.IdTitulo = t.IdTitulo ) = (Select t.valor from Titulos t ))  /*((select t.Valor from Titulos t ) - (select d.ValorPgto from deleted d)) = (select ValorPgto from deleted)*/
	    
	 begin
	 update  Titulos
	 set Status = 'EM_ABERTO'  where (Select IdTitulo from Titulos) = (select d.IdPagamento from deleted d)

	 end;

 --'PARCIAL' se ainda houver pagamentos parciais
	 else
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
if (select Nome from inserted ) <> (select Nome from deleted)
begin
  select @DADOSALTERADOS =+ ' ' + 'Campo = nome ' + 'De : ' + (select Nome from deleted  ) +'Para:'+ (select Nome from inserted );   
end;
 --Se o email for alterado 
if (select Email from inserted) <> (select Email from deleted)
begin
 select @DADOSALTERADOS =+ ' ' + 'Campo = nome ' + 'De : ' + (select Email from deleted  ) +'Para:'+ (select email from inserted );   
end;

--Se o email for alterado 
if (select Telefone from inserted) <> (select Telefone from deleted)
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
