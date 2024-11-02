CREATE DATABASE academia_saude;
USE academia_saude;

-- Criar tabela ALUNOS
CREATE TABLE ALUNOS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    endereco VARCHAR(255) NOT NULL
);

-- Criar índice para ALUNOS
CREATE INDEX idx_cpf ON ALUNOS (cpf);

-- Criar visão para ALUNOS
CREATE VIEW vista_alunos AS
SELECT nome, cpf, data_nascimento
FROM ALUNOS;

-- Alterar tabela ALUNOS
ALTER TABLE ALUNOS ADD email VARCHAR(100);

-- Alterar tabela ALUNOS
ALTER TABLE ALUNOS MODIFY COLUMN email VARCHAR(150);

-- Alterar tabela ALUNOS:
ALTER TABLE ALUNOS CHANGE COLUMN email email_completo VARCHAR(150);

-- Alterar tabela ALUNOS: 
ALTER TABLE ALUNOS ADD INDEX idx_email (email_completo);

-- Remover índice da tabela ALUNOS
DROP INDEX idx_email ON ALUNOS;

-- Remover visão da tabela ALUNOS
DROP VIEW vista_alunos;

-- Remover dados da tabela ALUNOS
TRUNCATE TABLE ALUNOS;

-- Alterar nome da tabela ALUNOS
RENAME TABLE ALUNOS TO ALUNO;
RENAME TABLE ALUNO TO ALUNOS;

-- Adicionar comentário à tabela ALUNOS
ALTER TABLE ALUNOS COMMENT = 'Tabela de informações dos Alunos';

-- Adicionar comentário à coluna email_completo da tabela ALUNOS
ALTER TABLE ALUNOS MODIFY email_completo VARCHAR(150) COMMENT 'email do aluno';

-- Remover coluna email_completo da tabela ALUNOS
ALTER TABLE ALUNOS DROP COLUMN email_completo;

-- Criar tabela INSTRUTORES
CREATE TABLE INSTRUTORES (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    especialidade VARCHAR(50)
);

-- Criar índice para INSTRUTORES
CREATE INDEX idx_cpf_instrutor ON INSTRUTORES (cpf);

-- Criar visão para INSTRUTORES
CREATE VIEW vista_instrutores AS
SELECT nome, cpf, especialidade
FROM INSTRUTORES;

-- Alterar tabela INSTRUTORES: adicionar coluna email
ALTER TABLE INSTRUTORES ADD email VARCHAR(100);

-- Alterar tabela INSTRUTORES: modificar coluna email
ALTER TABLE INSTRUTORES MODIFY COLUMN email VARCHAR(150);

-- Alterar tabela INSTRUTORES: mudar nome da coluna email
ALTER TABLE INSTRUTORES CHANGE COLUMN email email_completo VARCHAR(150);

-- Alterar tabela INSTRUTORES: adicionar índice na coluna email
ALTER TABLE INSTRUTORES ADD INDEX idx_email (email_completo);

-- Remover índice da tabela INSTRUTORES
DROP INDEX idx_email ON INSTRUTORES;

-- Remover visão da tabela INSTRUTORES
DROP VIEW vista_instrutores;

-- Remover dados da tabela INSTRUTORES
TRUNCATE TABLE INSTRUTORES;

-- Alterar nome da tabela INSTRUTORES
RENAME TABLE INSTRUTORES TO INSTRUTOR;
RENAME TABLE INSTRUTOR TO INSTRUTORES;

-- Adicionar comentário à tabela INSTRUTORES
ALTER TABLE INSTRUTORES COMMENT = 'Tabela de informações dos Instrutores';

-- Adicionar comentário à coluna email_completo da tabela INSTRUTORES
ALTER TABLE INSTRUTORES MODIFY email_completo VARCHAR(150) COMMENT 'email do instrutor';

-- Remover coluna email_completo da tabela INSTRUTORES
ALTER TABLE INSTRUTORES DROP COLUMN email_completo;

-- Criar tabela MODALIDADES
CREATE TABLE MODALIDADES (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT,
    capacidade INT NOT NULL
);

-- Criar índice para MODALIDADES
CREATE INDEX idx_nome_modalidade ON MODALIDADES (nome);

