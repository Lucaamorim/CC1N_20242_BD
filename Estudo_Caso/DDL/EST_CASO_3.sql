CREATE DATABASE tech_solution;
USE tech_solution;

-- Criar tabela TIPOS_DE_ENDERECO
CREATE TABLE IF NOT EXISTS TIPOS_DE_ENDERECO (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
);

-- Comandos DDL TIPOS_DE_ENDERECO
-- Criar Index
CREATE INDEX idx_nome_tipo_endereco ON TIPOS_DE_ENDERECO (nome);

-- Criar View
CREATE VIEW vista_tipos_endereco AS
SELECT id, nome FROM TIPOS_DE_ENDERECO;

-- Comando Alter ADD
ALTER TABLE TIPOS_DE_ENDERECO ADD descricao VARCHAR(100);

-- Comando Alter MODIFY COLUMN 
ALTER TABLE TIPOS_DE_ENDERECO MODIFY COLUMN descricao VARCHAR(150);

-- Comando Alter CHANGE COLUMN
ALTER TABLE TIPOS_DE_ENDERECO CHANGE COLUMN descricao descricao_completa VARCHAR(150);

-- Comando Alter ADD INDEX
ALTER TABLE TIPOS_DE_ENDERECO ADD INDEX idx_descricao (descricao_completa);

-- Remover Índice:
DROP INDEX idx_descricao ON TIPOS_DE_ENDERECO;

-- Remover Visão:
DROP VIEW vista_tipos_endereco;

-- Remover dados
TRUNCATE TABLE TIPOS_DE_ENDERECO;

-- Alterar nome da tabela
RENAME TABLE TIPOS_DE_ENDERECO TO TIPOS_ENDERECO_ANTIGOS;
RENAME TABLE TIPOS_ENDERECO_ANTIGOS TO TIPOS_DE_ENDERECO;

-- Comentários na tabela
ALTER TABLE TIPOS_DE_ENDERECO COMMENT = 'Tabela de tipos de endereços';

-- Adicionar Comentário a Coluna:
ALTER TABLE TIPOS_DE_ENDERECO MODIFY nome VARCHAR(50) COMMENT 'Nome do tipo de endereço';

-- Comando Alter DROP COLUMN
ALTER TABLE TIPOS_DE_ENDERECO DROP COLUMN descricao_completa;


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

-- Comandos DDL ENDERECOS
-- Criar Index
CREATE INDEX idx_logradouro ON ENDERECOS (logradouro);

-- Criar View
CREATE VIEW vista_enderecos AS
SELECT id, logradouro, cidade FROM ENDERECOS;

-- Comando Alter ADD
ALTER TABLE ENDERECOS ADD ponto_referencia VARCHAR(100);

-- Comando Alter MODIFY COLUMN 
ALTER TABLE ENDERECOS MODIFY COLUMN ponto_referencia VARCHAR(150);

-- Comando Alter CHANGE COLUMN
ALTER TABLE ENDERECOS CHANGE COLUMN ponto_referencia ponto_referencia_completo VARCHAR(150);

-- Comando Alter ADD INDEX
ALTER TABLE ENDERECOS ADD INDEX idx_ponto_referencia (ponto_referencia_completo);

-- Remover Índice:
DROP INDEX idx_ponto_referencia ON ENDERECOS;

-- Remover Visão:
DROP VIEW vista_enderecos;

-- Remover dados
TRUNCATE TABLE ENDERECOS;

-- Alterar nome da tabela
RENAME TABLE ENDERECOS TO ENDERECOS_ANTIGOS;
RENAME TABLE ENDERECOS_ANTIGOS TO ENDERECOS;

-- Comentários na tabela
ALTER TABLE ENDERECOS COMMENT = 'Tabela de endereços';

-- Adicionar Comentário a Coluna:
ALTER TABLE ENDERECOS MODIFY ponto_referencia_completo VARCHAR(150) COMMENT 'Ponto de referência do endereço';

-- Comando Alter DROP COLUMN
ALTER TABLE ENDERECOS DROP COLUMN ponto_referencia_completo;


