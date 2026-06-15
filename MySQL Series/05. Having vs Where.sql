-- 4. HAVING vs. WHERE

-- The Issue: The WHERE clause cannot filter data based on aggregate functions 
-- (like AVG or COUNT) because the aggregation hasn't happened yet in the 
-- execution order.

-- The Solution: The HAVING clause is specifically designed to filter records 
-- after the GROUP BY clause has aggregated the rows.

SELECT gender, AVG(age)
FROM employee_demographics
WHERE AVG(age) > 40
GROUP BY gender; -- Wrong, Invalid use of Group Function
-- When we try to filter based on 'AVG(age)' hasn't been created
-- yet, so 'WHERE' will not work.

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40;

SELECT occupation, AVG(salary)
FROM employee_salary
GROUP BY OCCUPATION;

SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY OCCUPATION
HAVING AVG(salary) > 75000;

