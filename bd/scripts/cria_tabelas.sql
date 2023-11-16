-- Tabela Clientes
CREATE TABLE clientes (

id_cliente SERIAL PRIMARY KEY,

nome_cliente VARCHAR(50) NOT NULL,

endereco VARCHAR(100) NOT NULL,

telefone VARCHAR(15) NOT NULL,

email VARCHAR(50) NOT NULL,

cupom_id INTEGER

);

COMMENT ON TABLE clientes IS 'tabela de registro do cliente';

COMMENT ON COLUMN clientes.id_cliente IS 'registro id do cliente';

COMMENT ON COLUMN clientes.nome_cliente IS 'registro nome do cliente';

COMMENT ON COLUMN clientes.endereco IS 'registro do endereço do cliente';

COMMENT ON COLUMN clientes.telefone IS 'registro telefone do cliente';

COMMENT ON COLUMN clientes.email IS 'registro do email do cliente';

-- Tabela pedidos
CREATE TABLE pedidos (

id_pedido SERIAL PRIMARY KEY,

data_hora_pedido TIMESTAMP NOT NULL,

status_pedido VARCHAR(50) NOT NULL,

id_cliente INTEGER NOT NULL,

id_feedback INTEGER,

id_funcionario INTEGER NOT NULL

);
ALTER TABLE pedidos

ALTER COLUMN id_feedback DROP NOT NULL;

COMMENT ON TABLE pedidos IS 'tabela de registro do pedido';

COMMENT ON COLUMN pedidos.id_pedido IS 'registro do id do pedido';

COMMENT ON COLUMN pedidos.data_hora_pedido IS 'registro da data e da hora do pedido';

COMMENT ON COLUMN pedidos.status_pedido IS 'registro do status do pedido';

COMMENT ON COLUMN pedidos.id_cliente IS 'registro do id do cliente';

-- Tabela itempedido
CREATE TABLE itempedido (

id_item_pedido SERIAL PRIMARY KEY,

nome_item VARCHAR(50) NOT NULL,

preco_item NUMERIC(5, 2) NOT NULL,

quantidade INTEGER NOT NULL,

id_pedido INTEGER NOT NULL,

id_produto INTEGER NOT NULL

);

COMMENT ON TABLE itempedido IS 'tabela de registro do item pedido';

COMMENT ON COLUMN itempedido.id_item_pedido IS 'registro do id do item pedido';

COMMENT ON COLUMN itempedido.nome_item IS 'registro do nome do item pedido';

COMMENT ON COLUMN itempedido.preco_item IS 'registro do preço do item pedido';

COMMENT ON COLUMN itempedido.quantidade IS 'registro da quantidade do item pedido';

-- Tabela funcionario
CREATE TABLE funcionario (
  id_funcionario SERIAL PRIMARY KEY,
  nome_funcionario VARCHAR(50) NOT NULL,
  cargo VARCHAR(50) NOT NULL,
  salario NUMERIC(6, 2) NOT NULL,
  empresa_cnpj VARCHAR(14) NOT NULL,
  sexo_funcionario CHAR(1) NOT NULL CHECK (sexo_funcionario IN ('M', 'F'))
);
COMMENT ON TABLE funcionario IS 'tabela de registro dos funcionarios';
COMMENT ON COLUMN funcionario.id_funcionario IS 'registro do id do funcionario';
COMMENT ON COLUMN funcionario.nome_funcionario IS 'registro do nome do funcionario';
COMMENT ON COLUMN funcionario.cargo IS 'registro do cargo do funcionario';
COMMENT ON COLUMN funcionario.salario IS 'registro do salario do funcionario';
COMMENT ON COLUMN funcionario.sexo_funcionario IS 'registro do sexo do funcionario';

-- Tabela empresa
CREATE TABLE empresa (
  cnpj VARCHAR(14) NOT NULL,
  nome_empresa VARCHAR(50) NOT NULL,
  endereco VARCHAR(80),
  telefone_empresa VARCHAR(15),
  email_empresa VARCHAR(40),
  PRIMARY KEY (cnpj)
);
COMMENT ON TABLE empresa IS 'tabela de registro da empresa';
COMMENT ON COLUMN empresa.cnpj IS 'registro do cnpj da empresa';
COMMENT ON COLUMN empresa.nome_empresa IS 'registro do nome da empresa';
COMMENT ON COLUMN empresa.endereco IS 'endereço da empresa';
COMMENT ON COLUMN empresa.telefone_empresa IS 'registro do telefone da empresa';
COMMENT ON COLUMN empresa.email_empresa IS 'registro do email da empresa';

