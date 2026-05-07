/*
8. A livraria deseja listar todos os livros que possuem um ISBN  registrado, ou seja,
 onde o campo isbn não está vazio. Mostre as colunas: título, autor, isbn, ano_publicacao.
*/

use biblioteca;

select titulo, autor, isbn, ano_publicado
from livros
where isbn is not null;