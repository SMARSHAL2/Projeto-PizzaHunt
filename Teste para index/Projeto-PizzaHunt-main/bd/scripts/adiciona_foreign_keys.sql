-- Adicionando chaves estrangeiras para a tabela pedidos
ALTER TABLE pedidos
  ADD FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
  ADD FOREIGN KEY (id_feedback) REFERENCES feedback(id_feedback),
  ADD FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario);

-- Adicionando chaves estrangeiras para a tabela itempedido
ALTER TABLE itempedido
  ADD FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
  ADD FOREIGN KEY (id_produto) REFERENCES produto(id_produto);