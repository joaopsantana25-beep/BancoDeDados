/*
5. Considere a tabela Usuarios com as colunas id, nome, email,  telefone, data_nascimento e data_registro. 
Escreva um comando SQL para listar apenas os 10 primeiros  usuários cadastrados na tabela, mostrando todas as informações  disponíveis. 
Considere a tabela Usuarios com as colunas id, nome, email, telefone,  data_nascimento e data_registro.

*/

use biblioteca;
select * from usuarios limit 10;