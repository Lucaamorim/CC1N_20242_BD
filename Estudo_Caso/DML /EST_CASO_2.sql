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

-- Inserir Passageiros
INSERT INTO Passageiros (nome_passag, cpf_passag, tel_passag, endereco_passag)
VALUES ('João da Silva', '123.456.789-10', '(27)99999-8888', 'Rua das Flores, 123');

INSERT INTO Passageiros (nome_passag, cpf_passag, tel_passag, endereco_passag)
VALUES ('Maria Oliveira', '987.654.321-00', '(27)98888-7777', 'Avenida Central, 456');

INSERT INTO Passageiros (nome_passag, cpf_passag, tel_passag, endereco_passag)
VALUES ('Carlos Pereira', '456.789.123-12', '(27)97777-6666', 'Praça do Sol, 789');

-- Atualizar telefone de Passageiros
UPDATE Passageiros
SET tel_passag = '(27)99999-0000'
WHERE nome_passag = 'João da Silva';

UPDATE Passageiros
SET tel_passag = '(27)98888-1111'
WHERE nome_passag = 'Maria Oliveira';

-- Deletar Passageiro
DELETE FROM Passageiros
WHERE cpf_passag = '456.789.123-12';


-- Criar tabela Voos
CREATE TABLE IF NOT EXISTS Voos (
    id_voo INT PRIMARY KEY AUTO_INCREMENT,
    origem VARCHAR(150) NOT NULL,
    destino VARCHAR(150) NOT NULL,
    horario_chegada DATETIME,
    horario_saida DATETIME
);

-- Inserir Voos
INSERT INTO Voos (origem, destino, horario_chegada, horario_saida)
VALUES ('São Paulo', 'Rio de Janeiro', '2024-11-20 14:00:00', '2024-11-20 12:00:00');

INSERT INTO Voos (origem, destino, horario_chegada, horario_saida)
VALUES ('Belo Horizonte', 'Recife', '2024-11-21 18:00:00', '2024-11-21 15:30:00');

INSERT INTO Voos (origem, destino, horario_chegada, horario_saida)
VALUES ('Curitiba', 'Salvador', '2024-11-22 22:00:00', '2024-11-22 19:00:00');

-- Atualizar horário de chegada
UPDATE Voos
SET horario_chegada = '2024-11-20 15:00:00'
WHERE origem = 'São Paulo' AND destino = 'Rio de Janeiro';

UPDATE Voos
SET horario_chegada = '2024-11-21 19:00:00'
WHERE origem = 'Belo Horizonte' AND destino = 'Recife';

-- Deletar Voo
DELETE FROM Voos
WHERE origem = 'Curitiba' AND destino = 'Salvador';


-- Criar tabela Aeroportos
CREATE TABLE IF NOT EXISTS Aeroportos (
    id_aeroporto INT PRIMARY KEY AUTO_INCREMENT,
    ponto_partida VARCHAR(150) NOT NULL,
    ponto_chegada VARCHAR(150) NOT NULL
);

-- Inserir Aeroportos
INSERT INTO Aeroportos (ponto_partida, ponto_chegada)
VALUES ('São Paulo', 'Rio de Janeiro');

INSERT INTO Aeroportos (ponto_partida, ponto_chegada)
VALUES ('Belo Horizonte', 'Recife');

INSERT INTO Aeroportos (ponto_partida, ponto_chegada)
VALUES ('Curitiba', 'Salvador');

-- Atualizar ponto de partida
UPDATE Aeroportos
SET ponto_partida = 'Brasília'
WHERE ponto_partida = 'Curitiba';

UPDATE Aeroportos
SET ponto_chegada = 'Fortaleza'
WHERE ponto_partida = 'Belo Horizonte';

-- Deletar Aeroporto
DELETE FROM Aeroportos
WHERE ponto_partida = 'São Paulo';


-- Criar tabela Aeronaves
CREATE TABLE IF NOT EXISTS Aeronaves (
    id_aeronave INT PRIMARY KEY AUTO_INCREMENT,
    nome_aero VARCHAR (255)
);

-- Inserir Aeronaves
INSERT INTO Aeronaves (nome_aero) VALUES ("space 1");
INSERT INTO Aeronaves (nome_aero) VALUES ("space 2");
INSERT INTO Aeronaves (nome_aero) VALUES ("space 3");

UPDATE Aeronaves SET nome_aero = "space 11" WHERE id_aeronave = 1;
UPDATE Aeronaves SET nome_aero = "space 12" WHERE id_aeronave = 2;

DELETE FROM Aeronaves WHERE nome_aero = "space 3";

-- Criar tabela Funcionarios
CREATE TABLE IF NOT EXISTS Funcionarios (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome_piloto VARCHAR(30) NOT NULL,
    comissarios_abordo VARCHAR(150) NOT NULL,
    equipe_solo VARCHAR(150) NOT NULL
);

-- Inserir Funcionários
INSERT INTO Funcionarios (nome_piloto, comissarios_abordo, equipe_solo)
VALUES ('José Santos', 'Maria, Ana, Paulo', 'Equipe A');

INSERT INTO Funcionarios (nome_piloto, comissarios_abordo, equipe_solo)
VALUES ('Pedro Lima', 'Joana, Carlos, Júlia', 'Equipe B');

INSERT INTO Funcionarios (nome_piloto, comissarios_abordo, equipe_solo)
VALUES ('Fernanda Ribeiro', 'Marcos, Lúcia, Tiago', 'Equipe C');

-- Atualizar equipe de solo
UPDATE Funcionarios
SET equipe_solo = 'Equipe D'
WHERE nome_piloto = 'José Santos';

UPDATE Funcionarios
SET equipe_solo = 'Equipe E'
WHERE nome_piloto = 'Pedro Lima';

-- Deletar Funcionário
DELETE FROM Funcionarios
WHERE nome_piloto = 'Fernanda Ribeiro';


-- Criar tabela Reservas
CREATE TABLE IF NOT EXISTS Reservas (
    id_reserva INT PRIMARY KEY AUTO_INCREMENT,
    id_passageiros INT NOT NULL,
    id_voo INT NOT NULL
);

-- Inserir Reservas
INSERT INTO Reservas (id_passageiros, id_voo)
VALUES (1, 1);

INSERT INTO Reservas (id_passageiros, id_voo)
VALUES (2, 2);

INSERT INTO Reservas (id_passageiros, id_voo)
VALUES (3, 3);

-- Atualizar reserva
UPDATE Reservas
SET id_voo = 2
WHERE id_reserva = 1;

UPDATE Reservas
SET id_voo = 3
WHERE id_reserva = 2;

-- Deletar Reserva
DELETE FROM Reservas
WHERE id_reserva = 3;
DROP DATABASE flyhigh_airlines;

