/*CASE Statements
Purpose: Allows you to add if-else logic directly into your SELECT 
statement to categorize data or perform conditional calculations.

Syntax Structure: Always begins with CASE and ends with END.

Execution: Uses WHEN condition THEN result logic. You can chain multiple 
WHEN statements. Once a condition is met, it stops reading.

Catch-all: Uses ELSE for any row that doesn't meet the specified WHEN 
conditions. */ 

SELECT first_name, last_name, age,
CASE
	WHEN age <= 30 THEN 'YOUNG'
    WHEN age BETWEEN 31 and 50 THEN 'OLD'
    WHEN age >= 50 THEN "On Death's Door"
END AS 'Age Bracket'
FROM employee_demographics;


-- Pay Increase And Bonus
-- < 50000 = 5%
-- > 50000 = 7%
-- Finance = 10% Bonus

SELECT SAL.first_name, SAL.last_name, SAL.salary,
PD.department_name,
CASE 
	WHEN SAL.salary < 50000 and PD.department_name != 'Finance' THEN (SAL.salary + (SAL.salary * 0.05))
    WHEN SAL.salary > 50000 and PD.department_name != 'Finance' THEN SAL.salary + ((SAL.salary * 0.07))
    WHEN PD.department_name = 'Finance' THEN (SAL.salary + (SAL.salary * 0.10))
END AS 'New Salary'
FROM employee_salary as SAL 
INNER JOIN parks_departments as PD
	ON SAL.dept_id = PD.department_id;