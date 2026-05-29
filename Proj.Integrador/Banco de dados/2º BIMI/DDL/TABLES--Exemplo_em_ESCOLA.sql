<<<<<<< HEAD
DROP TABLE IF EXISTS notas;
DROP TABLE IF EXISTS cursos_disciplinas;
DROP TABLE IF EXISTS turmas;
DROP TABLE IF EXISTS disciplinas;
DROP TABLE IF EXISTS alunos;
DROP TABLE IF EXISTS professores;
DROP TABLE IF EXISTS cursos;
	
-- Criação do Bando de Dados
CREATE DATABASE IF NOT EXISTS escola;
=======
-- Criação do Bando de Dados
CREATE DATABASE escola;
>>>>>>> 084c5280102a2fbdd64dddf85947d531dffcec7e
-- selecionar o BD para uso
USE escola;

-- Criar tabela aluno
-- Armasena os dados dos estudantes
<<<<<<< HEAD
CREATE TABLE alunos(
=======
CREATE TABLE aluno (
>>>>>>> 084c5280102a2fbdd64dddf85947d531dffcec7e
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

-- Tabela Turmas
-- Cada turma pertence a uma turma e um professor
CREATE TABLE turmas(
	-- Inentificador único
	id_turmas INT AUTO_INCREMENT PRIMARY KEY,

	-- FK para cursos (cada turma pertence a um curso)
	id_cursos INT NOT NULL,

	-- FK para professor (responsavel pela turma)
	id_professor INT NOT NULL,

	-- Ano da turma (ex.: 2026)
	ano INT NOT NULL,

	-- Série (1º, 2º, 3º ano)
	serie INT NOT NULL,

	-- Chave estrangeira -> cursos (1 curso tem várias turmas(1-n))
	FOREIGN KEY (id_cursos)
		REFERENCES cursos(id_curso)
		ON DELETE RESTRICT,
		-- RESTRICT impede apagar cursos com turmas vinculadas
	
    -- Chave estrangeira -> professor (1 professor tem várias turmas(1-n))
    FOREIGN KEY (id_professor)
		REFERENCES professores(id_professor)
        ON DELETE RESTRICT
        -- Impede excluir professor se ele estiver vinculado a uma turma
);
-- Tabela: disciplina
CREATE TABLE disciplinas(
	-- Indentificador da disciplina
    id_disciplina INT AUTO_INCREMENT PRIMARY KEY,
    
    -- Nome da disciplina
    nome VARCHAR(100) NOT NULL,
    
    -- Carga horária da disciplina
    carga_horaria INT NOT NULL
);

-- Tabela: curso_disciplinas
-- Relácionamentos N:N entre cursos e disciplinas
CREATE TABLE cursos_disciplinas(
	-- FK para curso
    id_curso INT NOT NULL,
    
    -- FK para disciplina
    id_disciplina INT NOT NULL,
    
    -- Chave primária composta (evita duplicidade)
    PRIMARY KEY (id_curso, id_disciplina),
    
    -- FK -> cursos
    FOREIGN KEY(id_curso)
		REFERENCES cursos(id_curso)
		ON DELETE CASCADE,
        -- CASCADE: Ao excluir curso, remove automaticamente relações
	
    -- FK -> disciplinas
    FOREIGN KEY(id_disciplina)
		REFERENCES disciplinas(id_disciplina)
		ON DELETE CASCADE
        -- CASCADE: Ao excluir disciplina, remove automaticamente relações
);

-- Tabela: notas
-- Armazena notas dos alunos por disciplinas
CREATE TABLE notas(
	-- Indentificador único
    id_nota INT AUTO_INCREMENT PRIMARY KEY,
    
    -- FK para aluno
    id_aluno INT NOT NULL,
    
    -- FK para disciplina
    id_disciplina INT NOT NULL,
    
    -- Nota (ex.: 7.5)
    nota DECIMAL(5,2),
	
	-- FK -> alunos (1 aluno pode ter várias notas)
    FOREIGN KEY(id_aluno)
		REFERENCES alunos(id_aluno)
        ON DELETE CASCADE,
        -- CASCADE: Ao excluir o aluno, suas notas também são excluidas
        
	-- FK -> disciplinas (1 disciplina pode conter vários alunos)
    FOREIGN KEY(id_disciplina)
		REFERENCES disciplinas(id_disciplina)
		ON DELETE RESTRICT,
        -- RESTRICT: Impede de excluir disciplina com notas cadastradas

	-- Garante que o aluno tenha apenas uma nota por disciplina
    UNIQUE (id_aluno, id_disciplina)
);

-- ALTER TABLE (Adição da FK ALUNOS -> Turmas)

-- 1. Adicionar a coluna id_turma na tabela alunos
-- Essa coluna irá armazenar a eférencia da turma do aluno
ALTER TABLE alunos
ADD COLUMN id_turma INT;

-- 2. Tornar a coluna obrigatória (NOT NULL)
-- Garante que todo aluno esteja vinculado a sua turma
ALTER TABLE alunos
ADD COLUMN id_turma INT NOT NULL;

-- 3. Cria chave estrangeira (relacionamento)
ALTER TABLE alunos
ADD CONSTRAINT fk_aluno_turmas
FOREIGN KEY (id_turma)
REFERENCES turmas(id_turmas)
ON DELETE RESTRICT;

-- EXPLICAÇÃO
-- A chave estrangeira garante que:
-- 1: Todo aluno deve estar vinculado a uma turma existente
-- 2: Não é possivel inserir um aluno comuma turma inexistente
-- 3; Não é possivel excluir uma turma que possua alunos vinculados (RESTRICT)
