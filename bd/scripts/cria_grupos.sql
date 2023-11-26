-- Cria usuários
CREATE USER user_cliente1 WITH PASSWORD 'senha1';
CREATE USER user_cliente2 WITH PASSWORD 'senha2';
CREATE USER user_funcionario1 WITH PASSWORD 'senha3';
CREATE USER user_funcionario2 WITH PASSWORD 'senha4';
CREATE USER user_administrador WITH PASSWORD 'senha5';


-- Cria grupos
CREATE GROUP grupo_clientes;
CREATE GROUP grupo_funcionarios;
CREATE GROUP grupo_administradores;


-- Atribui usuários aos grupos
GRANT grupo_clientes TO user_cliente1, user_cliente2;
GRANT grupo_funcionarios TO user_funcionario1, user_funcionario2;
GRANT grupo_administradores TO user_administrador;

-- Concessão de privilégios para o grupo de clientes na tabela clientes
GRANT SELECT ON clientes TO grupo_clientes;

-- Concessão de privilégios para o grupo de funcionários na tabela pedidos
GRANT SELECT, INSERT, UPDATE ON pedidos TO grupo_funcionarios;

-- Concessão de todos os privilégios para o grupo de administradores na tabela empresa
GRANT ALL PRIVILEGES ON empresa TO grupo_administradores;