-- Criar visão para MODALIDADES
CREATE VIEW vista_modalidades AS
SELECT nome, capacidade
FROM MODALIDADES;

-- Remover visão da tabela MODALIDADES
DROP VIEW vista_modalidades;

-- Remover dados da tabela MODALIDADES
TRUNCATE TABLE MODALIDADES;

-- Alterar nome da tabela MODALIDADES
RENAME TABLE MODALIDADES TO MODALIDADE;
RENAME TABLE MODALIDADE TO MODALIDADES;

-- Adicionar comentário à tabela MODALIDADES
ALTER TABLE MODALIDADES COMMENT = 'Tabela de informações das Modalidades';

-- Criar tabela PLANOS_TREINAMENTO
CREATE TABLE PLANOS_TREINAMENTO (
    id INT PRIMARY KEY AUTO_INCREMENT,
    aluno_id INT,
    instrutor_id INT,
    data_criacao DATE NOT NULL,
    data_atualizacao DATE,
    FOREIGN KEY (aluno_id) REFERENCES ALUNOS(id),
    FOREIGN KEY (instrutor_id) REFERENCES INSTRUTORES(id)
);

-- Criar índice para PLANOS_TREINAMENTO
CREATE INDEX idx_aluno_id ON PLANOS_TREINAMENTO (aluno_id);
CREATE INDEX idx_instrutor_id ON PLANOS_TREINAMENTO (instrutor_id);

-- Remover dados da tabela PLANOS_TREINAMENTO
TRUNCATE TABLE PLANOS_TREINAMENTO;

-- Criar tabela AULAS
CREATE TABLE AULAS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    modalidade_id INT,
    instrutor_id INT,
    horario TIME NOT NULL,
    data DATE NOT NULL,
    capacidade INT NOT NULL,
    FOREIGN KEY (modalidade_id) REFERENCES MODALIDADES(id),
    FOREIGN KEY (instrutor_id) REFERENCES INSTRUTORES(id)
);

-- Criar índice para AULAS
CREATE INDEX idx_modalidade_id ON AULAS (modalidade_id);
CREATE INDEX idx_instrutor_id_aula ON AULAS (instrutor_id);

-- Remover dados da tabela AULAS
TRUNCATE TABLE AULAS;

-- Criar tabela ALUNOS_MODALIDADES
CREATE TABLE ALUNOS_MODALIDADES (
    aluno_id INT,
    modalidade_id INT,
    PRIMARY KEY (aluno_id, modalidade_id),
    FOREIGN KEY (aluno_id) REFERENCES ALUNOS(id),
    FOREIGN KEY (modalidade_id) REFERENCES MODALIDADES(id)
);

-- Remover dados da tabela ALUNOS_MODALIDADES
TRUNCATE TABLE ALUNOS_MODALIDADES;

-- Criar tabela PAGAMENTOS
CREATE TABLE PAGAMENTOS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    aluno_id INT,
    data_pagamento DATE NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    status ENUM('pago', 'pendente') NOT NULL,
    FOREIGN KEY (aluno_id) REFERENCES ALUNOS(id)
);

-- Criar índice para PAGAMENTOS
CREATE INDEX idx_aluno_pagamento ON PAGAMENTOS (aluno_id);

-- Remover dados da tabela PAGAMENTOS
TRUNCATE TABLE PAGAMENTOS;

-- Remover tabela PAGAMENTOS
DROP TABLE IF EXISTS PAGAMENTOS;

-- Remover tabela ALUNOS_MODALIDADES
DROP TABLE IF EXISTS ALUNOS_MODALIDADES;

-- Remover tabela AULAS
DROP TABLE IF EXISTS AULAS;

-- Remover tabela PLANOS_TREINAMENTO
DROP TABLE IF EXISTS PLANOS_TREINAMENTO;

-- Remover tabela MODALIDADES
DROP TABLE IF EXISTS MODALIDADES;

-- Remover tabela INSTRUTORES
DROP TABLE IF EXISTS INSTRUTORES;

-- Remover tabela ALUNOS
DROP TABLE IF EXISTS ALUNOS;

DROP DATABASE academia_saude;
