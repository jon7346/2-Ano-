


CREATE DATABASE LivrariaDB;
GO

USE LivrariaDB;
GO

CREATE TABLE Clientes (
    IdCliente INT IDENTITY PRIMARY KEY,
    Nome VARCHAR(150) NOT NULL,
    Email VARCHAR(150)
);

CREATE TABLE Livros (
    IdLivro INT IDENTITY PRIMARY KEY,
    Titulo VARCHAR(200) NOT NULL,
    Autor VARCHAR(150),
    Preco DECIMAL(10, 2) NOT NULL,
    Estoque INT NOT NULL
);

CREATE TABLE Vendas (
    IdVenda INT IDENTITY PRIMARY KEY,
    IdCliente INT REFERENCES Clientes(IdCliente),
    DataVenda DATETIME DEFAULT GETDATE(),
    TotalVenda DECIMAL(10, 2) DEFAULT 0
);

CREATE TABLE ItensVenda (
    IdItemVenda INT IDENTITY PRIMARY KEY,
    IdVenda INT REFERENCES Vendas(IdVenda),
    IdLivro INT REFERENCES Livros(IdLivro),
    Quantidade INT NOT NULL,
    PrecoUnitario DECIMAL(10, 2) NOT NULL
);

-- Tabela de auditoria (para a Trigger 4)
CREATE TABLE HistoricoPrecos (
    IdHistorico INT IDENTITY PRIMARY KEY,
    IdLivro INT,
    TituloAntigo VARCHAR(200),
    PrecoAntigo DECIMAL(10, 2),
    DataAlteracao DATETIME DEFAULT GETDATE()
);
GO
--2. Tarefas (O que você deve fazer)
--Parte 1: Procedures

--PROC_AplicarAumentoLivros
--Objetivo: Criar uma procedure que recebe um percentual (ex: 10.0) como parâmetro.
--Ação: Aplicar um aumento de preço (usando a fórmula que vimos em aula) em todos os livros da tabela Livros que custam mais de R$ 50,00


--PROC_BuscarVendasPorCliente
--Objetivo: Criar uma procedure que recebe o @IdCliente como parâmetro.
--Ação: Deve listar todas as vendas (Vendas) e os itens (ItensVenda) daquele cliente, mostrando DataVenda, Titulo do livro, Quantidade e PrecoUnitario.
 create procedure PROC_BuscarVendasPorCliente
 @IdCliente INT
as begin

 select * from Vendas v join ItensVenda iv on v.IdVenda = iv.IdVenda join Livros L on L.IdLivro = iv.IdLivro where v.IdCliente = @IdCliente
 

end;


--Parte 2: Triggers

--(Faça-as no estilo "linha-a-linha" que aprendemos.)

--TRG_ItensVenda_AI_Estoque

--Tabela: ItensVenda

--Evento: AFTER INSERT

--Ação: Ao inserir um item de venda, verificar se a Quantidade inserida é maior que o Estoque do livro na tabela Livros.

--Se o estoque for insuficiente (Estoque < Quantidade), impedir a operação (RAISERROR e ROLLBACK) com a mensagem "Estoque insuficiente.".

--Se houver estoque, diminuir o Estoque na tabela Livros.

--TRG_ItensVenda_AI_Total

--Tabela: ItensVenda

--Evento: AFTER INSERT

--Ação: Atualizar o TotalVenda na tabela Vendas. O TotalVenda deve ser somado com o valor do item inserido (Quantidade * PrecoUnitario).

--TRG_ItensVenda_AD_ReverterEstoque

--Tabela: ItensVenda

--Evento: AFTER DELETE

--Ação: Ao excluir um item de venda (cancelar), o Estoque deve voltar para a tabela Livros (ou seja, some a Quantidade do item excluído de volta ao Estoque).

--TRG_Livros_AU_AuditPreco

--Tabela: Livros

--Evento: AFTER UPDATE

--Ação: Se o Preco do livro for alterado, inserir um registro na tabela HistoricoPrecos, guardando o IdLivro, o Titulo e o PrecoAntigo (pegar da tabela deleted).


INSERT INTO [dbo].[Clientes]
           ([Nome]
           ,[Email])
     VALUES
           --(<Nome, varchar(150),>
           ,--<Email, varchar(150),>)


GO



INSERT INTO [dbo].[HistoricoPrecos]
           ([IdLivro]
           ,[TituloAntigo]
           ,[PrecoAntigo]
           ,[DataAlteracao])
     VALUES
           --(<IdLivro, int,>
           ,--<TituloAntigo, varchar(200),>
           ,--<PrecoAntigo, decimal(10,2),>
           ,--<DataAlteracao, datetime,>)
GO



INSERT INTO [dbo].[ItensVenda]
           ([IdVenda]
           ,[IdLivro]
           ,[Quantidade]
           ,[PrecoUnitario])
     VALUES
           (<IdVenda, int,>
           ,<IdLivro, int,>
           ,<Quantidade, int,>
           ,<PrecoUnitario, decimal(10,2),>)
GO



INSERT INTO [dbo].[Livros]
           ([Titulo]
           ,[Autor]
           ,[Preco]
           ,[Estoque])
     VALUES
           (<Titulo, varchar(200),>
           ,<Autor, varchar(150),>
           ,<Preco, decimal(10,2),>
           ,<Estoque, int,>)
go

SELECT [IdVenda]
      ,[IdCliente]
      ,[DataVenda]
      ,[TotalVenda]
  FROM [dbo].[Vendas]
go








