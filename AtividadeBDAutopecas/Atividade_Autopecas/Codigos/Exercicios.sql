/*
1. Liste todos os dados da tabela de clientes.


use Loja_Autopeça;

select *
from clientes;
*/

/*
2. Exiba apenas o nome e o e-mail dos clientes cadastrados.


select 
nome as Nome_Clientes,
email as Emails_Cadastrados
from clientes;

*/

/*
3. Liste todos os produtos com seus respectivos preços.


select 
nome as Nome_Produto,
preco as Preço
from produtos;
*/

/*
4. Mostre os produtos que possuem preço maior que R$ 50,00.


select *
from produtos
where preco>50;
*/

/*
5. Exiba os produtos que pertencem à categoria “Freios”.


select *
from produtos
where categoria like "%Freio%";
*/

/*
6. Liste todos os fornecedores cadastrados.
*/

/*
select *
from Fornecedores;
*/

/*
7. Mostre os fornecedores que estão na cidade de “São Paulo”.


select *
from fornecedores
where cidade like "%São Paulo%"
*/

/*
8. Liste todos os funcionários da loja.


select *
from funcionarios;
*/

/*
9. Exiba apenas o nome e o cargo dos funcionários.
*/

/*
select 
nome as Nome_Funcionario,
cargo as Cargo
from funcionarios;
*/

/*
10. Mostre todos os pedidos realizados.
*/

/*
select *
from pedidos
*/

/*
11. Exiba os pedidos com valor total maior que R$ 500,00.
*/

/*
select *
from pedidos
where valor_total >500;
*/

/*
12. Liste os pedidos ordenados pela data (do mais recente para o mais
antigo).
*/

/*
select *
from pedidos
order by data_pedido desc
*/

/*
13. Mostre os produtos ordenados pelo nome em ordem alfabética.
*/

/*
select *
from produtos
order by nome 
*/

/*
14. Exiba os produtos que possuem quantidade em estoque menor que 5.
*/

/*
select *
from produtos
where estoque<5;
*/

/*
15. Liste os itens de pedido com quantidade maior que 2.
*/
/*
select *
from itens_pedido
where quantidade>2;
*/

/*
16. Exiba os nomes dos produtos distintos cadastrados.
*/

/*
select 
distinct nome as Nome_Produto
from produtos
*/

/*
17. Mostre os clientes que possuem e-mail contendo “@gmail.com”.
*/

/*
select *
from clientes
where email like "%@gmail.com%";
*/

/*
18. Liste os produtos com preço entre R$ 100,00 e R$ 500,00.
*/

/*
select *
from produtos
where preco between 100 and 500;
*/

/*
19. Exiba os pedidos com status “Concluído”/"Enviado".
*/

/*
select *
from pedidos
where status = "Enviado" or status = "Concluido";
*/

/*
20. Mostre os produtos cujo nome começa com a letra “A”.

select *
from produtos 
where nome like "A%";
*/
