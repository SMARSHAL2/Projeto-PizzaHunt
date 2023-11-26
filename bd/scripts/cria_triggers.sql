-- gatilho para controlar a integridade do preço do itempedido
CREATE OR REPLACE FUNCTION controle_preco_item()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.preco_item <= 0 THEN
        RAISE EXCEPTION 'O preço do item deve ser um valor positivo.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Associar o gatilho à tabela itempedido
CREATE TRIGGER trigger_controle_preco_item
BEFORE INSERT OR UPDATE ON itempedido
FOR EACH ROW
EXECUTE FUNCTION controle_preco_item();


-- Cria a tabela de auditoria
CREATE TABLE auditoria_pedidos (
    id SERIAL PRIMARY KEY,
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    acao VARCHAR(20),
    id_pedido INTEGER,
    novo_status_pedido VARCHAR(50)
);

-- gatilho na tabela pedidos para auditoria
CREATE OR REPLACE FUNCTION auditoria_pedidos()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO auditoria_pedidos (acao, id_pedido, novo_status_pedido)
    VALUES ('INSERT', NEW.id_pedido, NEW.status_pedido);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Associa o gatilho à tabela pedidos
CREATE TRIGGER trigger_auditoria_pedidos
AFTER INSERT ON pedidos
FOR EACH ROW
EXECUTE FUNCTION auditoria_pedidos();
