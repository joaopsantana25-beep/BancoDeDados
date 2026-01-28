use escolasenai;usuarios 
create table usuarios(
id int primary key auto_increment,
nome varchar(100),
email varchar(100) unique,
idade int
);