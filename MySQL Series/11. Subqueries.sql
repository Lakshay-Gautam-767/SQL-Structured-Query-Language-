-- Subqueries
-- Purpose: A query nested inside another query to perform complex 
--          filtering or calculations.
-- In the WHERE Clause: Used to filter records based on the results 
--     of a separate query (e.g., WHERE id IN (SELECT id FROM...)).
-- In the SELECT Clause: Used to show an aggregated value (like the 
--     overall average salary) alongside individual unaggregated rows.
-- In the FROM Clause: Treats the results of a query as a temporary, 
--     derived table to query against. Note: Derived tables in the FROM 
--     clause must always be given an alias.

select * from employee_demographics;
select * from employee_salary;

SELECT * 
FROM employee_demographics 
where employee_id in (SELECT employee_id
from employee_salary where dept_id = 1);

SELECT first_name, salary, 
(select avg(salary)
from employee_salary)
FROM employee_salary; 

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender;

SELECT gender, AVG(`MAX(age)`)
FROM
(SELECT gender, AVG(age), MAX(age), 
MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender) as Aggregated_Table
GROUP BY gender; 

SELECT AVG(max_age)
FROM
(SELECT gender, AVG(age) as avg_age, MAX(age) as max_age, 
MIN(age) as min_age, COUNT(age) as count_age
FROM employee_demographics
GROUP BY gender) as Aggregated_Table; 


-- SELECT mein subquery = Alias Dena Optional hai (sirf column ka 
-- naam theek karne ke liye).

-- FROM mein subquery = Alias Dena Strictly Zaroori hai (kyunki SQL 
-- usko ek nayi table maanta hai, aur bina naam ke table exist nahi 
-- kar sakti).