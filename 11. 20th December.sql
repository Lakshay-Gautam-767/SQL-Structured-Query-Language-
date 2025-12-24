# Test: Group by Test 

/*
+--------+----------+------------+--------+------------+----------+
| emp_id | emp_name | department | salary | join_date  | city     |
+--------+----------+------------+--------+------------+----------+
| 101    | Alice    | HR         | 50000  | 2021-01-15 | New York |
| 102    | Bob      | IT         | 70000  | 2020-03-10 | London   |
| 103    | Charlie  | IT         | 65000  | 2019-07-23 | London   |
| 104    | Diana    | HR         | 52000  | 2021-06-01 | New York |
| 105    | Edward   | Finance    | 80000  | 2018-11-12 | Sydney   |
| 106    | Fiona    | Finance    | 75000  | 2020-02-20 | Sydney   |
| 107    | George   | IT         | 72000  | 2022-04-18 | New York |
+--------+----------+------------+--------+------------+----------+
Table: Employees
*/
#  1. Find the total salary paid per department.
select department, sum(salary) from employees group by department;

#  2. Find the number of employees in each department.
select department, count(emp_id) from employees group by department;

#  3. first 3 characters of each employee name in capital letters
select upper(substr(emp_name, 1, 3)) as 'First 3 letters' from employees;

#  4. Find the employee who have more than 6 character in their name
select emp_name from employees where char_length(emp_name) > 6;

#  5. Find employees who joined after November 2020. 
select * from employees where join_date>='2020-11-30';    # Note it carefully

#  6. Display the number of years since joining (assuming current year = 2025).
select emp_name, (year(now()) - year(join_date)) from employees;

#  7. Display salary rounded to nearest thousand. 
select emp_id, emp_name, round(salary, -3) from employees;

#  8. Find cities having more than 2 employees.
select city, count(*) from employees group by city having count(emp_id)>2;

#  9. Find cities where the average salary is between 60,000 and 75,000.
select city, avg(salary) from employees group by city having avg(salary) between 60000 and 75000; 

# 10.Find the department and city combination where the average salary is highest.
select * from employees;


# 11. Display departments where more than one city is present.
# 12.Write a brief on SQL and type of sql languages 