drop database biblioteca;

create database biblioteca;

use biblioteca;


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
endereco varchar(255),
data_registro date
);


create table Funcionarios(
id int auto_increment primary key,
nome varchar(255),
cargo varchar(100),
email varchar(100),
telefone varchar(20)
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
foreign key (id_usuario) references Usuarios(id)
); 


insert into livros(titulo,autor,ano_publicado,genero,quantidade_estoque,isbn)
values 
("O Xangô de Baker Street","Jô Soares","1995","Comédia,Mistério",10, "978-8535920109"),
("As Esgandas","Jô Soares","2011","Ficção Policial",12,"9788535919752"),
("O Homem que Matou Getúlio Vargas","Jô Soaes","1998","Ficção Histórica",3,"978-8571648395"),
("Assassinatos na Academia Brasileira de Letras","Jô Soares","2005","Ficção,Mistério",0,"978-8535906172"),
("O Assassinato No Expresso Oriente", "Agatha Christie","1934","Ficção Policial",4,null),
("O Assassinato de Roger Ackroyd", "Agatha Christie","1926","Ficção Policial",5,null),
("O Misterioso Caso de Styles", "Agatha Christie","1920","Ficção Policial",6,null),
("Os crimes do ABC", "Agatha Christie","1936","Ficção Policial",0,null),
("Cai o Pano - O Último Caso de Poirot", "Agatha Christie","1975","Ficção Policial",8,null),
("O Caso dos Dez Negrinhos", "Agatha Christie","1939","Ficção Policial",9,null),
("Vidas Secas", "Graciliano Ramos","1938","Romance",10,null),
("Angustia", "Graciliano Ramos","1936","Romance",15,null),
("Insônia", "Graciliano Ramos","1947","Ficção",8,null),
("It - A Coisa", "Stephen King","1986","Romance, Terror",6,null),
("O Iluminado", "Stephen King","1977","Romance, Terror",2,null),
("A Espera de Um Milagre", "Stephen King","1996","Terror",2,null),
("Carrie", "Stephen King","1974","Romance, Terror",8,null),
("O Espião que Morreu de Tédio", "Geroge Mikes","1973","Comédia,Sátira",10,null),
("O Pequeno Príncipe", "Saint-Exupéry","1943","Literatura Infatil",12,null),
("O Vendedor de Sonhos - O Chamado", "Augusto Cury","2008","Romance Psicológico",14,null),
("O Vendedor de Sonhos - A Revolução dos Anônimos", "Augusto Cury","2009","Romance Psicológico",15,null),
("O Semeador de Ideias", "Augusto Cury","2010","Romance Psicológico",9,null),
("Coma","Robin Cook","1977","Suspense,Romance,Terror",8,null),
("Virus","Robin Cook","1987","Suspense,Romance,Terror",78,null),
("Terminal","Robin Cook","1993","Suspense,Romance,Terror",67,null),
("A Volta ao Mundo em 80 Dias","Julio Verne","1972","Ficção Científica",68,null),
("Vinte Mil Léguas Submarinas","Julio Verne","1970","Ficção Científica",8,null),
("Da Terra à Lua","Julio Verne","1965","Ficção Científica",10,null),
("O Alienista","Machado de Assis","1982","Ficção",12,null),
("Memórias Póstumas de Brás Cubas","Machado de Assis","1981","Ficção",4,null);


insert into Usuarios(nome,email,telefone,endereco)
values 
("João Paulo","joao@gmail.com","98070-0001","Avenida Paulista, 50"),
("Clarice Lispector","clarice.lis@gmail.com","98070-0002","Oscar Freire,788"),
("Machado de Assis","machado.assis@gmail.com","98070-0003","25 de Março,69"),
("Conan Doyle","sherlock@gmail.com","98070-0004","Rua Augusta,95"),
("Carlos Andre","carlos.andrade@gmail.com","98070-0005","Avenida São João,99"),
("Agatha Christie","hercule@gmail.com","98070-0006","Rua São Caetano,55"),
("Carlos Heito Cony","pai.amado@gmail.com","98070-0007","Ladeira Porto Geral,25"),
("Oswald de Andrade","pedra.no.caminho@gmail.com","98070-0008","Avenida 9 de Julho,500"),
("Jô Soares","OGordo@gmail.com","98070-0009","Rua Seridó,77"),
("Esteve Rei","o.iluminado@gmail.com","98070-0010","Rua Barão de Capanema,91"),
("Jorge Amado","pedro.bala@gmail.com","98070-0011","Rua Escobar Ortiz,43"),
("Maria Clara","maria.clara@gmail.com","98070-0012","Rua Avanhandava,66"),
("Júlio Verne","capitão.nemo@gmail.com","98070-0013","Avenida Atlântica,98"),
("Pedro Bandeira","os.Karas@gmail.com","98070-0014","Rua Dias Ferreira,275"),
("João Carlos Marinho","bolachao@gmail.com","98070-0015","Avenida Marechal Tito,27");

insert into Funcionarios(nome,cargo,email,telefone)
values 
("Joao Paulo","Gerente Geral","jp@gmail.com","98000-0020"),
("Tomas Henrique","Balconista","t.henrique@gmail.com","98000-0220"),
("Beatriz Lacerda","Repositora","beatriz.lacerda@gmail.com","98000-0060");





