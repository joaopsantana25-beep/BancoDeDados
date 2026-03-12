/*
2. A livraria deseja listar todos os livros do gênero “Ficção” que estão  em estoque, 
ordenando do mais recente para o mais antigo. Mostre as colunas: 
título, autor, ano de publicação e quantidade  em estoque. 
*/

use biblioteca;

select titulo,autor,ano_publicado,quantidade_estoque
from livros 
where quantidade_estoque >0
and genero 
like "%ficção%" or "ficcão"
order by ano_publicado Desc;