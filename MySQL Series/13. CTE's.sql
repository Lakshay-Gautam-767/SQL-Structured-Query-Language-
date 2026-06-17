/*  CTEs (Common Table Expressions)
•	Purpose: Defines a temporary, named result set that you can query 
    from immediately. It makes complex queries much cleaner and easier 
    to read compared to nested subqueries.
•	Syntax: Defined using the WITH keyword followed by alias AS (query).
•	Usage Rule: A CTE is not stored in memory or saved as a permanent 
	object; it can only be queried in the exact SELECT statement 
    immediately following its creation.
•	Multiple CTEs: You can create multiple CTEs within a single WITH 
	block by separating them with commas.
*/

WITH CTE_Example(Gender, Avg_Sal, Max_Sal, Min_Sal, Count_Sal) AS 
(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal
, COUNT(salary) count_sal 
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id 
GROUP BY gender
)
SELECT *
FROM CTE_Example;  	-- It looks pretty, easy to read


SELECT avg(avg_sal)
FROM
(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal
, COUNT(salary) count_sal 
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id 
GROUP BY gender
) as example_subquery;  -- It is difficult to read



WITH CTE_Example As 
(
SELECT employee_id, gender, birth_date
FROM employee_demographics
WHERE birth_date > '1980-01-01'
),
CTE_Example2 As
(
SELECT employee_id, salary
FROM employee_salary
WHERE salary > 50000
)
SELECT *
FROM CTE_Example
JOIN CTE_Example2
	ON CTE_Example.employee_id = CTE_Example2.employee_id;