/* Buscar os nomes de todos os alunos que frequentam alguma turma com o professor JOAO PEDRO.*/

SELECT a.nome
FROM aluno a
JOIN matricula m ON m.id_aluno = a.id_aluno
JOIN turma t ON t.id_turma = m.id_turma
JOIN disciplina d ON d.id_disciplina = t.id_disciplina
JOIN professor p ON p.id_professor = t.id_professor
WHERE p.nome = 'JOAO PEDRO';

/* Buscar os dias da semana que tenham aulas da disciplina MATEMATICA. */

SELECT DISTINCT h.dia_semana
FROM horario h
JOIN turma t ON t.id_turma = h.id_turma
JOIN disciplina d ON d.id_disciplina = t.id_disciplina
WHERE d.nome = 'MATEMATICA';

/* Buscar todos os alunos que frequentem aulas de MATEMATICA e também FISICA. */

SELECT a.nome
FROM aluno a
JOIN matricula m ON m.id_aluno = a.id_aluno
JOIN turma t ON t.id_turma = m.id_turma
JOIN disciplina d ON d.id_disciplina = t.id_disciplina
WHERE d.nome IN ('MATEMATICA', 'FISICA')
GROUP BY a.id_aluno
HAVING COUNT(DISTINCT d.nome) = 2;

/* Buscar todas disciplinas que não tenham nenhuma turma. */

SELECT d.nome
FROM disciplina d
LEFT JOIN turma t ON t.id_disciplina = d.id_disciplina
WHERE t.id_turma IS NULL;

/*Buscar os alunos que frequentem aulas de MATEMATICA exceto os que frequentem QUIMICA.*/

SELECT a.nome
FROM aluno a
JOIN matricula m ON m.id_aluno = a.id_aluno
JOIN turma t ON t.id_turma = m.id_turma
JOIN disciplina d ON d.id_disciplina = t.id_disciplina
WHERE d.nome = 'MATEMATICA' AND a.id_aluno NOT IN (
    SELECT a.id_aluno
    FROM aluno a
    JOIN matricula m ON m.id_aluno = a.id_aluno
    JOIN turma t ON t.id_turma = m.id_turma
    JOIN disciplina d ON d.id_disciplina = t.id_disciplina
    WHERE d.nome = 'QUIMICA'
);

