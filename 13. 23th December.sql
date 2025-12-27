/* CREATING DATABASE SCRIPT, JUST RUN IT.
CREATE DATABASE REGEX;
USE REGEX;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2)
);



INSERT INTO customers (customer_id, customer_name, city) VALUES
(1, 'Alice', 'New York'),
(2, 'Bob', 'Los Angeles'),
(3, 'Charlie', 'Chicago'),
(4, 'David', 'Houston'),
(5, 'Eva', 'Phoenix'),
(6, 'Frank', 'Philadelphia'),
(7, 'Grace', 'San Antonio'),
(8, 'Henry', 'San Diego'),
(9, 'Ivy', 'Dallas'),
(10, 'Jack', 'San Jose');


INSERT INTO orders (order_id, customer_id, order_date, amount) VALUES
(101, 1, '2024-01-05', 250.00),
(102, 2, '2024-01-06', 150.00),
(103, 3, '2024-01-07', 300.00),
(104, 1, '2024-01-10', 120.00),
(105, 5, '2024-01-12', 450.00),
(106, 6, '2024-01-15', 200.00),
(107, 2, '2024-01-18', 175.00),
(108, 8, '2024-01-20', 500.00),
(109, 11, '2024-01-22', 90.00),
(110, 12, '2024-01-25', 60.00);
*/ 

use regex;
show tables;

select * from customers;
select * from orders;

/*
# 2. Types of SQL Joins

-- ==========================================================================
A. Inner Join
The Inner Join selects records that have matching values in both tables.

	How it works: If a customer exists in the Customers table but has never 
	placed an order, they will not appear in the results.
    
    ( A )   ( B )
   .----.  .----.
  /      \/      \
 |   A   ##   B   |
  \      /\      /
   '----'  '----'
          ↑ 
     Inner Join (Only Common)
    
#	Syntax Options */
# i) Old Syntax: Uses the WHERE clause to match IDs.
SELECT c.customer_id, c.customer_name, o.customer_id, o.order_id,
o.amount FROM customers AS c JOIN orders AS o
WHERE c.customer_id = o.customer_id;

# ii) Modern Syntax: Uses the INNER JOIN keyword with the ON clause.
SELECT c.customer_id, c.customer_name, o.customer_id, o.order_id,
o.amount FROM customers AS c INNER JOIN orders AS o
ON c.customer_id = o.customer_id;

# iii) Using Keyword: Used when column names are identical in both tables 
--  (e.g., USING(customer_id)).
SELECT c.customer_id, c.customer_name, o.customer_id, o.order_id,
o.amount FROM customers AS c INNER JOIN orders AS o
USING (customer_id);
-- ==========================================================================
/*
B. Left (Outer) Join
The Left Join returns all records from the left table (the table mentioned 
first), and the matched records from the right table.

	Behavior: If there is no match, the result is NULL on the right side.
	Use Case: When you want to see a list of all customers, including those 
              who haven't bought anything.

   ( A )   ( B )
   .----.  .----.
  /######\/      \
 |### A ###   B   |
  \######/\      /
   '----'  '----'
          ↑ 
	  Left Join (Left Part + Common)
*/
SELECT c.customer_id, c.customer_name, o.customer_id, o.order_id,
o.amount FROM customers AS c LEFT JOIN orders AS o
ON c.customer_id = o.customer_id;

/*
C. Right (Outer) Join
The Right Join returns all records from the right table, and the matched records 
from the left table.

	Behavior: If an order exists that isn't linked to a valid customer in your 
    list, the customer details will show as NULL.

    ( A )   ( B )
   .----.  .----.
  /      \/######\
 |    A  #### B ##|
  \      /\######/
   '----'  '----'
          ↑ 
	 Right Join (Right Part + Common)

*/
SELECT c.customer_id, c.customer_name, o.customer_id, o.order_id,
o.amount FROM customers AS c RIGHT JOIN orders AS o
ON c.customer_id = o.customer_id; 

/*
D. Full Outer Join
This join returns all records when there is a match in either left or right table 
records.

	Result: It combines the effect of both Left and Right joins. It shows customers 
    without orders AND orders without registered customers.

    ( A )   ( B )
   .----.  .----.
  /######\/######\
 |### A ##### B ##|
  \######/\######/
   '----'  '----'
          ↑ 
   Full Outer Join (Left Part + Right Part + Common)
*/

