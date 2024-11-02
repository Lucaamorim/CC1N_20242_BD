CREATE DATABASE flyhigh_airlines;
USE flyhigh_airlines;

-- Criar tabela Passageiros
CREATE TABLE IF NOT EXISTS Passageiros (
    id_passageiros INT PRIMARY KEY AUTO_INCREMENT,
    nome_passag VARCHAR(150) NOT NULL,
    cpf_passag VARCHAR(20) NOT NULL UNIQUE,
    tel_passag VARCHAR(12) NOT NULL,
    endereco_passag VARCHAR(150) NOT NULL
);

-- Comandos DDL Passageiros
-- Criar Index
CREATE INDEX idx_cpf_passag ON Passageiros (cpf_passag);

-- Criar View
CREATE VIEW vista_passageiros AS
SELECT nome_passag, cpf_passag, tel_passag
FROM Passageiros;

-- Comando Alter ADD
ALTER TABLE Passageiros ADD email_passag VARCHAR(100);

-- Comando Alter MODIFY COLUMN 
ALTER TABLE Passageiros MODIFY COLUMN email_passag VARCHAR(150);

-- Comando Alter CHANGE COLUMN
ALTER TABLE Passageiros CHANGE COLUMN email_passag email_completo VARCHAR(150);

-- Comando Alter ADD INDEX
ALTER TABLE Passageiros ADD INDEX idx_email (email_completo);

-- Remover Índice:
DROP INDEX idx_email ON Passageiros;

-- Remover Visão:
DROP VIEW vista_passageiros;

-- Remover dados
TRUNCATE TABLE Passageiros;

-- Alterar nome da tabela
RENAME TABLE Passageiros TO PassageirosAntigos;
RENAME TABLE PassageirosAntigos TO Passageiros;

-- Comentários na tabela
ALTER TABLE Passageiros COMMENT = 'Tabela de informações dos Passageiros';

-- Adicionar Comentário a Coluna:
ALTER TABLE Passageiros MODIFY email_completo VARCHAR(150) COMMENT 'Email do passageiro';

-- Comando Alter DROP COLUMN
ALTER TABLE Passageiros DROP COLUMN email_completo;

-- Criar tabela Voos
CREATE TABLE IF NOT EXISTS Voos (
    id_voo INT PRIMARY KEY AUTO_INCREMENT,
    origem VARCHAR(150) NOT NULL,
    destino VARCHAR(150) NOT NULL,
    horario_chegada DATETIME,
    horario_saida DATETIME
);

-- Comandos DDL Voos
-- Criar Index
CREATE INDEX idx_origem_destino ON Voos (origem, destino);

-- Criar View
CREATE VIEW vista_voos AS
SELECT origem, destino, horario_chegada, horario_saida
FROM Voos;

-- Comando Alter ADD
ALTER TABLE Voos ADD companhia_aerea VARCHAR(100);

-- Comando Alter MODIFY COLUMN 
ALTER TABLE Voos MODIFY COLUMN companhia_aerea VARCHAR(150);

-- Comando Alter CHANGE COLUMN
ALTER TABLE Voos CHANGE COLUMN companhia_aerea companhia_aerea_completa VARCHAR(150);

-- Comando Alter ADD INDEX
ALTER TABLE Voos ADD INDEX idx_companhia_aerea (companhia_aerea_completa);

-- Remover Índice:
DROP INDEX idx_companhia_aerea ON Voos;

-- Remover Visão:
DROP VIEW vista_voos;

-- Remover dados
TRUNCATE TABLE Voos;

-- Alterar nome da tabela
RENAME TABLE Voos TO VoosAntigos;
RENAME TABLE VoosAntigos TO Voos;

-- Comentários na tabela
ALTER TABLE Voos COMMENT = 'Tabela de informações dos Voos';

-- Adicionar Comentário a Coluna:
ALTER TABLE Voos MODIFY companhia_aerea_completa VARCHAR(150) COMMENT 'Nome da companhia aérea que opera o voo';

-- Comando Alter DROP COLUMN
ALTER TABLE Voos DROP COLUMN companhia_aerea_completa;

