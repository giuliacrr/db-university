-- 1) Selezionare tutti gli studenti iscritti al corso di Laurea in Economia (68)
SELECT `students`.`name` as "Nome", `surname` as "Cognome", `degrees`.`name` as "Laurea"
FROM `students`
INNER JOIN `degrees`
ON `degrees`.`id` = `students`.`degree_id`
WHERE `degree_id` = 53;

-- 2) Selezionare tutti i corsi di Laurea Magistrale del Dipartimento di Neuroscienze (id dep neuroscienze 7) (1)
SELECT `degrees`.`name`, `departments`.`name`, `level`
FROM `degrees`
INNER JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`
WHERE `department_id` = 7
AND `level` = "magistrale";

-- 3) Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44) (11)
SELECT `teachers`.`name`,`teachers`.`surname`,`course_id`
FROM `course_teacher`
INNER JOIN `teachers`
ON `teachers`.`id` = `teacher_id`
WHERE `teacher_id` = 44;

-- 4) Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT `surname` as "cognome", `students`.`name` as "Nome", `degrees`.`name` as "Laurea", `departments`.`name` as "Dipartimento"
FROM `students`
INNER JOIN `degrees`
ON `degrees`.`id` = `students`.`degree_id`
INNER JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`
ORDER BY `surname`, `students`.`name`;


--5) Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT `degrees`.`name` as "degree" ,`courses`.`name` as "course name", `teachers`.`surname` as "teacher surname", `teachers`.`name` as "teacher name"
FROM `course_teacher`
INNER JOIN `teachers`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
INNER JOIN `courses`
ON `courses`.`id` = `course_teacher`.`course_id`
INNER JOIN `degrees`
ON `degrees`.`id`= `courses`.`degree_id`
ORDER BY `degrees`.`name`;

-- 6) Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (70)
-- 6) Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica
SELECT `surname` as "Cognome" ,`teachers`.`name` as "Nome", `departments`.`name` as "Dipartimento"
FROM `teachers`

INNER JOIN `course_teacher`
ON `course_teacher`.`teacher_id` = `teachers`.`id`

INNER JOIN `courses`
ON `courses`.`id` = `course_teacher`.`course_id`

INNER JOIN `degrees`
ON `degrees`.`id` = `courses`.`degree_id`

INNER JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`

WHERE `departments`.`id` = 5;

--7) BONUS: Selezionare per ogni studente il numero di tentativi sostenuti per ogni esame, stampando anche il voto massimo.
-- Successivamente, filtrare i tentativi con voto minimo 18.