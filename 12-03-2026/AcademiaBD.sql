drop database AcademiaDB;
create database AcademiaDB;


use AcademiaDB;


create table Alunos (
id INT auto_increment primary key,
nome varchar(255),
email varchar(100),
telefone varchar(20),
data_nascimento date
);


create table Instrutores(
id int auto_increment primary key,
nome varchar(255),
email varchar(100),
telefone varchar(20),
especialidade varchar(100),
data_de_cadastro date
);

create table Aulas(
id int auto_increment primary key,
id_instrutor int,
nome varchar(255),
descricao text,
horario datetime,
foreign key (id_instrutor) references Instrutores(id)
);

create table Matriculas(
id int auto_increment primary key,
id_aluno int,
id_aula int,
foreign key (id_aluno) references Alunos(id),
foreign key (id_aula) references Aulas(id)
);

create table Pagamentos(
id int auto_increment primary key,
id_aluno int,
valor_pago decimal(10,2),
foreign key (id_aluno) references Alunos(id)
);


create table Presenca(
id int auto_increment primary key,
id_aluno int,
id_aula int,
status_presenca varchar(20),
foreign key (id_aluno) references Alunos(id),
foreign key (id_aula) references Aulas(id)
);

INSERT INTO Alunos (nome, email, telefone, data_nascimento) 
VALUES
('Lucas Silva', 'lucas.silva@email.com', '11987654321', '2000-05-14'),
('Mariana Souza', 'mariana.souza@email.com', '11987654322', '1999-11-03'),
('Pedro Santos', 'pedro.santos@email.com', '11987654323', '2001-02-20'),
('Ana Oliveira', 'ana.oliveira@email.com', '11987654324', '2000-07-09'),
('Carlos Pereira', 'carlos.pereira@email.com', '11987654325', '1998-09-18'),
('Juliana Costa', 'juliana.costa@email.com', '11987654326', '2001-03-11'),
('Rafael Rodrigues', 'rafael.rodrigues@email.com', '11987654327', '1999-12-25'),
('Fernanda Almeida', 'fernanda.almeida@email.com', '11987654328', '2000-01-30'),
('Bruno Martins', 'bruno.martins@email.com', '11987654329', '2002-04-16'),
('Patricia Gomes', 'patricia.gomes@email.com', '11987654330', '1998-06-27'),
('Gabriel Ribeiro', 'gabriel.ribeiro@email.com', '11987654331', '2001-08-12'),
('Camila Carvalho', 'camila.carvalho@email.com', '11987654332', '2000-10-05'),
('Matheus Araujo', 'matheus.araujo@email.com', '11987654333', '1999-02-14'),
('Larissa Fernandes', 'larissa.fernandes@email.com', '11987654334', '2001-09-21'),
('Thiago Barbosa', 'thiago.barbosa@email.com', '11987654335', '1998-03-02'),
('Beatriz Rocha', 'beatriz.rocha@email.com', '11987654336', '2002-07-19'),
('Eduardo Dias', 'eduardo.dias@email.com', '11987654337', '1999-04-28'),
('Isabela Teixeira', 'isabela.teixeira@email.com', '11987654338', '2000-12-07'),
('Felipe Moreira', 'felipe.moreira@email.com', '11987654339', '2001-06-15'),
('Aline Lopes', 'aline.lopes@email.com', '11987654340', '1998-11-23'),
('Daniel Cardoso', 'daniel.cardoso@email.com', '11987654341', '2000-02-10'),
('Renata Monteiro', 'renata.monteiro@email.com', '11987654342', '1999-07-31'),
('Vinicius Nunes', 'vinicius.nunes@email.com', '11987654343', '2001-05-04'),
('Carolina Mendes', 'carolina.mendes@email.com', '11987654344', '2000-09-13'),
('Gustavo Freitas', 'gustavo.freitas@email.com', '11987654345', '1998-12-01'),
('Natalia Batista', 'natalia.batista@email.com', '11987654346', '2002-01-17'),
('Rodrigo Farias', 'rodrigo.farias@email.com', '11987654347', '1999-03-26'),
('Tatiane Duarte', 'tatiane.duarte@email.com', '11987654348', '2000-08-22'),
('Leandro Pires', 'leandro.pires@email.com', '11987654349', '2001-11-09'),
('Vanessa Moura', 'vanessa.moura@email.com', '11987654350', '1998-05-30'),
('Diego Castro', 'diego.castro@email.com', '11987654351', '2002-06-18'),
('Paula Ramos', 'paula.ramos@email.com', '11987654352', '1999-10-24'),
('André Melo', 'andre.melo@email.com', '11987654353', '2001-01-06'),
('Priscila Neves', 'priscila.neves@email.com', '11987654354', '2000-04-12'),
('Marcelo Tavares', 'marcelo.tavares@email.com', '11987654355', '1998-07-07'),
('Sabrina Coelho', 'sabrina.coelho@email.com', '11987654356', '2002-03-29'),
('Alexandre Cunha', 'alexandre.cunha@email.com', '11987654357', '1999-06-02'),
('Roberta Peixoto', 'roberta.peixoto@email.com', '11987654358', '2001-12-14'),
('Leonardo Antunes', 'leonardo.antunes@email.com', '11987654359', '2000-05-21'),
('Bianca Viana', 'bianca.viana@email.com', '11987654360', '1998-10-16');

