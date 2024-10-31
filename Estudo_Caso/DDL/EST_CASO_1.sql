CREATE DATABASE cadeia_de_suprimentos;
USE cadeia_de_suprimentos;

CREATE TABLE Fornecedor (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome_empresa VARCHAR(255) NOT NULL,
    endereco_empresa VARCHAR(255),
    pais_origem VARCHAR(100),
    pessoa_contato VARCHAR(100),
    telefone VARCHAR(50)
);


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

-- Criar Index
CREATE INDEX idx_nome_produto 
ON Produto (nome_produto);

-- Criar View
CREATE VIEW vista_produto AS
SELECT nome_produto, descricao
FROM Produto;

-- Comando Alter ADD
ALTER TABLE Produto ADD email VARCHAR(100);

-- Comando Alter DROP COLUMN
ALTER TABLE Produto DROP COLUMN email;

-- Comando Alter MODIFY COLUMN 
ALTER TABLE Produto MODIFY COLUMN email VARCHAR(150);

-- Comando Alter CHANGE COLUMN
ALTER TABLE Produto CHANGE COLUMN email email_completo VARCHAR(150);

-- Comando Alter ADD INDEX
ALTER TABLE Produto ADD INDEX idx_email (email_completo);

-- Remover Banco de Dados:
DROP DATABASE cadeia_de_suprimentos;

-- Remover Tabela:
DROP TABLE Produto;

-- Remover Índice:
DROP INDEX idx_email ON Produto;

-- Remover Visão:
DROP VIEW vista_produto;

-- Remover dados
TRUNCATE TABLE Produto;

-- Alterar nome da tabela
RENAME TABLE Produto TO Produto;

-- Comentarios nas tabelas
ALTER TABLE Produto COMMENT = 'Tabela de informações dos Produtos';

-- Adicionar Comentário a Coluna:
ALTER TABLE Produto MODIFY email_completo VARCHAR(150) COMMENT 'email do contato que representa o produto';


CREATE TABLE PedidoCompra (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATE NOT NULL,
    data_entrega_esperada DATE,
    status ENUM('em processamento', 'enviado', 'recebido', 'cancelado') NOT NULL,
    id_fornecedor INT,
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedor(id_fornecedor)
);

-- Criar Index
CREATE INDEX idx_data_pedido 
ON PedidoCompra (data_pedido);

-- Criar View
CREATE VIEW vista_pedido_compra AS
SELECT id_pedido, data_pedido, status
FROM PedidoCompra;

-- Comando Alter ADD
ALTER TABLE PedidoCompra ADD email VARCHAR(100);

-- Comando Alter DROP COLUMN
ALTER TABLE PedidoCompra DROP COLUMN email;

-- Comando Alter MODIFY COLUMN 
ALTER TABLE PedidoCompra MODIFY COLUMN email VARCHAR(150);

-- Comando Alter CHANGE COLUMN
ALTER TABLE PedidoCompra CHANGE COLUMN email email_completo VARCHAR(150);

-- Comando Alter ADD INDEX
ALTER TABLE PedidoCompra ADD INDEX idx_email (email_completo);

-- Remover Banco de Dados:
DROP DATABASE cadeia_de_suprimentos;

-- Remover Tabela:
DROP TABLE PedidoCompra;

-- Remover Índice:
DROP INDEX idx_email ON PedidoCompra;

-- Remover Visão:
DROP VIEW vista_pedido_compra;

-- Remover dados
TRUNCATE TABLE PedidoCompra;

-- Alterar nome da tabela
RENAME TABLE PedidoCompra TO PedidoCompra;

-- Comentarios nas tabelas
ALTER TABLE PedidoCompra COMMENT = 'Tabela de informações dos Pedidos de Compra';

-- Adicionar Comentário a Coluna:
ALTER TABLE PedidoCompra MODIFY email_completo VARCHAR(150) COMMENT 'email do contato que representa o pedido de compra';


