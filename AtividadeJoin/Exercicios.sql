use base;

/*
1.A equipe de produtos está revisando o catálogo e deseja listar o nome do
produto, sua marca e a categoria à qual pertence.
Crie uma consulta para exibir essas informações. (Utilize as tabelas
produtos e categorias)
*/

Select
Nome_Produto,
Marca_Produto,
categorias.Categoria
from produtos
inner join categorias
on produtos.id_categoria = categorias.id_categoria;

/*
2.O setor de marketing está planejando campanhas específicas para clientes
com alta escolaridade e deseja analisar o perfil de vendas desse público.
Crie uma consulta que liste o nome completo dos clientes com escolaridade
"Pós-graduado", a data da venda realizada por cada cliente e o valor da
receita gerada por pedido. (Utilize as tabelas pedidos e clientes).
*/

Select 
concat(Nome," ", Sobrenome) as "Nome Completo",
pedidos.Data_Venda,
pedidos.Receita_Venda
from clientes 
inner join pedidos
on pedidos.id_cliente = clientes.id_cliente
where clientes.escolaridade = "Pós-graduado"
order by pedidos.Data_Venda DESC;

/*
3. O setor de análise de vendas deseja um relatório detalhado do
desempenho dos produtos da marca Samsung. O objetivo é identificar a
quantidade total vendida e a receita gerada por cada produto dessa marca.
Crie uma consulta SQL que liste o nome de cada produto da Samsung, a
quantidade total vendida e a receita total. (Utilize as tabelas pedidos e
produtos.
*/

select 
produtos.Nome_Produto,
SUM(pedidos.Qtd_Vendida) As "Quantidade vendida",
sum(pedidos.Qtd_Vendida * produtos.Preco_Unit) As "Receita gerada"
from produtos
inner join pedidos
on pedidos.id_produto = produtos.id_produto
where produtos.marca_produto = "Samsung"
GROUP BY produtos.id_produto, produtos.Nome_Produto;

/*
4. Parte A: A equipe de planejamento quer identificar os produtos mais
vendidos.
Liste o nome do produto e a quantidade total vendida, ordenando em ordem
decrescente de quantidade. (Utilize as tabelas pedidos e produtos)
*/

select 
produtos.Nome_Produto,
SUM(pedidos.Qtd_Vendida) As "Quantidade vendida"
from produtos
inner join pedidos
on pedidos.id_produto = produtos.id_produto
GROUP BY produtos.id_produto, produtos.Nome_Produto
order by SUM(pedidos.Qtd_Vendida) DESC;


/*
4. Parte B: Adapte o código do item A para acrescentar as categorias dos
produtos. (Utilize as tabelas pedidos, produtos e categorias)
*/

select 
produtos.Nome_Produto,
SUM(pedidos.Qtd_Vendida) As "Quantidade vendida",
categorias.Categoria as "Categoria do Produto"
from produtos
inner join pedidos
on pedidos.id_produto = produtos.id_produto
inner join categorias
on categorias.id_categoria = produtos.id_categoria
GROUP BY produtos.id_produto, produtos.Nome_Produto, categorias.Categoria
order by SUM(pedidos.Qtd_Vendida) DESC;

/*
5. A diretoria quer avaliar o desempenho de cada gerente.
Crie uma consulta SQL que retorne o nome do gerente, o nome da loja e a
receita total, ordenando os resultados pela maior receita. (Utilize as tabelas
pedidos e lojas)
*/


select

lojas.Gerente as "Nome do Gerente",
lojas.Loja as "Nome da Loja",
SUM(pedidos.Receita_Venda) as "Receita da Loja"

from lojas
inner join pedidos
on pedidos.id_loja = lojas.id_loja
group by 
lojas.id_loja,
lojas.Gerente,
lojas.Loja
order by (SUM(pedidos.Receita_Venda)) desc;

/*
6. A diretoria quer avaliar o desempenho de cada gerente.
Crie uma consulta SQL que retorne o nome do gerente, o nome da loja e a
receita total, ordenando os resultados pela maior receita. (Utilize as tabelas
pedidos e lojas).
*/

select

lojas.Gerente as "Nome do Gerente",
lojas.Loja as "Nome da Loja",
SUM(pedidos.Receita_Venda) as "Receita da Loja"

from lojas
inner join pedidos
on pedidos.id_loja = lojas.id_loja
group by 
lojas.id_loja,
lojas.Gerente,
lojas.Loja
order by (SUM(pedidos.Receita_Venda)) desc;



/*
7. O setor de produtos quer avaliar as vendas por categoria.
Crie uma consulta que exiba os nomes das categorias e o total de vendas
para cada uma. (Utilize as tabelas pedidos, produtos e categorias)
*/

select 
categorias.categoria,
sum(pedidos.Qtd_Vendida) as "Quantidade Vendida"

from categorias
inner join produtos
on produtos.id_categoria = categorias.id_categoria
inner join pedidos
on pedidos.id_produto = produtos.id_produto

group by
categorias.categoria

order by
sum(pedidos.Qtd_Vendida) DESC;


/*
8. O setor de inteligência de mercado quer identificar quais clientes
geraram maior receita para cada produto adquirido. Esse relatório será
utilizado para entender o comportamento de compra e valorizar os clientes
mais lucrativos da empresa.
Crie uma consulta SQL que retorne o nome completo dos clientes, os
produtos adquiridos e a receita total gerada por cliente e produto. Organize
os resultados em ordem decrescente de receita gerada. (Utilize as tabelas
clientes, pedidos e produtos).
*/

select 
concat(clientes.nome," ",clientes.sobrenome) as "Nome Completo",
produtos.Nome_Produto,
SUM(pedidos.Receita_Venda) AS "Receita Total"

FROM clientes
INNER JOIN pedidos
    ON pedidos.id_cliente = clientes.id_cliente
INNER JOIN produtos
    ON produtos.id_produto = pedidos.id_produto
GROUP BY 
    clientes.id_cliente,
    clientes.Nome,
    clientes.Sobrenome,
    produtos.id_produto,
    produtos.Nome_Produto
ORDER BY 
    concat(clientes.nome," ",clientes.sobrenome) ASC;
    

/*
9. DESAFIO: O time de planejamento estratégico está desenvolvendo uma
análise detalhada para entender a performance de vendas considerando
múltiplos fatores.
Eles precisam de um relatório que exiba o nome completo dos clientes, a
região onde realizaram suas compras, o produto adquirido e a receita total
gerada por cliente, produto e região.
Além disso, o relatório deve listar apenas os agrupamentos (combinação de
cliente, produto e região) que geraram uma receita total acima de R$
25.000,00.
Ordene os resultados em ordem decrescente de receita total. (Utilize as
tabelas clientes, pedidos, produtos, lojas e locais)
*/


select 
concat(clientes.nome," ",clientes.sobrenome) as "Nome Completo",
produtos.Nome_Produto,
locais.Região,
SUM(pedidos.Receita_Venda) AS "Receita Total"

FROM clientes

inner join pedidos
on pedidos.id_cliente = clientes.id_cliente
inner join produtos
on pedidos.id_produto = produtos.id_produto
inner join lojas 
on pedidos.id_loja = lojas.id_loja
inner join locais
on locais.Cidade = lojas.Loja


group by
clientes.id_cliente,
clientes.Nome,
clientes.Sobrenome,
locais.Região,
produtos.id_produto,
produtos.Nome_Produto

having SUM(pedidos.Receita_Venda)>25000

order by
    SUM(pedidos.Receita_Venda) DESC;









