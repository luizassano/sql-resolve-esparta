/* Buscar os nomes de todos os alunos que frequentam alguma turma com o professor JOAO PEDRO.*/
SELECT a.nome
FROM aluno a 
JOIN aluno_turma ON aluno_turma.aluno_id = a.id
JOIN turma t ON t.id = aluno_turma.turma_id
JOIN professor p ON p.id = turma.professor_id
WHERE p.nome = 'JOAO PEDRO';

/* Buscar os dias da semana que tenham aulas da disciplina MATEMATICA. */
SELECT t.dia_da_semana
FROM turma t
JOIN disciplina d ON d.id = t.disciplina_id
WHERE d.nome = 'MATEMATICA';

/* Buscar todos os alunos que frequentem aulas de MATEMATICA e também FISICA. */
SELECT a.nome
FROM aluno a
JOIN turma t ON t.aluno_id = a.id
JOIN disciplina d ON d.id = t.disciplina_id
WHERE d.nome IN ('MATEMATICA', 'FISICA')
GROUP BY a.nome
HAVING COUNT(DISTINCT d.nome) = 2;

/* Buscar todas disciplinas que não tenham nenhuma turma. */
SELECT d.nome
FROM disciplina d
LEFT JOIN turma t ON t.disciplina_id = d.id
WHERE t.id IS NULL;

/*Buscar os alunos que frequentem aulas de MATEMATICA exceto os que frequentem QUIMICA.*/
SELECT a.nome
FROM aluno a
JOIN aluno_turma ON aluno_turma.aluno_id = a.id
JOIN turma t ON t.id = aluno_turma.turma_id
JOIN disciplina d ON d.id = t.disciplina_id
WHERE d.nome = 'MATEMATICA'
AND a.id NOT IN (
    SELECT a.id
    FROM aluno a
    JOIN aluno_turma ON aluno_turma.aluno_id = a.id
    JOIN turma t ON t.id = aluno_turma.turma_id
    JOIN disciplina d ON d.id = turma.disciplina_id
    WHERE d.nome = 'QUIMICA'
);