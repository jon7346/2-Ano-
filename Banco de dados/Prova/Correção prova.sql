

--Nome: Jonathan Feliciano Felipe 
--Matricula(RA): 2024201025

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

--Criação do trigger numero das questões numero um e numero dois 

go
create trigger TGR_ItensVendaMed_Al_Estoque 
on itensVendaMed
after insert as begin 


update VendasMedicamentos 
  set Total = Total + (select (quantidade * PrecoUnit) from inserted ) 
  where VendasMedicamentos.IdVenda = (select Idvenda from inserted);

  if((select quantidade from inserted) > (select estoque from produtos ))
  begin
  print('venda maior que o estoque')

  end;
end;
go
/*
 trigger [dbo].[TGR_itensVendaMed_Ai_AgendamentoVacina] 
on [dbo].[ItensVendaMed] 
after insert as begin 
 if (select tipo from Produtos, inserted where inserted.IdProduto = Produtos.IdProduto) = ('VACINA')
		begin
		insert into Agendamentos values 
		(
		(select IdCliente from inserted join VendasMedicamentos as vdm on vdm.IdVenda = inserted.IdVenda),
		(select idpet from VendasMedicamentos as vdm  where IdVenda = (select idvenda from inserted)),
		 DATEADD(day, 7, GETDATE()) ,
		'Aplicação de vacina: ',
		 SUSER_NAME()
		)
		end;
	

else 
begin 
print('Agendar uma consulta');
end;
end;
*/
go
create trigger TGR_itensVendaMed_Ai_AgendamentoVacina 
on itensVendaMed 
after insert as begin 
 if (select tipo from Produtos, inserted where inserted.IdProduto = Produtos.IdProduto) = ('VACINA')
		begin
		--Segunda maneira de insert 
		insert into Agendamentos (idcliente, idpet, DataAgendada, motivo) 
		select 
		(select IdCliente from inserted join VendasMedicamentos as vdm on vdm.IdVenda = inserted.IdVenda),
		(select idpet from VendasMedicamentos as vdm  where IdVenda = (select idvenda from inserted)),
		(DATEADD(DAY, 7, GETDATE())),
		('Aplicação de vacina: ')
		
		end;
	

else 
begin 
print('Agendar uma consulta');
end;
end;
go 

create table audiLog (
IdCliente INT,
Nome VARCHAR(150),
Telefone VARCHAR(30),
Email VARCHAR(150),
DataCadastro DATETIME,
DataAtualização Datetime, 
);



-- criação do trigger da primeira questão 
go
create trigger TGR_Clientes_AU_Audit 
on Clientes
after update 
as 
begin 

insert into audiLog values ((select idcliente from deleted),(select Nome from deleted),  (select telefone from deleted), (Select email from deleted), (select DataCadastro from  deleted), GETDATE())

end;
go 

create table Pets_audiLog (
IdCliente INT,
Nome VARCHAR(150),
Telefone VARCHAR(30),
Email VARCHAR(150),
DataCadastro DATETIME,
DataAtualização Datetime, 
);
go
Create trigger Tgr_Pets_AU_Audit
on Pets 
after update
as 
begin 

insert into audiLog_pets

end;
go 


--testes do primeiro trigger

insert Clientes values ('Jonathan ', '17 90990283', 'batatinha@gmail.com', GETDATE())
insert produtos values('bala pet', 'doce', 100, 2.5)
insert VendasMedicamentos values (1, null,GETDATE(), 0 )
Insert itensVendaMed values (1, 1,100, 2.5)



