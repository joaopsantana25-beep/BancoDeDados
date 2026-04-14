#Item 1 Listas todos os clientes cadastrados

use MAD_Tecnologias;

select *
from clientes;

#Item 2 Listar todos os produtos da Loja

select*
from produtos;

#Item 3 Exibir apenas o nome e o preça de vendas dos produtos

select nome as "Nome do Produto",
preco as "Preço do Produto"
from produtos;

#Item 4 Mostrar os 5 primeiros produtos cadastrados

select *
from produtos
limit 5;

#Item 5 Exibir o nome dos clientes com apelido de coluna 

select nome as "Nome_Cliente"
from clientes;

#Item 6 Exibir o nome e o preço de venda dos produtos om alias 

select nome as "Produto",
preco as "Preco"
from produtos;

#Item 7 Mostrar todas as marcas diferentes dos produtos

select distinct marca as Marcas
from produtos;

#Item 8 Mostrar todas as cidades diferentes dos clientes
select distinct cidade as "Cidades"
from clientes;

#Item 9 Exibir os 3 primeiros fornecedores cadastrados 

select*
from fornecedores
limit 3;

#Item 10 Mostrar os produtos com descrição de colunas mais amigáveis

select 
nome as "Produto",
marca as "Marca_Prdouto",
descricao as "Descrição do Produto"
from produtos;

#Item 11 Listar os produtos em ordem alfabética crescente

select 
nome as "Produto",
preco as "Preço"
from produtos
order by nome asc;

#Item 12 Listar os clientes do mais novo para o mais antigo cadastro

select *
from clientes
order by id asc;

#Item 13 Mostrar os produtos do maior para o menor preçoptimize

select 
nome as "Produto",
marca as "Marca",
preco as "Preço"
from produtos
order by preco desc;

#Item 14 Filtrar os produtos de uma marca especifica

select *
from produtos
where marca="DELL";

#Item 15 Filtrar clientes de uma cidade especifica

select *
from Clientes
where cidade="Rio de Janeiro-RJ";

#Item 16 Filtrar produtos com duas condições

select *
from produtos 
where marca = "Logitech" AND preco>100;

#Item 17 Filtrar usando OR

select *
from produtos
where marca ="DELL" OR marca="LG";

#Item 18 Filtrar cidade com Where in

select *
from clientes
where cidade like "Goiânia%" or cidade like "Anápolis%" or cidade like "Brasília%";

#Item 19 Filtrar produtos por faixa de preçoptimize

select *
from produtos
where preco between 500 and 3000;