-- Criar tabela CLIENTES
CREATE TABLE IF NOT EXISTS CLIENTES (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cnpj VARCHAR(14) NOT NULL,
    razao_social VARCHAR(100) NOT NULL,
    ramo_atividade VARCHAR(50),
    data_cadastramento DATE NOT NULL,
    pessoa_contato VARCHAR(100)
);

-- Comandos DDL CLIENTES
-- Criar Index
CREATE INDEX idx_razao_social ON CLIENTES (razao_social);

-- Criar View
CREATE VIEW vista_clientes AS
SELECT id, razao_social FROM CLIENTES;

-- Comando Alter ADD
ALTER TABLE CLIENTES ADD telefone VARCHAR(15);

-- Comando Alter MODIFY COLUMN 
ALTER TABLE CLIENTES MODIFY COLUMN telefone VARCHAR(20);

-- Comando Alter CHANGE COLUMN
ALTER TABLE CLIENTES CHANGE COLUMN telefone telefone_contato VARCHAR(20);

-- Comando Alter ADD INDEX
ALTER TABLE CLIENTES ADD INDEX idx_telefone (telefone_contato);

-- Remover Índice:
DROP INDEX idx_telefone ON CLIENTES;

-- Remover Visão:
DROP VIEW vista_clientes;

-- Remover dados
TRUNCATE TABLE CLIENTES;

-- Alterar nome da tabela
RENAME TABLE CLIENTES TO CLIENTES_ANTIGOS;
RENAME TABLE CLIENTES_ANTIGOS TO CLIENTES;

-- Comentários na tabela
ALTER TABLE CLIENTES COMMENT = 'Tabela de clientes';

-- Adicionar Comentário a Coluna:
ALTER TABLE CLIENTES MODIFY telefone_contato VARCHAR(20) COMMENT 'Telefone de contato do cliente';

-- Comando Alter DROP COLUMN
ALTER TABLE CLIENTES DROP COLUMN telefone_contato;


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

-- Comandos DDL EMPREGADOS
-- Criar Index
CREATE INDEX idx_nome ON EMPREGADOS (nome);

-- Criar View
CREATE VIEW vista_empregados AS
SELECT matricula, nome, cargo FROM EMPREGADOS;

-- Comando Alter ADD
ALTER TABLE EMPREGADOS ADD data_nascimento DATE;

-- Comando Alter MODIFY COLUMN 
ALTER TABLE EMPREGADOS MODIFY COLUMN data_nascimento DATE;

-- Comando Alter CHANGE COLUMN
ALTER TABLE EMPREGADOS CHANGE COLUMN data_nascimento data_nascimento_completa DATE;

-- Comando Alter ADD INDEX
ALTER TABLE EMPREGADOS ADD INDEX idx_data_nascimento (data_nascimento_completa);

-- Remover Índice:
DROP INDEX idx_data_nascimento ON EMPREGADOS;

-- Remover Visão:
DROP VIEW vista_empregados;

-- Remover dados
TRUNCATE TABLE EMPREGADOS;

-- Alterar nome da tabela
RENAME TABLE EMPREGADOS TO EMPREGADOS_ANTIGOS;
RENAME TABLE EMPREGADOS_ANTIGOS TO EMPREGADOS;

-- Comentários na tabela
ALTER TABLE EMPREGADOS COMMENT = 'Tabela de empregados';

-- Adicionar Comentário a Coluna:
ALTER TABLE EMPREGADOS MODIFY data_nascimento_completa DATE COMMENT 'Data de nascimento do empregado';

-- Comando Alter DROP COLUMN
ALTER TABLE EMPREGADOS DROP COLUMN data_nascimento_completa;


-- Criar tabela EMPRESAS
CREATE TABLE IF NOT EXISTS EMPRESAS (
    cnpj VARCHAR(14) PRIMARY KEY,
    razao_social VARCHAR(100) NOT NULL,
    pessoa_contato VARCHAR(100),
    endereco_id INT,
    FOREIGN KEY (endereco_id) REFERENCES ENDERECOS(id)
);

-- Comandos DDL EMPRESAS
-- Criar Index
CREATE INDEX idx_razao_social_empresas ON EMPRESAS (razao_social);

-- Criar View
CREATE VIEW vista_empresas AS
SELECT cnpj, razao_social FROM EMPRESAS;