-- Tabela Produto

CREATE TABLE Produto (

id_produto SERIAL PRIMARY KEY,

nome_produto VARCHAR(200) NOT NULL,

descricao_produto VARCHAR(200) NOT NULL,

valor_produto NUMERIC(8, 2) NOT NULL,

estoque_ingrediente_id INTEGER NOT NULL

);

COMMENT ON TABLE Produto IS 'tabela de registro do produto';

COMMENT ON COLUMN Produto.id_produto IS 'registro do id do produto';

COMMENT ON COLUMN Produto.nome_produto IS 'registro do nome do produto';

COMMENT ON COLUMN Produto.descricao_produto IS 'descrição do produto';

COMMENT ON COLUMN Produto.valor_produto IS 'registro do valor do produto';

-- Tabela Fornecedor
CREATE TABLE Fornecedor (

cnpj_fornecedor VARCHAR(14) NOT NULL PRIMARY KEY,

nome_fornecedor VARCHAR(30) NOT NULL,

telefone_fornecedor VARCHAR(20),

email_fornecedor VARCHAR(200),

produtos_fornecidos VARCHAR(200),

quantidade_fornecida NUMERIC(10, 2),

empresa_cnpj VARCHAR(14) NOT NULL,

FOREIGN KEY (empresa_cnpj) REFERENCES empresa(cnpj)

);
COMMENT ON TABLE Fornecedor IS 'tabela de registro do fornecedor';
COMMENT ON COLUMN Fornecedor.cnpj_fornecedor IS 'registro do cnpj do fornecedor';
COMMENT ON COLUMN Fornecedor.nome_fornecedor IS 'registro do nome do fornecedor';
COMMENT ON COLUMN Fornecedor.telefone_fornecedor IS 'registro do telefone do fornecedor';
COMMENT ON COLUMN Fornecedor.email_fornecedor IS 'registro do email do fornecedor';
COMMENT ON COLUMN Fornecedor.produtos_fornecidos IS 'registro dos produtos fornecidos';
COMMENT ON COLUMN Fornecedor.quantidade_fornecida IS 'registro da quantidade de produto fornecido';

-- Tabela Estoque

CREATE TABLE Estoque (

ingrediente_id SERIAL PRIMARY KEY,

nome_ingrediente VARCHAR(200) NOT NULL,

quantidade_estoque NUMERIC(6, 2) NOT NULL

);

COMMENT ON TABLE Estoque IS 'tabela de registro do estoque';

COMMENT ON COLUMN Estoque.ingrediente_id IS 'registro do id dos ingredientes';

COMMENT ON COLUMN Estoque.nome_ingrediente IS 'registro do nome dos ingredientes';

COMMENT ON COLUMN Estoque.quantidade_estoque IS 'registro da quantidade do ingrediente no estoque';

-- Tabela cupom

CREATE TABLE cupom (

id_cupon SERIAL PRIMARY KEY,

desconto NUMERIC(5, 2) CHECK (desconto >= 0 AND desconto <= 100)

);

COMMENT ON TABLE cupom IS 'tabela de registro dos cupons';

COMMENT ON COLUMN cupom.id_cupon IS 'id dos cupons';

COMMENT ON COLUMN cupom.desconto IS 'porcentagem de desconto do cupon';

-- Tabela feedback
CREATE TABLE feedback (
  id_feedback SERIAL PRIMARY KEY,
  comentario VARCHAR(150),
  avaliacao NUMERIC(3, 1) CHECK (avaliacao >= 1 AND avaliacao <= 5)
);
COMMENT ON TABLE feedback IS 'tabela do feedback dos pedidos';
COMMENT ON COLUMN feedback.id_feedback IS 'id do feedback';
COMMENT ON COLUMN feedback.comentario IS 'comentário do pedido';
COMMENT ON COLUMN feedback.avaliacao IS 'avaliação do pedido';