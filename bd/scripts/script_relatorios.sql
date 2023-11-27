--1)Relação de CPF e nome de pessoas que são funcionários, do sexo femininoe cujo número de telefone inicia com
--número 4998 Ordene de forma ascendente pelo nome do funcionário

CREATE VIEW FuncionariosFemininos AS
SELECT id_funcionario, nome_funcionario
FROM funcionario
WHERE sexo_funcionario = 'F'
AND telefone LIKE '4998%';

SELECT f.id_funcionario, f.nome_funcionario
FROM funcionario f
JOIN FuncionariosFemininos ff ON f.id_funcionario = ff.id_funcionario
ORDER BY f.nome_funcionario ASC;

--2)  Relação de ID, nome e preço de todos os produtos do tipo bebida.
--Ordene o relatório pelo nome de forma ascendente e depois pelo preço de forma descendente;
CREATE VIEW Bebidas AS
SELECT id_produto, nome_produto, valor_produto
FROM Produto
WHERE descricao_produto LIKE '%Bebida%';

SELECT id_produto, nome_produto, valor_produto
FROM Bebidas
ORDER BY nome_produto ASC, valor_produto DESC;

--3) Relação com o mês, número de pedidos e valor total para pedidos realizados em 2023;

CREATE VIEW Pedidos2023 AS
SELECT p.id_pedido, p.data_hora_pedido, ip.preco_item, ip.quantidade
FROM pedidos p
JOIN itempedido ip ON p.id_pedido = ip.id_pedido
WHERE EXTRACT(YEAR FROM p.data_hora_pedido) = 2023;

SELECT EXTRACT(MONTH FROM data_hora_pedido) AS mes,
       COUNT(id_pedido) AS numero_pedidos,
       SUM(preco_item * quantidade) AS valor_total
FROM Pedidos2023
GROUP BY EXTRACT(MONTH FROM data_hora_pedido)
ORDER BY mes;

--
CREATE VIEW vw_clientes AS
SELECT id_cliente, nome, idade, CPF
FROM clientes;

CREATE VIEW vw_pedidos AS
SELECT id_pedido, cliente_id, valor_pedido, data_pedido
FROM pedidos
WHERE YEAR(data_pedido) = 2023;

CREATE VIEW vw_itens_pedido AS
SELECT pedido_id, COUNT(*) AS quantidade_itens
FROM itens_pedido
GROUP BY pedido_id;

SELECT c.nome, c.idade, c.CPF
FROM vw_clientes c
INNER JOIN vw_pedidos p ON c.id_cliente = p.cliente_id
INNER JOIN vw_itens_pedido ip ON p.id_pedido = ip.pedido_id
WHERE c.idade BETWEEN 16 AND 28
  AND p.valor_pedido > 120.00
  AND ip.quantidade_itens > 0;

