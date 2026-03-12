/*
9. A livraria deseja listar todos os livros do gênero “Ficção” que foram  publicados entre os anos 2000 e 2020,
ordenando do mais recente  para o mais antigo. 
Mostre as colunas: título, autor, ano_publicacao, genero.
*/

use biblioteca;

select titulo, autor, ano_publicado, genero
from livros
where genero like "%Ficção%" and
ano_publicado between 2000 and 2020
order by ano_publicado desc;