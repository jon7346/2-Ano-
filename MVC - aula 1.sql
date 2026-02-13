
Create database MVC_Aula;

Create table usuario 
( usuario_id int identity primary key, 
  nome	VARCHAR(250) NOT NULL, 
  email VARCHAR(250) NOT NULL, 
  senha VARCHAR(250) NOT NULL 
)
SELECT * FROM usuario

insert into usuario ( nome, email, senha) values ('Lucas', 'Lucas@fmail.com', '123')

update usuario set nome= 'Lucas alberto ' where usuario_id = 2 


DECLARE @teste varchar(50); 

SET @teste = 'Lucas';

Select @teste 

insert into usuario (nome, email, senha) values (@teste, 'email', 'senha' ); 

Select * from usuario