/*
7. A livraria deseja listar todos os livros publicados nos anos 1990,  2000, 2010 ou 2020, 
ordenando do mais recente para o mais  antigo. 
Mostre as colunas: título, autor, ano_publicacao. 
*/

use biblioteca;

select titulo, autor, ano_publicado
from livros
where ano_publicado=1990 or ano_publicado=2000 or ano_publicado=2010 or ano_publicado=2020
order by ano_publicado desc;