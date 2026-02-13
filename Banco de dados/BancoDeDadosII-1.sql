Create database Loja 

--1. Atualizem automaticamente o estoque quando itens de pedido são incluídos,
--alterados ou excluídos.
--2. Reponham o estoque quando um pedido é cancelado.
--3. Registrem em log (auditoria) as alterações sensíveis (colunas de contato de
--clientes e preços/nome de produtos).


Create table clientes (
IdCLiente int identity primary key,
NomeCompleto varchar(120) not null, 
Email varchar(255) not null,
telefone varchar(40), 
DataCadastro datetime default 1,
Ativo bit default 1   

)

Create table Produtos (
IdProduto int identity primary key, 
Nome varchar(120) not null,
Preco decimal(12,2) check(Preco >= 0 ),
EstoqueAtual int default 0 Check(EstoqueAtual >= 0),
DataCadastro datetime default getdate(),
Ativo Bit default 1 
)

Create table Pedidos(
IdPedido int identity primary key,
IdCliente int,
foreign key (IdCliente) references clientes(IdCliente),
DataPedido datetime default 1, 
Cancelado bit default 0,
Observacoes varchar(400) 
)

Create table ItensPedido(
IdItemPedido int identity primary key,
IdPedido int, 
foreign key (IdPedido) references Pedidos(IdPedido),
idProduto int,
foreign key (IdProduto) references Produtos(IdProduto),
quantidade int check(quantidade > 0),
PrecoUnitario decimal(12,2) check(PrecoUnitario >=0)
) 

Create table MovimentosEstoque(
IdMovimento int identity primary key, 
DataEvento Datetime default getdate(),
IdPedido  int, 
IdItemPedido int,
IdProduto int, 
Acao varchar(30),
QuantidadeMovimento int,
Usuario varchar(128),
Maquina varchar(128),
Aplicação varchar(128), 
Sessao int 
)

Create table LogAuditoria (
IdAuditoria int identity primary key, 
DataEvento Datetime default getdate(),
NomeTabela varchar(100),
Chave varchar (100), 
Coluna Sysname,
ValorAntigo varchar(max), 
ValorNovo varchar(max), 
Acao varchar(10),
Usuario varchar(128), 
Maquina varchar(128),
Aplicacao varchar(128),
Sessao int
)
--Criação do trigger 
--Trigger de Estoque (na tabela ItensPedido)
-- INSERT: reduzir EstoqueAtual do produto; registrar no MovimentoEstoquecomo VENDA.
-- UPDATE: calcular diferença entre nova e antiga Quantidade; ajustar estoque; registrar como VENDA_ATUALIZADA.
-- DELETE: repor estoque; registrar como VENDA_EXCLUIDA.
-- Regra de negócio: não permitir estoque negativo → abortar (THROW).



go 
create trigger TRGEstoque --Cabeçalho do trigger
on ItensPedido
after insert, update, delete as begin -- definindo qual ação ria acionar o trigger 
-- inserted são as informações adicionadas ou novas 
-- deleted são as informações deletadas ou antigas 
-- update deleta as novas informações e a salva na tabela deleted 


-- registra todas as acoes que forem apenas insercoes ou seja vendas/inserts 
if exists(Select 1 from inserted) and not exists(Select 1 from deleted)
begin
insert into MovimentosEstoque
( IdPedido, IdItemPedido, IdProduto, Acao, QuantidadeMovimento, Usuario, Maquina, Aplicação, Sessao)
Select i.IdPedido , i.IdItemPedido, i.idProduto , 'Venda' , i.quantidade , SUSER_SNAME(),HOST_NAME() ,APP_NAME(), @@SPID from inserted i  -- prenchendo as variaveis com valores originados de inserted ou seja o novos valores inseridos 
-- reduz os produtos do pedido do estoque atual 
update Produtos 
Set EstoqueAtual = EstoqueAtual- i.quantidade from inserted i
end;

-- separa os updates dos inserts  
if exists(Select 1 from inserted) and exists(select 1 from deleted) 
begin-- começa 
insert into MovimentosEstoque
( IdPedido, IdItemPedido, IdProduto, Acao, QuantidadeMovimento, Usuario, Maquina, Aplicação, Sessao)
Select i.IdPedido , i.IdItemPedido , i.idProduto , 'Venda_atualizada' , (i.quantidade - d.quantidade) , SUSER_SNAME() ,HOST_NAME()  ,APP_NAME() , @@SPID  from inserted i join deleted d on d.IdItemPedido = i.IdItemPedido    -- prenchendo as variaveis com valores originados de inserted ou seja o novos valores inseridos 
update Produtos 
-- Set EstoqueAtual = EstoqueAtual - QuantidadeMovimento from MovimentosEstoque - Será que funfa
Set EstoqueAtual = EstoqueAtual - ( i.quantidade - d.quantidade) from inserted i join deleted d on i.IdItemPedido = d.IdItemPedido
-- termina 
end;
-- separa os delete dos inserts 
if exists(Select 1 from deleted) and not Exists(Select 1 from inserted)
begin 
insert into MovimentosEstoque
( IdPedido, IdItemPedido, IdProduto, Acao, QuantidadeMovimento, Usuario, Maquina, Aplicação, Sessao)
Select d.IdPedido, d.IdItemPedido , d.idProduto, 'VENDA_EXCLUIDA', d.quantidade, SUSER_SNAME(), HOST_NAME() , APP_NAME(), @@SPID  from deleted d  -- prenchendo as variaveis com valores originados de inserted ou seja o novos valores inseridos 
update produtos 
Set EstoqueAtual = EstoqueAtual + deleted.quantidade from deleted
end;

end; -- termina o trigger 
go 

go 
create trigger TRGCancelamento 
on Pedidos 
after update as begin 
if (Select Cancelado from inserted) = 1
begin
update Produtos  
set EstoqueAtual = EstoqueAtual + itp.quantidade from inserted i join ItensPedido itp on i.IdPedido = itp.IdPedido
insert into MovimentosEstoque
( IdPedido, IdItemPedido, IdProduto, Acao, QuantidadeMovimento, Usuario, Maquina, Aplicação, Sessao)
Select i.IdPedido, itp.IdItemPedido , itp.idProduto, 'Cancelamento_Reposicao', itp.quantidade, SUSER_SNAME(), HOST_NAME() , APP_NAME(), @@SPID  from inserted i join ItensPedido itp on i.IdPedido = itp.IdPedido -- prenchendo as variaveis com valores originados de inserted ou seja o novos valores inseridos 

end;


end; 
go
--teste do trigger TGRestoque 
insert into clientes values('jonathan', 'jonathan@gmail.com', '17000804', GETDATE(), 1);  
insert into Produtos values('Escova', 12.2, 12, GETDATE(), 1 )
insert into Pedidos  values(1, GETDATE(),0, null);
insert into ItensPedido values(1,1,3,4.4);

select * from MovimentosEstoque;
select * from Produtos;
select * from ItensPedido;

update ItensPedido 
set quantidade =12 where IdPedido = 1;

delete 

go
create trigger TRGauditoria 
on clientes 
after update as begin 

if (select Email from clientes) != (select Email from inserted) or (select telefone from clientes) != (select telefone from inserted)
begin

insert into LogAuditoria values(GETDATE(), 'clientes', (select IdCLiente from clientes), )  

end; 

end; 
go 