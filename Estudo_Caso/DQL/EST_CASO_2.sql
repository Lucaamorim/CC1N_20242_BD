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

-- Criar tabela Voos
CREATE TABLE IF NOT EXISTS Voos (
    id_voo INT PRIMARY KEY AUTO_INCREMENT,
    origem VARCHAR(150) NOT NULL,
    destino VARCHAR(150) NOT NULL,
    horario_chegada DATETIME,
    horario_saida DATETIME
);

-- Criar tabela Aeroportos
CREATE TABLE IF NOT EXISTS Aeroportos (
    id_aeroporto INT PRIMARY KEY AUTO_INCREMENT,
    ponto_partida VARCHAR(150) NOT NULL,
    ponto_chegada VARCHAR(150) NOT NULL
);

-- Criar tabela Aeronaves
CREATE TABLE IF NOT EXISTS Aeronaves (
    id_aeronave INT PRIMARY KEY AUTO_INCREMENT
);

-- Criar tabela Funcionarios
CREATE TABLE IF NOT EXISTS Funcionarios (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome_piloto VARCHAR(30) NOT NULL,
    comissarios_abordo VARCHAR(150) NOT NULL,
    equipe_solo VARCHAR(150) NOT NULL
);

-- Criar tabela Reservas
CREATE TABLE IF NOT EXISTS Reservas (
    id_reserva INT PRIMARY KEY AUTO_INCREMENT,
    id_passageiros INT NOT NULL,
    id_voo INT NOT NULL
);
