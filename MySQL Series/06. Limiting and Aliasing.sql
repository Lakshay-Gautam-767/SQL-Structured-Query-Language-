-- LIMIT and Aliasing

-- LIMIT: Specifies the maximum number of rows you want in your output 
-- (e.g., LIMIT 3 returns only the top 3 rows). You can also add a starting 
-- position (e.g., LIMIT 2, 1 starts after position 2 and returns 1 row).

-- Aliasing (AS): Temporarily renames a column or table for readability. For 
-- example, SELECT AVG(age) AS average_age. The AS keyword is technically 
-- optional but highly recommended for clean code.

SELECT * 
FROM employee_demographics
ORDER BY age DESC
LIMIT 3;

SELECT * 
FROM employee_demographics
ORDER BY age DESC
LIMIT 2, 1;

-- Aliasing
SELECT gender, AVG(age) AS 'avg_age'
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40;