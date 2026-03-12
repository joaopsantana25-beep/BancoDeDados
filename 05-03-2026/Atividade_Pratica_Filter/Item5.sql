/*
5. A livraria deseja listar todos os livros cujo título contenha a  palavra “Amor”. 
Mostre as colunas: título, autor, ano_publicacao. 
*/

use biblioteca;

select titulo, autor, ano_publicado
from livros
where titulo 
like "%amor%";