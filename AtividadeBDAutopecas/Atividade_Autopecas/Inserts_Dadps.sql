use Loja_Autopeça;

insert into Clientes (nome, cpf, telefone, email, endereco) values
('João Silva','12345678901','11987654321','joao.silva@gmail.com','Rua das Flores, 123'),
('Maria Souza','23456789012','11976543210','maria.souza@email.com','Av. Paulista, 456'),
('Carlos Oliveira','34567890123','11965432109','carlos.oliveira@gmail.com','Rua Augusta, 789'),
('Ana Santos','45678901234','11954321098','ana.santos@gmail.com','Rua Vergueiro, 321'),
('Paulo Lima','56789012345','11943210987','paulo.lima@email.com','Av. Ipiranga, 654'),
('Fernanda Costa','67890123456','11932109876','fernanda.costa@gmail.com','Rua Consolação, 987'),
('Ricardo Alves','78901234567','11921098765','ricardo.alves@email.com','Rua Liberdade, 159'),
('Juliana Rocha','89012345678','11910987654','juliana.rocha@gmail.com','Av. Santo Amaro, 753'),
('Marcos Pereira','90123456789','11999887766','marcos.pereira@email.com','Rua Bela Cintra, 852'),
('Patricia Gomes','01234567890','11988776655','patricia.gomes@gmail.com','Rua Oscar Freire, 951');

insert into Funcionarios (nome, cargo, telefone, email) values
('Lucas Martins','Vendedor','11990000001','lucas@gmail.com'),
('Bruna Ferreira','Caixa','11990000002','bruna@email.com'),
('André Ribeiro','Gerente','11990000003','andre@gmail.com'),
('Camila Barbosa','Vendedora','11990000004','camila@email.com'),
('Diego Carvalho','Estoquista','11990000005','diego@gmail.com'),
('Renata Mendes','Caixa','11990000006','renata@email.com'),
('Felipe Nogueira','Vendedor','11990000007','felipe@gmail.com'),
('Aline Teixeira','Vendedora','11990000008','aline@email.com'),
('Gustavo Rocha','Estoquista','11990000009','gustavo@gmail.com'),
('Vanessa Duarte','Gerente','11990000010','vanessa@email.com');

insert into Fornecedores (nome, contato, telefone, email, cidade) values
('Auto Peças Brasil','Carlos Mendes','1130000001','contato@autobrasil.com','São Paulo'),
('Distribuidora MotorSul','Ana Paula','1130000002','vendas@motorsul.com','Curitiba'),
('Peças Rápidas','João Pedro','1130000003','contato@pecasrapidas.com','Rio de Janeiro'),
('AutoParts Center','Marcos Lima','1130000004','suporte@autoparts.com','Belo Horizonte'),
('Mega Peças','Fernanda Alves','1130000005','vendas@megapecas.com','Porto Alegre'),
('Brasil Auto Supply','Ricardo Souza','1130000006','contato@basupply.com','Campinas'),
('TopCar Distribuidora','Juliana Costa','1130000007','vendas@topcar.com','Florianópolis'),
('Prime Autopeças','Paulo Rocha','1130000008','contato@primeauto.com','Salvador'),
('Speed Parts','Lucas Ferreira','1130000009','vendas@speedparts.com','Goiânia'),
('Central Automotiva','Bruna Lima','1130000010','suporte@centralauto.com','Recife');

insert into Produtos (nome, categoria, marca, preco, estoque, fornecedor_id) values
('Pastilha de Freio','Freio','Bosch',120.00,50,1),
('Disco de Freio','Freio','TRW',250.00,30,2),
('Amortecedor Dianteiro','Suspensão','Monroe',350.00,20,3),
('Bateria 60Ah','Elétrica','Moura',450.00,15,4),
('Filtro de Óleo','Motor','Fram',35.00,100,5),
('Correia Dentada','Motor','Gates',90.00,40,6),
('Velas de Ignição (Jogo)','Motor','NGK',80.00,60,7),
('Radiador','Arrefecimento','Valeo',600.00,10,8),
('Farol Dianteiro','Iluminação','Arteb',300.00,25,9),
('Sensor de Oxigênio','Injeção','Denso',220.00,18,10);


insert into Pedidos (cliente_id, data_pedido, valor_total, status) values
(1, '2025-03-01 10:15:23', 240.00, 'Pago'),
(2, '2025-03-02 14:32:10', 250.00, 'Pendente'),
(3, '2025-03-03 09:05:47', 350.00, 'Enviado'),
(4, '2025-03-05 16:48:30', 450.00, 'Pago'),
(5, '2025-03-06 11:22:55', 70.00, 'Pendente'),
(6, '2025-03-08 13:10:05', 180.00, 'Enviado'),
(7, '2025-03-10 18:27:41', 160.00, 'Pago'),
(8, '2025-03-12 08:55:19', 600.00, 'Pendente'),
(9, '2025-03-15 15:40:00', 300.00, 'Enviado'),
(10, '2025-03-18 12:05:33', 220.00, 'Pago');

insert into Itens_Pedido (pedido_id, produto_id, quantidade, preco_unitario) values
(1,1,2,120.00),
(2,2,1,250.00),
(3,3,1,350.00),
(4,4,1,450.00),
(5,5,2,35.00),
(6,6,2,90.00),
(7,7,2,80.00),
(8,8,1,600.00),
(9,9,1,300.00),
(10,10,1,220.00);

