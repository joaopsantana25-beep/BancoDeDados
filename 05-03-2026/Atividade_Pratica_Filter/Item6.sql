/*
6. A livraria deseja listar todos os livros publicados entre 1990 e 2020,  
ordenando do mais recente para o mais antigo. 
Mostre as colunas: título, autor, ano_publicacao. 
*/

use biblioteca;

select titulo, autor, ano_publicado
from livros
where ano_publicado between 1990 and 2020
order by ano_publicado desc;