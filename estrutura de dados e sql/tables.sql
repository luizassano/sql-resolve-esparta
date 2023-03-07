-- Criação das tabelas

-- Tabela disciplina
CREATE TABLE IF NOT EXISTS disciplina(
    id BIGSERIAL PRIMARY KEY,
    nome VARCHAR(45) NOT NULL
);

-- Tabela aluno
CREATE TABLE IF NOT EXISTS aluno(
    id BIGSERIAL PRIMARY KEY,
    nome VARCHAR(45) NOT NULL
);

-- Tabela professor
CREATE TABLE IF NOT EXISTS professor(
    id BIGSERIAL PRIMARY KEY,
	nome VARCHAR(45) NOT NULL
);

-- Tabela turma
CREATE TABLE IF NOT EXISTS turma(
    id BIGSERIAL PRIMARY KEY,
    horario VARCHAR(45) NOT NULL,
    dia_da_semana INTEGER NOT NULL,
    disciplina_id INTEGER NOT NULL,
    FOREIGN KEY (disciplina_id) REFERENCES disciplina(id) ON DELETE CASCADE,
    professor_id INTEGER NOT NULL,
    FOREIGN KEY (professor_id) REFERENCES professor(id) ON DELETE CASCADE,
    aluno_id INTEGER NOT NULL,
    FOREIGN KEY (aluno_id) REFERENCES aluno(id) ON DELETE CASCADE
);

-- Tabela aluno-turma
CREATE TABLE IF NOT EXISTS aluno_turma(
    aluno_id INTEGER NOT NULL,
    FOREIGN KEY (aluno_id) REFERENCES aluno(id) ON DELETE CASCADE,
    turma_id INTEGER NOT NULL,
    FOREIGN KEY (turma_id) REFERENCES turma(id) ON DELETE CASCADE
);