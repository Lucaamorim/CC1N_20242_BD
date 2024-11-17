CREATE DATABASE escola_fitness;
USE escola_fitness;

-- Criar tabela ALUNOS
CREATE TABLE IF NOT EXISTS ALUNOS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    endereco VARCHAR(255) NOT NULL
);

-- Inserir dados na tabela ALUNOS
INSERT INTO ALUNOS (nome, cpf, data_nascimento, endereco)
VALUES ('Carlos Silva', '12345678901', '1990-05-15', 'Rua A, 123'),
       ('Juliana Costa', '98765432100', '1988-02-25', 'Rua B, 456'),
       ('Rafael Lima', '45678912345', '1992-08-10', 'Rua C, 789'),
       ('Lucas Amorim', '15162689765', '1999-08-12', 'Rua D, 78');
       
-- Atualizar dados na tabela ALUNOS
UPDATE ALUNOS SET endereco = 'Rua D, 101' WHERE id = 1;
UPDATE ALUNOS SET endereco = 'Rua S, 101' WHERE id = 2;
-- Deletar dados da tabela ALUNOS
DELETE FROM ALUNOS WHERE id = 4;

-- Criar tabela INSTRUTORES
CREATE TABLE IF NOT EXISTS INSTRUTORES (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    especialidade VARCHAR(50)
);

-- Inserir dados na tabela INSTRUTORES
INSERT INTO INSTRUTORES (nome, cpf, especialidade)
VALUES ('Fernanda Oliveira', '12312312312', 'Musculação'),
       ('Lucas Pereira', '32132132132', 'Yoga'),
       ('Mariana Souza', '11122233344', 'Pilates'),
        ('Izabella Bins', '11332233344', 'tikTok');
-- Atualizar dados na tabela INSTRUTORES

UPDATE INSTRUTORES SET especialidade = 'Crossfit' WHERE id = 2;
UPDATE INSTRUTORES SET especialidade = 'tikTok' WHERE id = 3;

-- Deletar dados na tabela INSTRUTORES
DELETE FROM INSTRUTORES WHERE id = 4;

-- Criar tabela MODALIDADES
CREATE TABLE IF NOT EXISTS MODALIDADES (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT,
    capacidade INT NOT NULL
);

-- Inserir dados na tabela MODALIDADES
INSERT INTO MODALIDADES (nome, descricao, capacidade)
VALUES ('Musculação', 'Treinamento de força', 20),
       ('Yoga', 'Práticas de alongamento e meditação', 15),
       ('Pilates', 'Exercícios para o fortalecimento do core', 10);
-- Atualizar dados na tabela MODALIDADES
UPDATE MODALIDADES SET capacidade = 25 WHERE id = 1;
UPDATE MODALIDADES SET capacidade = 20 WHERE id = 2;
-- Deletar dados na tabela MODALIDADES
DELETE FROM MODALIDADES WHERE id = 3;

-- Criar tabela PLANOS_TREINAMENTO
CREATE TABLE IF NOT EXISTS PLANOS_TREINAMENTO (
    id INT PRIMARY KEY AUTO_INCREMENT,
    aluno_id INT,
    instrutor_id INT,
    data_criacao DATE NOT NULL,
    data_atualizacao DATE,
    FOREIGN KEY (aluno_id) REFERENCES ALUNOS(id),
    FOREIGN KEY (instrutor_id) REFERENCES INSTRUTORES(id)
);

-- Inserir dados na tabela PLANOS_TREINAMENTO
INSERT INTO PLANOS_TREINAMENTO (aluno_id, instrutor_id, data_criacao, data_atualizacao)
VALUES (1, 1, '2024-01-10', '2024-01-15'),
       (2, 2, '2024-02-01', '2024-02-10'),
       (2, 3, '2024-02-01', '2024-02-10');
       
-- Atualizar dados na tabela PLANOS_TREINAMENTO
UPDATE PLANOS_TREINAMENTO SET data_atualizacao = '2024-02-20' WHERE id = 1;
UPDATE PLANOS_TREINAMENTO SET data_atualizacao = '2024-02-20' WHERE id = 2;
-- Deletar dados na tabela PLANOS_TREINAMENTO
DELETE FROM PLANOS_TREINAMENTO WHERE id = 2;

-- Criar tabela AULAS
CREATE TABLE IF NOT EXISTS AULAS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    modalidade_id INT,
    instrutor_id INT,
    horario TIME NOT NULL,
    data DATE NOT NULL,
    capacidade INT NOT NULL,
    FOREIGN KEY (modalidade_id) REFERENCES MODALIDADES(id),
    FOREIGN KEY (instrutor_id) REFERENCES INSTRUTORES(id)
);

-- Inserir dados na tabela AULAS
INSERT INTO AULAS (modalidade_id, instrutor_id, horario, data, capacidade)
VALUES (1, 1, '08:00:00', '2024-01-12', 20),
       (2, 2, '10:00:00', '2024-02-15', 15),
       (2, 3, '10:00:00', '2024-02-15', 15);
-- Atualizar dados na tabela AULAS
UPDATE AULAS SET horario = '09:00:00' WHERE id = 1;
UPDATE AULAS SET horario = '10:00:00' WHERE id = 2;
-- Deletar dados na tabela AULAS
DELETE FROM AULAS WHERE id = 3;

-- Criar tabela ALUNOS_MODALIDADES
CREATE TABLE IF NOT EXISTS ALUNOS_MODALIDADES (
    aluno_id INT,
    modalidade_id INT,
    PRIMARY KEY (aluno_id, modalidade_id),
    FOREIGN KEY (aluno_id) REFERENCES ALUNOS(id),
    FOREIGN KEY (modalidade_id) REFERENCES MODALIDADES(id)
);

-- Inserir dados na tabela ALUNOS_MODALIDADES
INSERT INTO ALUNOS_MODALIDADES (aluno_id, modalidade_id)
VALUES (1, 1),
       (2, 2),
       (1, 2);
-- Atualizar dados na tabela ALUNOS_MODALIDADES
UPDATE ALUNOS_MODALIDADES SET modalidade_id = 1 WHERE aluno_id = 2;
UPDATE ALUNOS_MODALIDADES SET modalidade_id = 1 WHERE aluno_id = 2;

-- Deletar dados na tabela ALUNOS_MODALIDADES
DELETE FROM ALUNOS_MODALIDADES WHERE aluno_id = 1 AND modalidade_id = 2;

-- Criar tabela PAGAMENTOS
CREATE TABLE IF NOT EXISTS PAGAMENTOS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    aluno_id INT,
    data_pagamento DATE NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    status ENUM('pago', 'pendente') NOT NULL,
    FOREIGN KEY (aluno_id) REFERENCES ALUNOS(id)
);

-- Inserir dados na tabela PAGAMENTOS
INSERT INTO PAGAMENTOS (aluno_id, data_pagamento, valor, status)
VALUES (1, '2024-01-15', 150.00, 'pago'),
       (2, '2024-02-10', 180.00, 'pendente'),
       (3, '2024-02-10', 130.00, 'pendente');
-- Atualizar dados na tabela PAGAMENTOS
UPDATE PAGAMENTOS SET status = 'pago' WHERE id = 2;
UPDATE PAGAMENTOS SET status = 'pago' WHERE id = 3;
-- Deletar dados na tabela PAGAMENTOS
DELETE FROM PAGAMENTOS WHERE id = 1;

DROP DATABASE escola_fitness;

