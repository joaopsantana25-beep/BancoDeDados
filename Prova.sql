drop database MAD_Tecnologias;

create database MAD_Tecnologias;

use MAD_Tecnologias;

create Table Clientes(
id iNT auto_increment primary key,
nome varchar(255),
endereco varchar(255),
CPF varchar(20),
email varchar(255)
);

create table Fornecedores(
id int auto_increment primary key,
nome varchar(255),
email varchar(255),
endereco varchar(255),
descricao varchar(255)
);

create table Categorias_Produtos(
id int auto_increment primary key,
nome varchar(255),
descricao varchar(255),
endereco_na_loja varchar(255),
data_criacao timestamp
);

create table Produtos(
id int auto_increment primary key,
nome varchar(255),
descricao varchar(255),
quantidade_estoque int,
id_Categoria_Produto int,

foreign key (id_Categoria_Produto) references Categorias_Produtos(id)
);


create table Funcionarios(
id int  auto_increment primary key,
nome varchar(255),
cargo varchar(255),
descricao varchar(255),
email varchar(255),
salario decimal(10,2)
);

create table Pagamentos(
id int auto_increment primary key,
id_Funcionario int,
id_Fornecedor int,
valor_pagamento decimal(10,2),
data_pagamento timestamp,
itens_comprados varchar(255),
formas_pagamentos varchar(255),
descricao varchar(255),

foreign key (id_Funcionario) references Funcionarios(id),
foreign key (id_Fornecedor) references Fornecedores(id)
);

create table Vendas(
id int auto_increment primary key,
data_venda timestamp,
id_Funcionario int,
id_Cliente int,
valor_venda decimal(10,2),
formas_pagamentos varchar(255),
descricao varchar(255),

foreign key (id_Funcionario) references Funcionarios(id),
foreign key (id_Cliente) references Clientes(id)
);

create table Itens_Vendidos(
id int auto_increment primary key,
id_Venda int,
id_Funcionario int,
data_saida timestamp,
quantidade_Vendida int,

foreign key (id_Venda) references Vendas(id),
foreign key (id_Funcionario) references Funcionarios(id)
);


create table Estoque(
id int auto_increment primary key,
id_Produto int,
quantidade_estoque int,
historico_saidas int,
historico_entradas int,
id_Categoria_Item int,
descricao varchar(255),

foreign key (id_Produto) references Produtos(id),
foreign key (historico_saidas) references Vendas(id),
foreign key (historico_entradas) references Pagamentos(id),
foreign key (id_Categoria_Item) references Categorias_Produtos(id)
);



insert into Clientes(nome,email,endereco,CPF)
values 
("João Paulo","joao@gmail.com","Avenida Paulista, 50","505-505-505-30"),
("Clarice Lispector","clarice.lis@gmail.com","Oscar Freire,788","505-505-505-40"),
("Machado de Assis","machado.assis@gmail.com","25 de Março,69","505-505-505-60"),
("Conan Doyle","sherlock@gmail.com","Rua Augusta,95","505-505-505-70"),
("Carlos Andre","carlos.andrade@gmail.com","Avenida São João,99","505-505-505-80");

insert into Fornecedores(nome,email,endereco,descricao)
values
("Agatha Christie","hercule@gmail.com","Rua São Caetano,55","Vendedor de Notebooks"),
("Carlos Heito Cony","pai.amado@gmail.com","Ladeira Porto Geral,25","Vendedor de Placa-Mães"),
("Oswald de Andrade","pedra.no.caminho@gmail.com","Avenida 9 de Julho,500","Vendedor de Mouses e Telcados"),
("Jô Soares","OGordo@gmail.com","Rua Seridó,77","Vendedor de Gabinetes"),
("Esteve Rei","o.iluminado@gmail.com","Rua Barão de Capanema,91","Vendedor de Cadeiras Ergonômicas");

insert into Categorias_Produtos(nome,descricao,endereco_na_loja,data_criacao)
values
("Periféricos","Itens que são periféricos como mouses e teclados","Rua 6","2025-12-20 14:30:00"),
("Notebooks","Notebooks da marca Positivo e Dell","Rua 5","2025-12-20 13:30:00"),
("Cadeiras","Cadeiras gamers e ergonomicas","Rua 8","2025-12-20 12:30:00"),
("Placa Mães","Placa mães da Max","Rua 3","2025-12-20 15:30:00"),
("Gabintes","Gabinetes para pcs","Rua 4","2025-12-20 17:30:00");

