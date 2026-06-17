/*  Temporary Tables
•	Purpose: Complex queries ke intermediate results ko store karne ke liye use 
	hoti hain.
•	Visibility: Yeh sirf aapke current session tak hi zinda rehti hain. Jaise hi 
	aap MySQL close karoge, temp table automatically delete ho jayegi.
•	Banane ke 2 tareeqe:
1.	Normal table ki tarah: CREATE TEMPORARY TABLE temp_table (first_name varchar(50)); 
	aur fir manually INSERT karna.
2.	Existing data se (Best approach): Ek nayi temp table banakar usme seedha filter 
	lagakar data daalna.
 	CREATE TEMPORARY TABLE salary_over_50k AS SELECT * FROM employee_salary WHERE 
	salary >= 50000;
•	CTEs vs Temp Tables: CTEs simple, one-level calculations ke liye theek hain. 
	Par jab data ko bohot zyada manipulate karna ho ya Stored Procedures likhne hon, 
    toh Temp Tables zyada use hoti hain.
*/

CREATE TEMPORARY TABLE temp_table
(first_name varchar(50),
last_name varchar(50), 
favourite_movie varchar(100)
);

SELECT * FROM temp_table;

INSERT INTO temp_table
VALUES ('Lakshay', 'Gautam', 'Bahubali');

SELECT * FROM temp_table;

SELECT * FROM employee_salary;

CREATE TEMPORARY TABLE salary_over_50k
SELECT * FROM employee_salary WHERE salary >= 50000;

SELECT * FROM salary_over_50k;