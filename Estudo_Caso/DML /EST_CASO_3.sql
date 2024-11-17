CREATE DATABASE tech_solution;
USE tech_solution;

-- Criar tabela TIPOS_DE_ENDERECO
CREATE TABLE IF NOT EXISTS TIPOS_DE_ENDERECO (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
);

-- Inserir dados na tabela TIPOS_DE_ENDERECO
INSERT INTO TIPOS_DE_ENDERECO (nome)
VALUES ('Residencial'),
('Comercial'),
('Industrial'),
('Publico');

-- Atualizar dados na tabela TIPOS_DE_ENDERECO
UPDATE TIPOS_DE_ENDERECO SET nome = 'Comercial' WHERE id = 2;
UPDATE TIPOS_DE_ENDERECO SET nome = 'Casa' WHERE id = 1;
-- Deletar dados da tabela TIPOS_DE_ENDERECO
DELETE FROM TIPOS_DE_ENDERECO WHERE id = 4;

-- Criar tabela ENDERECOS
CREATE TABLE IF NOT EXISTS ENDERECOS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    numero VARCHAR(10),
    logradouro VARCHAR(100) NOT NULL,
    complemento VARCHAR(100),
    cep VARCHAR(10) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    tipo_endereco_id INT,
    FOREIGN KEY (tipo_endereco_id) REFERENCES TIPOS_DE_ENDERECO(id)
);

-- Inserir dados na tabela ENDERECOS
INSERT INTO ENDERECOS (numero, logradouro, complemento, cep, bairro, cidade, estado, tipo_endereco_id)
VALUES ('123', 'Rua A', 'Apto 101', '12345-678', 'Centro', 'Cidade X', 'Estado Y', 1),
       ('456', 'Rua B', 'Sala 3', '23456-789', 'Bairro Z', 'Cidade W', 'Estado Z', 2),
       ('789', 'Rua C', 'Loja 5', '34567-890', 'Bairro Y', 'Cidade V', 'Estado X', 3),
       ('89', 'Rua P', 'Apto 5', '34567-890', 'Bairro W', 'Cidade O', 'Estado U', 1);
-- Atualizar dados na tabela ENDERECOS
UPDATE ENDERECOS SET logradouro = 'Rua D' WHERE id = 2;
UPDATE ENDERECOS SET logradouro = 'Rua T' WHERE id = 3;
-- Deletar dados da tabela ENDERECOS
DELETE FROM ENDERECOS WHERE id = 4;

-- Criar tabela CLIENTES
CREATE TABLE IF NOT EXISTS CLIENTES (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cnpj VARCHAR(14) NOT NULL,
    razao_social VARCHAR(100) NOT NULL,
    ramo_atividade VARCHAR(50),
    data_cadastramento DATE NOT NULL,
    pessoa_contato VARCHAR(100)
);

-- Inserir dados na tabela CLIENTES
INSERT INTO CLIENTES (cnpj, razao_social, ramo_atividade, data_cadastramento, pessoa_contato)
VALUES ('12345678000123', 'Empresa A', 'Comércio', '2024-01-01', 'João Silva'),
       ('23456789000134', 'Empresa B', 'Serviços', '2024-02-15', 'Maria Oliveira'),
       ('34567890000145', 'Empresa C', 'Indústria', '2024-03-30', 'Carlos Souza');
-- Atualizar dados na tabela CLIENTES
UPDATE CLIENTES SET ramo_atividade = 'Varejo' WHERE id = 1;
UPDATE CLIENTES SET ramo_atividade = 'Atacado' WHERE id = 2;
-- Deletar dados da tabela CLIENTES
DELETE FROM CLIENTES WHERE id = 3;

-- Criar tabela EMPREGADOS
CREATE TABLE IF NOT EXISTS EMPREGADOS (
    matricula INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    salario DECIMAL(10,2),
    data_admissao DATE NOT NULL,
    qualificacoes VARCHAR(255),
    endereco_id INT,
    FOREIGN KEY (endereco_id) REFERENCES ENDERECOS(id)
);

-- Inserir dados na tabela EMPREGADOS
INSERT INTO EMPREGADOS (nome, cargo, salario, data_admissao, qualificacoes, endereco_id)
VALUES ('Ana Costa', 'Gerente', 500000, '2024-01-01', 'MBA em Gestão', 1),
       ('Lucas Pereira', 'Vendedor', 300000, '2024-02-15', 'Curso de Vendas', 2),
       ('Roberta Lima', 'Supervisor', 400000, '2024-03-30', 'Gestão de Equipes', 3),
       ('Mykael Deolindo', 'Supervisor', 2200000, '2024-03-30', 'Analista', 3);
       
