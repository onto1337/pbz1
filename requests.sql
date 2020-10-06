/*ЗАДАНИЕ 1*/

/*1.1*/ SELECT * FROM teachers;

/*1.2*/ SELECT * FROM students_group WHERE speciality='ЭВМ';

/*1.3*/ SELECT teacher_id, clASsroom_id FROM teacher_teaches_subjects_in_groups WHERE subject_id='18П';

/*1.4*/ SELECT DISTINCT teacher_teaches_subjects_in_groups.subject_id,    subjects.subject_name 
FROM teacher_teaches_subjects_in_groups 
JOIN teachers ON teachers.id=teacher_teaches_subjects_in_groups.teacher_id
JOIN subjects ON subjects.id=teacher_teaches_subjects_in_groups.subject_id
WHERE teachers.sername='Костин';

/*1.5*/ SELECT group_id FROM teacher_teaches_subjects_in_groups
JOIN teachers ON teachers.id=teacher_teaches_subjects_in_groups.teacher_id
WHERE sername='Фролов';

/*1.6*/ SELECT * FROM subjects WHERE speciality='АСОИ';

/*1.7*/ SELECT * FROM teachers WHERE speciality LIKE 'АСОИ%';

/*1.8*/ SELECT DISTINCT sername FROM teachers JOIN teacher_teaches_subjects_in_groups ON id=teacher_id
WHERE clASsroom_id=210;

/*1.9*/ SELECT DISTINCT subjects.subject_name, students_group.group_name FROM subjects 
JOIN teacher_teaches_subjects_in_groups ON teacher_teaches_subjects_in_groups.subject_id=subjects.id
JOIN students_group ON students_group.id=teacher_teaches_subjects_in_groups.group_id
WHERE clASsroom_id BETWEEN 100 AND 200;

/*1.10*/ SELECT DISTINCT s1.id AS '1' , s2.id AS '2'
FROM students_group AS s1 JOIN students_group AS s2 
ON s1.id != s2.id WHERE
 (s1.speciality  = s2.speciality AND s1.id  < s2.id);

/*1.11*/ SELECT  sum(number_of_people) FROM students_group WHERE speciality='ЭВМ';

/*1.12*/ SELECT  id FROM teachers WHERE speciality LIKE '%ЭВМ';

/*1.20*/ SELECT DISTINCT  teacher_id FROM teacher_teaches_subjects_in_groups 
    JOIN teachers ON teachers.id=teacher_teaches_subjects_in_groups.teacher_id
    JOIN students_group ON students_group.id=teacher_teaches_subjects_in_groups.group_id
    WHERE teachers.department='ЭВМ' AND students_group.speciality= ANY (SELECT teachers.speciality FROM teachers);

/*1.14*/ SELECT DISTINCT sername FROM teachers
JOIN teacher_teaches_subjects_in_groups ON teacher_teaches_subjects_in_groups.teacher_id=teachers.id
WHERE subject_id in (SELECT DISTINCT id FROM subjects
JOIN teacher_teaches_subjects_in_groups ON teacher_teaches_subjects_in_groups.subject_id=subjects.id
WHERE teacher_id= (SELECT DISTINCT teacher_id FROM teacher_teaches_subjects_in_groups WHERE subject_id='14п')
);

/*1.15*/ SELECT DISTINCT * FROM subjects
WHERE subjects.id  not in( SELECT DISTINCT subject_id FROM teacher_teaches_subjects_in_groups 
WHERE teacher_id='221Л') ;

/*1.16*/ SELECT DISTINCT * FROM subjects 
    WHERE subjects.id not in (SELECT DISTINCT teacher_teaches_subjects_in_groups.subject_id FROM teacher_teaches_subjects_in_groups 
    JOIN students_group ON students_group.id=teacher_teaches_subjects_in_groups.group_id 
    WHERE students_group.group_name='М-6');

/*1.17*/ SELECT DISTINCT * FROM teachers
    JOIN teacher_teaches_subjects_in_groups ON teacher_teaches_subjects_in_groups.teacher_id=teachers.id
    WHERE (teachers.positiON='Доцент' AND teacher_teaches_subjects_in_groups.group_id in ('3Г','8Г'));

/*1.18*/ SELECT DISTINCT subject_id, teacher_id, group_id FROM teacher_teaches_subjects_in_groups 
    JOIN teachers ON teachers.id=teacher_teaches_subjects_in_groups.teacher_id
    WHERE (teachers.department='ЭВМ' AND teachers.speciality LIKE 'АСОИ%');

