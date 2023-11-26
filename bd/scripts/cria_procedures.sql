-- procedimento para verificar o estoque de um produto
CREATE OR REPLACE PROCEDURE verificar_estoque_produto(
    IN produto_id INTEGER,
    OUT estoque_disponivel NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN
    SELECT quantidade_estoque INTO estoque_disponivel
    FROM Estoque
    WHERE ingrediente_id = produto_id;
END;
$$;


-- procedimento para atualizar o status de um pedido
CREATE OR REPLACE PROCEDURE atualizar_status_pedido(
    IN pedido_id INTEGER,
    IN novo_status VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE pedidos
    SET status_pedido = novo_status
    WHERE id_pedido = pedido_id;
END;
$$;
