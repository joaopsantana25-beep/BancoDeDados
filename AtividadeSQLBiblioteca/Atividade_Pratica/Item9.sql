/*
9. Considere a tabela Livros com as colunas id, titulo, autor,  ano_publicacao, isbn, genero e quantidade_estoque. 
Escreva um comando SQL para listar todos os livros, ordenando  primeiro pelo ano de publicação mais recente 
e, em caso de  empate, pela quantidade em estoque maior para menor 
*/

use biblioteca;

select * from livros Order By ano_publicado Desc, quantidade_estoque Desc; 