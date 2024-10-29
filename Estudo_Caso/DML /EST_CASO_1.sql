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

CREATE TABLE PedidoCompra (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATE NOT NULL,
    data_entrega_esperada DATE,
    status ENUM('em processamento', 'enviado', 'recebido', 'cancelado') NOT NULL,
    id_fornecedor INT,
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedor(id_fornecedor)
);

CREATE TABLE Produto_Pedido (
    id_pedido INT,
    id_produto INT,
    quantidade_solicitada INT NOT NULL,
    PRIMARY KEY (id_pedido, id_produto),
    FOREIGN KEY (id_pedido) REFERENCES PedidoCompra(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

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

-- DML
--Inserir valores nos atributos de uma certa tabela
INSERT INTO Fornecedor (nome_empresa,pais_origem,pessoa_contato,telefone) VALUES ("UVV", "Brasil", "Susileia", "(27) 99798-5858");
-- Atualizar um atributpo especifico para um novo valor
UPDATE FROM Fornecedor SET endereco_empresa = "rua dominicana" WHERE nome_empresa = "UVV";
-- Deletar dados de um determinado atributo
DELETE FROM Fornecedor WHERE nome_empresa = "UVV";