-- Criar tabela Aeroportos
CREATE TABLE IF NOT EXISTS Aeroportos (
    id_aeroporto INT PRIMARY KEY AUTO_INCREMENT,
    ponto_partida VARCHAR(150) NOT NULL,
    ponto_chegada VARCHAR(150) NOT NULL
);

-- Comandos DDL Aeroportos
-- Criar Index
CREATE INDEX idx_ponto_partida_chegada ON Aeroportos (ponto_partida, ponto_chegada);

-- Criar View
CREATE VIEW vista_aeroportos AS
SELECT ponto_partida, ponto_chegada
FROM Aeroportos;

-- Comando Alter ADD
ALTER TABLE Aeroportos ADD codigo_aeroporto VARCHAR(10);

-- Comando Alter MODIFY COLUMN 
ALTER TABLE Aeroportos MODIFY COLUMN codigo_aeroporto VARCHAR(15);

-- Comando Alter CHANGE COLUMN
ALTER TABLE Aeroportos CHANGE COLUMN codigo_aeroporto codigo_aeroporto_completo VARCHAR(15);

-- Comando Alter ADD INDEX
ALTER TABLE Aeroportos ADD INDEX idx_codigo_aeroporto (codigo_aeroporto_completo);

-- Remover Índice:
DROP INDEX idx_codigo_aeroporto ON Aeroportos;

-- Remover Visão:
DROP VIEW vista_aeroportos;

-- Remover dados
TRUNCATE TABLE Aeroportos;

-- Alterar nome da tabela
RENAME TABLE Aeroportos TO AeroportosAntigos;
RENAME TABLE AeroportosAntigos TO Aeroportos;

-- Comentários na tabela
ALTER TABLE Aeroportos COMMENT = 'Tabela de informações dos Aeroportos';

-- Adicionar Comentário a Coluna:
ALTER TABLE Aeroportos MODIFY codigo_aeroporto_completo VARCHAR(15) COMMENT 'Código do aeroporto';

-- Comando Alter DROP COLUMN
ALTER TABLE Aeroportos DROP COLUMN codigo_aeroporto_completo;

-- Criar tabela Aeronaves
CREATE TABLE IF NOT EXISTS Aeronaves (
    id_aeronave INT PRIMARY KEY AUTO_INCREMENT
);

-- Comandos DDL Aeronaves
-- Criar Index
CREATE INDEX idx_id_aeronave ON Aeronaves (id_aeronave);

-- Criar View
CREATE VIEW vista_aeronaves AS
SELECT id_aeronave
FROM Aeronaves;

-- Comando Alter ADD
ALTER TABLE Aeronaves ADD modelo VARCHAR(50);

-- Comando Alter MODIFY COLUMN 
ALTER TABLE Aeronaves MODIFY COLUMN modelo VARCHAR(75);

-- Comando Alter CHANGE COLUMN
ALTER TABLE Aeronaves CHANGE COLUMN modelo modelo_completo VARCHAR(75);

-- Comando Alter ADD INDEX
ALTER TABLE Aeronaves ADD INDEX idx_modelo (modelo_completo);

-- Remover Índice:
DROP INDEX idx_modelo ON Aeronaves;

-- Remover Visão:
DROP VIEW vista_aeronaves;

-- Remover dados
TRUNCATE TABLE Aeronaves;

-- Alterar nome da tabela
RENAME TABLE Aeronaves TO AeronavesAntigas;
RENAME TABLE AeronavesAntigas TO Aeronaves;

-- Comentários na tabela
ALTER TABLE Aeronaves COMMENT = 'Tabela de informações das Aeronaves';

-- Adicionar Comentário a Coluna:
ALTER TABLE Aeronaves MODIFY modelo_completo VARCHAR(75) COMMENT 'Modelo da aeronave';

-- Comando Alter DROP COLUMN
ALTER TABLE Aeronaves DROP COLUMN modelo_completo;

-- Criar tabela Funcionarios
CREATE TABLE IF NOT EXISTS Funcionarios (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome_piloto VARCHAR(30) NOT NULL,
    comissarios_abordo VARCHAR(150) NOT NULL,
    equipe_solo VARCHAR(150) NOT NULL
);

