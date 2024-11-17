CREATE DATABASE cadeia_de_suprimentos;
USE cadeia_de_suprimentos;

-- Criação da tabela Fornecedor
CREATE TABLE Fornecedor (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome_empresa VARCHAR(255) NOT NULL,
    endereco_empresa VARCHAR(255),
    pais_origem VARCHAR(100),
    pessoa_contato VARCHAR(100),
    telefone VARCHAR(50)
);

-- Inserir Fornecedores
INSERT INTO Fornecedor (nome_empresa, pais_origem, pessoa_contato, telefone)
VALUES ("ArcelorMittal", "Brasil", "Maria Silva", "(27) 99876-5432");

INSERT INTO Fornecedor (nome_empresa, pais_origem, pessoa_contato, telefone)
VALUES ("Vale S.A.", "Brasil", "Carlos Souza", "(27) 91234-5678");

INSERT INTO Fornecedor (nome_empresa, pais_origem, pessoa_contato, telefone)
VALUES ("Petrobras", "Brasil", "Ana Oliveira", "(27) 92234-5678");

INSERT INTO Fornecedor (nome_empresa, pais_origem, pessoa_contato, telefone)
VALUES ("UVV", "Brasil", "Susileia", "(27) 92234-5678");

-- Atualizar endereço de fornecedor
UPDATE Fornecedor
SET endereco_empresa = "Avenida Industrial, 123"
WHERE nome_empresa = "ArcelorMittal";

UPDATE Fornecedor
SET endereco_empresa = "Rua das Indústrias, 456"
WHERE nome_empresa = "Vale S.A.";

-- Deletar um fornecedor
DELETE FROM Fornecedor WHERE nome_empresa = "UVV";


-- Criação da tabela Produto
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

-- Inserir Produtos
INSERT INTO Produto (nome_produto, descricao, unidade_medida, preco_unitario, quantidade_estoque, localizacao_armazenagem, ponto_ressuprimento)
VALUES ("Parafuso Hexagonal", "Parafuso para uso geral", "unidade", 0.50, 1000, "Estante A1", 200);

INSERT INTO Produto (nome_produto, descricao, unidade_medida, preco_unitario, quantidade_estoque, localizacao_armazenagem, ponto_ressuprimento)
VALUES ("Cabo de Aço", "Cabo de aço galvanizado", "metro", 5.00, 500, "Estante B3", 50);

INSERT INTO Produto (nome_produto, descricao, unidade_medida, preco_unitario, quantidade_estoque, localizacao_armazenagem, ponto_ressuprimento)
VALUES ("Óleo Lubrificante", "Óleo para máquinas industriais", "litro", 20.00, 200, "Tanque T1", 30);

INSERT INTO Produto (nome_produto, descricao, unidade_medida, preco_unitario, quantidade_estoque, localizacao_armazenagem, ponto_ressuprimento)
VALUES ("Livro", "Livros Novos para Biblioteca", "inteiro", 20.00, 200, "Prateleira 1", 30);

-- Atualizar especificações de um produto
UPDATE Produto
SET especificacoes_tecnicas = "Material: Aço; Resistência: Alta"
WHERE nome_produto = "Parafuso Hexagonal";

UPDATE Produto
SET especificacoes_tecnicas = "Material: Aço galvanizado; Diâmetro: 10mm"
WHERE nome_produto = "Cabo de Aço";

-- Deletar um produto
DELETE FROM Produto WHERE nome_produto = "Livro";


-- Criação da tabela PedidoCompra
CREATE TABLE PedidoCompra (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATE NOT NULL,
    data_entrega_esperada DATE,
    status ENUM('em processamento', 'enviado', 'recebido', 'cancelado') NOT NULL,
    id_fornecedor INT,
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedor(id_fornecedor)
);

-- Inserir Pedidos de Compra
INSERT INTO PedidoCompra (data_pedido, data_entrega_esperada, status, id_fornecedor)
VALUES ("2024-11-10", "2024-11-20", "em processamento", 1);

INSERT INTO PedidoCompra (data_pedido, data_entrega_esperada, status, id_fornecedor)
VALUES ("2024-11-12", "2024-11-25", "enviado", 2);

INSERT INTO PedidoCompra (data_pedido, data_entrega_esperada, status, id_fornecedor)
VALUES ("2024-11-15", "2024-11-30", "recebido", 3);

INSERT INTO PedidoCompra (data_pedido, data_entrega_esperada, status, id_fornecedor)
VALUES ("2024-11-15", "2024-11-30", "em processamento", 3);

-- Atualizar status de pedido
UPDATE PedidoCompra
SET status = "cancelado"
WHERE id_pedido = 1;

UPDATE PedidoCompra
SET status = "cancelado"
WHERE id_pedido = 2;

-- Deletar um pedido
DELETE FROM PedidoCompra WHERE id_pedido = 4;