-- Comando Alter ADD
ALTER TABLE EMPRESAS ADD tipo_empresa VARCHAR(50);

-- Comando Alter MODIFY COLUMN 
ALTER TABLE EMPRESAS MODIFY COLUMN tipo_empresa VARCHAR(70);

-- Comando Alter CHANGE COLUMN
ALTER TABLE EMPRESAS CHANGE COLUMN tipo_empresa tipo_empresa_completo VARCHAR(70);

-- Comando Alter ADD INDEX
ALTER TABLE EMPRESAS ADD INDEX idx_tipo_empresa (tipo_empresa_completo);

-- Remover Índice:
DROP INDEX idx_tipo_empresa ON EMPRESAS;

-- Remover Visão:
DROP VIEW vista_empresas;

-- Remover dados
TRUNCATE TABLE EMPRESAS;

-- Alterar nome da tabela
RENAME TABLE EMPRESAS TO EMPRESAS_ANTIGAS;
RENAME TABLE EMPRESAS_ANTIGAS TO EMPRESAS;

-- Comentários na tabela
ALTER TABLE EMPRESAS COMMENT = 'Tabela de empresas';

-- Adicionar Comentário a Coluna:
ALTER TABLE EMPRESAS MODIFY tipo_empresa_completo VARCHAR(70) COMMENT 'Tipo de empresa';

-- Comando Alter DROP COLUMN
ALTER TABLE EMPRESAS DROP COLUMN tipo_empresa_completo;

-- Criar tabela FORNECEDORES
CREATE TABLE IF NOT EXISTS FORNECEDORES (
    cnpj VARCHAR(14) PRIMARY KEY,
    razao_social VARCHAR(100) NOT NULL,
    pessoa_contato VARCHAR(100),
    endereco_id INT,
    FOREIGN KEY (endereco_id) REFERENCES ENDERECOS(id)
);

-- Comandos DDL FORNECEDORES
-- Criar Index
CREATE INDEX idx_razao_social_fornecedores ON FORNECEDORES (razao_social);

-- Criar View
CREATE VIEW vista_fornecedores AS
SELECT cnpj, razao_social FROM FORNECEDORES;

-- Comando Alter ADD
ALTER TABLE FORNECEDORES ADD tipo_fornecedor VARCHAR(50);

-- Comando Alter MODIFY COLUMN 
ALTER TABLE FORNECEDORES MODIFY COLUMN tipo_fornecedor VARCHAR(70);

-- Comando Alter CHANGE COLUMN
ALTER TABLE FORNECEDORES CHANGE COLUMN tipo_fornecedor tipo_fornecedor_completo VARCHAR(70);

-- Comando Alter ADD INDEX
ALTER TABLE FORNECEDORES ADD INDEX idx_tipo_fornecedor (tipo_fornecedor_completo);

-- Remover Índice:
DROP INDEX idx_tipo_fornecedor ON FORNECEDORES;

-- Remover Visão:
DROP VIEW vista_fornecedores;

-- Remover dados
TRUNCATE TABLE FORNECEDORES;

-- Alterar nome da tabela
RENAME TABLE FORNECEDORES TO FORNECEDORES_ANTIGOS;
RENAME TABLE FORNECEDORES_ANTIGOS TO FORNECEDORES;

-- Comentários na tabela
ALTER TABLE FORNECEDORES COMMENT = 'Tabela de fornecedores';

-- Adicionar Comentário a Coluna:
ALTER TABLE FORNECEDORES MODIFY tipo_fornecedor_completo VARCHAR(70) COMMENT 'Tipo de fornecedor';

-- Comando Alter DROP COLUMN
ALTER TABLE FORNECEDORES DROP COLUMN tipo_fornecedor_completo;


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

-- Comandos DDL PRODUTOS
-- Criar Index
CREATE INDEX idx_nome_produto ON PRODUTOS (nome);

-- Criar View
CREATE VIEW vista_produtos AS
SELECT codigo, nome, preco FROM PRODUTOS;

-- Comando Alter ADD
ALTER TABLE PRODUTOS ADD categoria VARCHAR(50);

