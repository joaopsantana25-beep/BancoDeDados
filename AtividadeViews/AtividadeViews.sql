use base;

drop view if exists
vwClientesContato,
vwLojasFuncionarios,
vwProdutosAltoValor,
vwMargemLucro,
vwVendasPorLoja,
vwClassificacaoProdutos,
vwVolumeVendasLojas,
vwClientesAltaRendaComFilhos;

/*
1. A equipe de marketing deseja uma visão centralizada dos nomes e
emails de todos os clientes cadastrados. Crie uma View chamada
vwClientesContato que exiba apenas os campos Nome, Sobrenome e
Email dos clientes. (Utilize a tabela clientes)
*/

create view vwClientesContato as 

select
Nome,
Sobrenome,
Email
from clientes;

select * from vwClientesContato;




/*
2. O RH deseja identificar as lojas com o menor número de
funcionários para possíveis otimizações. Crie uma View chamada
vwLojasFuncionarios que exiba o nome da loja, o gerente e o
número de funcionários, ordenados de forma crescente pelo número
de funcionários. (Utilize a tabela lojas)
*/

create view vwLojasFuncionarios as

select 
Loja,
Gerente,
Num_funcionarios
from lojas
order by Num_funcionarios ASC;

select * from vwLojasFuncionarios;

/*
3. O setor financeiro quer uma amostra dos cinco produtos mais caros
da tabela produtos. Crie uma View chamada vwProdutosAltoValor
que exiba o nome do produto, a marca e o preço unitário desses
produtos. (Utilize a tabela produtos)
*/

create view vwProdutosAltoValor as

select
Nome_Produto,
Marca_Produto,
Preco_Unit
from produtos;

select * from vwProdutosAltoValor;

/*
4. O setor financeiro deseja calcular a margem de lucro por produto.
Crie uma View chamada vwMargemLucro que exiba o nome do
produto, o preço unitário, o custo unitário e a margem de lucro
calculada. (Utilize a tabela produtos)
*/

create view vwMargemLucro as 

select 
Nome_Produto,
Preco_Unit,
Custo_Unit,
(Preco_Unit - Custo_unit) as "Margem de Lucro"
from produtos;

select * from vwMargemLucro;

/*
5. O setor de vendas precisa de uma visão consolidada das vendas por
loja. Crie uma View chamada vwVendasPorLoja que exiba o
ID_Loja, a soma das receitas e a quantidade de pedidos. (Utilize a
tabela pedidos)
*/

create view vwVendasPorLoja as

select 
ID_Loja,
Sum(Receita_Venda) as "Soma das Receitas",
count(Id_loja) as "Número de Pedidos"
from pedidos
group by
Id_loja
order by Id_loja asc;

select * from vwVendasPorLoja;

/*
6. Altere a View criada no item A para incluir o Nome da Loja. (Utilize
as tabelas pedidos e lojas)
*/

alter view vwVendasPorLoja as 

select 
pedidos.ID_Loja,
Lojas.Loja as "Nome da Loja",
Sum(Receita_Venda) as "Soma das Receitas",
count(pedidos.Id_loja) as "Número de Pedidos"

from pedidos
inner join Lojas
on pedidos.Id_Loja = Lojas.Id_Loja
group by
Id_loja,
Lojas.Loja
order by Id_loja asc;


select * from vwVendasPorLoja;

/*
7. A equipe de compras precisa classificar os produtos como &quot;Custo
Alto&quot; ou &quot;Custo Baixo&quot; com base em seu custo unitário. Crie uma
View chamada vwClassificacaoProdutos que exiba o nome do
produto, a marca, o custo unitário e a classificação baseada no custo
unitário. Considere &quot;Custo Alto&quot; para custos maiores que 500.
(Utilize a tabela produtos)
*/

create view vwClassificacaoProdutos as 

select 
Nome_Produto,
Marca_Produto,
Custo_Unit,
case
when Custo_Unit >500 then "Custo Alto"
else "Custo Baixo"
end as "Classificação"
from produtos;

select * from vwClassificacaoProdutos;


/*
8. A empresa deseja monitorar o volume de vendas mensais de cada
loja. Crie uma View chamada vwVolumeVendasLojas que contenha
as colunas Mes_Ano, Loja, e o total de itens vendidos agrupados por
mês/ano e loja. (Utilize as tabelas pedidos e lojas)
*/

create view vwVolumeVendasLojas as 

select 
Lojas.loja,
sum(pedidos.Qtd_Vendida) as "Total Itens",
date_format(pedidos.Data_Venda, '%Y-%m') as "Mes_Ano" 
from pedidos
inner join lojas
on pedidos.Id_loja = lojas.id_loja
group by
pedidos.Id_loja,
Lojas.loja,
date_format(pedidos.Data_Venda, '%Y-%m');

select * from vwVolumeVendasLojas;


/*
9. A equipe de marketing precisa analisar os clientes que possuem uma
renda anual maior ou igual a R$90.000 e têm ao menos um filho.
Crie uma View chamada vwClientesAltaRendaComFilhos que inclua
o nome completo, e-mail, renda anual e quantidade de filhos desses
clientes. (Utilize a tabela clientes)
*/


create view vwClientesAltaRendaComFilhos as

select 
concat(nome," ",sobrenome) as "Nome Completo",
Email,
Renda_Anual,
Qtd_Filhos
from clientes
where Renda_Anual>=90000;

select * from vwClientesAltaRendaComFilhos;

/*
10. Exclua todas as Views criadas nesta lista de exercícios:
vwClientesContato
vwLojasFuncionarios
vwProdutosAltoValor
vwMargemLucro
vwVendasPorLoja
vwClassificacaoProdutos
vwVolumeVendasLojas
vwClientesAltaRendaComFilhos
(Não é necessário utilizar tabelas)
*/

drop view 
vwClientesContato,
vwLojasFuncionarios,
vwProdutosAltoValor,
vwMargemLucro,
vwVendasPorLoja,
vwClassificacaoProdutos,
vwVolumeVendasLojas,
vwClientesAltaRendaComFilhos;




