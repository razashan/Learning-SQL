create database analysis;
use  analysis;

show tables;

select * 
from teachers;

select * 
from teacher;

Insert into teachers(first_name,last_name,school,hire_date,salary)
values ('Janet', 'Smith', 'F.D. Roosevelt HS', '2011-10-30', 36200),
       ('Lee', 'Reynolds', 'F.D. Roosevelt HS', '1993-05-22', 65000),
       ('Samuel', 'Cole', 'Myers Middle School', '2005-08-01', 43500),
       ('Samantha', 'Bush', 'Myers Middle School', '2011-10-30', 36200),
       ('Betty', 'Diaz', 'Myers Middle School', '2005-08-30', 43500),
       ('Kathleen', 'Roush', 'F.D. Roosevelt HS', '2010-10-22', 38500);


select * 
from teachers;

SELECT first_name, last_name, school
FROM teachers
WHERE first_name = 'Janet';

SELECT school
FROM teachers
WHERE school != 'F.D. Roosevelt HS';

SELECT first_name, last_name, hire_date
FROM teachers
WHERE hire_date < '2000-01-01';

SELECT first_name, last_name, salary
FROM teachers
WHERE salary >= 43500;



-- Teachers who earn between $40,000 and $65,000
SELECT first_name, last_name, school, salary
FROM teachers
WHERE salary BETWEEN 40000 AND 65000;

SELECT first_name
FROM teachers
WHERE first_name LIKE 'sam%';

SELECT *
FROM teachers
WHERE school = 'Myers Middle School'
     & salary < 40000;
     
SELECT *
FROM teachers
WHERE last_name = 'Cole'
      | last_name = 'Bush';
      
SELECT *
FROM teachers
WHERE school = 'F.D. Roosevelt HS'
      & (salary < 38000 | salary > 40000);
      
SELECT first_name, last_name, school, hire_date, salary
FROM teachers
WHERE school LIKE '%Roos%'
ORDER BY hire_date DESC;