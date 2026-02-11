--Trigger 1 — TRG_ItensVendaMed_AI_Estoque
--Ao inserir linhas em ItensVendaMed: Atualizar VendasMedicamentos. Total = (somar Quantidade * PrecoUnit) para o(s) IdVenda afetado(s).


CREATE TRIGGER dbo.TRG_ItensVendaMed_AI_Estoque
   ON dbo.ItensVendaMed
   AFTER UPDATE
AS 
BEGIN
	
	SET NOCOUNT ON;

    update VendasMedicamentos set Total = Total + (select Quantidade from inserted) where IdVenda = (select IdVenda from inserted)

END
GO

--Trigger 2 — TRG_ItensVendaMed_AI_AgendamentoVacina

--quando for detectado que Produtos.Tipo = VACINA, inserir um registro em Agendamentos para o IdCliente / IdPet do IdVenda com:
--DataAgendada = DATEADD(day, 7, GETDATE()) (ou outra regra simples que você definir).
--Motivo = Aplicação de vacina: NomeProduto

CREATE TRIGGER dbo.TRG_ItensVendaMed_AI_Estoque
   ON dbo.ItensVendaMed
   AFTER UPDATE
AS 
BEGIN
	
	SET NOCOUNT ON;

       -- Inserir agendamentos para itens do tipo VACINA
    INSERT INTO Agendamentos (IdCliente, IdPet, DataAgendada, Motivo)
    SELECT 
        v.IdCliente,
        v.IdPet,
        DATEADD(day, 7, GETDATE()) AS DataAgendada,   -- regra simples: 7 dias depois
        CONCAT('Aplicacao de vacina: ', p.Nome) AS Motivo
    FROM inserted i
    JOIN VendasMedicamentos v ON v.IdVenda = i.IdVenda
    JOIN Produtos p ON p.IdProduto = i.IdProduto
    WHERE UPPER(p.Tipo) = 'VACINA';

END
GO

--Trigger 3 — TRG_Clientes_AU_Audit
--Ao atualizar um registro em Clientes, registrar na tabela AuditLog as alterações (guardar os valores antigos).

CREATE TABLE Clientes_AUDIT (
IdClienteAUDIT INT IDENTITY PRIMARY KEY,
IdCliente INT,
Nome VARCHAR(150) NOT NULL,
Telefone VARCHAR(30),
Email VARCHAR(150),
DataCadastro DATETIME,
DataAlteracao DATETIME DEFAULT GETDATE()
);


CREATE TRIGGER dbo.TRG_Clientes_AU_Audit
   ON dbo.Clientes
   AFTER UPDATE, DELETE
AS 
BEGIN
	
	SET NOCOUNT ON;

insert into Clientes_AUDIT (
    IdCliente
    ,Nome
    ,Telefone
    ,Email
    ,DataCadastro
    ,DataAlteracao
    )
    select
        IdCliente
        ,Nome
        ,Telefone
        ,Email
        ,DataCadastro
        ,getdate()
    from deleted
END
GO


--Trigger 4 — TRG_Pets_AU_Audit
--Ao atualizar um registro em Pets, registrar na AuditLog as alterações (campo,valor antigo, novo).

-- Pets
CREATE TABLE Pets_AUDIT (
IdPetAUDIT INT IDENTITY PRIMARY KEY,
IdPet INT,
IdCliente INT,
NomePet VARCHAR(100) NOT NULL,
Especie VARCHAR(50), -- Ex: Cachorro, Gato
Raca VARCHAR(100),
DataNascimento DATE,
DataCadastro DATETIME,
DataAlteracao DATETIME DEFAULT GETDATE()
);


CREATE TRIGGER dbo.TRG_Pets_AU_Audit
   ON dbo.Pets
   AFTER UPDATE, DELETE
AS 
BEGIN
	
	SET NOCOUNT ON;

insert into Pets_AUDIT (
    
    IdPet
    ,IdCliente
    ,NomePet
    ,Especie
    ,Raca
    ,DataNascimento
    ,DataCadastro
    ,DataAltercao
    )
    select
        IdPet
        ,IdCliente
        ,NomePet
        ,Especie
        ,Raca
        ,DataNascimento
        ,DataCadastro
        ,getdate()
    from deleted
END
GO