/*1.19*/ SELECT DISTINCT  group_id FROM teacher_teaches_subjects_in_groups 
    JOIN teachers ON teachers.id=teacher_teaches_subjects_in_groups.teacher_id
    JOIN students_group ON students_group.id=teacher_teaches_subjects_in_groups.group_id
    WHERE students_group.speciality= ANY (SELECT teachers.speciality FROM teachers);

/*1.20*/ SELECT DISTINCT  teacher_id FROM teacher_teaches_subjects_in_groups 
    JOIN teachers ON teachers.id=teacher_teaches_subjects_in_groups.teacher_id
    JOIN students_group ON students_group.id=teacher_teaches_subjects_in_groups.group_id
    WHERE teachers.department='ЭВМ' AND students_group.speciality= ANY (SELECT teachers.speciality FROM teachers);

/*1.21*/ SELECT DISTINCT students_group.speciality FROM students_group
    JOIN teacher_teaches_subjects_in_groups ON teacher_teaches_subjects_in_groups.group_id=students_group.id
    JOIN teachers ON teachers.id=teacher_teaches_subjects_in_groups.teacher_id
    WHERE teachers.department='АСУ';

/*1.22*/ SELECT DISTINCT subject_id FROM teacher_teaches_subjects_in_groups
    JOIN students_group ON students_group.id=teacher_teaches_subjects_in_groups.group_id
    WHERE students_group.group_name='АС-8';

/*1.23*/ SELECT DISTINCT group_id FROM teacher_teaches_subjects_in_groups
    WHERE subject_id  IN (SELECT DISTINCT subject_id FROM teacher_teaches_subjects_in_groups
    JOIN students_group ON students_group.id=teacher_teaches_subjects_in_groups.group_id
    WHERE students_group.group_name='АС-8');

/*1.24*/ SELECT DISTINCT group_id FROM teacher_teaches_subjects_in_groups
    WHERE subject_id NOT IN (SELECT DISTINCT subject_id FROM teacher_teaches_subjects_in_groups
    JOIN students_group ON students_group.id=teacher_teaches_subjects_in_groups.group_id
    WHERE students_group.group_name='АС-8');
/*1.25*/ SELECT DISTINCT group_id 
FROM teacher_teaches_subjects_in_groups WHERE subject_id NOT IN(SELECT DISTINCT  subject_id
FROM teacher_teaches_subjects_in_groups WHERE teacher_id = '430Л');

/*1.26*/ SELECT DISTINCT teacher_id FROM teacher_teaches_subjects_in_groups
WHERE subject_id != '12П' AND group_id = (SELECT DISTINCT id FROM students_group WHERE group_name='Э-15');

/*ЗАДАНИЕ 2 4 ВАРИАНТ*/

/*2.*/ SELECT * FROM j WHERE j.city = 'Лондон';

/*4.*/ SELECT * FROM SPG where SPG.s >= 300 and s <= 750;

/*8.*/ SELECT DISTINCT suppliersId, detailId, projectId FROM SPG
JOIN S ON S.id=SPG.suppliersId
JOIN P ON P.id=SPG.detailId
JOIN J ON J.id=SPG.projectId
WHERE S.city!=P.city AND S.city!=J.city AND P.city!=J.city;

/*13.*/ SELECT DISTINCT projectId FROM SPG
JOIN S ON S.id=SPG.suppliersId
JOIN J ON J.id=SPG.projectId
WHERE S.city!=J.city;

/*14.*/ SELECT DISTINCT s1.detailId AS 'detal1' , s2.detailId AS 'detal2'
FROM SPG AS s1 JOIN SPG AS s2
where s1.suppliersId=s2.suppliersId;

/*22.*/ SELECT distinct projectId, detailId FROM SPG JOIN
(SELECT distinct detailId as did FROM SPG WHERE
suppliersId = 'П1') detailtable ON SPG.detailId = detailtable.did;

/*29.*/ SELECT * FROM SPG JOIN
(SELECT projectId, sum(s) AS s FROM SPG group by projectId) detailsum ON detailsum.projectId = SPG.projectId where
suppliersId = 'П1' and detailsum.s < SPG.s;

/*33.*/ SELECT result.city FROM (
SELECT counter.city, sum(counter.Ncount) AS Ncount FROM (
SELECT distinct city, 1 AS Ncount FROM S
UNION SELECT distinct city, 2 AS Ncount FROM P
UNION SELECT distinct city, 3 AS Ncount FROM J) counter group by 1) result where result.Ncount = 6;