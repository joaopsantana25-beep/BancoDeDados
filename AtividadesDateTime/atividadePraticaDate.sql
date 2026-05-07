use base;

/*
1.A equipe de estoque precisa identificar produtos cujo número de série
inicia com &#39;MIC&#39; para fazer uma verificação.
Crie uma consulta que utilize a função LEFT para listar os IDs e nomes
desses produtos, filtrando os números de série que atendem a essa
condição. (Utilize a tabela produtos)
*/

select 
produtos.ID_Produto as "Id do Produto",
produtos.Nome_Produto as "Nome do Produto",
produtos.Num_Serie as "Número de Série"
from produtos
where left(Num_Serie, 3) = "MIC";

/*
2. O analista de dados da empresa está verificando a integridade da base de
clientes e quer garantir que não existam e-mails duplicados, já que isso
pode causar problemas nas comunicações com os clientes.
Crie uma consulta que utilize a função MID para extrair os IDs dos e-mails
(a parte antes do caractere &#39;@&#39;) e liste aqueles que aparecem mais de uma
vez. Caso não haja duplicatas, a consulta não deve retornar resultados.
(Utilize a tabela clientes)
*/

SELECT 
	Id_cliente as "Id do cliente",
    concat(nome," ",sobrenome) as "Nome_Cliente",
    MID(Email, 1, LOCATE('@', Email) - 1) AS "ID_Email",
    count("ID_Email") as "Quantidade"
FROM clientes
GROUP BY 
ID_Email,
Id_cliente,
Nome_Cliente
Having Count("ID_Email") > 1;

/*
3. O RH está avaliando lojas com menos de 15 funcionários para um plano
de expansão. Além disso, eles querem listar os nomes das lojas em letras
minúsculas para facilitar a integração com um sistema legado.
Crie uma consulta para exibir o ID da loja, o nome da loja em letras
minúsculas e o número de funcionários. (Utilize a tabela lojas)
*/

select 
Id_Loja as "ID",
lower(Loja) as "Nome da Loja",
Num_Funcionarios as "Número de Funcionários"
from lojas
where Num_Funcionarios<15;


/*
4. O setor de CRM quer saber quais clientes fazem aniversário no mês atual
para enviar promoções personalizadas.
Utilize a função MONTH na coluna Data_Nascimento para filtrar os
clientes que atendem ao critério. (Utilize a tabela clientes)
*/

select 
concat(nome," ",sobrenome) as "Nome_Cliente",
Data_nascimento
from clientes
where month(Data_nascimento) = month(curdate());

/*
5. A equipe de logística está revisando pedidos antigos e precisa identificar
aqueles que foram realizados há mais de 30 dias a partir de uma
determinada data.
Para esta análise, suponha que a data determinada seja 10/02/2019 e
armazene-a em uma variável. Em seguida, filtre todos os pedidos cuja
diferença entre a data da venda e a data determinada seja superior a 30 dias.
(Utilize a tabela pedidos)
*/

set @data_referencia = '2019-02-10';

select 
Id_pedido,
Data_Venda
from pedidos
where datediff(Data_Venda,@data_referencia)>30;

/*
6. A equipe de logística precisa criar identificadores temporários para os
produtos em estoque, baseando-se na marca e nos 3 últimos caracteres do
número de série.
Utilize as funções CONCAT (ou CONCAT_WS) e RIGHT para construir
esses identificadores. (Utilize a tabela produtos)
*/



select 
concat(marca_produto,"-",right(num_serie,3)) as "Identificador"
from produtos;

/*
7. A equipe de estoque está padronizando o cadastro dos produtos e
solicitou que listemos todos os nomes de produtos em letras maiúsculas.
Use a função UCASE() para transformar os nomes. (Utilize a tabela
produtos)
*/

select
Id_Produto,
UCASE(Nome_Produto)
from produtos;

/*
8. A equipe de marketing deseja identificar clientes nascidos nos dias 1, 15
ou 30 de qualquer mês para uma ação especial.
Use a função DAY() para filtrar esses clientes. (Utilize a tabela clientes)
*/

select
concat(nome,' ',sobrenome) as "Nome_Completo",
Data_Nascimento
from clientes
where day(Data_Nascimento) in (1,15,30);

/*
9. equipe de marketing está planejando uma campanha direcionada para
clientes nascidos na década de 90, visando oferecer produtos
personalizados para essa faixa etária. Para isso, precisamos identificar
todos os clientes que nasceram entre 1990 e 1999.
Use a função YEAR() para filtrar os clientes por essa faixa de anos e
retorne o nome completo e a data de nascimento. (Utilize a tabela clientes)
*/

select 
concat(nome,' ',sobrenome) as "Nome Completo",
Data_Nascimento
from clientes
where year(Data_Nascimento) between 1990 and 1999;


/*
10. A equipe de TI está preparando um novo sistema de envio de SMS para
as campanhas promocionais e, para isso, precisa dos números de telefone
dos clientes no formato simples, sem parênteses, traços ou espaços.
Como a tabela de clientes contém números no formato &#39;(99) 99999- 9999&#39;,
para garantir que o sistema de mensagens funcionará corretamente, é
necessário tratar esses telefones para que contenham somente os 11 dígitos.
Sua tarefa é remover os parênteses, o traço e o espaço dos números de
telefone e verificar se o comprimento do número após a remoção tem
exatamente 11 dígitos. Além disso, você deve retornar apenas os clientes
que possuem telefone preenchido, ou seja, excluindo os valores nulos ou
em branco. (Utilize a tabela clientes)
*/

select 
concat(nome," ",sobrenome) as "Nome_Cliente",
Regexp_Replace(Telefone,"[()\\s-]","") as "Telefone" 
from clientes
where  telefone is not null and length(Regexp_Replace(Telefone,"[()\\s-]","")) = 11;