-- Criação da tabela Produto_Pedido
CREATE TABLE Produto_Pedido (
    id_pedido INT,
    id_produto INT,
    quantidade_solicitada INT NOT NULL,
    PRIMARY KEY (id_pedido, id_produto),
    FOREIGN KEY (id_pedido) REFERENCES PedidoCompra(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

-- Inserir Produtos em Pedidos (Deve ser feito após os pedidos estarem criados)
INSERT INTO Produto_Pedido (id_pedido, id_produto, quantidade_solicitada)
VALUES (1, 1, 500);

INSERT INTO Produto_Pedido (id_pedido, id_produto, quantidade_solicitada)
VALUES (1, 2, 200);

INSERT INTO Produto_Pedido (id_pedido, id_produto, quantidade_solicitada)
VALUES (1, 3, 300);

INSERT INTO Produto_Pedido (id_pedido, id_produto, quantidade_solicitada)
VALUES (2, 1, 500);

INSERT INTO Produto_Pedido (id_pedido, id_produto, quantidade_solicitada)
VALUES (2, 2, 200);

INSERT INTO Produto_Pedido (id_pedido, id_produto, quantidade_solicitada)
VALUES (2, 3, 300);

-- Atualizar quantidade solicitada
UPDATE Produto_Pedido
SET quantidade_solicitada = 300
WHERE id_pedido = 1 AND id_produto = 2;

UPDATE Produto_Pedido
SET quantidade_solicitada = 400
WHERE id_pedido = 1 AND id_produto = 3;

-- Deletar um produto do pedido
DELETE FROM Produto_Pedido WHERE id_pedido = 2 AND id_produto = 2;


-- Criação da tabela Recebimento
CREATE TABLE Recebimento (
    id_recebimento INT AUTO_INCREMENT PRIMARY KEY,
    data_recebimento DATE NOT NULL,
    condicao ENUM('aceito', 'rejeitado') NOT NULL,
    motivo_rejeicao TEXT,
    id_pedido INT,
    FOREIGN KEY (id_pedido) REFERENCES PedidoCompra(id_pedido)
);

-- Inserir Recebimentos
INSERT INTO Recebimento (data_recebimento, condicao, motivo_rejeicao, id_pedido)
VALUES ("2024-11-21", "aceito", NULL, 2);

INSERT INTO Recebimento (data_recebimento, condicao, motivo_rejeicao, id_pedido)
VALUES ("2024-11-18", "rejeitado", "Produto danificado", 1);

INSERT INTO Recebimento (data_recebimento, condicao, motivo_rejeicao, id_pedido)
VALUES ("2024-02-27", "rejeitado", "Produto danificado", 3);

INSERT INTO Recebimento (data_recebimento, condicao, motivo_rejeicao, id_pedido)
VALUES ("2024-02-27", "rejeitado", "Produto danificado", 3);

-- Atualizar condição de recebimento
UPDATE Recebimento
SET condicao = "rejeitado", motivo_rejeicao = "Produto fora de especificação"
WHERE id_pedido = 3;

UPDATE Recebimento
SET condicao = "aceito", motivo_rejeicao = "Produto fora de especificação"
WHERE id_pedido = 3;

-- Deletar recebimento
DELETE FROM Recebimento WHERE id_recebimento = 4;


-- Criação da tabela Filial
CREATE TABLE Filial (
    id_filial INT AUTO_INCREMENT PRIMARY KEY,
    nome_filial VARCHAR(255) NOT NULL,
    endereco VARCHAR(255),
    capacidade_armazenagem INT
);

-- Inserir Filiais
INSERT INTO Filial (nome_filial, endereco, capacidade_armazenagem)
VALUES ("Filial São Paulo", "Rua da Empresa, 123", 5000);

INSERT INTO Filial (nome_filial, endereco, capacidade_armazenagem)
VALUES ("Filial Rio de Janeiro", "Avenida Comercial, 456", 3000);

INSERT INTO Filial (nome_filial, endereco, capacidade_armazenagem)
VALUES ("Filial Espirito Santo", "Avenida Lindenberg, 1001", 3100);

-- Atualizar capacidade de armazenamento de filial
UPDATE Filial
SET capacidade_armazenagem = 6000
WHERE nome_filial = "Filial São Paulo";

UPDATE Filial
SET capacidade_armazenagem = 7000
WHERE nome_filial = "Filial Espirito Santo";

-- Deletar uma filial
DELETE FROM Filial WHERE nome_filial = "Filial Espirito Santo";


-- Criação da tabela Transferencia
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

-- Inserir Transferências
INSERT INTO Transferencia (data_transferencia, id_produto, quantidade, id_filial_origem, id_filial_destino)
VALUES ("2024-11-16", 1, 200, 1, 2);

INSERT INTO Transferencia (data_transferencia, id_produto, quantidade, id_filial_origem, id_filial_destino)
VALUES ("2024-11-17", 2, 100, 2, 1);

INSERT INTO Transferencia (data_transferencia, id_produto, quantidade, id_filial_origem, id_filial_destino)
VALUES ("2024-11-17", 2, 100, 2, 2);

-- Atualizar a quantidade de transferência
UPDATE Transferencia
SET quantidade = 250
WHERE id_transferencia = 1;

UPDATE Transferencia
SET quantidade = 350
WHERE id_transferencia = 2;


-- Deletar uma transferência
DELETE FROM Transferencia WHERE id_transferencia = 3;

DROP DATABASE cadeia_de_suprimentos;








