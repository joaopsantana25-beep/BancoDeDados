drop database joins;

create database joins;
use joins;

create table Produtos(
id_produto int auto_increment primary key,
nome_produto varchar(30),
id_subcategoria int
);

insert into produtos(nome_produto, id_subcategoria)
values
("Fone Bluetooth JBL",5),
("PS4",6),
("Notebook Samsung i3",2),
("iPhone 11", 1),
("Moto G9", 1);



create table subcategoria(
id_subcategoria int auto_increment primary key,
nome_subcategoria varchar(30)
);

insert into subcategoria(nome_subcategoria)
values
('Celular'),
("Notebook"),
("Câmera Digital"),
("Televisão"),
("Fone de Ouvido"),
("Video Game");


Select
id_produto,
nome_produto,
produtos.id_subcategoria,
nome_subcategoria
from produtos
inner join subcategoria
on produtos.id_subcategoria = subcategoria.id_subcategoria