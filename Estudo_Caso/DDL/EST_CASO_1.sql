CREATE DATABASE cadeia_de_suprimentos;
USE cadeia_de_suprimentos;

CREATE TABLE Fornecedores (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome_empresa VARCHAR(255) NOT NULL,
    endereco_empresa VARCHAR(255),
    pais_origem VARCHAR(100),
    pessoa_contato VARCHAR(100),
    telefone VARCHAR(50)
);

-- Comandos DDL Fornecedor
-- Criar Index
CREATE INDEX idx_nome_empresa 
ON Fornecedores (nome_empresa);

-- Criar View
CREATE VIEW vista_fornecedores AS
SELECT nome_empresa, endereco_empresa
FROM Fornecedores;

-- Comando Alter ADD
ALTER TABLE Fornecedores ADD email VARCHAR(100);

-- Comando Alter MODIFY COLUMN 
ALTER TABLE Fornecedores MODIFY COLUMN email VARCHAR(150);

-- Comando Alter CHANGE COLUMN
ALTER TABLE Fornecedores CHANGE COLUMN email email_completo VARCHAR(150);

-- Comando Alter ADD INDEX
ALTER TABLE Fornecedores ADD INDEX idx_email (email_completo);

-- Remover Índice:
DROP INDEX idx_email ON Fornecedores;

-- Remover Visão:
DROP VIEW vista_fornecedores;

-- Remover dados
TRUNCATE TABLE Fornecedores;

-- Alterar nome da tabela
RENAME TABLE Fornecedores TO Fornecedor;
RENAME TABLE Fornecedor TO Fornecedores;

-- Comentarios nas tabelas
ALTER TABLE Fornecedores COMMENT = 'Tabela de informações dos Fornecedores';

-- Adicionar Comentário a Coluna:
ALTER TABLE Fornecedores MODIFY email_completo VARCHAR(150) COMMENT 'email do contato que representa o fornecedor';

-- Comando Alter DROP COLUMUN
ALTER TABLE Fornecedores DROP COLUMN email_completo;

-- Criar tabela Produto
CREATE TABLE Produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(255) NOT NULL,
    descricao TEXT,
    especificacoes_tecnicas TEXT,
    unidade_medida VARCHAR(50),
    preco_unitario DECIMAL(10, 2),
    quantidade_estoque INT DEFAULT 0,
    localizacao_armazenagem VARCHAR(100),
    ponto_ressuprimento INT
);

-- Comandos DDL Produto
-- Criar Index
CREATE INDEX idx_nome_produto 
ON Produto (nome_produto);

-- Criar View
CREATE VIEW vista_produtos AS
SELECT nome_produto, preco_unitario
FROM Produto;

-- Comando Alter ADD
ALTER TABLE Produto ADD codigo_barras VARCHAR(100);

-- Comando Alter MODIFY COLUMN 
ALTER TABLE Produto MODIFY COLUMN codigo_barras VARCHAR(150);

-- Comando Alter CHANGE COLUMN
ALTER TABLE Produto CHANGE COLUMN codigo_barras codigo_barras_completo VARCHAR(150);

-- Comando Alter ADD INDEX
ALTER TABLE Produto ADD INDEX idx_codigo_barras (codigo_barras_completo);

-- Remover Índice:
DROP INDEX idx_codigo_barras ON Produto;

-- Remover Visão:
DROP VIEW vista_produtos;

-- Remover dados
TRUNCATE TABLE Produto;

-- Alterar nome da tabela
RENAME TABLE Produto TO Produtos;
RENAME TABLE Produtos TO Produto;

-- Comentários na tabela
ALTER TABLE Produto COMMENT = 'Tabela de informações dos Produtos';

-- Adicionar Comentário a Coluna:
ALTER TABLE Produto MODIFY codigo_barras_completo VARCHAR(150) COMMENT 'Código de barras do produto';

-- Comando Alter DROP COLUMN
ALTER TABLE Produto DROP COLUMN codigo_barras_completo;

-- Criar tabela PedidoCompra
CREATE TABLE PedidoCompra (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATE NOT NULL,
    data_entrega_esperada DATE,
    status_pedidos ENUM('em processamento', 'enviado', 'recebido', 'cancelado') NOT NULL,
    id_fornecedor INT,
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedores(id_fornecedor)
);

-- Comandos DDL PedidoCompra
-- Criar Index
CREATE INDEX idx_data_pedido 
ON PedidoCompra (data_pedido);

-- Criar View
CREATE VIEW vista_pedidos AS
SELECT data_pedido, status_pedidos
FROM PedidoCompra;

-- Comando Alter ADD
ALTER TABLE PedidoCompra ADD numero_referencia VARCHAR(100);

-- Comando Alter MODIFY COLUMN 
ALTER TABLE PedidoCompra MODIFY COLUMN numero_referencia VARCHAR(150);