-- Comando Alter MODIFY COLUMN 
ALTER TABLE PRODUTOS MODIFY COLUMN categoria VARCHAR(70);

-- Comando Alter CHANGE COLUMN
ALTER TABLE PRODUTOS CHANGE COLUMN categoria categoria_completa VARCHAR(70);

-- Comando Alter ADD INDEX
ALTER TABLE PRODUTOS ADD INDEX idx_categoria (categoria_completa);

-- Remover Índice:
DROP INDEX idx_categoria ON PRODUTOS;

-- Remover Visão:
DROP VIEW vista_produtos;

-- Remover dados
TRUNCATE TABLE PRODUTOS;

-- Alterar nome da tabela
RENAME TABLE PRODUTOS TO PRODUTOS_ANTIGOS;
RENAME TABLE PRODUTOS_ANTIGOS TO PRODUTOS;

-- Comentários na tabela
ALTER TABLE PRODUTOS COMMENT = 'Tabela de produtos';

-- Adicionar Comentário a Coluna:
ALTER TABLE PRODUTOS MODIFY categoria_completa VARCHAR(70) COMMENT 'Categoria do produto';

-- Comando Alter DROP COLUMN
ALTER TABLE PRODUTOS DROP COLUMN categoria_completa;


-- Criar tabela TIPOS_DE_COMPONENTE
CREATE TABLE IF NOT EXISTS TIPOS_DE_COMPONENTE (
    codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
);

-- Comandos DDL TIPOS_DE_COMPONENTE
-- Criar Index
CREATE INDEX idx_nome_tipo_componente ON TIPOS_DE_COMPONENTE (nome);

-- Criar View
CREATE VIEW vista_tipos_componente AS
SELECT codigo, nome FROM TIPOS_DE_COMPONENTE;

-- Comando Alter ADD
ALTER TABLE TIPOS_DE_COMPONENTE ADD descricao VARCHAR(100);

-- Comando Alter MODIFY COLUMN 
ALTER TABLE TIPOS_DE_COMPONENTE MODIFY COLUMN descricao VARCHAR(150);

-- Comando Alter CHANGE COLUMN
ALTER TABLE TIPOS_DE_COMPONENTE CHANGE COLUMN descricao descricao_completa VARCHAR(150);

-- Comando Alter ADD INDEX
ALTER TABLE TIPOS_DE_COMPONENTE ADD INDEX idx_descricao (descricao_completa);

-- Remover Índice:
DROP INDEX idx_descricao ON TIPOS_DE_COMPONENTE;

-- Remover Visão:
DROP VIEW vista_tipos_componente;

-- Remover dados
TRUNCATE TABLE TIPOS_DE_COMPONENTE;

-- Alterar nome da tabela
RENAME TABLE TIPOS_DE_COMPONENTE TO TIPOS_COMPONENTES_ANTIGOS;
RENAME TABLE TIPOS_COMPONENTES_ANTIGOS TO TIPOS_DE_COMPONENTE;

-- Comentários na tabela
ALTER TABLE TIPOS_DE_COMPONENTE COMMENT = 'Tabela de tipos de componente';

-- Adicionar Comentário a Coluna:
ALTER TABLE TIPOS_DE_COMPONENTE MODIFY nome VARCHAR(50) COMMENT 'Nome do tipo de componente';

-- Comando Alter DROP COLUMN
ALTER TABLE TIPOS_DE_COMPONENTE DROP COLUMN descricao_completa;

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

-- Comandos DDL COMPONENTES
-- Criar Index
CREATE INDEX idx_nome_componente ON COMPONENTES (nome);

-- Criar View
CREATE VIEW vista_componentes AS
SELECT codigo, nome, quantidade_em_estoque FROM COMPONENTES;

-- Comando Alter ADD
ALTER TABLE COMPONENTES ADD data_validade DATE;

-- Comando Alter MODIFY COLUMN 
ALTER TABLE COMPONENTES MODIFY COLUMN data_validade DATE;

-- Comando Alter CHANGE COLUMN
ALTER TABLE COMPONENTES CHANGE COLUMN data_validade data_validade_completa DATE;

-- Comando Alter ADD INDEX
ALTER TABLE COMPONENTES ADD INDEX idx_data_validade (data_validade_completa);

