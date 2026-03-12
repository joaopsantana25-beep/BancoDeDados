/*
8. Considere a tabela Livros com as colunas id, titulo, autor,  ano_publicacao, isbn, genero e quantidade_estoque. 
Escreva um comando SQL para listar todos os livros da tabela,  
ordenando-os pelo ano de publicação do mais recente para o  mais antigo. 
*/

use biblioteca;
select * from livros Order By ano_publicado Desc;