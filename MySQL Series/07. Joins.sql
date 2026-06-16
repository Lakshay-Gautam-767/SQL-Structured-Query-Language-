-- JOINS: Combines columns/rows from two or more tables based on a common related
--        column (e.g., an employee_id).
-- •	Inner Join: Returns only the rows that have matching values in both tables.
-- •	Left (Outer) Join: Returns everything from the left table, and only the 
--      matched rows from the right table. Unmatched rows from the right table will 
--      show as NULL.
-- •	Right (Outer) Join: Returns everything from the right table, and only matched
--      rows from the left table.
-- •	Self Join: Joins a table to itself. Useful for comparing rows within the same
--      table (e.g., matching employees to other employees for a Secret Santa draw).
-- •	Multiple Joins: You can chain joins to connect three or more tables together,
--      provided they share common reference columns.

SELECT *
FROM employee_demographics;

SELECT * 
FROM employee_salary;

SELECT *
FROM employee_demographics
INNER JOIN employee_salary
	ON employee_demographics.employee_id = employee_salary.employee_id;
    
SELECT *
FROM employee_demographics AS dem 
INNER JOIN employee_salary AS SAL
	ON dem.employee_id = dem.employee_id;
    
SELECT dem.employee_id, dem.age, sal.occupation
FROM employee_demographics AS dem 
INNER JOIN employee_salary AS SAL
	ON dem.employee_id = dem.employee_id;

SELECT *
FROM employee_demographics AS dem 
LEFT JOIN employee_salary AS SAL
	ON dem.employee_id = sal.employee_id;
    
SELECT *
FROM employee_demographics AS dem 
RIGHT JOIN employee_salary AS SAL
	ON dem.employee_id = sal.employee_id;

-- Self Join: It is join where we tie a table from itself

SELECT emp1.employee_id as 'santa_id',
emp1.first_name as 'santa_first_name', 
emp1.last_name as 'santa_last_name',  
emp2.employee_id, 
emp2.first_name, 
emp2.last_name
FROM employee_salary as emp1
JOIN employee_salary as emp2
	ON emp1.employee_id + 1 = emp2.employee_id;
    
-- joining multiple tables together
SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments AS pd 
	ON sal.dept_id = pd.department_id;