-- Remover Índice:
DROP INDEX idx_data_validade ON COMPONENTES;

-- Remover Visão:
DROP VIEW vista_componentes;

-- Remover dados
TRUNCATE TABLE COMPONENTES;

-- Alterar nome da tabela
RENAME TABLE COMPONENTES TO COMPONENTES_ANTIGOS;
RENAME TABLE COMPONENTES_ANTIGOS TO COMPONENTES;

-- Comentários na tabela
ALTER TABLE COMPONENTES COMMENT = 'Tabela de componentes';

-- Adicionar Comentário a Coluna:
ALTER TABLE COMPONENTES MODIFY data_validade_completa DATE COMMENT 'Data de validade do componente';

-- Comando Alter DROP COLUMN
ALTER TABLE COMPONENTES DROP COLUMN data_validade_completa;


-- Criar tabela MAQUINAS
CREATE TABLE IF NOT EXISTS MAQUINAS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tempo_de_vida INT,
    data_compra DATE,
    data_fim_garantia DATE
);

-- Comandos DDL MAQUINAS
-- Criar Index
CREATE INDEX idx_data_compra ON MAQUINAS (data_compra);

-- Criar View
CREATE VIEW vista_maquinas AS
SELECT id, tempo_de_vida, data_compra FROM MAQUINAS;

-- Comando Alter ADD
ALTER TABLE MAQUINAS ADD tipo_maquina VARCHAR(50);

-- Comando Alter MODIFY COLUMN 
ALTER TABLE MAQUINAS MODIFY COLUMN tipo_maquina VARCHAR(70);

-- Comando Alter CHANGE COLUMN
ALTER TABLE MAQUINAS CHANGE COLUMN tipo_maquina tipo_maquina_completo VARCHAR(70);

-- Comando Alter ADD INDEX
ALTER TABLE MAQUINAS ADD INDEX idx_tipo_maquina (tipo_maquina_completo);

-- Remover Índice:
DROP INDEX idx_tipo_maquina ON MAQUINAS;

-- Remover Visão:
DROP VIEW vista_maquinas;

-- Remover dados
TRUNCATE TABLE MAQUINAS;

-- Alterar nome da tabela
RENAME TABLE MAQUINAS TO MAQUINAS_ANTIGAS;
RENAME TABLE MAQUINAS_ANTIGAS TO MAQUINAS;

-- Comentários na tabela
ALTER TABLE MAQUINAS COMMENT = 'Tabela de máquinas';

-- Adicionar Comentário a Coluna:
ALTER TABLE MAQUINAS MODIFY tipo_maquina_completo VARCHAR(70) COMMENT 'Tipo da máquina';

-- Comando Alter DROP COLUMN
ALTER TABLE MAQUINAS DROP COLUMN tipo_maquina_completo;


-- Criar tabela RECURSOS_ESPECIFICOS
CREATE TABLE IF NOT EXISTS RECURSOS_ESPECIFICOS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    quantidade_necessaria INT,
    unidade VARCHAR(10),
    tempo_uso INT,
    horas_mao_obra INT,
    produto_id INT,
    FOREIGN KEY (produto_id) REFERENCES PRODUTOS(codigo)
);

-- Comandos DDL RECURSOS_ESPECIFICOS
-- Criar Index
CREATE INDEX idx_produto_id ON RECURSOS_ESPECIFICOS (produto_id);

-- Criar View
CREATE VIEW vista_recursos_especificos AS
SELECT id, produto_id, quantidade_necessaria FROM RECURSOS_ESPECIFICOS;

-- Comando Alter ADD
ALTER TABLE RECURSOS_ESPECIFICOS ADD descricao VARCHAR(100);

-- Comando Alter MODIFY COLUMN 
ALTER TABLE RECURSOS_ESPECIFICOS MODIFY COLUMN descricao VARCHAR(150);

-- Comando Alter CHANGE COLUMN
ALTER TABLE RECURSOS_ESPECIFICOS CHANGE COLUMN descricao descricao_completa VARCHAR(150);

-- Comando Alter ADD INDEX
ALTER TABLE RECURSOS_ESPECIFICOS ADD INDEX idx_descricao (descricao_completa);

