
INSERT INTO clientes (nome_cliente, endereco, telefone, email, cupom_id) VALUES

('Ana Silva', 'Rua das Flores, 123', '(11) 1234-5678', 'ana.silva@email.com', NULL),

('Carlos Souza', 'Avenida Central, 456', '(11) 2345-6789', 'carlos.souza@email.com', NULL),

('Fernanda Oliveira', 'Praça da Árvore, 789', '(11) 3456-7890', 'fernanda.oliveira@email.com', NULL),

('Roberto Almeida', 'Rua do Comércio, 101', '(11) 4567-8901', 'roberto.almeida@email.com', NULL),

('Juliana Martins', 'Alameda das Rosas, 202', '(11) 5678-9012', 'juliana.martins@email.com', NULL);


INSERT INTO empresa (cnpj, nome_empresa, endereco, telefone_empresa, email_empresa) VALUES

('12345678000123', 'Pizza Hunt', 'Rua da Liberdade, 123, São Miguel', '(11) 1234-5678', 'contato@pizzahunt.com');


INSERT INTO funcionario (nome_funcionario, cargo, salario, empresa_cnpj, sexo_funcionario) VALUES

('João Silva', 'Pizzaiolo', 2500.00, '12345678000123', 'M'),

('Maria Oliveira', 'Atendente', 2000.00, '12345678000123', 'F'),

('Pedro Costa', 'Gerente', 3500.00, '12345678000123', 'M'),

('Ana Santos', 'Garçonete', 2200.00, '12345678000123', 'F'),

('Carlos Souza', 'Entregador', 1800.00, '12345678000123', 'M');

-- Inserindo pedidos sem feedback
INSERT INTO pedidos (data_hora_pedido, status_pedido, id_cliente, id_funcionario) VALUES

('2023-11-02 19:00:00', 'Em Preparo', 1, 1),

('2023-11-02 19:15:00', 'Entregue', 2, 2),

('2023-11-02 19:20:00', 'Em Entrega', 3, 3),

('2023-11-02 19:30:00', 'Entregue', 4, 1),

('2023-11-02 19:45:00', 'Em Preparo', 5, 2);

-- Tabela Estoque
INSERT INTO Estoque (nome_ingrediente, quantidade_estoque) VALUES

('Molho de Tomate', 100),

('Mussarela', 50),

('Coca Cola 350ml', 200),

('Queijo Vegano', 20),

('Calabresa', 30);

-- Tabela Produto 

INSERT INTO Produto (nome_produto, descricao_produto, valor_produto, estoque_ingrediente_id) VALUES

('Pizza de Mussarela', 'Pizza com mussarela e molho de tomate', 20.00, 1),

('Pizza de Calabresa', 'Pizza com calabresa e molho de tomate', 22.00, 2),

('Refrigerante Coca Cola', 'Coca Cola 350ml', 4.00, 3),

('Pizza Vegana', 'Pizza com queijo vegano e molho de tomate', 25.00, 4),

('Pizza de Calabresa e Mussarela', 'Pizza com calabresa, mussarela e molho de tomate', 24.00, 5);

-- Tabela itempedido (CUIDAR IDs)
INSERT INTO itempedido (nome_item, preco_item, quantidade, id_pedido, id_produto) VALUES
('Pizza de Mussarela', 20.00, 2, 1, 1),
('Pizza de Calabresa', 22.00, 1, 2, 2),
('Refrigerante Coca Cola', 4.00, 3, 3, 3),
('Pizza Vegana', 25.00, 1, 4, 4),
('Pizza de Calabresa e Mussarela', 24.00, 2, 5, 5);

-- Tabela cupom
INSERT INTO cupom (desconto) VALUES
(0.10),  -- 10% de desconto
(0.15),  -- 15% de desconto
(0.20);  -- 20% de desconto

-- Tabela feedback
INSERT INTO feedback (comentario, avaliacao) VALUES

('A pizza estava ótima!', 4.5),

('Entrega rápida e pizza deliciosa!', 5.0),

('A pizza chegou fria.', 2.5),

('Gostei muito, recomendo!', 4.0),

('Entregador muito simpático.', 4.8);