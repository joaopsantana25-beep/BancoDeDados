use base;

/*
1. A equipe de marketing deseja identificar clientes com renda anual acima da
média para futuras campanhas exclusivas. Liste os clientes cuja Renda_Anual
seja maior que a média de renda anual de todos os clientes. Ordene o resultado
pela coluna Renda_Anual. (Utilize a tabela clientes)
*/

set @mediaRendaAnual = (select AVG(Renda_Anual) from clientes);

Select *
from clientes
where Renda_Anual> @mediaRendaAnual
order by Renda_Anual desc;


/*
2. A gerência deseja saber quais produtos têm preço abaixo do custo médio de
todos os produtos da loja. Retorne os produtos cujo Preco_Unit seja menor que o
custo médio (Custo_Unit) de todos os produtos. (Utilize a tabela produtos)
*/

set @custoMedio = (select AVG(Custo_Unit) from produtos);

select *
from produtos
where Preco_Unit< @custoMedio
order by Preco_Unit Desc;

/*
3. O RH solicitou que descobríssemos quais lojas possuem um número de
funcionários superior à média de todas as lojas cadastradas. Liste o nome das
lojas e o número de funcionários. (Utilize a tabela lojas)
*/

set @mediaFuncionarios = (select AVG(Num_Funcionarios) from lojas);

select
Loja,
Num_Funcionarios
from lojas
where Num_Funcionarios > @mediaFuncionarios
order by Num_Funcionarios DESC;

/*
4. O setor de produtos deseja saber quantos produtos de cada categoria estão sendo
comercializados pela empresa. Crie um relatório com o nome de cada categoria
e a quantidade de produtos cadastrados. (Utilize as tabelas produtos e categorias)
*/


select 
categoria,
( 
	select
	count(produtos.Id_Produto)
	from produtos
	where produtos.Id_Categoria = categorias.Id_Categoria
  ) as "Quantidade_por_Categoria"
from categorias;

/*
5. Gere um relatório com o ID, o nome completo e o total de pedidos realizados
por cada cliente, para auxiliar a equipe de vendas a identificar os clientes mais
ativos. Ordene o resultado pelo total de pedidos, do maior para o menor total.
(Utilize as tabelas clientes e pedidos)
*/

select 
Clientes.Id_Cliente,
concat(nome," ",sobrenome) as "Nome_Completo",
(
	select 
    count(pedidos.Id_Cliente)
    from pedidos
    where pedidos.Id_Cliente = clientes.Id_Cliente
) as "Numero_Pedidos"
from clientes
order by Numero_Pedidos desc;

/*
6. A equipe de estratégia quer saber quais lojas não alcançaram uma receita total
maior que R$ 10.000.000. Crie uma consulta que liste as lojas com receita total
inferior a R$ 10.000.000. Inclua no resultado o nome da loja, o nome do gerente
e a receita total de cada loja retornada. (Utilize as tabelas pedidos e lojas)
*/

select 
Loja,
Gerente,
(
	select 
    SUM(pedidos.Receita_Venda)
    from pedidos
    where pedidos.Id_loja = Lojas.id_Loja
) as "Receita_Total"
from lojas
where 
(
	select 
    SUM(pedidos.Receita_Venda)
    from pedidos
    where pedidos.Id_loja = Lojas.id_Loja
)
<10000000;

/*
7. Liste os nomes completos e os e-mails dos clientes que realizaram compras de
produtos da categoria &quot;Headphone&quot;, permitindo que o marketing direcione
campanhas promocionais a esse público. (Utilize as tabelas clientes, pedidos,
produtos e categorias)
*/

select 
concat(nome, " ", sobrenome) as "Nome_Completo",
Email
from clientes 
where clientes.Id_cliente in
	(
    select pedidos.Id_Cliente
    from pedidos
    where pedidos.Id_produto in(
		select produtos.Id_produto
        from produtos
        where produtos.Id_categoria in (
			Select categorias.Id_Categoria
            from categorias
            where categorias.categoria = "Headphone"
			)
		)
	);


/*
8. O departamento de produtos precisa descobrir se existe alguma loja que ainda
não efetuou vendas dos produtos da marca &quot;DELL&quot;. Liste o nome das lojas que
eventualmente preencham essa condição, se houver. (Utilize as tabelas lojas,
pedidos e produtos)
*/

select 
Lojas.loja
from lojas
where not Exists(
	select 1
    from pedidos
    where pedidos.Id_Loja = lojas.Id_loja
    and pedidos.Id_Produto in(
		select produtos.Id_Produto
        from produtos
        where Marca_Produto = "DELL"
        )
	);

	








