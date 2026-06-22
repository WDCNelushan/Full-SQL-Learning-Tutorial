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