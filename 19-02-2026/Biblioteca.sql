use biblioteca;

/*
create table livros(
id INT auto_increment primary key,
titulo varchar(255),
autor varchar(255),
ano_publicado YEAR,
isbn varchar(20),
genero varchar(50),
quantidade_estoque int
);


create table Usuarios (
id INT auto_increment primary key,
nome varchar(255),
email varchar(100),
telefone varchar(20),
data_nascimento date,
data_registro timestamp default current_timestamp
);


create table Funcionarios(
id int auto_increment primary key,
nome varchar(255),
cargo varchar(100),
data_admissao date
);

create table Emprestimos(
id int auto_increment primary key,
id_usuario int,
id_livro int,
data_emprestimo date,
data_devolucao date,
status_emprestimo varchar(20),
foreign key (id_usuario) references Usuarios(id),
foreign key (id_livro) references livros(id)
);


create table Multas(
id int auto_increment primary key,
id_usuario int,
valor_multa decimal(10,2),
data_vencimento date,
status_pagamento varchar(20),
foreign key (id_usuarioid) references Usuarios(id)
); */




