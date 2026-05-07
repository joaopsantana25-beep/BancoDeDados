/*
10.Considere a tabela Livros com as colunas id, titulo, autor,
ano_publicacao, isbn, genero e quantidade_estoque.
Escreva um comando SQL para listar os 5 anos de publicação mais
recentes presentes na tabela, sem repetições.
*/


use biblioteca;
select distinct ano_publicado 
from livros 
order by ano_publicado DESC 
limit 5;