-- Group By

SELECT *
FROM employee_demographics;

SELECT gender
FROM employee_demographics
GROUP BY gender;

-- Error
SELECT first_name
FROM employee_demographics
GROUP BY gender; -- Select list is not in the the 
-- groupBy clause and it contains non aggregate columns

-- When we are selecting the columns and it is not a 
-- aggregate columns(like avg, etc) then it has to be
-- group by.  Means gender should match group by if we
-- are not performing aggregate function on it.


SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender;

SELECT occupation, salary
FROM employee_salary
GROUP BY occupation, salary;

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
from employee_demographics
GROUP BY gender;
 
-- ORDER BY
SELECT *
from employee_demographics;

SELECT * 
FROM employee_demographics
ORDER BY first_name; -- By default it is in 'ASC' order

SELECT * 
FROM employee_demographics
ORDER BY first_name ASC; 

SELECT * 
FROM employee_demographics
ORDER BY first_name DESC; -- Descending order

SELECT * 
FROM employee_demographics
ORDER BY gender, age; -- first we ordering by gender
-- then we also ordering by age(ASC by default) 

SELECT * 
FROM employee_demographics
ORDER BY gender, age DESC; -- gender will be in ascending
-- order and age will be in descending order

SELECT * 
FROM employee_demographics
ORDER BY age, gender; -- wrong

SELECT * 
FROM employee_demographics
ORDER BY gender, age;

-- We can also use Column position to do order by
-- like given below but it is not a good practice
SELECT * 
FROM employee_demographics
ORDER BY 5, 4;