INSERT INTO Instrutores (nome, email, telefone, especialidade, data_de_cadastro) 
VALUES
('Ricardo Mendes', 'ricardo.mendes@email.com', '11991234501', 'Yoga', '2023-01-15'),
('Patricia Alves', 'patricia.alves@email.com', '11991234502', 'Pilates', '2023-02-10'),
('Fernando Barros', 'fernando.barros@email.com', '11991234503', 'Jiu-Jitsu', '2023-03-05'),
('Carla Nogueira', 'carla.nogueira@email.com', '11991234504', 'Taekwond-Do', '2023-01-28'),
('Roberto Lima', 'roberto.lima@email.com', '11991234505', 'Natação', '2023-04-12'),
('Juliana Teodoro', 'juliana.teodoro@email.com', '11991234506', 'Hidroginástica', '2023-02-22'),
('Eduardo Campos', 'eduardo.campos@email.com', '11991234507', 'Musculação', '2023-03-30'),
('Aline Furtado', 'aline.furtado@email.com', '11991234508', 'Cross-Fit', '2023-01-19'),
('Marcelo Guedes', 'marcelo.guedes@email.com', '11991234509', 'MMA', '2023-04-03'),
('Vanessa Prado', 'vanessa.prado@email.com', '11991234510', 'Ginástica', '2023-02-14');

INSERT INTO Aulas (nome, descricao, horario, id_instrutor) VALUES
('Yoga', 'Conceitos básicos yoga', '2024-03-01 09:00:00', 1),
('Pilates', 'Conceitos básico de pilates para iniciantes', '2024-03-02 10:00:00', 2),
('Jiu-Jitsu', 'Aula de jiu jitsu para iniciantes', '2024-03-03 14:00:00', 3),
('Taekwon-Do', 'Seminário de diagrmas', '2024-03-04 09:30:00', 4),
('Natação', 'Aula para atletas de natação', '2024-03-05 11:00:00', 5),
('Hidroginástica', 'Aula de hidroginástica para idosos', '2024-03-06 13:30:00', 6),
('Musculação', 'Aulas de musculação', '2024-03-07 15:00:00', 7),
('Cross-Fit', 'Aulas de Cross Fit', '2024-03-08 10:30:00', 8),
('MMA', 'Aula para atletas de MMA', '2024-03-09 14:30:00', 9),
('Ginástica', 'Aulas infantis de ginástica.', '2024-03-10 16:00:00', 10);

INSERT INTO Matriculas (id_aluno, id_aula) 
VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(6, 3),
(7, 4),
(8, 5),
(9, 6),
(10, 7),
(11, 8),
(12, 9);

INSERT INTO Pagamentos (id_aluno, valor_pago) 
VALUES
(1, 150.00),
(2, 200.00),
(3, 180.00),
(4, 220.00),
(5, 150.00),
(6, 190.00),
(7, 210.00),
(8, 175.00);

INSERT INTO Presenca (id_aluno, id_aula, status_presenca) 
VALUES
(1, 1, 'presente'),
(2, 1, 'ausente'),
(3, 2, 'presente'),
(4, 2, 'presente'),
(5, 3, 'ausente'),
(6, 4, 'presente'),
(7, 5, 'presente');

