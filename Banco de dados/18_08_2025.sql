CREATE database anotações; 


CREATE TABLE dbo.Clientes (

Id INT IDENTITY(1,1) PRIMARY KEY,

Nome VARCHAR(100) NOT NULL,

Email VARCHAR(255) NOT NULL,

DataCadastro DATETIME NOT NULL DEFAULT GETDATE(),

Ativo BIT NOT NULL DEFAULT 1

)


CREATE TABLE dbo.Log_Auditoria (

Id INT IDENTITY(1,1) PRIMARY KEY,

DataEvento DATETIME DEFAULT GETDATE(),

Acao VARCHAR(10) NOT NULL, -- UPDATE ou DELETE

Tabela VARCHAR(30) NOT NULL, -- 'Clientes'

Chave VARCHAR(100) NOT NULL, -- Id do cliente

Coluna VARCHAR(30) NOT NULL, -- Nome, Email etc.

ValorAntigo VARCHAR(MAX) NULL,

ValorNovo VARCHAR(MAX) NULL,

Usuario VARCHAR(128) NULL, -- SUSER_SNAME()

Hostname VARCHAR(128) NULL -- HOST_NAME()
)


select * from Log_Auditoria; 


--Create trigger NomeTrigger 
--ON nome da tabela  
--after insert, update, delete 
--as
--begin 
-- lógica da trigger  
--end 

GO 
CREATE TRIGGER TRG_update -- cabeçalho do trigger 
ON Clientes -- planilha que ira ser monitorada 
AFTER INSERT, UPDATE, DELETE -- lista de todas as açoes que iran ativar o trigger 
AS 
BEGIN

if EXISTS(Select 1 from inserted) and exists(select 1 from deleted) -- se existir algo ou uma ação que foi realizada ela ira ser inserida
begin -- determina inicio da tomada de desci
-- inserção dos dados 
insert into dbo.Log_Auditoria 
(Acao, Tabela, Chave, Coluna, ValorAntigo, ValorNovo, Usuario, Hostname) -- campos a serem preenchidos 
Select 
'UPDATE' as Acao, -- valor e nome do campo
'Clientes' as Tabela, 
CAST(i.Id AS nvarchar(100)) AS Chave, 
'Nome' as Coluna, 
d.Nome AS ValorAntigo, 
i.Nome AS ValorNovo, 
SUSER_NAME() AS Usuario, -- Suser_Name  retorna o nome do usuario 
HOST_NAME() AS Hostname  -- retorna o app que esta acessando
From inserted i 
join deleted d ON d.id = i.id 
where isnull(d.Nome, '')<>isnull(i.Nome,'');

INSERT INTO dbo.Log_Auditoria
(Acao, Tabela, Chave, Coluna, ValorAntigo, ValorNovo, Usuario, Hostname)
SELECT
'UPDATE', 'Clientes', CAST(i.Id AS NVARCHAR(100)),
'Email', d.Email, i.Email, SUSER_SNAME(), HOST_NAME()
FROM inserted i
JOIN deleted d ON d.Id = i.Id
WHERE ISNULL(d.Email, N'') <> ISNULL(i.Email, N'');
END

END;
-- correção
go
CREATE TRIGGER TRG_update -- cabeçalho do trigger 
ON Clientes -- planilha que ira ser monitorada 
AFTER INSERT, UPDATE, DELETE -- lista de todas as açoes que iran ativar o trigger 
AS 
BEGIN 
if exists (Select 1 from deleted) and not exists (select 1 from inserted) 
begin 
 --nome 
  insert into dbo.Log_Auditoria 
   (Acao, Tabela, Chave, Coluna, ValorAntigo, ValorNovo, Usuario, Hostname)
   Select 'delete', 'Clientes', cast(d.id as varchar(100)), 'Nome', NULL, SUSER_SNAME(), HOST_NAME()
   From deleted d; 

   --email 
   insert into dbo.Log_Auditoria 
   (Acao, Tabela, Chave, Coluna, ValorAntigo, ValorNovo, Usuario, Hostname)
   SElect 'delete', 'Clientes', cast(d.id as varchar(100)),'Email' d.Email,null, suser_name(), host_name() 
   From deleted d; 
 
end; 
go 
  
--atividade 

Create table produtos (
id int identity(1,1) primary key,
nome varchar(250), 
preco decimal ,
ativo bit default 1 
)

Create table Log_produtos (
Id INT IDENTITY(1,1) PRIMARY KEY,

DataEvento DATETIME DEFAULT GETDATE(),

Acao VARCHAR(10) NOT NULL, -- UPDATE ou DELETE

Tabela VARCHAR(30) NOT NULL, -- 'Clientes'

Chave VARCHAR(100) NOT NULL, -- Id do cliente

Coluna VARCHAR(30) NOT NULL, -- Nome, Email etc.

ValorAntigo VARCHAR(MAX) NULL,

ValorNovo VARCHAR(MAX) NULL,

Usuario VARCHAR(128) NULL, -- SUSER_SNAME()

Hostname VARCHAR(128) NULL -- HOST_NAME()

)

go --definindo o inicio (quase como uma segunda query )
Create trigger dbo.tgr_produtos -- criação do trigger 
on produtos  -- escollhendo a tabela 
after update, delete as begin -- definindo as mudanças que o ativaram   

if exists(Select nome, preco from inserted) and exists(Select nome, preco from deleted)-- Verificação se nome e preco foram inseridos e deletados ou seja alterados 

begin -- definição de inicio do processo pelo trigger 
insert into Log_produtos -- insere dentro de log as informações 
(Acao, Tabela, Chave, Coluna, ValorAntigo, ValorNovo, Usuario, Hostname) --  define as informalções a serem inseridaas 
Select 'Update', 'Produtos', CAST(i.id as nvarchar(100)), 'Nome, Preco', d.Nome, i.Nome, SUSER_SNAME(), HOST_NAME() -- dados a serem colocados nos respectivos lugares inseridos acima 
from inserted i join deleted d ON i.id = d.id -- define da onde vem os dados inseridos como se fossem tabelas  
end 

insert into Log_produtos 
(Acao, Tabela, Chave, Coluna, ValorAntigo, ValorNovo, Usuario, Hostname)
Select 'Delete', 'Produtos', CAST(id as nvarchar(100)), 'Nome, Preço', Nome ,null,SUSER_NAME(), HOST_NAME() 
from deleted 

 end; 
go


Insert into produtos('sofoa', 100.00);