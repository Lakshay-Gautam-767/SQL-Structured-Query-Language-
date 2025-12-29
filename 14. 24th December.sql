/* 24th December 
# What is SELF JOIN?
A Self Join is a type of join where a table is joined with itself. This 
is particularly useful when a relationship exists between rows within the 
same table.

   +-----------------------------+    
   |    +-----+---------+------+ |
   |    | Eid | Ename   | Mid  | |
   |    +-----+---------+------+ |
   +=--→| 10  | Aman    | NULL | |  
        | 11  | Sakshi  | 10---|-+
        | 12  | Shubham | 10   |
        | 13  | Akansha | 12   |
        | 14  | Abhinav | 11   |
        +-----+---------+------+
         
         
+-----+---------+------+		     +----+---------+ 
| Eid | Ename   | Mid  |		     | ID | Name    |
+-----+---------+------+		     +----+---------+
| 10  | Aman    | NULL |   /-+------>| 10 | Aman    |
| 11  | Sakshi  | 10   |--/  |	     | 11 | Sakshi  |
| 12  | Shubham | 10   |-----+   /-->| 12 | Shubham |
| 13  | Akansha | 12   |--------/  	 +----+---------+
| 14  | Abhinav | 11   |		    (Manager Reference)
+-----+---------+------+
  (Employee Hierarchy)        

👆 Now If we have two tables like this(hypothetically), then we would 
-- write something like-
SELECT Emp.Eid, Emp.Ename, Mng.Mid, Mng.Name from Employee as Emp 
join Manager as Mng ON Emp.Mid = Mng.ID;


# But Now we don't have have two different tables, we just have one table.
# So we have to join our table with itself(Employee Join Employee), So we 
-- will use Self join in this situation. 
*/

/* Run this Part of Script To Create an Table that we are discussing.
show databases;
use test;
CREATE TABLE Employees (
    Eid INT PRIMARY KEY,
    Ename VARCHAR(50),
    Mid INT,
    FOREIGN KEY (Mid) REFERENCES Employees(Eid)
);

INSERT INTO Employees (Eid, Ename, Mid) VALUES (10, 'Aman', NULL);
INSERT INTO Employees (Eid, Ename, Mid) VALUES (11, 'Sakshi', 10);
INSERT INTO Employees (Eid, Ename, Mid) VALUES (12, 'Shubham', 10);
INSERT INTO Employees (Eid, Ename, Mid) VALUES (13, 'Akansha', 12);
INSERT INTO Employees (Eid, Ename, Mid) VALUES (14, 'Abhinav', 11);

show tables;
select * from employees;*/
select * from employees;

select Emp.Eid, Emp.Ename, Mng.Eid as 'Mid', Mng.Ename as 'Mname' 
from Employees as Emp 
join Employees as Mng ON Emp.Mid = Mng.Eid;
-- ================================================================
/* Self Join Table Create, by executing this script. 
show databases;
create database Concepts;
use Concepts;
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    job_title VARCHAR(100),
    manager_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (manager_id) REFERENCES employee(emp_id)
);
INSERT INTO employee (emp_id, emp_name, job_title, manager_id, salary) VALUES
(1, 'Alice', 'CEO', NULL, 120000),

(2, 'Bob', 'CTO', 1, 95000),
(3, 'Carol', 'CFO', 1, 90000),
(4, 'David', 'HR Manager', 1, 85000),

(5, 'Eve', 'Tech Lead', 2, 75000),
(6, 'Frank', 'Senior Developer', 2, 72000),
(7, 'Grace', 'Senior Developer', 2, 71000),

(8, 'Heidi', 'Developer', 5, 60000),
(9, 'Ivan', 'Developer', 5, 58000),
(10, 'Judy', 'Developer', 6, 59000),

(11, 'Mallory', 'Accountant', 3, 65000),
(12, 'Niaj', 'Financial Analyst', 3, 62000),

(13, 'Olivia', 'HR Executive', 4, 55000),
(14, 'Peggy', 'HR Executive', 4, 54000),

(15, 'Sybil', 'Intern', 8, 35000);

show tables;

*/

select * from employee; 

SELECT Emp.emp_id, Emp.emp_name, Emp.manager_id, Emp.salary, Mng.emp_id, 
Mng.emp_name, Mng.salary from Employee as Emp
join Employee as Mng ON Emp.manager_id = Mng.emp_id;

# Question: You need to find out, How many employees are there for each 
		 -- manager.
select * from employee;
select Mng.emp_id, Mng.emp_name as 'Manager Name', count(Emp.emp_id)
from Employee as Emp join Employee as Mng ON Emp.manager_id = Mng.emp_id
group by Mng.emp_id, Mng.emp_name;
-- ==========================================================================

# Homework/Learning Assigment
# Solve questions on this website for practice
#	 https://sqlzoo.net/wiki/The_JOIN_operation
