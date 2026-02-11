

CREATE TABLE ALUNOS (
IDALUNO INT PRIMARY KEY ,
NOME VARCHAR(60) NOT NULL,
EMAIL VARCHAR(60) UNIQUE NOT NULL,
CURSO VARCHAR(60) NOT NULL,
DATAMATRI DATE,
UsarioAlteracao varchar(250), 
DataAlteração datetime

)

CREATE TABLE LIVROS (
 IDLIVRO INT PRIMARY KEY, 
 TITULO VARCHAR(50) NOT NULL,
 AUTOR VARCHAR(50) NOT NULL, 
 EDITORA VARCHAR(50), 
 ANOPUB INT , 
 QTD INT NOT NULL, 
)

CREATE TABLE EMPREPRESTIMOS
(
IDEMPRE INT PRIMARY KEY,
ALUNO VARCHAR(50) NOT NULL,
IDALUNO INT, 
FOREIGN KEY (IDALUNO) REFERENCES ALUNOs(IDALUNO),
LIVRO VARCHAR(50) NOT NULL, 
IDLIVRO INT,
FOREIGN KEY(IDLIVRO) REFERENCES LIVROS(IDLIVRO),
DATAEMPRE DATE NOT NULL,
DATADEVO DATE NOT NULL,
);

INSERT INTO ALUNO VALUES('20252018', 'JONAÃOO', 'JONAAOO189@gmail.com', 'Sistemas de informação', '2092-09-29' ), 
('20250208', 'Pedrãoo', 'pedro19023@gmail.com', 'Sistemas de informação', '2025-09-29'), 
('23090918', 'Henrique', 'henriquee109380@gmail.com', 'Sistemas de informação', '2024-08-23'), 
('21312312', 'Doglas', 'douglas873197@gmail.com', 'Sistemas de informação', '2023-09-23'), 
('23234235', 'Gabriel','gabri1231233@gmail.com', 'Sistemas de informação', '2023-03-23'); 

 
 INSERT INTO LIVROS VALUES('01','Sapiens: Uma Breve História da Humanidade', 'Yuval Noah Harari', 'L&PM Editores','2011','4');
 INSERT INTO LIVROS VALUES('02','1984','George Orwell','Companhia das Letras','1949','3');
 INSERT INTO LIVROS VALUES('03','O Poder do Hábito (The Power of Habit)','Charles Duhigg', 'Objetiva', '2012', '4' );
 INSERT INTO LIVROS VALUES('04', 'A Revolução dos Bichos(Animal Farm)', 'George Orwell', 'Companhia das letras','1945','4');
 INSERT INTO LIVROS VALUES('05','lean Code', 'Robert C. Martin (Uncle Bob)', 'Alta Books ', '2008', '4')

 
 INSERT INTO EMPREPRESTIMOS VALUES ('01','JONAÂOO','20252018','1984','02','2025-06-25','2025-07-06'),
 ('02','Henrique','23090918','A Revolução dos Bichos(Animal Farm)','04','2025-06-17','2025-06-24'),('03','Douglas','21312312','1984','02','2024-07-04', '2024-07-11')

 UPDATE ALUNO SET EMAIL = 'jona213414@gmail.com' WHERE NOME = 'JONAÃOO';

 UPDATE LIVROS SET QTD = '10' WHERE IDLIVRO = '01';

 DELETE LIVROS WHERE  IDLIVRO ='01'; 

 SELECT * FROM EMPREPRESTIMOS;

 SELECT * FROM LIVROS WHERE QTD > 0 ; 
 
 SELECT * FROM EMPREPRESTIMOS WHERE DATADEVO < CAST(GETDATE() as date);


 --apaga todos os dados da empresa 
 drop table aluno
 truncate table aluno 

INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Silva', 'ana.silva001@uni.edu', 'Sistemas de Informação', '2022-01-02', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Santos', 'ana.santos002@uni.edu', 'Ciência da Computação', '2022-01-03', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Oliveira', 'ana.oliveira003@uni.edu', 'Engenharia de Software', '2022-01-04', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Souza', 'ana.souza004@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-01-05', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Rodrigues', 'ana.rodrigues005@uni.edu', 'Banco de Dados', '2022-01-06', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Ferreira', 'ana.ferreira006@uni.edu', 'Gestão de TI', '2022-01-07', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Alves', 'ana.alves007@uni.edu', 'Redes de Computadores', '2022-01-08', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Pereira', 'ana.pereira008@uni.edu', 'Segurança da Informação', '2022-01-09', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Lima', 'ana.lima009@uni.edu', 'Sistemas de Informação', '2022-01-10', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Gomes', 'ana.gomes010@uni.edu', 'Ciência da Computação', '2022-01-11', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Costa', 'ana.costa011@uni.edu', 'Engenharia de Software', '2022-01-12', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Ribeiro', 'ana.ribeiro012@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-01-13', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Martins', 'ana.martins013@uni.edu', 'Banco de Dados', '2022-01-14', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Carvalho', 'ana.carvalho014@uni.edu', 'Gestão de TI', '2022-01-15', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Rocha', 'ana.rocha015@uni.edu', 'Redes de Computadores', '2022-01-16', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Dias', 'ana.dias016@uni.edu', 'Segurança da Informação', '2022-01-17', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Moreira', 'ana.moreira017@uni.edu', 'Sistemas de Informação', '2022-01-18', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Barbosa', 'ana.barbosa018@uni.edu', 'Ciência da Computação', '2022-01-19', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Pinto', 'ana.pinto019@uni.edu', 'Engenharia de Software', '2022-01-20', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Teixeira', 'ana.teixeira020@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-01-21', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Fernandes', 'ana.fernandes021@uni.edu', 'Banco de Dados', '2022-01-22', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Araujo', 'ana.araujo022@uni.edu', 'Gestão de TI', '2022-01-23', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Melo', 'ana.melo023@uni.edu', 'Redes de Computadores', '2022-01-24', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Castro', 'ana.castro024@uni.edu', 'Segurança da Informação', '2022-01-25', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Cardoso', 'ana.cardoso025@uni.edu', 'Sistemas de Informação', '2022-01-26', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Batista', 'ana.batista026@uni.edu', 'Ciência da Computação', '2022-01-27', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Nunes', 'ana.nunes027@uni.edu', 'Engenharia de Software', '2022-01-28', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Campos', 'ana.campos028@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-01-29', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Pires', 'ana.pires029@uni.edu', 'Banco de Dados', '2022-01-30', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Correia', 'ana.correia030@uni.edu', 'Gestão de TI', '2022-01-31', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Moura', 'ana.moura031@uni.edu', 'Redes de Computadores', '2022-02-01', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Freitas', 'ana.freitas032@uni.edu', 'Segurança da Informação', '2022-02-02', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Cunha', 'ana.cunha033@uni.edu', 'Sistemas de Informação', '2022-02-03', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Farias', 'ana.farias034@uni.edu', 'Ciência da Computação', '2022-02-04', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Duarte', 'ana.duarte035@uni.edu', 'Engenharia de Software', '2022-02-05', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Tavares', 'ana.tavares036@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-02-06', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Monteiro', 'ana.monteiro037@uni.edu', 'Banco de Dados', '2022-02-07', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Mota', 'ana.mota038@uni.edu', 'Gestão de TI', '2022-02-08', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Prado', 'ana.prado039@uni.edu', 'Redes de Computadores', '2022-02-09', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Rios', 'ana.rios040@uni.edu', 'Segurança da Informação', '2022-02-10', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Rezende', 'ana.rezende041@uni.edu', 'Sistemas de Informação', '2022-02-11', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Viana', 'ana.viana042@uni.edu', 'Ciência da Computação', '2022-02-12', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Matos', 'ana.matos043@uni.edu', 'Engenharia de Software', '2022-02-13', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Sales', 'ana.sales044@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-02-14', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Queiroz', 'ana.queiroz045@uni.edu', 'Banco de Dados', '2022-02-15', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Guimaraes', 'ana.guimaraes046@uni.edu', 'Gestão de TI', '2022-02-16', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Assis', 'ana.assis047@uni.edu', 'Redes de Computadores', '2022-02-17', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Barros', 'ana.barros048@uni.edu', 'Segurança da Informação', '2022-02-18', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Andrade', 'ana.andrade049@uni.edu', 'Sistemas de Informação', '2022-02-19', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Ana Xavier', 'ana.xavier050@uni.edu', 'Ciência da Computação', '2022-02-20', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Silva', 'bruno.silva051@uni.edu', 'Engenharia de Software', '2022-02-21', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Santos', 'bruno.santos052@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-02-22', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Oliveira', 'bruno.oliveira053@uni.edu', 'Banco de Dados', '2022-02-23', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Souza', 'bruno.souza054@uni.edu', 'Gestão de TI', '2022-02-24', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Rodrigues', 'bruno.rodrigues055@uni.edu', 'Redes de Computadores', '2022-02-25', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Ferreira', 'bruno.ferreira056@uni.edu', 'Segurança da Informação', '2022-02-26', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Alves', 'bruno.alves057@uni.edu', 'Sistemas de Informação', '2022-02-27', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Pereira', 'bruno.pereira058@uni.edu', 'Ciência da Computação', '2022-02-28', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Lima', 'bruno.lima059@uni.edu', 'Engenharia de Software', '2022-03-01', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Gomes', 'bruno.gomes060@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-03-02', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Costa', 'bruno.costa061@uni.edu', 'Banco de Dados', '2022-03-03', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Ribeiro', 'bruno.ribeiro062@uni.edu', 'Gestão de TI', '2022-03-04', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Martins', 'bruno.martins063@uni.edu', 'Redes de Computadores', '2022-03-05', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Carvalho', 'bruno.carvalho064@uni.edu', 'Segurança da Informação', '2022-03-06', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Rocha', 'bruno.rocha065@uni.edu', 'Sistemas de Informação', '2022-03-07', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Dias', 'bruno.dias066@uni.edu', 'Ciência da Computação', '2022-03-08', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Moreira', 'bruno.moreira067@uni.edu', 'Engenharia de Software', '2022-03-09', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Barbosa', 'bruno.barbosa068@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-03-10', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Pinto', 'bruno.pinto069@uni.edu', 'Banco de Dados', '2022-03-11', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Teixeira', 'bruno.teixeira070@uni.edu', 'Gestão de TI', '2022-03-12', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Fernandes', 'bruno.fernandes071@uni.edu', 'Redes de Computadores', '2022-03-13', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Araujo', 'bruno.araujo072@uni.edu', 'Segurança da Informação', '2022-03-14', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Melo', 'bruno.melo073@uni.edu', 'Sistemas de Informação', '2022-03-15', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Castro', 'bruno.castro074@uni.edu', 'Ciência da Computação', '2022-03-16', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Cardoso', 'bruno.cardoso075@uni.edu', 'Engenharia de Software', '2022-03-17', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Batista', 'bruno.batista076@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-03-18', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Nunes', 'bruno.nunes077@uni.edu', 'Banco de Dados', '2022-03-19', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Campos', 'bruno.campos078@uni.edu', 'Gestão de TI', '2022-03-20', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Pires', 'bruno.pires079@uni.edu', 'Redes de Computadores', '2022-03-21', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Correia', 'bruno.correia080@uni.edu', 'Segurança da Informação', '2022-03-22', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Moura', 'bruno.moura081@uni.edu', 'Sistemas de Informação', '2022-03-23', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Freitas', 'bruno.freitas082@uni.edu', 'Ciência da Computação', '2022-03-24', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Cunha', 'bruno.cunha083@uni.edu', 'Engenharia de Software', '2022-03-25', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Farias', 'bruno.farias084@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-03-26', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Duarte', 'bruno.duarte085@uni.edu', 'Banco de Dados', '2022-03-27', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Tavares', 'bruno.tavares086@uni.edu', 'Gestão de TI', '2022-03-28', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Monteiro', 'bruno.monteiro087@uni.edu', 'Redes de Computadores', '2022-03-29', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Mota', 'bruno.mota088@uni.edu', 'Segurança da Informação', '2022-03-30', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Prado', 'bruno.prado089@uni.edu', 'Sistemas de Informação', '2022-03-31', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Rios', 'bruno.rios090@uni.edu', 'Ciência da Computação', '2022-04-01', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Rezende', 'bruno.rezende091@uni.edu', 'Engenharia de Software', '2022-04-02', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Viana', 'bruno.viana092@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-04-03', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Matos', 'bruno.matos093@uni.edu', 'Banco de Dados', '2022-04-04', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Sales', 'bruno.sales094@uni.edu', 'Gestão de TI', '2022-04-05', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Queiroz', 'bruno.queiroz095@uni.edu', 'Redes de Computadores', '2022-04-06', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Guimaraes', 'bruno.guimaraes096@uni.edu', 'Segurança da Informação', '2022-04-07', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Assis', 'bruno.assis097@uni.edu', 'Sistemas de Informação', '2022-04-08', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Barros', 'bruno.barros098@uni.edu', 'Ciência da Computação', '2022-04-09', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Andrade', 'bruno.andrade099@uni.edu', 'Engenharia de Software', '2022-04-10', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Bruno Xavier', 'bruno.xavier100@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-04-11', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Silva', 'carla.silva101@uni.edu', 'Banco de Dados', '2022-04-12', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Santos', 'carla.santos102@uni.edu', 'Gestão de TI', '2022-04-13', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Oliveira', 'carla.oliveira103@uni.edu', 'Redes de Computadores', '2022-04-14', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Souza', 'carla.souza104@uni.edu', 'Segurança da Informação', '2022-04-15', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Rodrigues', 'carla.rodrigues105@uni.edu', 'Sistemas de Informação', '2022-04-16', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Ferreira', 'carla.ferreira106@uni.edu', 'Ciência da Computação', '2022-04-17', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Alves', 'carla.alves107@uni.edu', 'Engenharia de Software', '2022-04-18', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Pereira', 'carla.pereira108@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-04-19', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Lima', 'carla.lima109@uni.edu', 'Banco de Dados', '2022-04-20', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Gomes', 'carla.gomes110@uni.edu', 'Gestão de TI', '2022-04-21', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Costa', 'carla.costa111@uni.edu', 'Redes de Computadores', '2022-04-22', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Ribeiro', 'carla.ribeiro112@uni.edu', 'Segurança da Informação', '2022-04-23', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Martins', 'carla.martins113@uni.edu', 'Sistemas de Informação', '2022-04-24', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Carvalho', 'carla.carvalho114@uni.edu', 'Ciência da Computação', '2022-04-25', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Rocha', 'carla.rocha115@uni.edu', 'Engenharia de Software', '2022-04-26', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Dias', 'carla.dias116@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-04-27', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Moreira', 'carla.moreira117@uni.edu', 'Banco de Dados', '2022-04-28', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Barbosa', 'carla.barbosa118@uni.edu', 'Gestão de TI', '2022-04-29', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Pinto', 'carla.pinto119@uni.edu', 'Redes de Computadores', '2022-04-30', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Teixeira', 'carla.teixeira120@uni.edu', 'Segurança da Informação', '2022-05-01', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Fernandes', 'carla.fernandes121@uni.edu', 'Sistemas de Informação', '2022-05-02', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Araujo', 'carla.araujo122@uni.edu', 'Ciência da Computação', '2022-05-03', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Melo', 'carla.melo123@uni.edu', 'Engenharia de Software', '2022-05-04', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Castro', 'carla.castro124@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-05-05', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Cardoso', 'carla.cardoso125@uni.edu', 'Banco de Dados', '2022-05-06', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Batista', 'carla.batista126@uni.edu', 'Gestão de TI', '2022-05-07', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Nunes', 'carla.nunes127@uni.edu', 'Redes de Computadores', '2022-05-08', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Campos', 'carla.campos128@uni.edu', 'Segurança da Informação', '2022-05-09', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Pires', 'carla.pires129@uni.edu', 'Sistemas de Informação', '2022-05-10', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Correia', 'carla.correia130@uni.edu', 'Ciência da Computação', '2022-05-11', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Moura', 'carla.moura131@uni.edu', 'Engenharia de Software', '2022-05-12', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Freitas', 'carla.freitas132@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-05-13', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Cunha', 'carla.cunha133@uni.edu', 'Banco de Dados', '2022-05-14', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Farias', 'carla.farias134@uni.edu', 'Gestão de TI', '2022-05-15', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Duarte', 'carla.duarte135@uni.edu', 'Redes de Computadores', '2022-05-16', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Tavares', 'carla.tavares136@uni.edu', 'Segurança da Informação', '2022-05-17', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Monteiro', 'carla.monteiro137@uni.edu', 'Sistemas de Informação', '2022-05-18', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Mota', 'carla.mota138@uni.edu', 'Ciência da Computação', '2022-05-19', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Prado', 'carla.prado139@uni.edu', 'Engenharia de Software', '2022-05-20', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Rios', 'carla.rios140@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-05-21', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Rezende', 'carla.rezende141@uni.edu', 'Banco de Dados', '2022-05-22', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Viana', 'carla.viana142@uni.edu', 'Gestão de TI', '2022-05-23', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Matos', 'carla.matos143@uni.edu', 'Redes de Computadores', '2022-05-24', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Sales', 'carla.sales144@uni.edu', 'Segurança da Informação', '2022-05-25', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Queiroz', 'carla.queiroz145@uni.edu', 'Sistemas de Informação', '2022-05-26', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Guimaraes', 'carla.guimaraes146@uni.edu', 'Ciência da Computação', '2022-05-27', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Assis', 'carla.assis147@uni.edu', 'Engenharia de Software', '2022-05-28', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Barros', 'carla.barros148@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-05-29', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Andrade', 'carla.andrade149@uni.edu', 'Banco de Dados', '2022-05-30', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Carla Xavier', 'carla.xavier150@uni.edu', 'Gestão de TI', '2022-05-31', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Silva', 'diego.silva151@uni.edu', 'Redes de Computadores', '2022-06-01', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Santos', 'diego.santos152@uni.edu', 'Segurança da Informação', '2022-06-02', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Oliveira', 'diego.oliveira153@uni.edu', 'Sistemas de Informação', '2022-06-03', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Souza', 'diego.souza154@uni.edu', 'Ciência da Computação', '2022-06-04', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Rodrigues', 'diego.rodrigues155@uni.edu', 'Engenharia de Software', '2022-06-05', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Ferreira', 'diego.ferreira156@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-06-06', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Alves', 'diego.alves157@uni.edu', 'Banco de Dados', '2022-06-07', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Pereira', 'diego.pereira158@uni.edu', 'Gestão de TI', '2022-06-08', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Lima', 'diego.lima159@uni.edu', 'Redes de Computadores', '2022-06-09', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Gomes', 'diego.gomes160@uni.edu', 'Segurança da Informação', '2022-06-10', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Costa', 'diego.costa161@uni.edu', 'Sistemas de Informação', '2022-06-11', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Ribeiro', 'diego.ribeiro162@uni.edu', 'Ciência da Computação', '2022-06-12', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Martins', 'diego.martins163@uni.edu', 'Engenharia de Software', '2022-06-13', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Carvalho', 'diego.carvalho164@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-06-14', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Rocha', 'diego.rocha165@uni.edu', 'Banco de Dados', '2022-06-15', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Dias', 'diego.dias166@uni.edu', 'Gestão de TI', '2022-06-16', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Moreira', 'diego.moreira167@uni.edu', 'Redes de Computadores', '2022-06-17', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Barbosa', 'diego.barbosa168@uni.edu', 'Segurança da Informação', '2022-06-18', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Pinto', 'diego.pinto169@uni.edu', 'Sistemas de Informação', '2022-06-19', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Teixeira', 'diego.teixeira170@uni.edu', 'Ciência da Computação', '2022-06-20', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Fernandes', 'diego.fernandes171@uni.edu', 'Engenharia de Software', '2022-06-21', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Araujo', 'diego.araujo172@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-06-22', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Melo', 'diego.melo173@uni.edu', 'Banco de Dados', '2022-06-23', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Castro', 'diego.castro174@uni.edu', 'Gestão de TI', '2022-06-24', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Cardoso', 'diego.cardoso175@uni.edu', 'Redes de Computadores', '2022-06-25', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Batista', 'diego.batista176@uni.edu', 'Segurança da Informação', '2022-06-26', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Nunes', 'diego.nunes177@uni.edu', 'Sistemas de Informação', '2022-06-27', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Campos', 'diego.campos178@uni.edu', 'Ciência da Computação', '2022-06-28', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Pires', 'diego.pires179@uni.edu', 'Engenharia de Software', '2022-06-29', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Correia', 'diego.correia180@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-06-30', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Moura', 'diego.moura181@uni.edu', 'Banco de Dados', '2022-07-01', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Freitas', 'diego.freitas182@uni.edu', 'Gestão de TI', '2022-07-02', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Cunha', 'diego.cunha183@uni.edu', 'Redes de Computadores', '2022-07-03', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Farias', 'diego.farias184@uni.edu', 'Segurança da Informação', '2022-07-04', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Duarte', 'diego.duarte185@uni.edu', 'Sistemas de Informação', '2022-07-05', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Tavares', 'diego.tavares186@uni.edu', 'Ciência da Computação', '2022-07-06', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Monteiro', 'diego.monteiro187@uni.edu', 'Engenharia de Software', '2022-07-07', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Mota', 'diego.mota188@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-07-08', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Prado', 'diego.prado189@uni.edu', 'Banco de Dados', '2022-07-09', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Rios', 'diego.rios190@uni.edu', 'Gestão de TI', '2022-07-10', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Rezende', 'diego.rezende191@uni.edu', 'Redes de Computadores', '2022-07-11', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Viana', 'diego.viana192@uni.edu', 'Segurança da Informação', '2022-07-12', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Matos', 'diego.matos193@uni.edu', 'Sistemas de Informação', '2022-07-13', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Sales', 'diego.sales194@uni.edu', 'Ciência da Computação', '2022-07-14', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Queiroz', 'diego.queiroz195@uni.edu', 'Engenharia de Software', '2022-07-15', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Guimaraes', 'diego.guimaraes196@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-07-16', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Assis', 'diego.assis197@uni.edu', 'Banco de Dados', '2022-07-17', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Barros', 'diego.barros198@uni.edu', 'Gestão de TI', '2022-07-18', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Andrade', 'diego.andrade199@uni.edu', 'Redes de Computadores', '2022-07-19', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Diego Xavier', 'diego.xavier200@uni.edu', 'Segurança da Informação', '2022-07-20', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Silva', 'elisa.silva201@uni.edu', 'Sistemas de Informação', '2022-07-21', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Santos', 'elisa.santos202@uni.edu', 'Ciência da Computação', '2022-07-22', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Oliveira', 'elisa.oliveira203@uni.edu', 'Engenharia de Software', '2022-07-23', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Souza', 'elisa.souza204@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-07-24', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Rodrigues', 'elisa.rodrigues205@uni.edu', 'Banco de Dados', '2022-07-25', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Ferreira', 'elisa.ferreira206@uni.edu', 'Gestão de TI', '2022-07-26', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Alves', 'elisa.alves207@uni.edu', 'Redes de Computadores', '2022-07-27', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Pereira', 'elisa.pereira208@uni.edu', 'Segurança da Informação', '2022-07-28', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Lima', 'elisa.lima209@uni.edu', 'Sistemas de Informação', '2022-07-29', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Gomes', 'elisa.gomes210@uni.edu', 'Ciência da Computação', '2022-07-30', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Costa', 'elisa.costa211@uni.edu', 'Engenharia de Software', '2022-07-31', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Ribeiro', 'elisa.ribeiro212@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-08-01', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Martins', 'elisa.martins213@uni.edu', 'Banco de Dados', '2022-08-02', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Carvalho', 'elisa.carvalho214@uni.edu', 'Gestão de TI', '2022-08-03', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Rocha', 'elisa.rocha215@uni.edu', 'Redes de Computadores', '2022-08-04', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Dias', 'elisa.dias216@uni.edu', 'Segurança da Informação', '2022-08-05', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Moreira', 'elisa.moreira217@uni.edu', 'Sistemas de Informação', '2022-08-06', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Barbosa', 'elisa.barbosa218@uni.edu', 'Ciência da Computação', '2022-08-07', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Pinto', 'elisa.pinto219@uni.edu', 'Engenharia de Software', '2022-08-08', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Teixeira', 'elisa.teixeira220@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-08-09', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Fernandes', 'elisa.fernandes221@uni.edu', 'Banco de Dados', '2022-08-10', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Araujo', 'elisa.araujo222@uni.edu', 'Gestão de TI', '2022-08-11', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Melo', 'elisa.melo223@uni.edu', 'Redes de Computadores', '2022-08-12', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Castro', 'elisa.castro224@uni.edu', 'Segurança da Informação', '2022-08-13', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Cardoso', 'elisa.cardoso225@uni.edu', 'Sistemas de Informação', '2022-08-14', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Batista', 'elisa.batista226@uni.edu', 'Ciência da Computação', '2022-08-15', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Nunes', 'elisa.nunes227@uni.edu', 'Engenharia de Software', '2022-08-16', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Campos', 'elisa.campos228@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-08-17', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Pires', 'elisa.pires229@uni.edu', 'Banco de Dados', '2022-08-18', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Correia', 'elisa.correia230@uni.edu', 'Gestão de TI', '2022-08-19', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Moura', 'elisa.moura231@uni.edu', 'Redes de Computadores', '2022-08-20', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Freitas', 'elisa.freitas232@uni.edu', 'Segurança da Informação', '2022-08-21', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Cunha', 'elisa.cunha233@uni.edu', 'Sistemas de Informação', '2022-08-22', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Farias', 'elisa.farias234@uni.edu', 'Ciência da Computação', '2022-08-23', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Duarte', 'elisa.duarte235@uni.edu', 'Engenharia de Software', '2022-08-24', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Tavares', 'elisa.tavares236@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-08-25', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Monteiro', 'elisa.monteiro237@uni.edu', 'Banco de Dados', '2022-08-26', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Mota', 'elisa.mota238@uni.edu', 'Gestão de TI', '2022-08-27', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Prado', 'elisa.prado239@uni.edu', 'Redes de Computadores', '2022-08-28', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Rios', 'elisa.rios240@uni.edu', 'Segurança da Informação', '2022-08-29', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Rezende', 'elisa.rezende241@uni.edu', 'Sistemas de Informação', '2022-08-30', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Viana', 'elisa.viana242@uni.edu', 'Ciência da Computação', '2022-08-31', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Matos', 'elisa.matos243@uni.edu', 'Engenharia de Software', '2022-09-01', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Sales', 'elisa.sales244@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-09-02', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Queiroz', 'elisa.queiroz245@uni.edu', 'Banco de Dados', '2022-09-03', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Guimaraes', 'elisa.guimaraes246@uni.edu', 'Gestão de TI', '2022-09-04', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Assis', 'elisa.assis247@uni.edu', 'Redes de Computadores', '2022-09-05', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Barros', 'elisa.barros248@uni.edu', 'Segurança da Informação', '2022-09-06', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Andrade', 'elisa.andrade249@uni.edu', 'Sistemas de Informação', '2022-09-07', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Elisa Xavier', 'elisa.xavier250@uni.edu', 'Ciência da Computação', '2022-09-08', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Silva', 'felipe.silva251@uni.edu', 'Engenharia de Software', '2022-09-09', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Santos', 'felipe.santos252@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-09-10', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Oliveira', 'felipe.oliveira253@uni.edu', 'Banco de Dados', '2022-09-11', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Souza', 'felipe.souza254@uni.edu', 'Gestão de TI', '2022-09-12', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Rodrigues', 'felipe.rodrigues255@uni.edu', 'Redes de Computadores', '2022-09-13', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Ferreira', 'felipe.ferreira256@uni.edu', 'Segurança da Informação', '2022-09-14', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Alves', 'felipe.alves257@uni.edu', 'Sistemas de Informação', '2022-09-15', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Pereira', 'felipe.pereira258@uni.edu', 'Ciência da Computação', '2022-09-16', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Lima', 'felipe.lima259@uni.edu', 'Engenharia de Software', '2022-09-17', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Gomes', 'felipe.gomes260@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-09-18', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Costa', 'felipe.costa261@uni.edu', 'Banco de Dados', '2022-09-19', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Ribeiro', 'felipe.ribeiro262@uni.edu', 'Gestão de TI', '2022-09-20', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Martins', 'felipe.martins263@uni.edu', 'Redes de Computadores', '2022-09-21', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Carvalho', 'felipe.carvalho264@uni.edu', 'Segurança da Informação', '2022-09-22', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Rocha', 'felipe.rocha265@uni.edu', 'Sistemas de Informação', '2022-09-23', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Dias', 'felipe.dias266@uni.edu', 'Ciência da Computação', '2022-09-24', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Moreira', 'felipe.moreira267@uni.edu', 'Engenharia de Software', '2022-09-25', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Barbosa', 'felipe.barbosa268@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-09-26', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Pinto', 'felipe.pinto269@uni.edu', 'Banco de Dados', '2022-09-27', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Teixeira', 'felipe.teixeira270@uni.edu', 'Gestão de TI', '2022-09-28', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Fernandes', 'felipe.fernandes271@uni.edu', 'Redes de Computadores', '2022-09-29', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Araujo', 'felipe.araujo272@uni.edu', 'Segurança da Informação', '2022-09-30', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Melo', 'felipe.melo273@uni.edu', 'Sistemas de Informação', '2022-10-01', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Castro', 'felipe.castro274@uni.edu', 'Ciência da Computação', '2022-10-02', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Cardoso', 'felipe.cardoso275@uni.edu', 'Engenharia de Software', '2022-10-03', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Batista', 'felipe.batista276@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-10-04', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Nunes', 'felipe.nunes277@uni.edu', 'Banco de Dados', '2022-10-05', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Campos', 'felipe.campos278@uni.edu', 'Gestão de TI', '2022-10-06', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Pires', 'felipe.pires279@uni.edu', 'Redes de Computadores', '2022-10-07', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Correia', 'felipe.correia280@uni.edu', 'Segurança da Informação', '2022-10-08', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Moura', 'felipe.moura281@uni.edu', 'Sistemas de Informação', '2022-10-09', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Freitas', 'felipe.freitas282@uni.edu', 'Ciência da Computação', '2022-10-10', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Cunha', 'felipe.cunha283@uni.edu', 'Engenharia de Software', '2022-10-11', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Farias', 'felipe.farias284@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-10-12', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Duarte', 'felipe.duarte285@uni.edu', 'Banco de Dados', '2022-10-13', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Tavares', 'felipe.tavares286@uni.edu', 'Gestão de TI', '2022-10-14', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Monteiro', 'felipe.monteiro287@uni.edu', 'Redes de Computadores', '2022-10-15', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Mota', 'felipe.mota288@uni.edu', 'Segurança da Informação', '2022-10-16', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Prado', 'felipe.prado289@uni.edu', 'Sistemas de Informação', '2022-10-17', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Rios', 'felipe.rios290@uni.edu', 'Ciência da Computação', '2022-10-18', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Rezende', 'felipe.rezende291@uni.edu', 'Engenharia de Software', '2022-10-19', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Viana', 'felipe.viana292@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-10-20', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Matos', 'felipe.matos293@uni.edu', 'Banco de Dados', '2022-10-21', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Sales', 'felipe.sales294@uni.edu', 'Gestão de TI', '2022-10-22', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Queiroz', 'felipe.queiroz295@uni.edu', 'Redes de Computadores', '2022-10-23', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Guimaraes', 'felipe.guimaraes296@uni.edu', 'Segurança da Informação', '2022-10-24', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Assis', 'felipe.assis297@uni.edu', 'Sistemas de Informação', '2022-10-25', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Barros', 'felipe.barros298@uni.edu', 'Ciência da Computação', '2022-10-26', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Andrade', 'felipe.andrade299@uni.edu', 'Engenharia de Software', '2022-10-27', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Felipe Xavier', 'felipe.xavier300@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-10-28', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Silva', 'gabriela.silva301@uni.edu', 'Banco de Dados', '2022-10-29', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Santos', 'gabriela.santos302@uni.edu', 'Gestão de TI', '2022-10-30', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Oliveira', 'gabriela.oliveira303@uni.edu', 'Redes de Computadores', '2022-10-31', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Souza', 'gabriela.souza304@uni.edu', 'Segurança da Informação', '2022-11-01', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Rodrigues', 'gabriela.rodrigues305@uni.edu', 'Sistemas de Informação', '2022-11-02', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Ferreira', 'gabriela.ferreira306@uni.edu', 'Ciência da Computação', '2022-11-03', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Alves', 'gabriela.alves307@uni.edu', 'Engenharia de Software', '2022-11-04', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Pereira', 'gabriela.pereira308@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-11-05', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Lima', 'gabriela.lima309@uni.edu', 'Banco de Dados', '2022-11-06', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Gomes', 'gabriela.gomes310@uni.edu', 'Gestão de TI', '2022-11-07', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Costa', 'gabriela.costa311@uni.edu', 'Redes de Computadores', '2022-11-08', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Ribeiro', 'gabriela.ribeiro312@uni.edu', 'Segurança da Informação', '2022-11-09', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Martins', 'gabriela.martins313@uni.edu', 'Sistemas de Informação', '2022-11-10', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Carvalho', 'gabriela.carvalho314@uni.edu', 'Ciência da Computação', '2022-11-11', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Rocha', 'gabriela.rocha315@uni.edu', 'Engenharia de Software', '2022-11-12', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Dias', 'gabriela.dias316@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-11-13', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Moreira', 'gabriela.moreira317@uni.edu', 'Banco de Dados', '2022-11-14', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Barbosa', 'gabriela.barbosa318@uni.edu', 'Gestão de TI', '2022-11-15', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Pinto', 'gabriela.pinto319@uni.edu', 'Redes de Computadores', '2022-11-16', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Teixeira', 'gabriela.teixeira320@uni.edu', 'Segurança da Informação', '2022-11-17', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Fernandes', 'gabriela.fernandes321@uni.edu', 'Sistemas de Informação', '2022-11-18', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Araujo', 'gabriela.araujo322@uni.edu', 'Ciência da Computação', '2022-11-19', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Melo', 'gabriela.melo323@uni.edu', 'Engenharia de Software', '2022-11-20', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Castro', 'gabriela.castro324@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-11-21', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Cardoso', 'gabriela.cardoso325@uni.edu', 'Banco de Dados', '2022-11-22', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Batista', 'gabriela.batista326@uni.edu', 'Gestão de TI', '2022-11-23', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Nunes', 'gabriela.nunes327@uni.edu', 'Redes de Computadores', '2022-11-24', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Campos', 'gabriela.campos328@uni.edu', 'Segurança da Informação', '2022-11-25', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Pires', 'gabriela.pires329@uni.edu', 'Sistemas de Informação', '2022-11-26', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Correia', 'gabriela.correia330@uni.edu', 'Ciência da Computação', '2022-11-27', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Moura', 'gabriela.moura331@uni.edu', 'Engenharia de Software', '2022-11-28', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Freitas', 'gabriela.freitas332@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-11-29', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Cunha', 'gabriela.cunha333@uni.edu', 'Banco de Dados', '2022-11-30', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Farias', 'gabriela.farias334@uni.edu', 'Gestão de TI', '2022-12-01', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Duarte', 'gabriela.duarte335@uni.edu', 'Redes de Computadores', '2022-12-02', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Tavares', 'gabriela.tavares336@uni.edu', 'Segurança da Informação', '2022-12-03', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Monteiro', 'gabriela.monteiro337@uni.edu', 'Sistemas de Informação', '2022-12-04', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Mota', 'gabriela.mota338@uni.edu', 'Ciência da Computação', '2022-12-05', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Prado', 'gabriela.prado339@uni.edu', 'Engenharia de Software', '2022-12-06', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Rios', 'gabriela.rios340@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-12-07', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Rezende', 'gabriela.rezende341@uni.edu', 'Banco de Dados', '2022-12-08', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Viana', 'gabriela.viana342@uni.edu', 'Gestão de TI', '2022-12-09', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Matos', 'gabriela.matos343@uni.edu', 'Redes de Computadores', '2022-12-10', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Sales', 'gabriela.sales344@uni.edu', 'Segurança da Informação', '2022-12-11', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Queiroz', 'gabriela.queiroz345@uni.edu', 'Sistemas de Informação', '2022-12-12', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Guimaraes', 'gabriela.guimaraes346@uni.edu', 'Ciência da Computação', '2022-12-13', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Assis', 'gabriela.assis347@uni.edu', 'Engenharia de Software', '2022-12-14', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Barros', 'gabriela.barros348@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-12-15', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Andrade', 'gabriela.andrade349@uni.edu', 'Banco de Dados', '2022-12-16', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Gabriela Xavier', 'gabriela.xavier350@uni.edu', 'Gestão de TI', '2022-12-17', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Silva', 'henrique.silva351@uni.edu', 'Redes de Computadores', '2022-12-18', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Santos', 'henrique.santos352@uni.edu', 'Segurança da Informação', '2022-12-19', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Oliveira', 'henrique.oliveira353@uni.edu', 'Sistemas de Informação', '2022-12-20', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Souza', 'henrique.souza354@uni.edu', 'Ciência da Computação', '2022-12-21', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Rodrigues', 'henrique.rodrigues355@uni.edu', 'Engenharia de Software', '2022-12-22', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Ferreira', 'henrique.ferreira356@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-12-23', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Alves', 'henrique.alves357@uni.edu', 'Banco de Dados', '2022-12-24', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Pereira', 'henrique.pereira358@uni.edu', 'Gestão de TI', '2022-12-25', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Lima', 'henrique.lima359@uni.edu', 'Redes de Computadores', '2022-12-26', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Gomes', 'henrique.gomes360@uni.edu', 'Segurança da Informação', '2022-12-27', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Costa', 'henrique.costa361@uni.edu', 'Sistemas de Informação', '2022-12-28', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Ribeiro', 'henrique.ribeiro362@uni.edu', 'Ciência da Computação', '2022-12-29', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Martins', 'henrique.martins363@uni.edu', 'Engenharia de Software', '2022-12-30', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Carvalho', 'henrique.carvalho364@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2022-12-31', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Rocha', 'henrique.rocha365@uni.edu', 'Banco de Dados', '2023-01-01', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Dias', 'henrique.dias366@uni.edu', 'Gestão de TI', '2023-01-02', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Moreira', 'henrique.moreira367@uni.edu', 'Redes de Computadores', '2023-01-03', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Barbosa', 'henrique.barbosa368@uni.edu', 'Segurança da Informação', '2023-01-04', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Pinto', 'henrique.pinto369@uni.edu', 'Sistemas de Informação', '2023-01-05', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Teixeira', 'henrique.teixeira370@uni.edu', 'Ciência da Computação', '2023-01-06', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Fernandes', 'henrique.fernandes371@uni.edu', 'Engenharia de Software', '2023-01-07', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Araujo', 'henrique.araujo372@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2023-01-08', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Melo', 'henrique.melo373@uni.edu', 'Banco de Dados', '2023-01-09', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Castro', 'henrique.castro374@uni.edu', 'Gestão de TI', '2023-01-10', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Cardoso', 'henrique.cardoso375@uni.edu', 'Redes de Computadores', '2023-01-11', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Batista', 'henrique.batista376@uni.edu', 'Segurança da Informação', '2023-01-12', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Nunes', 'henrique.nunes377@uni.edu', 'Sistemas de Informação', '2023-01-13', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Campos', 'henrique.campos378@uni.edu', 'Ciência da Computação', '2023-01-14', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Pires', 'henrique.pires379@uni.edu', 'Engenharia de Software', '2023-01-15', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Correia', 'henrique.correia380@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2023-01-16', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Moura', 'henrique.moura381@uni.edu', 'Banco de Dados', '2023-01-17', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Freitas', 'henrique.freitas382@uni.edu', 'Gestão de TI', '2023-01-18', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Cunha', 'henrique.cunha383@uni.edu', 'Redes de Computadores', '2023-01-19', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Farias', 'henrique.farias384@uni.edu', 'Segurança da Informação', '2023-01-20', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Duarte', 'henrique.duarte385@uni.edu', 'Sistemas de Informação', '2023-01-21', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Tavares', 'henrique.tavares386@uni.edu', 'Ciência da Computação', '2023-01-22', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Monteiro', 'henrique.monteiro387@uni.edu', 'Engenharia de Software', '2023-01-23', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Mota', 'henrique.mota388@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2023-01-24', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Prado', 'henrique.prado389@uni.edu', 'Banco de Dados', '2023-01-25', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Rios', 'henrique.rios390@uni.edu', 'Gestão de TI', '2023-01-26', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Rezende', 'henrique.rezende391@uni.edu', 'Redes de Computadores', '2023-01-27', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Viana', 'henrique.viana392@uni.edu', 'Segurança da Informação', '2023-01-28', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Matos', 'henrique.matos393@uni.edu', 'Sistemas de Informação', '2023-01-29', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Sales', 'henrique.sales394@uni.edu', 'Ciência da Computação', '2023-01-30', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Queiroz', 'henrique.queiroz395@uni.edu', 'Engenharia de Software', '2023-01-31', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Guimaraes', 'henrique.guimaraes396@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2023-02-01', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Assis', 'henrique.assis397@uni.edu', 'Banco de Dados', '2023-02-02', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Barros', 'henrique.barros398@uni.edu', 'Gestão de TI', '2023-02-03', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Andrade', 'henrique.andrade399@uni.edu', 'Redes de Computadores', '2023-02-04', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Henrique Xavier', 'henrique.xavier400@uni.edu', 'Segurança da Informação', '2023-02-05', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Silva', 'isabela.silva401@uni.edu', 'Sistemas de Informação', '2023-02-06', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Santos', 'isabela.santos402@uni.edu', 'Ciência da Computação', '2023-02-07', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Oliveira', 'isabela.oliveira403@uni.edu', 'Engenharia de Software', '2023-02-08', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Souza', 'isabela.souza404@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2023-02-09', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Rodrigues', 'isabela.rodrigues405@uni.edu', 'Banco de Dados', '2023-02-10', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Ferreira', 'isabela.ferreira406@uni.edu', 'Gestão de TI', '2023-02-11', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Alves', 'isabela.alves407@uni.edu', 'Redes de Computadores', '2023-02-12', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Pereira', 'isabela.pereira408@uni.edu', 'Segurança da Informação', '2023-02-13', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Lima', 'isabela.lima409@uni.edu', 'Sistemas de Informação', '2023-02-14', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Gomes', 'isabela.gomes410@uni.edu', 'Ciência da Computação', '2023-02-15', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Costa', 'isabela.costa411@uni.edu', 'Engenharia de Software', '2023-02-16', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Ribeiro', 'isabela.ribeiro412@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2023-02-17', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Martins', 'isabela.martins413@uni.edu', 'Banco de Dados', '2023-02-18', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Carvalho', 'isabela.carvalho414@uni.edu', 'Gestão de TI', '2023-02-19', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Rocha', 'isabela.rocha415@uni.edu', 'Redes de Computadores', '2023-02-20', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Dias', 'isabela.dias416@uni.edu', 'Segurança da Informação', '2023-02-21', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Moreira', 'isabela.moreira417@uni.edu', 'Sistemas de Informação', '2023-02-22', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Barbosa', 'isabela.barbosa418@uni.edu', 'Ciência da Computação', '2023-02-23', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Pinto', 'isabela.pinto419@uni.edu', 'Engenharia de Software', '2023-02-24', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Teixeira', 'isabela.teixeira420@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2023-02-25', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Fernandes', 'isabela.fernandes421@uni.edu', 'Banco de Dados', '2023-02-26', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Araujo', 'isabela.araujo422@uni.edu', 'Gestão de TI', '2023-02-27', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Melo', 'isabela.melo423@uni.edu', 'Redes de Computadores', '2023-02-28', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Castro', 'isabela.castro424@uni.edu', 'Segurança da Informação', '2023-03-01', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Cardoso', 'isabela.cardoso425@uni.edu', 'Sistemas de Informação', '2023-03-02', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Batista', 'isabela.batista426@uni.edu', 'Ciência da Computação', '2023-03-03', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Nunes', 'isabela.nunes427@uni.edu', 'Engenharia de Software', '2023-03-04', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Campos', 'isabela.campos428@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2023-03-05', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Pires', 'isabela.pires429@uni.edu', 'Banco de Dados', '2023-03-06', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Correia', 'isabela.correia430@uni.edu', 'Gestão de TI', '2023-03-07', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Moura', 'isabela.moura431@uni.edu', 'Redes de Computadores', '2023-03-08', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Freitas', 'isabela.freitas432@uni.edu', 'Segurança da Informação', '2023-03-09', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Cunha', 'isabela.cunha433@uni.edu', 'Sistemas de Informação', '2023-03-10', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Farias', 'isabela.farias434@uni.edu', 'Ciência da Computação', '2023-03-11', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Duarte', 'isabela.duarte435@uni.edu', 'Engenharia de Software', '2023-03-12', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Tavares', 'isabela.tavares436@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2023-03-13', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Monteiro', 'isabela.monteiro437@uni.edu', 'Banco de Dados', '2023-03-14', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Mota', 'isabela.mota438@uni.edu', 'Gestão de TI', '2023-03-15', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Prado', 'isabela.prado439@uni.edu', 'Redes de Computadores', '2023-03-16', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Rios', 'isabela.rios440@uni.edu', 'Segurança da Informação', '2023-03-17', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Rezende', 'isabela.rezende441@uni.edu', 'Sistemas de Informação', '2023-03-18', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Viana', 'isabela.viana442@uni.edu', 'Ciência da Computação', '2023-03-19', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Matos', 'isabela.matos443@uni.edu', 'Engenharia de Software', '2023-03-20', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Sales', 'isabela.sales444@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2023-03-21', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Queiroz', 'isabela.queiroz445@uni.edu', 'Banco de Dados', '2023-03-22', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Guimaraes', 'isabela.guimaraes446@uni.edu', 'Gestão de TI', '2023-03-23', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Assis', 'isabela.assis447@uni.edu', 'Redes de Computadores', '2023-03-24', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Barros', 'isabela.barros448@uni.edu', 'Segurança da Informação', '2023-03-25', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Andrade', 'isabela.andrade449@uni.edu', 'Sistemas de Informação', '2023-03-26', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Isabela Xavier', 'isabela.xavier450@uni.edu', 'Ciência da Computação', '2023-03-27', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Silva', 'joao.silva451@uni.edu', 'Engenharia de Software', '2023-03-28', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Santos', 'joao.santos452@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2023-03-29', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Oliveira', 'joao.oliveira453@uni.edu', 'Banco de Dados', '2023-03-30', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Souza', 'joao.souza454@uni.edu', 'Gestão de TI', '2023-03-31', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Rodrigues', 'joao.rodrigues455@uni.edu', 'Redes de Computadores', '2023-04-01', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Ferreira', 'joao.ferreira456@uni.edu', 'Segurança da Informação', '2023-04-02', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Alves', 'joao.alves457@uni.edu', 'Sistemas de Informação', '2023-04-03', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Pereira', 'joao.pereira458@uni.edu', 'Ciência da Computação', '2023-04-04', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Lima', 'joao.lima459@uni.edu', 'Engenharia de Software', '2023-04-05', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Gomes', 'joao.gomes460@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2023-04-06', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Costa', 'joao.costa461@uni.edu', 'Banco de Dados', '2023-04-07', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Ribeiro', 'joao.ribeiro462@uni.edu', 'Gestão de TI', '2023-04-08', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Martins', 'joao.martins463@uni.edu', 'Redes de Computadores', '2023-04-09', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Carvalho', 'joao.carvalho464@uni.edu', 'Segurança da Informação', '2023-04-10', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Rocha', 'joao.rocha465@uni.edu', 'Sistemas de Informação', '2023-04-11', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Dias', 'joao.dias466@uni.edu', 'Ciência da Computação', '2023-04-12', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Moreira', 'joao.moreira467@uni.edu', 'Engenharia de Software', '2023-04-13', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Barbosa', 'joao.barbosa468@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2023-04-14', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Pinto', 'joao.pinto469@uni.edu', 'Banco de Dados', '2023-04-15', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Teixeira', 'joao.teixeira470@uni.edu', 'Gestão de TI', '2023-04-16', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Fernandes', 'joao.fernandes471@uni.edu', 'Redes de Computadores', '2023-04-17', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Araujo', 'joao.araujo472@uni.edu', 'Segurança da Informação', '2023-04-18', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Melo', 'joao.melo473@uni.edu', 'Sistemas de Informação', '2023-04-19', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Castro', 'joao.castro474@uni.edu', 'Ciência da Computação', '2023-04-20', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Cardoso', 'joao.cardoso475@uni.edu', 'Engenharia de Software', '2023-04-21', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Batista', 'joao.batista476@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2023-04-22', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Nunes', 'joao.nunes477@uni.edu', 'Banco de Dados', '2023-04-23', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Campos', 'joao.campos478@uni.edu', 'Gestão de TI', '2023-04-24', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Pires', 'joao.pires479@uni.edu', 'Redes de Computadores', '2023-04-25', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Correia', 'joao.correia480@uni.edu', 'Segurança da Informação', '2023-04-26', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Moura', 'joao.moura481@uni.edu', 'Sistemas de Informação', '2023-04-27', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Freitas', 'joao.freitas482@uni.edu', 'Ciência da Computação', '2023-04-28', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Cunha', 'joao.cunha483@uni.edu', 'Engenharia de Software', '2023-04-29', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Farias', 'joao.farias484@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2023-04-30', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Duarte', 'joao.duarte485@uni.edu', 'Banco de Dados', '2023-05-01', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Tavares', 'joao.tavares486@uni.edu', 'Gestão de TI', '2023-05-02', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Monteiro', 'joao.monteiro487@uni.edu', 'Redes de Computadores', '2023-05-03', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Mota', 'joao.mota488@uni.edu', 'Segurança da Informação', '2023-05-04', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Prado', 'joao.prado489@uni.edu', 'Sistemas de Informação', '2023-05-05', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Rios', 'joao.rios490@uni.edu', 'Ciência da Computação', '2023-05-06', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Rezende', 'joao.rezende491@uni.edu', 'Engenharia de Software', '2023-05-07', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Viana', 'joao.viana492@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2023-05-08', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Matos', 'joao.matos493@uni.edu', 'Banco de Dados', '2023-05-09', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Sales', 'joao.sales494@uni.edu', 'Gestão de TI', '2023-05-10', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Queiroz', 'joao.queiroz495@uni.edu', 'Redes de Computadores', '2023-05-11', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Guimaraes', 'joao.guimaraes496@uni.edu', 'Segurança da Informação', '2023-05-12', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Assis', 'joao.assis497@uni.edu', 'Sistemas de Informação', '2023-05-13', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Barros', 'joao.barros498@uni.edu', 'Ciência da Computação', '2023-05-14', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Andrade', 'joao.andrade499@uni.edu', 'Engenharia de Software', '2023-05-15', 0, NULL, NULL);
INSERT INTO dbo.Alunos (Nome, Email, Curso, DataMatricula, Apagado, UsuarioAlteracao, DataAlteracao) VALUES ('Joao Xavier', 'joao.xavier500@uni.edu', 'Análise e Desenvolvimento de Sistemas', '2023-05-16', 0, NULL, NULL);


select * from ALUNO