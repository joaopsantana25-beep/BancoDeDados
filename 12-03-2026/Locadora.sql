drop database Locadora;

create database Locadora;

use Locadora;

create table Clientes(
id int auto_increment primary key,
nome varchar(255),
email varchar(255),
telefone varchar(20),
cpf varchar(20),
endereco varchar(255)
);

create table Filmes (
id int auto_increment primary key,
titulo varchar(255),
estudio varchar(255),
genero varchar(255),
quantidade_estoque int
);


create table Funcionarios(
id int auto_increment primary key,
nome varchar(255),
cargo varchar(100),
email varchar(100),
telefone varchar(20),
salario decimal(10,2)
);

create table Alugueis(
id  int auto_increment primary key,
id_filme int,
id_funcionario int,
data_emprestimo date,
data_devolucao date,
status_emprestimo varchar(25),
foreign key (id_filme) references Filmes(id),
foreign key (id_funcionario) references Funcionarios(id)
);

insert into Clientes(nome,email,telefone,endereco,cpf)
values 
("João Paulo","joao@gmail.com","98070-0001","Avenida Paulista, 50","500.500.500-70"),
("Clarice Lispector","clarice.lis@gmail.com","98070-0002","Oscar Freire,788","500.500.500-60"),
("Machado de Assis","machado.assis@gmail.com","98070-0003","25 de Março,69","500.500.505-70"),
("Conan Doyle","sherlock@gmail.com","98070-0004","Rua Augusta,95","500.500.500-10"),
("Carlos Andre","carlos.andrade@gmail.com","98070-0005","Avenida São João,99","500.500.504-70"),
("Agatha Christie","hercule@gmail.com","98070-0006","Rua São Caetano,55","500.500.503-70"),
("Carlos Heito Cony","pai.amado@gmail.com","98070-0007","Ladeira Porto Geral,25","500.530.500-70"),
("Oswald de Andrade","pedra.no.caminho@gmail.com","98070-0008","Avenida 9 de Julho,500","580.500.500-70"),
("Jô Soares","OGordo@gmail.com","98070-0009","Rua Seridó,77","500.500.530-70"),
("Jô Tavares","OoutroGordo@gmail.com","98071-0009","Rua Seridó,78","500.531.530-70");


insert into Filmes(titulo,estudio,genero,quantidade_estoque)
values
('Sierra Burgess é uma Loser','Netflix','Melodrama',5),
('Bob Esponja: Salvando a Fenda do Biquíni – O Filme da Sandy Bochechas (2024)','Netflix','Animacao',3),
('O Fabricante de Lágrimas','Netflix','Drama',4),
('Death Note','Netflix','Ficcao',4),
('Feios','Netflix','Ficcao Científica',3),
('Mentiras Perigosas, de Michael Scott','Amazon',"Terror",2),
('O Limite da Traição, de Tyler Perry','Amazon',"Documentario",4),
('Rebecca — A Mulher Inesquecível, de Ben Wheatley','Amazon',"Romance",4),
('Vigiados, de Dave Franco','Amazon',"Terror Psicológico",7),
('Selah e Os Espadas, de Tayarisha Poe','Amazon',"Crime ao Telespectador",2);


insert into Funcionarios(nome,cargo,email,telefone,salario)
values 
("Joao Paulo","Gerente Geral","jp@gmail.com","98000-0020",4500),
("Tomas Henrique","Balconista","t.henrique@gmail.com","98000-0220",3000),
("Beatriz Lacerda","Repositora","beatriz.lacerda@gmail.com","98000-0060",1000),
("Joao Pedro","Gerente Administrativo","jpedro@gmail.com","98000-0320",2000),
("Tomas Carlos","Vendedor","t.Carlos@gmail.com","98000-0920",4500),
("Beatriz Bianca","Repositora","beatriz.Bianca@gmail.com","98500-0060",200),
("Teseu","RH","teseu@gmail.com","98900-0020",3000),
("Heraclito","Balconista","heraclito@gmail.com","98660-0220",500),
("Beatriz Romena","RH","beatriz.romena@gmail.com","98800-0060",200),
("Beatriz Cacatua","RH","beatriz.cacatua@gmail.com","98870-0060",199);

insert into Alugueis(id_filme,id_funcionario,data_emprestimo,data_devolucao,status_emprestimo)
values
(1,1,"2026-03-03","2026-04-04","Emprestado"),
(2,1,"2026-03-03","2026-04-04","Emprestado"),
(3,2,"2025-03-03","2025-04-03","Devolvido"),
(3,4,"2024-04-03","2024-05-03","Devolvido"),
(5,2,"2026-06-03","2026-07-03","Emprestado"),
(1,4,"2026-01-03","2026-02-03","Devolvido"),
(1,1,"2023-12-03","2024-01-04","Devolvido"),
(5,2,"2026-02-03","2026-03-04","Devolvido"),
(1,1,"2020-12-03","2020-12-04","Devolvido"),
(1,1,"2026-05-04","2026-06-04","Devolvido");


select *
from clientes
;

select *
from Funcionarios
;

select *
from Filmes;


select *
from Alugueis;





 
