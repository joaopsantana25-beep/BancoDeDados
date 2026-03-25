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
preco decimal(10,2),

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
id_Item int,
data_saida timestamp,
quantidade_Vendida int,

foreign key (id_Venda) references Vendas(id),
foreign key (id_Funcionario) references Funcionarios(id),
foreign key (id_Item) references Produtos(id)
);


create table Estoque(
id int auto_increment primary key,
id_Produto int,
nome_Produto varchar(255),
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

insert into Produtos(nome,descricao,quantidade_estoque,id_Categoria_Produto,preco)
values
("Notebook Positivo","Notebook maravilhoso e super atualizado da marca Positivo","15","2","700.00"),
("Notebook DELL","Notebook DELL vesão para trabalho doméstico","30","2","8000.00"),
("Cadeira Gamer","Cadeira Gamer ergonômica","8","3","1500.00"),
("Gabinete de Tal","Gabinete super confiável da marca de Tal","40","5","600.00"),
("Mouse Wireless","Mouse wireless da marca Xingling","40","1","200.00");

insert into Funcionarios(nome,cargo,descricao,email,salario)
values
("José Buendia","Balconista","Jose é um excelente vendedor e atualmente trabalha como balconista","macondo@gmail.com","3000.00"),
("Carlos Heitor","Gerente Geral","Carlos Heitor é um ótimo gerente","carlosheitor@gmail.com","6000.00"),
("Romário da Silva","Estoquista","Romário trabalha como estoquista nos fins de semana","romariosilva@gmail.com","2000.00"),
("Pedro Albuquerque","Balconista","Pedro trabalha muito bem com Jose e é um otimo balconista","pedro@gmail.com","3000.00"),
("Rogerio","CEO","Rogerio é o CEO da empresa MAD","rogerio@gmail.com","15000.00");

insert into Pagamentos(id_Funcionario,id_Fornecedor,valor_pagamento,data_pagamento,itens_comprados,formas_pagamentos,descricao)
values
("2","1","7000.00","2026-01-01","10 Notebooks Positivos","Dinheiro","Compra de 10 notebooks da positivo no dia 01 de Janeiro"),
("5","5","4000.00","2025-03-05","3 Cadeiras Gamers","Cartão de Crédito","Compra de 3 cadeiras gamers ergonômicas no dia 05 de Março"),
("5","4","5000.00","2025-03-05","10 Gabinetes da marca Tal","Catão de Débito","Compra de 10 gabinetes no dia 05 de Março"),
("5","3","5000.00","2025-11-05","30 Mouses wireless","Boleto","Compra de 30 mouses wireless no dia 05 de Novembro"),
("5","1","5000.00","2025-12-05","3 notebooks DELL","Dinheiro","Compra de 3 notebooks da marca dell no dia 05 de Dezembro");

insert into Vendas(data_venda,id_Funcionario,id_Cliente,valor_venda,formas_pagamentos,descricao)
values
("2026-03-20","1","1","900.00","Cartão de Débito","Venda de um notebook da positivo e um mouse wireless"),
("2026-03-20","1","2","3000.00","Cartão de Débito","Compra de duas cadeiras gamers ergonômicas"),
("2026-03-20","4","3","1200.00","Pix","Compra de dois gabinetes da marca TAL"),
("2026-03-20","4","4","1400.00","Pix","Compra de dois notebooks da positivo"),
("2026-03-20","4","5","8000.00","Dinheiro","Compra de um notebooks DELL");

insert into Itens_Vendidos(id_Venda,id_Funcionario,id_Item,data_saida,quantidade_Vendida)
values
("1","1","1","2026-03-20","1"),
("1","1","5","2026-03-20","1"),
("2","1","3","2026-03-20","3"),
("3","4","4","2026-03-20","2"),
("4","4","1","2026-03-20","2"),
("5","4","2","2026-03-20","1");

insert into Estoque(id_Produto,historico_saidas,historico_entradas,id_Categoria_Item,descricao,quantidade_estoque,nome_Produto)
values
("1","1","1","2","Notebooks da positivo","15","Notebook Positivo"),
("5","1","4","1","Mouses Wireless Xingling","40","Mouses Wireless"),
("3","2","2","3","Cadeira Gamers Ergonomicas","8","Cadeira Gamer"),
("4","3","5","5","Gabinetes da Marca Tal","40","Gabinetes de Tal"),
("2","5","5","2","Notebooks da DELL","30","Notebooks DELL");



select *
from produtos;

select *
from estoque;

select *
from Vendas;

select *
from Clientes;

select distinct formas_pagamentos as Formas_de_Pagamentos
from Pagamentos;














