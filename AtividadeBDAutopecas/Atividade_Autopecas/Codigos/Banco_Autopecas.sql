drop database IF EXISTS Loja_Autopeça;

create database Loja_Autopeça;

use Loja_Autopeça;

create Table Clientes(
cliente_id INT auto_increment primary key,
nome varchar(255),
cpf varchar(20),
telefone varchar(20),
email varchar(255),
endereco varchar(255)
);

create Table Funcionarios(
funcionario_id int auto_increment primary key,
nome varchar(255),
cargo varchar(255),
telefone varchar(20),
email varchar(255)
);

create Table Fornecedores(
fornecedor_id int auto_increment primary key,
nome varchar(255),
contato varchar(255),
telefone varchar(20),
email varchar(255),
cidade varchar(255)
);


create Table Produtos(
produto_id int auto_increment primary key,
nome varchar(255),
categoria varchar(255),
marca varchar(255),
preco decimal(10,2),
estoque int,
fornecedor_id int,

foreign key (fornecedor_id) references Fornecedores(fornecedor_id)
);

create Table Pedidos(
pedido_id int auto_increment primary key,
cliente_id int,
data_pedido datetime,
valor_total decimal(10,2),
status varchar(20),

foreign key (cliente_id) references Clientes(cliente_id)
);

create Table Itens_Pedido(
item_id int auto_increment primary key,
pedido_id int,
produto_id int,
quantidade int,
preco_unitario decimal(10,2),

foreign key (pedido_id) references Pedidos(pedido_id),
foreign key (produto_id) references Produtos(produto_id)
);






