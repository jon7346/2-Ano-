CREATE DATABASE LojaPet;
GO
USE LojaPet;
GO
-- Clientes
CREATE TABLE Clientes (
IdCliente INT IDENTITY PRIMARY KEY,
Nome VARCHAR(150) NOT NULL,
Telefone VARCHAR(30),
Email VARCHAR(150),
DataCadastro DATETIME DEFAULT GETDATE()
);
-- Pets
CREATE TABLE Pets (
IdPet INT IDENTITY PRIMARY KEY,
IdCliente INT NOT NULL REFERENCES Clientes(IdCliente),
NomePet VARCHAR(100) NOT NULL,
Especie VARCHAR(50), -- Ex: Cachorro, Gato
Raca VARCHAR(100),

DataNascimento DATE,
DataCadastro DATETIME DEFAULT GETDATE()
);
-- Produtos (medicamentos)
CREATE TABLE Produtos (
IdProduto INT IDENTITY PRIMARY KEY,
Nome VARCHAR(150) NOT NULL,
Tipo VARCHAR(50) NOT NULL, -- Ex. &#39;VACINA&#39;, &#39;ANTIPARASITARIO&#39;, &#39;SUPLEMENTO&#39;
Estoque INT NOT NULL DEFAULT 0,
Preco DECIMAL(10,2) NOT NULL
);
-- Compras (reposição de estoque)
CREATE TABLE Compras (
IdCompra INT IDENTITY PRIMARY KEY,
Fornecedor VARCHAR(150),
DataCompra DATETIME DEFAULT GETDATE()
);
CREATE TABLE ItensCompra (
IdItemCompra INT IDENTITY PRIMARY KEY,
IdCompra INT NOT NULL REFERENCES Compras(IdCompra),
IdProduto INT NOT NULL REFERENCES Produtos(IdProduto),
Quantidade INT NOT NULL CHECK (Quantidade > 0)
);
-- Vendas de medicamentos relacionadas ao pet
CREATE TABLE VendasMedicamentos (
IdVenda INT IDENTITY PRIMARY KEY,
IdCliente INT NOT NULL REFERENCES Clientes(IdCliente),
IdPet INT NULL REFERENCES Pets(IdPet),
DataVenda DATETIME DEFAULT GETDATE(),
Total DECIMAL(12,2) DEFAULT 0
);

CREATE TABLE ItensVendaMed (
IdItemVenda INT IDENTITY PRIMARY KEY,
IdVenda INT NOT NULL REFERENCES VendasMedicamentos(IdVenda),
IdProduto INT NOT NULL REFERENCES Produtos(IdProduto),
Quantidade INT NOT NULL CHECK (Quantidade > 0),
PrecoUnit DECIMAL(10,2) NOT NULL
);

-- Agendamentos de consulta (criado automaticamente quando vacina vendida)
CREATE TABLE Agendamentos (
IdAgendamento INT IDENTITY PRIMARY KEY,
IdCliente INT NOT NULL REFERENCES Clientes(IdCliente),
IdPet INT NULL REFERENCES Pets(IdPet),
DataAgendada DATETIME NOT NULL,
Motivo VARCHAR(200),
CriadoPor VARCHAR(100) DEFAULT  SUSER_SNAME()

);
go 
create trigger TRG_ItensVendaMed_AL_Estoque 
on ItensVendaMed 
after insert as begin 

update VendasMedicamentos 
 set Total =  ((select Quantidade * PrecoUnit from ItensVendaMed)) where (Select IdVenda from inserted ) = (Select IdVenda from VendasMedicamentos)

end;
go 
USE [LojaPet]
GO

USE [LojaPet]
GO

INSERT INTO [dbo].[Produtos]
           ([Nome]
           ,[Tipo]
           ,[Estoque]
           ,[Preco])
     VALUES
           (
		   --<Nome, varchar(150),>
		   'Produto1',
           --,<Tipo, varchar(50),>
		   'remédio',
           --,<Estoque, int,>
		   100,
           --,<Preco, decimal(10,2),>
		   1.0
		   )
GO
USE [LojaPet]
GO

INSERT INTO [dbo].[Clientes]
           ([Nome]
           ,[Telefone]
           ,[Email]
           ,[DataCadastro])
     VALUES
           (
		   --<Nome, varchar(150),>
           'Jonathan',
		   '17 1223414',    --<Telefone, varchar(30),>
           'Jonathan@gmail.com',--<Email, varchar(150),>
            GETDATE()--<DataCadastro, datetime,>)
			)
 go





INSERT INTO [dbo].[VendasMedicamentos]
           ([IdCliente]
           
           ,[DataVenda]
           )
     VALUES
           (
		   1, --<IdCliente, int,> 1 
           null,--<IdPet, int,>
           GETDATE()--<DataVenda, datetime,>
           --<Total, decimal(12,2),>)
		   )




INSERT INTO [dbo].[ItensVendaMed]
           ([IdVenda]
           ,[IdProduto]
           ,[Quantidade]
           ,[PrecoUnit])
     VALUES(
           --(<IdVenda, int,>
		   1,
           --<IdProduto, int,>
           1,
		   --<Quantidade, int,>
		   10,
           --<PrecoUnit, decimal(10,2),>)
            1.0)


GO


