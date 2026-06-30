select * 
from parks_and_recreation.employee_demographics;

select * 
from parks_and_recreation.employee_salary;

select * 
from parks_and_recreation.parks_departments;

-- Joins

-- Inner Join

select dem.employee_id, age, occupation
from employee_demographics AS dem
INNER JOIN employee_salary As sal
	ON dem.employee_id = sal.employee_id;
    
SELECT demo.employee_id, demo.first_name, demo.age, sal.salary
FROM employee_demographics AS demo
INNER JOIN employee_salary AS sal
    ON demo.employee_id = sal.employee_id;
    
-- LEFT OUTER Join

select *
from employee_demographics AS dem
LEFT JOIN employee_salary AS sal 
	 ON dem.employee_id = sal.employee_id
where sal.salary > 50000;

SELECT sal.employee_id, sal.first_name, sal.salary, demo.age
FROM employee_salary AS sal
LEFT JOIN employee_demographics AS demo
    ON sal.employee_id = demo.employee_id;
    
-- RIGHT OUTER Join

select *
from employee_demographics AS dem
RIGHT JOIN employee_salary AS sal 
	 ON dem.employee_id = sal.employee_id;
     
SELECT sal.employee_id, demo.first_name, sal.salary, demo.age
FROM employee_demographics AS demo
RIGHT JOIN employee_salary AS sal
    ON demo.employee_id = sal.employee_id;
    
-- SELF Join

select *
from employee_salary AS emp1
JOIN employee_salary AS emp2
	ON emp1.employee_id + 1 = emp2.employee_id;

SELECT emp1.first_name AS Employee, emp2.first_name AS Coworker, emp1.dept_id  -- people who work in the same department.
FROM employee_salary emp1
JOIN employee_salary emp2
    ON emp1.dept_id = emp2.dept_id 
    AND emp1.employee_id != emp2.employee_id;
    
-- Multiple Joins

SELECT demo.first_name, demo.last_name, sal.salary, dept.department_name
FROM employee_demographics AS demo
JOIN employee_salary AS sal
    ON demo.employee_id = sal.employee_id
JOIN parks_departments AS dept
    ON sal.dept_id = dept.department_id;


-- UNION

select first_name, last_name, "Old Man" AS Label
from employee_demographics
where age >40 AND gender = "Male"
UNION       -- Remove Duplicates
select first_name, last_name, "Old Lady" AS Label
from employee_demographics
where age >40 AND gender = "Female"
UNION
select first_name, last_name, "Highly Earners" AS Label
from employee_salary
where salary > 70000
ORDER BY  first_name, last_name;

SELECT first_name, last_name 
FROM employee_demographics
UNION ALL      -- Keep Duplicates
SELECT first_name, last_name 
FROM employee_salary;







     
     