-- Comando Alter CHANGE COLUMN
ALTER TABLE PedidoCompra CHANGE COLUMN numero_referencia referencia_completa VARCHAR(150);

-- Comando Alter ADD INDEX
ALTER TABLE PedidoCompra ADD INDEX idx_referencia (referencia_completa);

-- Remover Índice:
DROP INDEX idx_referencia ON PedidoCompra;

-- Remover Visão:
DROP VIEW vista_pedidos;

-- Remover dados
TRUNCATE TABLE PedidoCompra;

-- Alterar nome da tabela
RENAME TABLE PedidoCompra TO PedidosCompra;
RENAME TABLE PedidosCompra TO PedidoCompra;

-- Comentários na tabela
ALTER TABLE PedidoCompra COMMENT = 'Tabela de informações dos Pedidos de Compra';

-- Adicionar Comentário a Coluna:
ALTER TABLE PedidoCompra MODIFY referencia_completa VARCHAR(150) COMMENT 'Número de referência do pedido de compra';

-- Comando Alter DROP COLUMN
ALTER TABLE PedidoCompra DROP COLUMN referencia_completa;


-- Criar tabela Produto_Pedido
CREATE TABLE Produto_Pedido (
    id_pedido INT,
    id_produto INT,
    quantidade_solicitada INT NOT NULL,
    PRIMARY KEY (id_pedido, id_produto),
    FOREIGN KEY (id_pedido) REFERENCES PedidoCompra(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

-- Comandos DDL Produto_Pedido
-- Criar Index
CREATE INDEX idx_id_pedido 
ON Produto_Pedido (id_pedido);

-- Criar View
CREATE VIEW vista_produto_pedido AS
SELECT id_pedido, id_produto, quantidade_solicitada
FROM Produto_Pedido;

-- Comando Alter ADD
ALTER TABLE Produto_Pedido ADD observacao VARCHAR(255);

-- Comando Alter MODIFY COLUMN 
ALTER TABLE Produto_Pedido MODIFY COLUMN observacao VARCHAR(300);

-- Comando Alter CHANGE COLUMN
ALTER TABLE Produto_Pedido CHANGE COLUMN observacao observacao_detalhada VARCHAR(300);

-- Comando Alter ADD INDEX
ALTER TABLE Produto_Pedido ADD INDEX idx_observacao (observacao_detalhada);

-- Remover Índice:
DROP INDEX idx_observacao ON Produto_Pedido;

-- Remover Visão:
DROP VIEW vista_produto_pedido;

-- Remover dados
TRUNCATE TABLE Produto_Pedido;

-- Alterar nome da tabela
RENAME TABLE Produto_Pedido TO Produtos_Pedidos;
RENAME TABLE Produtos_Pedidos TO Produto_Pedido;

-- Comentários na tabela
ALTER TABLE Produto_Pedido COMMENT = 'Tabela associativa entre Produtos e Pedidos de Compra';

-- Adicionar Comentário a Coluna:
ALTER TABLE Produto_Pedido MODIFY observacao_detalhada VARCHAR(300) COMMENT 'Observação sobre o produto no pedido';

-- Comando Alter DROP COLUMN
ALTER TABLE Produto_Pedido DROP COLUMN observacao_detalhada;


-- Criar tabela Recebimento
CREATE TABLE Recebimento (
    id_recebimento INT AUTO_INCREMENT PRIMARY KEY,
    data_recebimento DATE NOT NULL,
    condicao ENUM('aceito', 'rejeitado') NOT NULL,
    motivo_rejeicao TEXT,
    id_pedido INT,
    FOREIGN KEY (id_pedido) REFERENCES PedidoCompra(id_pedido)
);

-- Comandos DDL Recebimento
-- Criar Index
CREATE INDEX idx_data_recebimento 
ON Recebimento (data_recebimento);

-- Criar View
CREATE VIEW vista_recebimentos AS
SELECT data_recebimento, condicao
FROM Recebimento;

-- Comando Alter ADD
ALTER TABLE Recebimento ADD numero_documento VARCHAR(100);

-- Comando Alter MODIFY COLUMN 
ALTER TABLE Recebimento MODIFY COLUMN numero_documento VARCHAR(150);

-- Comando Alter CHANGE COLUMN
ALTER TABLE Recebimento CHANGE COLUMN numero_documento numero_documento_completo VARCHAR(150);

-- Comando Alter ADD INDEX
ALTER TABLE Recebimento ADD INDEX idx_numero_documento (numero_documento_completo);

-- Remover Índice:
DROP INDEX idx_numero_documento ON Recebimento;

-- Remover Visão:
DROP VIEW vista_recebimentos;

-- Remover dados
TRUNCATE TABLE Recebimento;

-- Alterar nome da tabela
RENAME TABLE Recebimento TO Recebimentos;
RENAME TABLE Recebimentos TO Recebimento;

-- Comentários na tabela
ALTER TABLE Recebimento COMMENT = 'Tabela de informações dos Recebimentos de Produtos';

-- Adicionar Comentário a Coluna:
ALTER TABLE Recebimento MODIFY numero_documento_completo VARCHAR(150) COMMENT 'Número do documento do recebimento';

-- Comando Alter DROP COLUMN
ALTER TABLE Recebimento DROP COLUMN numero_documento_completo;


-- Criar tabela Filial
CREATE TABLE Filial (
    id_filial INT AUTO_INCREMENT PRIMARY KEY,
    nome_filial VARCHAR(255) NOT NULL,
    endereco VARCHAR(255),
    capacidade_armazenagem INT
);

-- Comandos DDL Filial
-- Criar Index
CREATE INDEX idx_nome_filial 
ON Filial (nome_filial);

-- Criar View
CREATE VIEW vista_filiais AS
SELECT nome_filial, endereco
FROM Filial;

-- Comando Alter ADD
ALTER TABLE Filial ADD codigo_identificacao VARCHAR(100);

-- Comando Alter MODIFY COLUMN 
ALTER TABLE Filial MODIFY COLUMN codigo_identificacao VARCHAR(150);

-- Comando Alter CHANGE COLUMN
ALTER TABLE Filial CHANGE COLUMN codigo_identificacao codigo_identificacao_completo VARCHAR(150);

-- Comando Alter ADD INDEX
ALTER TABLE Filial ADD INDEX idx_codigo_identificacao (codigo_identificacao_completo);

-- Remover Índice:
DROP INDEX idx_codigo_identificacao ON Filial;

-- Remover Visão:
DROP VIEW vista_filiais;

-- Remover dados
TRUNCATE TABLE Filial;

-- Alterar nome da tabela
RENAME TABLE Filial TO Filiais;
RENAME TABLE Filiais TO Filial;

-- Comentários na tabela
ALTER TABLE Filial COMMENT = 'Tabela de informações das Filiais';

-- Adicionar Comentário a Coluna:
ALTER TABLE Filial MODIFY codigo_identificacao_completo VARCHAR(150) COMMENT 'Código de identificação da filial';

-- Comando Alter DROP COLUMN
ALTER TABLE Filial DROP COLUMN codigo_identificacao_completo;


-- Criar tabela Transferencia
CREATE TABLE Transferencia (
    id_transferencia INT AUTO_INCREMENT PRIMARY KEY,
    data_transferencia DATE NOT NULL,
    id_produto INT,
    quantidade INT NOT NULL,
    id_filial_origem INT,
    id_filial_destino INT,
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto),
    FOREIGN KEY (id_filial_origem) REFERENCES Filial(id_filial),
    FOREIGN KEY (id_filial_destino) REFERENCES Filial(id_filial)
);

-- Comandos DDL Transferencia
-- Criar Index
CREATE INDEX idx_data_transferencia 
ON Transferencia (data_transferencia);

-- Criar View
CREATE VIEW vista_transferencias AS
SELECT data_transferencia, id_produto, quantidade
FROM Transferencia;

-- Comando Alter ADD
ALTER TABLE Transferencia ADD numero_documento VARCHAR(100);

-- Comando Alter MODIFY COLUMN 
ALTER TABLE Transferencia MODIFY COLUMN numero_documento VARCHAR(150);

-- Comando Alter CHANGE COLUMN
ALTER TABLE Transferencia CHANGE COLUMN numero_documento numero_documento_completo VARCHAR(150);

-- Comando Alter ADD INDEX
ALTER TABLE Transferencia ADD INDEX idx_numero_documento (numero_documento_completo);

-- Remover Índice:
DROP INDEX idx_numero_documento ON Transferencia;

-- Remover Visão:
DROP VIEW vista_transferencias;

-- Remover dados
TRUNCATE TABLE Transferencia;

-- Alterar nome da tabela
RENAME TABLE Transferencia TO Transferencias;
RENAME TABLE Transferencias TO Transferencia;

-- Comentários na tabela
ALTER TABLE Transferencia COMMENT = 'Tabela de informações das Transferências de Produtos entre Filiais';

-- Adicionar Comentário a Coluna:
ALTER TABLE Transferencia MODIFY numero_documento_completo VARCHAR(150) COMMENT 'Número do documento da transferência';

-- Comando Alter DROP COLUMN
ALTER TABLE Transferencia DROP COLUMN numero_documento_completo;


-- Remover Tabela:
DROP TABLE IF EXISTS Transferencia;
DROP TABLE IF EXISTS Filial;
DROP TABLE IF EXISTS Recebimento;
DROP TABLE IF EXISTS Produto_Pedido;
DROP TABLE IF EXISTS PedidoCompra;
DROP TABLE IF EXISTS Produto;
DROP TABLE IF EXISTS Fornecedores;

-- Remover Banco de Dados:
DROP DATABASE cadeia_de_suprimentos;
