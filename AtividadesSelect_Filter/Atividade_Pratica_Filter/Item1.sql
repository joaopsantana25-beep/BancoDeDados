/*
1. A livraria deseja consultar todos os livros do autor “Machado de
Assis” que foram publicados a partir do ano 1880.
Escreva uma consulta SQL que retorne o título, autor, ano de
publicação e quantidade em estoque desses livros.
*/


use biblioteca;
Select * 
From livros
where autor = "Machado de Assis"; 

