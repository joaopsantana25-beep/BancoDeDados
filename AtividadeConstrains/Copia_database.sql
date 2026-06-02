DROP DATABASE IF EXISTS dbExemplo;

CREATE DATABASE IF NOT EXISTS dbExemplo;

USE dbExemplo;

CREATE TABLE IF NOT EXISTS dAlunos (
ID_Aluno INT AUTO_INCREMENT PRIMARY KEY,
Nome_Aluno VARCHAR(100) NOT NULL,
Email VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS dCursos (
ID_Curso INT AUTO_INCREMENT PRIMARY KEY,
Nome_Curso VARCHAR(100) NOT NULL,
Preco_Curso DECIMAL(10, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS fMatriculas (
ID_Matricula INT AUTO_INCREMENT PRIMARY KEY,
ID_Aluno INT NOT NULL,
ID_Curso INT NOT NULL,
Data_Cadastro DATE NOT NULL,
FOREIGN KEY (ID_Aluno) REFERENCES dAlunos(ID_Aluno),
FOREIGN KEY (ID_Curso) REFERENCES dCursos(ID_Curso)
);


INSERT INTO dAlunos (ID_Aluno, Nome_Aluno, Email)
VALUES
(1, 'Ana', 'ana123@gmail.com'),
    (2, 'Bruno', 'bruno_vargas@outlook.com'),
    (3, 'Carla', 'carlinha@gmail.com'),
    (4, 'Diego', 'dicastroneves@gmail.com');
   
INSERT INTO dCursos(ID_Curso, Nome_Curso, Preco_Curso)
VALUES
(1, 'Excel', '100'),
    (2, 'VBA', 200),
    (3, 'Power BI', '150');
   
INSERT INTO fMatriculas (ID_Matricula, ID_Aluno, ID_Curso, Data_Cadastro)
VALUES
(1, 1, 1, '2021-03-11'),
    (2, 1, 2, '2021-06-21'),
    (3, 2, 3, '2021-01-08'),
    (4, 3, 1, '2021-04-03'),
    (5, 4, 1, '2021-05-10'),
    (6, 4, 3, '2021-05-10');