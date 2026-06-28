-- Select Clause

select * 
from parks_and_recreation.employee_demographics;

select * 
from parks_and_recreation.employee_salary;

select * 
from parks_and_recreation.parks_departments;

SELECT first_name, last_name, age, (age+10) * 10
FROM parks_and_recreation.employee_demographics;

-- DISTINCT keyword

SELECT distinct gender
FROM parks_and_recreation.employee_demographics;

SELECT distinct gender, first_name
FROM parks_and_recreation.employee_demographics;

-- Where clause

select * 
from parks_and_recreation.employee_demographics
where first_name = "leslie";

select *
from employee_salary
where salary <= 50000;

select * 
from parks_and_recreation.employee_demographics
where gender != "Female";

select * 
from parks_and_recreation.employee_demographics
where birth_date > "1987-01-01" AND gender = "Female";

select * 
from parks_and_recreation.employee_demographics
where birth_date > "1987-01-01" OR NOT gender = "Female";

select * 
from parks_and_recreation.employee_demographics
where (birth_date > "1987-01-01" AND gender = "Female") OR age > 40;

-- Like Statement
select * 
from parks_and_recreation.employee_demographics
where first_name LIKE "A%";   -- Names statt with A

select * 
from parks_and_recreation.employee_demographics
where first_name LIKE "A__";     -- Names start with A and only another 2 characters.

select * 
from parks_and_recreation.employee_demographics
where first_name LIKE "A__%";     

select * 
from parks_and_recreation.employee_demographics
where birth_date LIKE "1987%";

-- IS NULL / IS NOT NULL Operator

SELECT * 
FROM employee_salary 
WHERE dept_id IS NULL;

SELECT * 
FROM employee_salary 
WHERE dept_id IS NOT NULL;

-- BETWEEN Operator

SELECT * 
FROM employee_demographics 
WHERE age BETWEEN 30 AND 40;

SELECT * 
FROM employee_demographics 
WHERE birth_date BETWEEN '1980-01-01' AND '1989-12-31';