CREATE TABLE Produto_Pedido (
    id_pedido INT,
    id_produto INT,
    quantidade_solicitada INT NOT NULL,
    PRIMARY KEY (id_pedido, id_produto),
    FOREIGN KEY (id_pedido) REFERENCES PedidoCompra(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

-- Criar Index
CREATE INDEX idx_id_produto 
ON Produto_Pedido (id_produto);

-- Criar View
CREATE VIEW vista_produto_pedido AS
SELECT id_pedido, id_produto, quantidade_solicitada
FROM Produto_Pedido;

-- Comando Alter ADD
ALTER TABLE Produto_Pedido ADD email VARCHAR(100);

-- Comando Alter DROP COLUMN
ALTER TABLE Produto_Pedido DROP COLUMN email;

-- Comando Alter MODIFY COLUMN 
ALTER TABLE Produto_Pedido MODIFY COLUMN email VARCHAR(150);

-- Comando Alter CHANGE COLUMN
ALTER TABLE Produto_Pedido CHANGE COLUMN email email_completo VARCHAR(150);

-- Comando Alter ADD INDEX
ALTER TABLE Produto_Pedido ADD INDEX idx_email (email_completo);

-- Remover Banco de Dados:
DROP DATABASE cadeia_de_suprimentos;

-- Remover Tabela:
DROP TABLE Produto_Pedido;

-- Remover Índice:
DROP INDEX idx_email ON Produto_Pedido;

-- Remover Visão:
DROP VIEW vista_produto_pedido;

-- Remover dados
TRUNCATE TABLE Produto_Pedido;

-- Alterar nome da tabela
RENAME TABLE Produto_Pedido TO Produto_Pedido;

-- Comentarios nas tabelas
ALTER TABLE Produto_Pedido COMMENT = 'Tabela de informações dos Produtos em cada Pedido';

-- Adicionar Comentário a Coluna:
ALTER TABLE Produto_Pedido MODIFY email_completo VARCHAR(150) COMMENT 'email do contato que representa o produto no pedido';

CREATE TABLE Recebimento (
    id_recebimento INT AUTO_INCREMENT PRIMARY KEY,
    data_recebimento DATE NOT NULL,
    condicao ENUM('aceito', 'rejeitado') NOT NULL,
    motivo_rejeicao TEXT,
    id_pedido INT,
    FOREIGN KEY (id_pedido) REFERENCES PedidoCompra(id_pedido)
);

CREATE TABLE Filial (
    id_filial INT AUTO_INCREMENT PRIMARY KEY,
    nome_filial VARCHAR(255) NOT NULL,
    endereco VARCHAR(255),
    capacidade_armazenagem INT
);

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

--Domandos DDL

--Criar Index
CREATE INDEX idx_nome_empresa 
ON Fornecedor (nome_empresa);

--Criar View
CREATE VIEW vista_fornecedore AS
SELECT nome_empresa, endereco_empresa
FROM Fornecedor;

-- Comando Alter ADD
ALTER TABLE Fornecedores ADD email VARCHAR(100);
-- Comando Alter DROP COLUMUN
ALTER TABLE Fornecedores DROP COLUMN email;
-- Comando Alter MODIFY COLUMN 
ALTER TABLE Fornecedores MODIFY COLUMN email VARCHAR(150);
-- Comando Alter CHANGE COLUMN
ALTER TABLE Fornecedores CHANGE COLUMN email email_completo VARCHAR(150);
-- Comando Alter ADD INDEX
ALTER TABLE Fornecedores ADD INDEX idx_email (email_completo);

--Remover Banco de Dados:
DROP DATABASE cadeia_de_suprimentos;
--Remover Tabela:
DROP TABLE Fornecedores;
--Remover Índice:
DROP INDEX idx_email ON Fornecedores;
--Remover Visão:
DROP VIEW vista_fornecedore;

--Remover dados
TRUNCATE TABLE Fornecedores;

--Alterar nome da tabela
RENAME TABLE Fornecedores TO Fornecedor;

--Comentarios nas tabelas
ALTER TABLE Fornecedores COMMENT = 'Tabela de informações dos Fornecedores';

--Adicionar Comentário a Coluna:
ALTER TABLE Fornecedores MODIFY email_completo VARCHAR(150) COMMENT 'email do contato que representa o fornecedor';
