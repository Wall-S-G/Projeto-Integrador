-- Criação do Bando de Dados
CREATE DATABASE escola;
-- selecionar o BD para uso
USE escola;

-- Criar tabela aluno
-- Armasena os dados dos estudantes
CREATE TABLE aluno (
	-- Indentificador único (chave primária)
	id_aluno INT auto_increment primary key,
    
    -- Nome completo do aluno (obrigatório)
    nome VARCHAR(100) NOT NULL,
    
    -- Data de nascimento do aluno
    data_nascimento DATE NOT NULL,
    
    -- CPF
    cpf VARCHAR(14) UNIQUE,
    
    -- Email  do aluno
    email VARCHAR(100) NOT NULL UNIQUE,
	
    -- Telefone para contato
    telefone VARCHAR(20) NOT NULL,
    
    -- Data da matricula
    matricula_date DATE NOT NULL,
    
    -- Matricula do aluno
    matricula INT NOT NULL
);

-- Tabela de professores
CREATE TABLE professores(
	-- Indentificador único do professor
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    
    -- Nome do professor
    nome VARCHAR(100) NOT NULL,
	
    -- Área de especialização
    especialização VARCHAR(100),
    
    -- Email do professor
    email VARCHAR(100) NOT NULL,
    
    -- Telefone de contato
    telefone VARCHAR(20)
);
-- Tabela de Cursos
-- Representa os cursos oferecidos pela escola
CREATE TABLE cursos(
	-- Indentificador único do curso
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    
    -- Nome do curso
    nome  VARCHAR(100) NOT NULL,
    
	-- Carga horária total do curso em horas
    carga_horaria INT NOT NULL
);