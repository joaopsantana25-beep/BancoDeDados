drop database if exists dbexemplo;
create database dbexemplo;
use dbexemplo;

create table if not exists dAlunos(
Id_aluno int primary key auto_increment,
Nome_aluno varchar(100) not null,
Email varchar(100) not null
);


create table if not exists dCursos(
Id_curso int primary key,
Nome_curso varchar(100) not null,
Preco_curso decimal(10,2) not null
);

create table if not exists fMatriculas(
Id_matricula int primary key,
Id_aluno int not null,
Id_curso int not null,
Data_cadastro date not null,

Foreign key(Id_aluno) references dAlunos(Id_aluno),
Foreign key(Id_curso) references dCursos(Id_curso)
);

-- 5. Inserindo dados nas tabelas.

INSERT INTO dAlunos(ID_Aluno, Nome_Aluno, Email)
VALUES
    (1, 'Ana','ana123@gmail.com'),
    (2, 'Bruno','bruno_vargas@outlook.com'),
    (3, 'Carla','carlinha1999@gmail.com'),
    (4, 'Diego','diicastroneves@gmail.com');

INSERT INTO dCursos(ID_Curso, Nome_Curso, Preco_Curso)
VALUES
    (1,'Excel',100),
    (2,'VBA',200),
    (3,'Power BI',50);

INSERT INTO fMatriculas(ID_Matricula, ID_Aluno, ID_Curso, Data_Cadastro)
VALUES
    (1, 1, 1,'2021-03-11'),
    (2, 1, 2,'2021-06-21'),
    (3, 2, 3,'2021-01-08'),
    (4, 3, 1,'2021-04-03'),
    (5, 4, 1,'2021-05-10'),
    (6, 4, 3,'2021-05-10');


#6. Atualizando dados de uma tabela com o UPDATE

Update dCursos
Set preco_curso = 300
where Id_curso = 1;


#7. Deletando registros de uma tabela

delete from fMatriculas
where Id_matricula =6;

/*
8. Truncate table x drop table 

Truncate Table : Deleta todos os registros da tabela de uma vez, mas
a table continua existindo

Drop Table: Deleta todos os registros da tabela, inclusive a 
própria tabela
*/

Truncate Table fMatriculas;

Drop table fMatriculas;







