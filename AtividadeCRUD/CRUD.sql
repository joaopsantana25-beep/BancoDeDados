drop database if exists dbProjetos;

#1.Crie um banco de dados chamado dbProjetos e o coloque em uso.

create dataBase dbProjetos;
use dbProjetos;

/*
2.Crie as seguintes tabelas no banco db_Projetos:
a) Tabela Funcionarios
*/

create table if not exists Funcionarios(
Id_Funcionario int  auto_increment primary key,
Nome varchar(100) not null,
Sobrenome varchar(100) not null,
Email varchar(50) not null unique,
Data_Nascimento date not null,
Data_Admissao date not null,
Salario decimal(10,2) not null
);

/*
3.Crie as seguintes tabelas no banco db_Projetos:
b) Tabela Projetos
*/

create table if not exists Projetos(
Id_Projeto int auto_increment primary key,
Nome_Projeto varchar(100) not null unique,
Descricao varchar(250) not null,
Data_Inicio date not null,
Data_Fim date
);

/*
4.Crie as seguintes tabelas no banco db_Projetos:
c) Tabela Alocacoes
*/

create table if not exists Alocacoes(
Id_Alocacao int auto_increment primary key,
Id_Funcionario int ,
Id_Projeto int,
Horas_Trabalhadas int,


foreign key (Id_Funcionario) references funcionarios(id_Funcionario),
foreign key (Id_Projeto) references projetos(id_Projeto)
);

/*
5.Agora que as tabelas foram criadas, insira os dados dos funcionários,
projetos e alocações:
a) Insira 10 funcionários na tabela Funcionarios e faça uma consulta
para verificar se os dados foram inseridos corretamente:
*/

INSERT INTO Funcionarios
(Nome, Sobrenome, Email, Data_Nascimento, Data_Admissao, Salario)
VALUES
('Ana', 'Silva', 'ana.silva@email.com', '1985-02-20', '2010-04-10', 3500.50),
('Carlos', 'Oliveira', 'carlos.oliveira@email.com', '1990-05-15', '2015-08-01', 4000.00),
('Lucas', 'Souza', 'lucas.souza@email.com', '1988-07-22', '2012-09-10', 4500.75),
('Maria', 'Pereira', 'maria.pereira@email.com', '1995-11-30', '2017-02-14', 3800.00),
('João', 'Costa', 'joao.costa@email.com', '1980-01-10', '2011-03-18', 5000.00),
('Fernanda', 'Gomes', 'fernanda.gomes@email.com', '1992-04-05', '2016-06-30', 4200.00),
('Rodrigo', 'Martins', 'rodrigo.martins@email.com', '1987-09-25', '2013-07-20', 4600.00),
('Juliana', 'Alves', 'juliana.alves@email.com', '1994-10-12', '2018-01-15', 3700.00),
('Ricardo', 'Santos', 'ricardo.santos@email.com', '1983-12-05', '2010-11-20', 4800.50),
('Patrícia', 'Lima', 'patricia.lima@email.com', '1991-03-14', '2014-04-25', 4100.25);


select * 
from funcionarios;

/*
b) Insira 8 projetos na tabela Projetos e faça uma consulta para verificar
se os dados foram inseridos corretamente:
*/

INSERT INTO Projetos
(Nome_Projeto, Descricao, Data_Inicio, Data_Fim)
VALUES
('Sistema ERP','Desenvolvimento de um ERP para a empresa','2022-01-01','2023-01-01'),
('Reestruturação Financeira','Projeto de reestruturação do setor financeiro','2021-06-01','2022-12-31'),
('Desenvolvimento Web','Criação de um site institucional','2022-03-15', NULL),
('Automação de Processos','Automação dos processos internos da empresa','2022-07-01','2023-05-01'),
('Plataforma E-Commerce','Desenvolvimento de plataforma para vendas online','2022-05-10',NULL),
('Integração de Sistemas','Integração de sistemas de gestão com fornecedores','2022-08-01','2023-06-30'),
('Expansão de Mercado','Projeto para expansão da empresa para novas regiões','2023-01-01',NULL),
('Segurança de TI','Melhoria da infraestrutura de segurança de TI','2022-11-01','2023-11-01');


select * from projetos;

/*
6.Insira 20 alocações na tabela Alocacoes e faça uma consulta para
verificar se os dados foram inseridos corretamente:
*/

INSERT INTO Alocacoes
(Id_Funcionario, Id_Projeto, Horas_Trabalhadas)
VALUES
(1, 1, 40),
(2, 2, 35),
(3, 3, 45),
(4, 4, 40),
(5, 5, 38),
(6, 6, 40),
(7, 7, 42),
(8, 8, 36),
(9, 1, 40),
(10, 2, 35),
(1, 3, 40),
(2, 4, 38),
(3, 5, 40),
(4, 6, 35),
(5, 7, 38),
(6, 8, 40),
(7, 3, 36),
(8, 4, 45),
(9, 5, 40),
(10, 6, 42);

select * from Alocacoes;

/*
7.Você recebeu uma solicitação do departamento de recursos humanos
para ajustar o salário de um dos funcionários. O funcionário com o
ID_Funcionario igual a 3 (Lucas Souza) deve ter o seu salário
aumentado de R$ 4500,75 para R$ 5000,00. Realize a atualização da
tabela Funcionarios para refletir esse aumento salarial.
*/


update funcionarios
set salario = 5000
where (Id_Funcionario = 3 and Nome = "Lucas" and sobrenome = "Souza");

select * from funcionarios;

/*
8.O projeto &quot;Expansão de Mercado&quot; (ID_Projeto = 7) foi cancelado e,
como resultado, precisa ser removido do banco de dados. Como este
projeto está referenciado na tabela Alocacoes, é necessário seguir os
seguintes passos para realizar sua exclusão:
a) Excluir todas as alocações que fazem referência a esse projeto na
tabela Alocacoes.
b) Após a exclusão das alocações, excluir o projeto da tabela Projetos.
*/

delete from alocacoes
where (id_projeto =7);

delete from Projetos
where Nome_Projeto = "Expansão de Mercado";

select * from alocacoes;
select* from projetos;

/*
9.A empresa realizou uma reestruturação em sua gestão de alocações de
recursos. O processo agora é gerenciado por um sistema externo
integrado, e, por isso, os dados armazenados na tabela Alocacoes já
foram migrados para essa nova plataforma. Para liberar espaço de
armazenamento e simplificar o banco de dados, a tabela Alocacoes deve
ser excluída. Efetue a exclusão dessa tabela.
*/

drop table if exists Alocacoes;

/*
10.Após uma revisão do planejamento de TI, a empresa decidiu
descontinuar o banco de dados db_Projetos. Isso ocorreu porque a gestão
de projetos foi reorganizada e um novo sistema de gestão foi
implementado, que utiliza uma plataforma diferente e mais integrada.
Como o banco de dados db_Projetos não será mais utilizado, é
necessário excluí-lo completamente do sistema, removendo todas as
tabelas e os dados nele contidos. Proceda à essa exclusão.
*/

drop database if exists dbProjetos;