-- Remover Índice:
DROP INDEX idx_descricao ON RECURSOS_ESPECIFICOS;

-- Remover Visão:
DROP VIEW vista_recursos_especificos;

-- Remover dados
TRUNCATE TABLE RECURSOS_ESPECIFICOS;

-- Alterar nome da tabela
RENAME TABLE RECURSOS_ESPECIFICOS TO RECURSOS_ESPECIFICOS_ANTIGOS;
RENAME TABLE RECURSOS_ESPECIFICOS_ANTIGOS TO RECURSOS_ESPECIFICOS;

-- Comentários na tabela
ALTER TABLE RECURSOS_ESPECIFICOS COMMENT = 'Tabela de recursos específicos';

-- Adicionar Comentário a Coluna:
ALTER TABLE RECURSOS_ESPECIFICOS MODIFY descricao_completa VARCHAR(150) COMMENT 'Descrição do recurso específico';

-- Comando Alter DROP COLUMN
ALTER TABLE RECURSOS_ESPECIFICOS DROP COLUMN descricao_completa;


-- Criar tabela REGISTRO_MANUTENCAO
CREATE TABLE IF NOT EXISTS REGISTRO_MANUTENCAO (
    id INT PRIMARY KEY AUTO_INCREMENT,
    data DATE,
    descricao TEXT,
    maquina_id INT,
    FOREIGN KEY (maquina_id) REFERENCES MAQUINAS(id)
);

-- Comandos DDL REGISTRO_MANUTENCAO
-- Criar Index
CREATE INDEX idx_maquina_id ON REGISTRO_MANUTENCAO (maquina_id);

-- Criar View
CREATE VIEW vista_registro_manutencao AS
SELECT id, maquina_id, data FROM REGISTRO_MANUTENCAO;

-- Comando Alter ADD
ALTER TABLE REGISTRO_MANUTENCAO ADD responsavel VARCHAR(100);

-- Comando Alter MODIFY COLUMN 
ALTER TABLE REGISTRO_MANUTENCAO MODIFY COLUMN responsavel VARCHAR(150);

-- Comando Alter CHANGE COLUMN
ALTER TABLE REGISTRO_MANUTENCAO CHANGE COLUMN responsavel responsavel_completo VARCHAR(150);

-- Comando Alter ADD INDEX
ALTER TABLE REGISTRO_MANUTENCAO ADD INDEX idx_responsavel (responsavel_completo);

-- Remover Índice:
DROP INDEX idx_responsavel ON REGISTRO_MANUTENCAO;

-- Remover Visão:
DROP VIEW vista_registro_manutencao;

-- Remover dados
TRUNCATE TABLE REGISTRO_MANUTENCAO;

-- Alterar nome da tabela
RENAME TABLE REGISTRO_MANUTENCAO TO REGISTRO_MANUTENCAO_ANTIGO;
RENAME TABLE REGISTRO_MANUTENCAO_ANTIGO TO REGISTRO_MANUTENCAO;

-- Comentários na tabela
ALTER TABLE REGISTRO_MANUTENCAO COMMENT = 'Tabela de registros de manutenção';

-- Adicionar Comentário a Coluna:
ALTER TABLE REGISTRO_MANUTENCAO MODIFY responsavel_completo VARCHAR(150) COMMENT 'Responsável pela manutenção';

-- Comando Alter DROP COLUMN
ALTER TABLE REGISTRO_MANUTENCAO DROP COLUMN responsavel_completo;


-- Criar tabela REGISTRO_SUPRIMENTOS
CREATE TABLE IF NOT EXISTS REGISTRO_SUPRIMENTOS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    quantidade INT,
    data_necessidade DATE,
    componente_id INT,
    FOREIGN KEY (componente_id) REFERENCES COMPONENTES(codigo)
);

-- Comandos DDL REGISTRO_SUPRIMENTOS
-- Criar Index
CREATE INDEX idx_componente_id ON REGISTRO_SUPRIMENTOS (componente_id);

-- Criar View
CREATE VIEW vista_registro_suprimentos AS
SELECT id, componente_id, quantidade FROM REGISTRO_SUPRIMENTOS;

