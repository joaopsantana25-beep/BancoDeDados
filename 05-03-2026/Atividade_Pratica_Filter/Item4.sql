/*
4. A livraria deseja listar todos os livros que são dos autores 
“Machado  de Assis”, “Clarice Lispector” ou “Jorge Amado”. 
Mostre as colunas: título, autor, ano_publicacao. 
*/

select titulo,autor, ano_publicado
from livros 
where autor = "Clarice Lispector" or autor="Jorge Amado" or autor="Machado de Assis";