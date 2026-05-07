/*
2. Considere a tabela Usuarios com as colunas id, nome, email,
telefone, data_nascimento e data_registro.
Escreva um comando SQL para listar apenas o nome e o email de
todos os usuários cadastrados, sem se preocupar com a ordem dos
resultados.
*/

use biblioteca;
describe usuarios;
select nome,email 
from usuarios;