-- Comando Alter ADD
ALTER TABLE REGISTRO_SUPRIMENTOS ADD descricao VARCHAR(100);

-- Comando Alter MODIFY COLUMN 
ALTER TABLE REGISTRO_SUPRIMENTOS MODIFY COLUMN descricao VARCHAR(150);

-- Comando Alter CHANGE COLUMN
ALTER TABLE REGISTRO_SUPRIMENTOS CHANGE COLUMN descricao descricao_completa VARCHAR(150);

-- Comando Alter ADD INDEX
ALTER TABLE REGISTRO_SUPRIMENTOS ADD INDEX idx_descricao (descricao_completa);

-- Remover Índice:
DROP INDEX idx_descricao ON REGISTRO_SUPRIMENTOS;

-- Remover Visão:
DROP VIEW vista_registro_suprimentos;

-- Remover dados
TRUNCATE TABLE REGISTRO_SUPRIMENTOS;

-- Alterar nome da tabela
RENAME TABLE REGISTRO_SUPRIMENTOS TO REGISTRO_SUPRIMENTOS_ANTIGOS;
RENAME TABLE REGISTRO_SUPRIMENTOS_ANTIGOS TO REGISTRO_SUPRIMENTOS;

-- Comentários na tabela
ALTER TABLE REGISTRO_SUPRIMENTOS COMMENT = 'Tabela de registros de suprimentos';

-- Adicionar Comentário a Coluna:
ALTER TABLE REGISTRO_SUPRIMENTOS MODIFY descricao_completa VARCHAR(150) COMMENT 'Descrição do suprimento';

-- Comando Alter DROP COLUMN
ALTER TABLE REGISTRO_SUPRIMENTOS DROP COLUMN descricao_completa;


-- Criar tabela ENCOMENDAS
CREATE TABLE IF NOT EXISTS ENCOMENDAS (
    numero INT PRIMARY KEY AUTO_INCREMENT,
    data_inclusao DATE NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    valor_desconto DECIMAL(10,2),
    valor_liquido DECIMAL(10,2),
    forma_pagamento_id INT,
    quantidade_parcelas INT,
    cliente_id INT,
    FOREIGN KEY (cliente_id) REFERENCES CLIENTES(id)
);

-- Comandos DDL ENCOMENDAS
-- Criar Index
CREATE INDEX idx_cliente_id ON ENCOMENDAS (cliente_id);

-- Criar View
CREATE VIEW vista_encomendas AS
SELECT numero, data_inclusao, valor_total FROM ENCOMENDAS;

-- Comando Alter ADD
ALTER TABLE ENCOMENDAS ADD status VARCHAR(50);

-- Comando Alter MODIFY COLUMN 
ALTER TABLE ENCOMENDAS MODIFY COLUMN status VARCHAR(70);

-- Comando Alter CHANGE COLUMN
ALTER TABLE ENCOMENDAS CHANGE COLUMN status status_completo VARCHAR(70);

-- Comando Alter ADD INDEX
ALTER TABLE ENCOMENDAS ADD INDEX idx_status (status_completo);

-- Remover Índice:
DROP INDEX idx_status ON ENCOMENDAS;

-- Remover Visão:
DROP VIEW vista_encomendas;

-- Remover dados
TRUNCATE TABLE ENCOMENDAS;

-- Alterar nome da tabela
RENAME TABLE ENCOMENDAS TO ENCOMENDAS_ANTIGAS;
RENAME TABLE ENCOMENDAS_ANTIGAS TO ENCOMENDAS;

-- Comentários na tabela
ALTER TABLE ENCOMENDAS COMMENT = 'Tabela de encomendas';

-- Adicionar Comentário a Coluna:
ALTER TABLE ENCOMENDAS MODIFY status_completo VARCHAR(70) COMMENT 'Status da encomenda';

-- Comando Alter DROP COLUMN
ALTER TABLE ENCOMENDAS DROP COLUMN status_completo;


