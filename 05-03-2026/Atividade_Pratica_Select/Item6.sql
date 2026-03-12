/*
6. Escreva um comando SQL para listar os 10 primeiros usuários,  mostrando todas as informações, mas renomeando as colunas na  saída da seguinte forma: 
• nome como NomeCompleto 
• email como EmailUsuario 
• telefone como Contato 
• data_nascimento como Nascimento 
• data_registro como Cadastro 
*/

use biblioteca;

Select 
nome as NomeCompleto,
email as EmailUsuario,
telefone as Contato,
data_nascimento as Nascimento,
data_registro as Cadastro
fROM usuarios;