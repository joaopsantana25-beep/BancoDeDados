create database AcademiaDB;


use AcademiaDB;


create table Alunos (
id INT auto_increment primary key,
id_matricula int,
id_pagamentos int,
nome varchar(255),
email varchar(100),
telefone varchar(20),
data_nascimento date,
data_cadastro timestamp default current_timestamp


create table Instrutores(
id int auto_increment primary key,
id_aulas int,
nome varchar(255),
email varchar(100),
telefone varchar(20),
especialidade varchar(100)
);

create table Aulas(
id int auto_increment primary key,
id_instrutor int,
id_alunos int,
nome varchar(255),
descricao text,
horario datetime
);

create table Matriculas(
id int auto_increment primary key,
id_aluno int,
id_aula int,
data_da_matricula date,
status_matricula varchar(20)
);

create table Pagamentos(
id int auto_increment primary key,
id_aluno int,
valor_pago decimal(10,2),
forma_pagamento varchar(50),
data_pagamento datetime
);

create table Presenca(
id int auto_increment primary key,
id_aluno int,
id_aula int,
data_aula datetime,
status_presenca varchar(20)
);