-- Criar tabela ENCOMENDA_PRODUTO
CREATE TABLE IF NOT EXISTS ENCOMENDA_PRODUTO (
    encomenda_id INT,
    produto_id INT,
    quantidade INT,
    PRIMARY KEY (encomenda_id, produto_id),
    FOREIGN KEY (encomenda_id) REFERENCES ENCOMENDAS(numero),
    FOREIGN KEY (produto_id) REFERENCES PRODUTOS(codigo)
);

-- Comandos DDL ENCOMENDA_PRODUTO
-- Criar Index
CREATE INDEX idx_encomenda_id ON ENCOMENDA_PRODUTO (encomenda_id);

-- Criar View
CREATE VIEW vista_encomenda_produto AS
SELECT encomenda_id, produto_id, quantidade FROM ENCOMENDA_PRODUTO;

-- Comando Alter ADD
ALTER TABLE ENCOMENDA_PRODUTO ADD preco_unitario DECIMAL(10,2);

-- Comando Alter MODIFY COLUMN 
ALTER TABLE ENCOMENDA_PRODUTO MODIFY COLUMN preco_unitario DECIMAL(12,2);

-- Comando Alter CHANGE COLUMN
ALTER TABLE ENCOMENDA_PRODUTO CHANGE COLUMN preco_unitario preco_unitario_completo DECIMAL(12,2);

-- Comando Alter ADD INDEX
ALTER TABLE ENCOMENDA_PRODUTO ADD INDEX idx_preco_unitario (preco_unitario_completo);

-- Remover Índice:
DROP INDEX idx_preco_unitario ON ENCOMENDA_PRODUTO;

-- Remover Visão:
DROP VIEW vista_encomenda_produto;

-- Remover dados
TRUNCATE TABLE ENCOMENDA_PRODUTO;

-- Alterar nome da tabela
RENAME TABLE ENCOMENDA_PRODUTO TO ENCOMENDA_PRODUTO_ANTIGA;
RENAME TABLE ENCOMENDA_PRODUTO_ANTIGA TO ENCOMENDA_PRODUTO;

-- Comentários na tabela
ALTER TABLE ENCOMENDA_PRODUTO COMMENT = 'Tabela de relação entre encomendas e produtos';

-- Adicionar Comentário a Coluna:
ALTER TABLE ENCOMENDA_PRODUTO MODIFY preco_unitario_completo DECIMAL(12,2) COMMENT 'Preço unitário do produto na encomenda';

-- Comando Alter DROP COLUMN
ALTER TABLE ENCOMENDA_PRODUTO DROP COLUMN preco_unitario_completo;

-- Remover tabela ENCOMENDA_PRODUTO
DROP TABLE IF EXISTS ENCOMENDA_PRODUTO;

-- Remover tabela ENCOMENDAS
DROP TABLE IF EXISTS ENCOMENDAS;

-- Remover tabela REGISTRO_SUPRIMENTOS
DROP TABLE IF EXISTS REGISTRO_SUPRIMENTOS;

-- Remover tabela REGISTRO_MANUTENCAO
DROP TABLE IF EXISTS REGISTRO_MANUTENCAO;

-- Remover tabela RECURSOS_ESPECIFICOS
DROP TABLE IF EXISTS RECURSOS_ESPECIFICOS;

-- Remover tabela COMPONENTES
DROP TABLE IF EXISTS COMPONENTES;

-- Remover tabela MAQUINAS
DROP TABLE IF EXISTS MAQUINAS;

-- Remover tabela FORNECEDORES
DROP TABLE IF EXISTS FORNECEDORES;

-- Remover tabela CLIENTES
DROP TABLE IF EXISTS CLIENTES;

-- Remover tabela PRODUTOS
DROP TABLE IF EXISTS PRODUTOS;

-- Remover tabela EMPRESAS
DROP TABLE IF EXISTS EMPRESAS;

-- Remover tabela EMPREGADOS
DROP TABLE IF EXISTS EMPREGADOS;

-- Remover tabela CLIENTES
DROP TABLE IF EXISTS CLIENTES;

-- Remover tabela ENDERECOS
DROP TABLE IF EXISTS ENDERECOS;

-- Remover tabela TIPOS_DE_ENDERECO
DROP TABLE IF EXISTS TIPOS_DE_ENDERECO;

-- DROP DATA BASE
DROP DATABASE tech_solution;
