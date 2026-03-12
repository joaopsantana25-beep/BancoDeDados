/*
7. Considere a tabela Livros com as colunas id, titulo, autor, 
ano_publicacao, isbn, genero e quantidade_estoque.  
Escreva um comando SQL para listar todos os gêneros de livros 
diferentes disponíveis na tabela, sem repetir gêneros duplicados.  
*/

use biblioteca;
Select distinct genero from livros;