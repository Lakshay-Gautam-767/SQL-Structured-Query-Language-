/*5. Window Functions
•	Purpose: Performs calculations across a set of table rows related 
    to the current row, but keeps the individual rows intact instead 
    of rolling them up (unlike GROUP BY).
•	OVER(): The defining keyword that triggers a window function.
•	PARTITION BY: Divides the data into groups to perform calculations 
	within those specific boundaries (e.g., separating averages for 
    males vs. females).
•	Rolling Totals: Adding an ORDER BY clause inside the OVER() function 
	with an aggregate like SUM() creates a running/rolling total.
•	ROW_NUMBER(): Assigns a unique numerical value to each row within a 
	partition.
•	RANK(): Assigns a numerical rank, but gives identical values the same 
	rank and skips the next numerical value (e.g., 1, 2, 2, 4).
•	DENSE_RANK(): Identical to RANK(), but does not skip the next number 
	numerically (e.g., 1, 2, 2, 3).
*/

SELECT gender, AVG(salary) AS avg_salary
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender;

SELECT dem.first_name, dem.last_name, gender, sal.salary, 
AVG(salary) OVER(Partition by gender)
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
    
SELECT dem.first_name, dem.last_name, gender, sal.salary, 
SUM(salary) OVER(Partition by gender)
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
    
-- Rolling Total
SELECT dem.employee_id, dem.first_name, dem.last_name, gender, sal.salary, 
SUM(salary) OVER(Partition by gender order by dem.employee_id) AS Rolling_Total
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
    

SELECT dem.employee_id, dem.first_name, dem.last_name, gender, sal.salary, 
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary desc) as ROW_NUM,
RANK() OVER(PARTITION BY gender ORDER BY salary desc) as Rank_Num,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary desc) as DENSE_RANK_NUM
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;