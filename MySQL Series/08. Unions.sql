-- UNIONS
-- Purpose: Combines the rows of data from multiple SELECT statements into a 
-- single output (unlike JOINs, which combine columns).

-- UNION: Automatically removes duplicate rows and returns only distinct values.

-- UNION ALL: Returns all results from the combined statements, including duplicates.

-- Rule: The data types and the number of columns selected must be identical across 
-- all statements being combined.

SELECT age, gender 
FROM employee_demographics
UNION
SELECT first_name, last_name
FROM employee_salary; -- This is Bad Data. We should not combine age, gender with 
-- first name and last name. Removes duplicate, by default it is 'UNION DISTINCT'


SELECT age, gender 
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary; -- 'UNION ALL' Doesn't remove duplicates

SELECT first_name, last_name, 'Old Man' AS 'Label'
FROM employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'Old Lady' AS 'Label'
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'Highly Paid Employee' AS 'Label'
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name;