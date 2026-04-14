use MAD_Tecnologias;

#Item 1 Contar o número total de clientes cadastrados em sua tabela clientes

select count(id) as "Contagem do Número de Clientes Cadastrados"
from clientes; 

#Item 2 Calcular a média do preço de venda dos produtos na tabela produtos

select avg(preco) as "Média de Preços"
from produtos;

#Item 3 Exibir o preço máximo e o preço mínimo dos produtos na tabela produtos

select 
max(preco) as "Maior Valor",
min(preco) as "Menor Valor"
from produtos;

#Item 4 Contar o número de produtos distintos na tabela produtos

select count(distinct nome) as "Nomes únicos"
from produtos;

#Item 5 Exibir o nome completo dos clientes da tabela clientes em letras maiúsculas

select UPPER(nome) as "Nomes dos Clientes"
from clientes;

#Item 6 Exibir os primeiros 3 caracteres do nome dos produtos da tabela produtos

select LEFT(nome,3) as "Nomes"
from produtos;

/*
#Item 7 Concatenar o nome e o sobrenome dos clientes da tabela clientes com um espaço entre eles - "QUESTÃO CANCELADA
select CONCAT(nome , " ", marca)
from produtos;
*/

#Item 8 Questão cancelada

#Item 9 Exibir a quantidade de caracteres do nome dos clientes na tabela clientes

select length(nome) as "Tamanho dos Nomes"
from clientes;

#Item 10 Exibir o nome dos produtos na tabela produtos, mas em letra minusculas

select lower(nome) as "Nomes em Mínusculo"
from produtos;

#Item 11 Exibir a data e hota atual do sistema

select now();

#Item 12 Calcular a diferença em dias entre a data da venda e a data de pagamento na tabela vendas e pagamentos - Questão Cancelada

#Item 13 - Questão Cancelada

#Item 14 - Questão Cancela

#Item 15 - Exibir todos os produtos com preço superioa a 100 e com quantidade em estoque superior a 50

select *
from produtos
where quantidade_estoque>50 and preco>100;

#Item 16 - Exibir os clientes que moram nas cidades "São Paulo" ou "Rio de Janeiro"

select *
from clientes
where cidade in ("São Paulo-SP","Rio de Janeiro-RJ");

#Item 17 Filtrar produtos que pertencem as categorias "Periféricos"

select *
from produtos 
where id_Categoria_Produto= "1" or id_Categoria_Produto="5";

#Item 18 Exibir o total de compras realizadas por cada clientes

select 
id_Cliente as "Id do Cliente", 
count(id_Cliente) as "Quantidade de Compras Realizadas"
from vendas
group by (id_Cliente);



#Item 19 Exibir o número de produtos vendidos por cada funcionário

select  
id_Funcionario as "Id do Funcionário", 
sum(quantidade_vendida) as "Quantidade de Itens Vendidos"
from itens_vendidos
group by (id_funcionario);

#Exibir os 5 primeiros produtos mais caros 

select *
from produtos
order by preco desc
limit 5;









