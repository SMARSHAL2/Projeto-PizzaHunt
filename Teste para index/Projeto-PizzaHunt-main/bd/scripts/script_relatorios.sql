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
