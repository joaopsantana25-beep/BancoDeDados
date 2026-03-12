/*
3. Liste todos os livros do gênero “Ficção” que têm mais de 10 unidades em  estoque.  
Mostre as colunas: título, autor, quantidade_estoque.  
*/
use biblioteca;

select titulo,autor,quantidade_estoque,genero
from livros 
where quantidade_estoque>10 and genero 
like "%ficção%" ;