-- Atualizar dados na tabela EMPREGADOS
UPDATE EMPREGADOS SET salario = 550.00 WHERE matricula = 1;
UPDATE EMPREGADOS SET salario = 500.00 WHERE matricula = 2;

-- Deletar dados da tabela EMPREGADOS

DELETE FROM EMPREGADOS WHERE matricula = 4;

-- Criar tabela EMPRESAS
CREATE TABLE IF NOT EXISTS EMPRESAS (
    cnpj VARCHAR(14) PRIMARY KEY,
    razao_social VARCHAR(100) NOT NULL,
    pessoa_contato VARCHAR(100),
    endereco_id INT,
    FOREIGN KEY (endereco_id) REFERENCES ENDERECOS(id)
);

-- Inserir dados na tabela EMPRESAS
INSERT INTO EMPRESAS (cnpj, razao_social, pessoa_contato, endereco_id)
VALUES ('12345678000123', 'Empresa A', 'João Silva', 1),
       ('23456789000134', 'Empresa B', 'Maria Oliveira', 2),
        ('2345678910134', 'Empresa C', 'Gustavo Oliveira', 3);
       
-- Atualizar dados na tabela EMPRESAS
UPDATE EMPRESAS SET pessoa_contato = 'Pedro Santos' WHERE cnpj = '12345678000123';
UPDATE EMPRESAS SET pessoa_contato = 'Lucas Amorim' WHERE cnpj = '2345678910134';
-- Deletar dados da tabela EMPRESAS
DELETE FROM EMPRESAS WHERE cnpj = '2345678910134';

-- Criar tabela FORNECEDORES
CREATE TABLE IF NOT EXISTS FORNECEDORES (
    cnpj VARCHAR(14) PRIMARY KEY,
    razao_social VARCHAR(100) NOT NULL,
    pessoa_contato VARCHAR(100),
    endereco_id INT,
    FOREIGN KEY (endereco_id) REFERENCES ENDERECOS(id)
);

-- Inserir dados na tabela FORNECEDORES
INSERT INTO FORNECEDORES (cnpj, razao_social, pessoa_contato, endereco_id)
VALUES ('45678901000156', 'Fornecedor X', 'José Almeida', 1),
       ('56789012000167', 'Fornecedor Y', 'Cláudia Rocha', 2),
       ('56789012000888', 'Fornecedor W', 'Cláudio Pedrosa', 3);
-- Atualizar dados na tabela FORNECEDORES
UPDATE FORNECEDORES SET razao_social = 'Fornecedor A' WHERE cnpj = '45678901000156';
UPDATE FORNECEDORES SET razao_social = 'Fornecedor B' WHERE cnpj = '56789012000167';
-- Deletar dados da tabela FORNECEDORES
DELETE FROM FORNECEDORES WHERE cnpj = '56789012000888';

-- Criar tabela PRODUTOS
CREATE TABLE IF NOT EXISTS PRODUTOS (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cor VARCHAR(50),
    dimensoes VARCHAR(50),
    peso DECIMAL(10,2),
    preco DECIMAL(10,2) NOT NULL,
    tempo_fabricacao INT,
    desenho_produto TEXT,
    horas_mao_obra INT
);

-- Inserir dados na tabela PRODUTOS
INSERT INTO PRODUTOS (nome, cor, dimensoes, peso, preco, tempo_fabricacao, desenho_produto, horas_mao_obra)
VALUES ('Produto A', 'Vermelho', '20x30', 1.5, 100.00, 10, 'Desenho A', 5),
       ('Produto B', 'Azul', '10x15', 0.8, 150.00, 12, 'Desenho B', 4),
       ('Produto C', 'Amarelo', '102x15', 0.8, 150.00, 12, 'Desenho C', 10);
       
       
-- Atualizar dados na tabela PRODUTOS
UPDATE PRODUTOS SET preco = 120.00 WHERE codigo = 1;
UPDATE PRODUTOS SET preco = 10.00 WHERE codigo = 2;

-- Deletar dados da tabela PRODUTOS
DELETE FROM PRODUTOS WHERE codigo = 3;

