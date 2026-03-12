/*
11.Considere a tabela Livros com as colunas id, titulo, autor,
ano_publicacao, isbn, genero e quantidade_estoque.
Escreva um comando SQL para listar os 5 livros distintos com
maior ano de publicação, e, em caso de empate no ano, exibir
primeiro os livros com maior quantidade em estoque
*/

use biblioteca;

SELECT DISTINCT id,titulo,autor,ano_publicado,isbn,genero,quantidade_estoque
FROM livros
order by ano_publicado desc, quantidade_estoque desc
limit 5;