-- Comandos DDL Funcionarios
-- Criar Index
CREATE INDEX idx_nome_piloto ON Funcionarios (nome_piloto);

-- Criar View
CREATE VIEW vista_funcionarios AS
SELECT nome_piloto, comissarios_abordo, equipe_solo
FROM Funcionarios;

-- Comando Alter ADD
ALTER TABLE Funcionarios ADD tipo_funcionario VARCHAR(20);

-- Comando Alter MODIFY COLUMN 
ALTER TABLE Funcionarios MODIFY COLUMN tipo_funcionario VARCHAR(30);

-- Comando Alter CHANGE COLUMN
ALTER TABLE Funcionarios CHANGE COLUMN tipo_funcionario tipo_funcionario_completo VARCHAR(30);

-- Comando Alter ADD INDEX
ALTER TABLE Funcionarios ADD INDEX idx_tipo_funcionario (tipo_funcionario_completo);

-- Remover Índice:
DROP INDEX idx_tipo_funcionario ON Funcionarios;

-- Remover Visão:
DROP VIEW vista_funcionarios;

-- Remover dados
TRUNCATE TABLE Funcionarios;

-- Alterar nome da tabela
RENAME TABLE Funcionarios TO FuncionariosAntigos;
RENAME TABLE FuncionariosAntigos TO Funcionarios;

-- Comentários na tabela
ALTER TABLE Funcionarios COMMENT = 'Tabela de informações dos Funcionários';

-- Adicionar Comentário a Coluna:
ALTER TABLE Funcionarios MODIFY tipo_funcionario_completo VARCHAR(30) COMMENT 'Tipo de funcionário (piloto, comissário, etc.)';

-- Comando Alter DROP COLUMN
ALTER TABLE Funcionarios DROP COLUMN tipo_funcionario_completo;

-- Criar tabela Reservas
CREATE TABLE IF NOT EXISTS Reservas (
    id_reserva INT PRIMARY KEY AUTO_INCREMENT,
    id_passageiros INT NOT NULL,
    id_voo INT NOT NULL
);

-- Comandos DDL Reservas
-- Criar Index
CREATE INDEX idx_id_passageiros_voo ON Reservas (id_passageiros, id_voo);

-- Criar View
CREATE VIEW vista_reservas AS
SELECT id_reserva, id_passageiros, id_voo
FROM Reservas;

-- Comando Alter ADD
ALTER TABLE Reservas ADD status_reserva VARCHAR(20);

-- Comando Alter MODIFY COLUMN 
ALTER TABLE Reservas MODIFY COLUMN status_reserva VARCHAR(30);

-- Comando Alter CHANGE COLUMN
ALTER TABLE Reservas CHANGE COLUMN status_reserva status_reserva_completo VARCHAR(30);

-- Comando Alter ADD INDEX
ALTER TABLE Reservas ADD INDEX idx_status_reserva (status_reserva_completo);

-- Remover Índice:
DROP INDEX idx_status_reserva ON Reservas;

-- Remover Visão:
DROP VIEW vista_reservas;

-- Remover dados
TRUNCATE TABLE Reservas;

-- Alterar nome da tabela
RENAME TABLE Reservas TO ReservasAntigas;
RENAME TABLE ReservasAntigas TO Reservas;

-- Comentários na tabela
ALTER TABLE Reservas COMMENT = 'Tabela de informações das Reservas';

-- Adicionar Comentário a Coluna:
ALTER TABLE Reservas MODIFY status_reserva_completo VARCHAR(30) COMMENT 'Status da reserva (confirmada, cancelada, etc.)';

-- Comando Alter DROP COLUMN
ALTER TABLE Reservas DROP COLUMN status_reserva_completo;

DROP TABLE IF EXISTS Reservas;
DROP TABLE IF EXISTS Funcionarios;
DROP TABLE IF EXISTS Aeronaves;
DROP TABLE IF EXISTS Aeroportos;
DROP TABLE IF EXISTS Voos;
DROP TABLE IF EXISTS Passageiros;

DROP DATABASE IF EXISTS flyhigh_airlines;
