USE dbExemplo;

DROP FUNCTION IF EXISTS Consultas;
DROP FUNCTION IF EXISTS nomeAlunoMaiusculo;
DROP FUNCTION IF EXISTS validarCurso;
drop function if exists quantidadeAlunos;
drop function if exists desconto;
drop procedure if exists reajustePercentual;
drop procedure if exists corrigirEmail;
drop procedure if exists deletarDados;
drop procedure if exists cadastrarCurso;
drop procedure if exists transferirAluno;

/*
1. O gestor deseja saber o preço de um curso pelo nome para facilitar consultas
rápidas na interface do sistema. Crie uma function que receba o nome do curso a
ser consultado e retorne seu preço. (Utilize a tabela dCursos no código da
function)
*/


delimiter $$

create function Consultas(nomeCurso varchar(100))
returns decimal(10,2) deterministic

begin 
	
    declare preco decimal(10,2);
    
	select 
    Preco_Curso
    into preco
    from dCursos
    where Nome_Curso=nomeCurso;
    
    return preco;
end $$

delimiter ;


select Consultas("Excel") as Preco_Curso;

/*
2. Um relatório precisa exibir os nomes dos alunos em letras maiúsculas para
padronização. Crie uma function que receba o nome do aluno como parâmetro e
faça essa padronização. (Utilize a tabela dAlunos para testar se a function está
funcionando)
*/

delimiter $$

create function nomeAlunoMaiusculo(nome varchar(100))
returns varchar(100) deterministic

begin 	
    return UPPER(nome);
    
end$$

delimiter ;

select 
nomeAlunoMaiusculo(Nome_Aluno) as "Nome"
from dAlunos;


/*
3. Antes de inserir matrículas, o sistema precisa validar se o curso existe no banco
de dados. Crie uma function que receba o nome do curso e verifique sua
existência, retornando 1 para quando o curso existir na tabela e 0 para quando
não existir na tabela. (Utilize a tabela dCursos no código da function)
*/

delimiter $$

create function validarCurso(nomeCurso varchar(100))
returns int deterministic

begin 

	declare validacao int default 0;
    DECLARE cursoEncontrado VARCHAR(100);
    
    select 
    Nome_Curso
    into cursoEncontrado
    from dCursos
    where Nome_Curso = nomeCurso
    limit 1;
    
    
    if cursoEncontrado is not null then set validacao=1;
    end if;
    
    return validacao;

end $$

delimiter ;

SELECT validarCurso('VB') AS "Validação";

/*
4. O gestor precisa calcular o valor do curso com um desconto aplicado para
campanhas promocionais. Crie uma function que receba o ID do Curso e o
percentual do desconto, calcule e retorne o preço com desconto. (Utilize a tabela
dCursos no código da function)
*/



delimiter $$

create function Desconto(Id_curso int, desconto decimal(10,2))
returns decimal(10,2) deterministic 

begin 
	
    declare precoDesconto decimal(10,2);
	declare preco decimal(10,2);
    
    select
    Preco_Curso
    into preco
    from dCursos
    where Id_Curso = id_curso
    limit 1;
    
    set precoDesconto = preco *(1-desconto);
    
    return precoDesconto;
    
end $$

delimiter ;

select Desconto(1,0.05) as "Desconto";

/*
5. O coordenador quer saber quantos alunos estão matriculados em cada curso para
ajustar a lotação das turmas. Crie uma function que receba o ID do curso e
retorne a contagem da quantidade de matrículas. (Utilize a tabela fMatriculas no
código da function e a tabela dCursos para testar se a function está funcionando)
*/

delimiter $$

create function quantidadeAlunos(IdCurso int)
returns int deterministic 
begin 
	
    declare quantidadeAlunos int;
    
    select 
    count(Id_matricula)
    into quantidadeAlunos
    from fMatriculas
    where Id_curso = IdCurso;
    
    return quantidadeAlunos;
    
end $$

delimiter ;

select quantidadeAlunos(3) as "Quantidade_Alunos";


/*
6. A administração decidiu aumentar o preço de todos os cursos por um fator
percentual. Crie uma procedure que receba o percentual do aumento e faça a
atualização dos preços na tabela. (Utilize a tabela dCursos no código da
procedure)
*/

delimiter $$


create procedure reajustePercentual(reajuste decimal(10,2))
begin 
	
    
	Update dCursos
	Set preco_curso = preco_curso*(1+reajuste);
   
end $$

delimiter ;

SET SQL_SAFE_UPDATES = 0;
call reajustePercentual(0.1);
select *
from dCursos;
SET SQL_SAFE_UPDATES = 1;
 
 /*
 7. A secretaria precisa corrigir e-mails de alunos registrados de forma incorreta no
sistema. Crie uma procedure que receba os parâmetros necessários (ID do aluno
e e-mail correto) e proceda à alteração na tabela. (Utilize a tabela dAlunos no
código da procedure)
*/

delimiter $$

create procedure corrigirEmail(IdAluno int, novoEmail varchar(100))
begin
	
    update dAlunos
    set Email = novoEmail
    where Id_aluno = IdAluno;
    
end $$

delimiter ; 

SET SQL_SAFE_UPDATES = 0;
call corrigirEmail(2,"ana.carol@gmail.com");
select *
from dAlunos;
SET SQL_SAFE_UPDATES = 1;

/*
8. Quando um aluno solicitar a exclusão completa de seus dados, todos os seus
dados pessoais, incluindo as matrículas associadas a esse aluno, devem ser
excluídos do banco de dados. Crie uma procedure que receba o ID do aluno e
exclua todos os seus dados pessoais e suas matrículas. (Utilize as tabelas
fMatriculas e dAlunos no código da procedure)
*/

delimiter $$

create procedure deletarDados(IdAluno int)
begin
	
    delete from fMatriculas
    where Id_aluno = IdAluno;
    
    delete from dAlunos
    where Id_aluno = IdAluno;
    
end $$

delimiter ;

call deletarDados(3);
select *
from dAlunos;
select *
from fMatriculas;



/*
9. A secretaria precisa cadastrar novos cursos no sistema. Crie uma procedure que
receba os dados do novo curso (ID, nome e preço) e os insira na tabela. (Utilize
a tabela dCursos no código da procedure)
*/

delimiter $$

create procedure cadastrarCurso(id int, nome varchar(100),preco decimal(10,2))
begin
	insert into dCursos(ID_Curso, Nome_Curso, Preco_Curso)
    values
    (id,nome,preco);
    
end $$

delimiter ;

call cadastrarCurso(6,"Tênis","500");

select *
from dCursos;

/*
10. Um aluno solicitou sua transferência de curso e a secretaria precisa atualizar as
informações. Crie uma procedure que receba os parâmetros necessários (ID do
aluno, ID do curso atual, ID do novo curso para o qual o aluno será transferido e
data do novo cadastro) e efetue a alteração na tabela. (Utilize a tabela
fMatriculas no código da procedure)
*/

delimiter $$

create procedure transferirAluno(IdAluno int,IdCursoAtual int, IdNovoCurso int,DataNovoCadastro date)
begin

	update fMatriculas
    Set 
		Id_Curso = IdNovoCurso,
		Data_Cadastro = DataNovoCadastro 
    where
		Id_Aluno = IdAluno 
        and Id_Curso = IdCursoAtual;
    
end $$

delimiter ;


SET SQL_SAFE_UPDATES = 0;
CALL transferirAluno(2, 3, 4, '2026-05-22');
select *
from fMatriculas;
SET SQL_SAFE_UPDATES = 1;



	




    










