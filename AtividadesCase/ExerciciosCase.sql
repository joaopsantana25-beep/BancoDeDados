use base;

/*
1. O setor de compras quer classificar os produtos de acordo com o custo unitário. Crie
uma consulta que categorize os produtos como &quot;Alto Custo&quot; (Custo_Unit &gt; 1000),
&quot;Médio Custo&quot; (Custo_Unit entre 500 e 1000) e &quot;Baixo Custo&quot; (Custo_Unit &lt; 500). Liste
o nome do produto, o custo unitário e a classificação. (Utilize a tabela produtos)
*/

select 
Nome_Produto,
Custo_Unit,
Case
when  Custo_Unit>=1000 then "Alto Custo"
when  Custo_Unit<500 then "Baixo Custo"
else "Custo Médio" 
end as "Classificação"
from produtos;

/*
2. O setor de atendimento identificou que alguns clientes não cadastraram um telefone.
Crie uma consulta que liste o ID do cliente, o nome completo, o telefone e uma coluna
de status que indique se o telefone foi cadastrado ou não (&quot;Não informado&quot; para
campos sem telefone e &quot;OK&quot; para os demais). Lembre-se que existem tanto campos
nulos quanto com strings vazias na coluna Telefone. (Utilize a tabela clientes)
*/

select 
ID_Cliente,
concat(nome, " ",Sobrenome) as "Nome Completo",
Telefone,
Case
when Telefone is null or Telefone ="" then "Não Informado"
else "OK"
end as "Status"
from clientes;


/*
3. A empresa decidiu aplicar um reajuste de 10% no preço dos produtos que não
pertencem às marcas &quot;DELL&quot; e &quot;SAMSUNG&quot;. Para isso, é necessário criar uma consulta
que exiba o nome do produto, a marca, o preço atual e o novo preço com o reajuste
aplicado. Caso o produto pertença às marcas &quot;DELL&quot; ou &quot;SAMSUNG&quot;, o preço
permanece inalterado. Elabore uma consulta que atenda a essa necessidade. (Utilize a
tabela produtos)
*/

select 
Nome_Produto,
Marca_Produto,
Preco_Unit,
Case
when Marca_Produto!="Dell" and Marca_Produto!="SAMSUNG" then (1.1*Preco_Unit)
else Preco_Unit
end "Reajuste"
from produtos;


/*
4. A diretoria quer identificar os gerentes de lojas que administram equipes com menos
de 15 funcionários e mais de 20 funcionários. Crie uma consulta que exiba o nome do
gerente, a loja, a quantidade de funcionários e o status:
✓ &quot;Equipe pequena&quot; para menos de 15 funcionários;
✓ &quot;Equipe grande&quot; para mais de 20;
✓ &quot;Equipe média&quot; nos demais casos. Se possível, tente resolver utilizando IFs. (Utilize a
tabela lojas)
*/

select 
Gerente,
Loja,
Num_Funcionarios,
Case
when Num_Funcionarios<15 then "Equipe Pequena"
when Num_Funcionarios>20 then "Equipe Grande"
else "Equipe Média"
end "Status"
from lojas;


/*
5. A equipe financeira quer calcular a margem de lucro unitária para cada produto e
categorizá-la como:
✓ &quot;Alta margem&quot; para produtos com margem acima de R$1000;
✓ &quot;Média margem&quot; entre R$300 e R$1000;
✓ &quot;Baixa margem&quot; para margens abaixo de R$300. (Utilize a tabela produtos)
*/

select *,
case
when (Preco_Unit-Custo_Unit)>1000 then "Alta Margem"
when (Preco_Unit-Custo_Unit)<300 then "Baixa Margem"
else "Média Margem"
end "Categoria"
from produtos;

/*
6. A empresa quer identificar clientes prioritários, definidos como aqueles com uma
renda anual acima de R$80.000 ou que já realizaram no mínimo 450 pedidos. Crie uma
consulta que exiba o nome completo do cliente, a renda anual, a quantidade de
pedidos, além de uma coluna que indique se ele é &#39;prioritário&#39; ou &#39;comum&#39;. (Utilize as
tabelas clientes e pedidos)
*/

select 
concat(nome, " ",Sobrenome) as "Nome Completo",
Renda_Anual,
Count(pedidos.ID_Cliente) as "Número de Pedidos",

Case
when Renda_Anual>80000 or count(pedidos.ID_Cliente)>=450 then "Prioritário"
else "Comum"
end "Classificação"

from clientes
inner join pedidos
on pedidos.ID_Cliente= clientes.ID_Cliente

Group BY
clientes.id_cliente,
clientes.Nome,
clientes.Sobrenome,
Renda_Anual;


/*
7. A diretoria deseja identificar a performance de cada loja, levando em consideração o
número de funcionários e a receita gerada por cada um deles. Crie uma consulta que
exiba o nome da loja, a quantidade de funcionários, a receita total da loja, a receita
gerada por funcionário e um indicador de desempenho:
✓ &quot;Alta Performance&quot; para lojas com mais de R$700.000 em vendas por funcionário;
✓ &quot;Média Performance&quot; para vendas por funcionário entre R$400.000 e R$700.000;
✓ &quot;Baixa Performance&quot; para valores abaixo de R$400.000. (Utilize as tabelas lojas e
pedidos)
*/

select 
Lojas.loja,
Lojas.Num_Funcionarios,
Sum(pedidos.Receita_Venda) as "Receita Total",
(Sum(pedidos.Receita_Venda)/Lojas.Num_Funcionarios) as "Media_Funcionario",

Case
when (Sum(pedidos.Receita_Venda)/Lojas.Num_Funcionarios)>700000 then "Alta Performance"
when (Sum(pedidos.Receita_Venda)/Lojas.Num_Funcionarios)>400000 then "Média Performance"
else "Baixa Performance"
end "Indicador de Desempenho"

from Lojas
inner join pedidos
on pedidos.ID_Loja = lojas.ID_Loja

Group by
Lojas.loja,
Lojas.Num_Funcionarios,
lojas.ID_Loja,
pedidos.ID_Loja;



