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

-- String Functions

-- 1. LENGTH()

select length("Chamika");

-- Find the length of each employee's full name
SELECT first_name, LENGTH(first_name) AS name_length
FROM employee_demographics;

SELECT first_name 
FROM employee_demographics 
WHERE LENGTH(first_name) > 5;

-- 2. UPPER() & LOWER()

select upper("kamal");
select lower("KAMAL");

-- Convert all first names to UPPERCASE
SELECT first_name, UPPER(first_name) AS upper_name
FROM employee_demographics;

-- Convert all last names to lowercase
SELECT last_name, LOWER(last_name) AS lower_name
FROM employee_demographics;

-- 3. TRIM(), LTRIM(), RTRIM()
-- Imagine someone accidentally typed '   Leslie   '
SELECT TRIM('   Leslie   ') AS trimmed_name;      -- Result: 'Leslie'
SELECT LTRIM('   Leslie   ') AS left_trimmed;     -- Result: 'Leslie   '
SELECT RTRIM('   Leslie   ') AS right_trimmed;    -- Result: '   Leslie'

-- 4. LEFT(), RIGHT()

-- Get the first 3 letters of each first name
SELECT first_name, LEFT(first_name, 3) AS first_3_letters
FROM employee_demographics;

-- Get the last 4 letters of each last name
SELECT last_name, RIGHT(last_name, 4) AS last_4_letters
FROM employee_demographics;

-- 5. SUBSTRING()

-- Grab 3 characters starting from position 2 of each first name
SELECT first_name, SUBSTRING(first_name, 2, 3) AS middle_letters
FROM employee_demographics;

-- Just grab everything from position 3 onward
SELECT first_name, SUBSTRING(first_name, 3) AS from_third_char
FROM employee_demographics;

-- 6. REPLACE()

-- Replace all occurrences of 'a' with '@' in first names
SELECT first_name, REPLACE(first_name, 'a', '@') AS modified_name
FROM employee_demographics;

-- Replace 'Director' with 'Manager' in occupations
SELECT occupation, REPLACE(occupation, 'Director', 'Manager') AS new_title
FROM employee_salary;

-- 7. CONCAT()

-- Combine first and last name into a full name
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employee_demographics;

-- Create a fun description combining name and occupation
SELECT CONCAT(first_name, ' is a ', occupation) AS employee_info
FROM employee_salary;

SELECT CONCAT_WS(' - ', first_name, last_name, occupation) AS full_info
FROM employee_salary;

-- 8. LOCATE()

-- Find where the letter 'e' appears in each first name
SELECT first_name, LOCATE('e', first_name) AS position_of_e
FROM employee_demographics;

-- Find names that contain 'on'
SELECT first_name 
FROM employee_demographics 
WHERE LOCATE('on', first_name) > 0;

-- 9. REVERSE()

SELECT first_name, REVERSE(first_name) AS backwards_name
FROM employee_demographics;

SELECT 
    first_name,
    last_name,
    CONCAT(
        LOWER(LEFT(first_name, 1)),   -- First letter lowercase
        LOWER(last_name),              -- Full last name lowercase
        '@parks.gov'                   -- Domain
    ) AS email_address
FROM employee_demographics;





     
     