-- Criar tabela TIPOS_DE_COMPONENTE
CREATE TABLE IF NOT EXISTS TIPOS_DE_COMPONENTE (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
);

-- Inserir dados na tabela TIPOS_DE_COMPONENTE
INSERT INTO TIPOS_DE_COMPONENTE (nome) VALUES 
('Componente A'),
('Componente B'),
('Componente C');

-- Atualizar dados na tabela TIPOS_DE_COMPONENTE
UPDATE TIPOS_DE_COMPONENTE SET nome = 'Componente X' WHERE codigo = 1;
UPDATE TIPOS_DE_COMPONENTE SET nome = 'Componente Z' WHERE codigo = 2;

-- Deletar dados na tabela TIPOS_DE_COMPONENTE
DELETE FROM TIPOS_DE_COMPONENTE WHERE codigo = 3;

-- Criar tabela COMPONENTES
CREATE TABLE IF NOT EXISTS COMPONENTES (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    quantidade_em_estoque INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    unidade VARCHAR(10),
    tipo_componente_id INT,
    FOREIGN KEY (tipo_componente_id) REFERENCES TIPOS_DE_COMPONENTE(codigo)
);

-- Inserir dados na tabela COMPONENTES
INSERT INTO COMPONENTES (nome, quantidade_em_estoque, preco_unitario, unidade, tipo_componente_id)
VALUES ('Componente A1', 100, 50.00, 'Unidade', 1),
       ('Componente B1', 200, 75.00, 'Unidade', 1),
       ('Componente C1', 300, 100.00, 'Unidade', 1);
       
-- Atualizar dados na tabela COMPONENTES
UPDATE COMPONENTES SET preco_unitario = 60.00 WHERE codigo = 1;
UPDATE COMPONENTES SET preco_unitario = 60.00 WHERE codigo = 2;
-- Deletar dados na tabela COMPONENTES
DELETE FROM COMPONENTES WHERE codigo = 3;

-- Criar tabela ENCOMENDAS
CREATE TABLE IF NOT EXISTS ENCOMENDAS (
    numero INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATE NOT NULL,
    data_entrega DATE,
    cliente_id INT,
    empregado_id INT,
    FOREIGN KEY (cliente_id) REFERENCES CLIENTES(id),
    FOREIGN KEY (empregado_id) REFERENCES EMPREGADOS(matricula)
);

-- Inserir dados na tabela ENCOMENDAS
INSERT INTO ENCOMENDAS (data_pedido, data_entrega, cliente_id, empregado_id)
VALUES ('2024-01-10', '2024-01-15', 1, 1),
       ('2024-02-20', '2024-02-25', 2, 2),
       ('2024-02-20', '2024-02-25', 1, 3);
       
-- Atualizar dados na tabela ENCOMENDAS
UPDATE ENCOMENDAS SET data_entrega = '2024-02-01' WHERE numero = 1;
UPDATE ENCOMENDAS SET data_entrega = '2024-03-01' WHERE numero = 2;
-- Deletar dados na tabela ENCOMENDAS
DELETE FROM ENCOMENDAS WHERE numero = 3;

-- Criar tabela ENCOMENDA_PRODUTO
CREATE TABLE IF NOT EXISTS ENCOMENDA_PRODUTO (
    encomenda_id INT,
    produto_id INT,
    quantidade INT,
    PRIMARY KEY (encomenda_id, produto_id),
    FOREIGN KEY (encomenda_id) REFERENCES ENCOMENDAS(numero),
    FOREIGN KEY (produto_id) REFERENCES PRODUTOS(codigo)
);

-- Inserir dados na tabela ENCOMENDA_PRODUTO
INSERT INTO ENCOMENDA_PRODUTO (encomenda_id, produto_id, quantidade)
VALUES (1, 1, 10),
       (1, 2, 5);
-- Atualizar dados na tabela ENCOMENDA_PRODUTO

UPDATE ENCOMENDA_PRODUTO SET quantidade = 15 WHERE encomenda_id = 1 AND produto_id = 1;
UPDATE ENCOMENDA_PRODUTO SET quantidade = 25 WHERE encomenda_id = 1 AND produto_id = 2;

-- Deletar dados na tabela ENCOMENDA_PRODUTO
DELETE FROM ENCOMENDA_PRODUTO WHERE encomenda_id = 1 AND produto_id = 2;

DROP DATABASE tech_solution;
