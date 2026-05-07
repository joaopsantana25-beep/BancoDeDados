/*
3. A biblioteca percebeu a necessidade de registrar a data de
nascimento dos usuários para futuras ações comemorativas e
organização de eventos por faixa etária.
Atualmente, a tabela Usuarios possui a seguinte estrutura:
• id (inteiro, chave primária, auto incremento)
• nome (texto)
• email (texto)
• telefone (texto)
• endereco (texto)
*/

use biblioteca;

Alter Table usuarios
add column data_nascimento date;
Select*From usuarios;
