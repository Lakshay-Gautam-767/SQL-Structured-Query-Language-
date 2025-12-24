# 19th December
/* Revision
# Data Models: Way to organize (structure) of data.
1. Conceptual: Entity, Attributes get defined. 
2. Logical: (Entity, Attributes) + Relationship also gets established. 
3. Physical: It is place where data is stored.
			--> Entity becomes table
            --> Attribute becomes column
            --> Relationship with the help of keys(PK, FK).
            --> Those keys are known as Primary and Foreign keys. 
====================================================================
# Why we need Relationship

Let's assume this situation
+----------+-------+-----+--------+------------------+
| order-id | order | cid | cname  | Email Id         |
+----------+-------+-----+--------+------------------+
|      101 |   A   |  10 | Jai    | jai123@gmail.com |
|      102 |   B   |  20 | Aman   | aman32@gmail.com |
|      103 |   C   |  30 | Yash   | yash364@zoho.com |
|      104 |   D   |  10 | Jai    | jai123@gmail.com |
|      104 |   A   |  20 | Aman   | aman32@gmail.com |
|      105 |   A   |  20 | Aman   | aman32@gmail.com |
|      105 |   B   |  30 | Yash   | yash364@zoho.com |
|      105 |   E   |  40 | Tushar | tushar@gmail.com |
+----------+-------+-----+--------+------------------+

Now in this table focus on this part.
-- Situation 1: This part is fine, because it does not have duplicacy 
   but look at situation 2  
104 ----> D
104 ----> A 

-- Situation 2(Bottleneck): Here data is duplicate and redundant. 
NOTE: It get's worst when we also store address, etc. Then 
-- there will be to much duplicacy. 
20 ---> Aman ----> aman32@gmail.com
20 ---> Aman ----> aman32@gmail.com

# When there is duplicacy of data then it creates bottleneck on
  our database. 
 
# Now Problems: Storage Cost, Processing Cost, takes more time to 
  get result. 

Solving the Issue: So In this type of situation we never store the
data into one table so we try to divide our table in multiple tables.

like this
+----------+-------+        +------+--------+------------------+
| order-id | order |        | cid  | cname  | Email Id         |
+----------+-------+        +------+--------+------------------+
|      101 |   A   |        |   10 | Jai    | jai123@gmail.com |
|      102 |   B   |        |   20 | Aman   | aman32@gmail.com |
|      103 |   C   |        |   30 | Yash   | yash364@zoho.com |
|      104 |   D   |        |   40 | Tushar | tushar@gmail.com |
|      104 |   A   |        +------+--------+------------------+
|      105 |   A   |    
|      105 |   B   |    
|      105 |   E   |    
+----------+-------+  
We have reduced the redundancy and duplicacy of our table. 

# Now if we want to find out which are the products that a particular 
  customer have purchased? 
  Then we need a common element or relationship between these table, So
  that we can connect these two tables but there is no relationship 
  between these table. 
  So we have to add the column so that we can make relationship b/w tables. 
  Like this.
                                 
				    (F.K.)         (P.K.) 
+----------+-------+-----+        +------+--------+------------------+
| order-id | order | cid |        | cid  | cname  | Email Id         |
+----------+-------+-----+        +------+--------+------------------+
|      101 |   A   |  10 |------->|   10 | Jai    | jai123@gmail.com |
|      102 |   B   |  30 |     /  |   20 | Aman   | aman32@gmail.com |
|      103 |   C   |  40 |    /   |   30 | Yash   | yash364@zoho.com |
|      104 |   D   |  10 |---/    |   40 | Tushar | tushar@gmail.com |
|      104 |   A   |  20 |        +------+--------+------------------+
|      105 |   A   |  30 |
|      105 |   B   |  30 |
|      105 |   E   |  30 |
+----------+-------+-----+  


-- > PRIMARY KEY : Makes a column UNIQUE for every row (No duplicates, No NULLs).
				-- So that we can make (One to One, One to Many, Many to One) relationship.                   
-- > FOREIGN KEY : A column that points to the Primary Key of another table.
				-- Foreign Key is used to set the relationship with another table.  

# Learning Assigment
Q-1: What are Keys in SQL? 
Q-2: What is Primary Key, Super Key and Candidate Key?
Q-3: Primary Key and Foreign Key
Q-4: Types of Relationship (one to one, one to many, many to one, many to one)

# This was all about Revision
*/

/* Today we will learn

Subquery: A Subquery is a "Query within a Query"—essentially a question inside 
another question. It is used when the result of the main query depends on a 
value that you don't know yet and need to find out first.

Example:
[NORMAL QUESTION]
Ques: You need to find out the names whose marks are greater than or equal to 80.
select names from student where marks >= 80;

[SUBQUERY QUESTION]
Ques: Get the names whose marks are greater than my friend 'Rohan'

# Now analyze this situation, we wanted the names whose marks is greater
 than 'Rohan', but to perform this query first we have to know the marks
 of 'Rohan' to get the list of names. This is known as subquery. 

select names from student where marks >= C; # Now what is the marks of C?

Subquery basically have two parts
   outer( inner )
	 ↑	    ↑
 +---+      +--------------------+
 |			                     |  
 |         select marks for C;---+ 
 +--select name from marks > marks of C; 
*/

use sakila;
# Question: Find out the rows whose amount > 0.99  [Easy Task 😎]
select * from payment where amount > 0.99;

# Question: Find out the rows whose amount > payment_id = 5  [Subquery 🤔]
select amount from payment where payment_id = 5; # Ans= 9.99 
select * from payment where amount > 9.99; # Manually replacing

# We can write like this 👇; SubQuery 🧠💡
select amount from payment where payment_id = (select * from payment 
where amount > 9.99); 
-- =============================================================================
# Question: Get me the payment information whose month is same as the 
 -- payment id 3
 select month(payment_date) from payment where payment_id = 3; # Ans = 6     ## Inner query
 select * from payment where month(payment_date) = 6; # Manually Replacing   ## Outer query
 
# We can write like this, subquery 👇
 select * from payment where month(payment_date) = (select month(payment_date) from 
 payment where payment_id = 3);

-- SPECIAL NOTE: We will learn subquery properly later, after learning Join concept, 
-- because subquery concept need Join Concept. 
-- ==============================================================================
/*
# Super Key in a database is a column or a combination of multiple columns
-- that can uniquely identify any row (tuple) within a table

# Example
+-----+-----+-------+------------+---------+
| Sid | Cid | Cname | City       | Pincode |
+-----+-----+-------+------------+---------+
|  1  | 10  | A     | Jaipur     | 30201   |
|  2  | 10  | A     | Pune       | 30205   |
|  3  | 10  | A     | Goa        | 31467   |
|  4  | 20  | D     | J&K        | 3247    |
|  5  | 30  | E     | Goa        | 64321   |
|  6  | 40  | F     | Chandigarh | 10047   |
|  7  | 50  | A     | Jaipur     | 30201   |
+-----+-----+-------+------------+---------+

Super Keys: Any set of columns that ensures no two rows are identical 
            is a Super Key. A table can have many Super Keys.
    	--> Super Keys consist of all the possible combinations. 
✅ sid
✅ cid + city
✅ cid + pincode
✅ cname + city 
✅ Sid + Cid + Cname + City + Pincode 


# Candidate Key: A candidate key in a database 
is a minimal set of one or more attributes(columns) that uniquely identifies 
each rows/record in a table.
--> A minimal Super Key with no redundant attributes.
--> It is a "Subset" of Super Keys. We look for the smallest combinations that 
    still work alone.    
 
 Key Characteristics:
 * Minimality: No duplicacy of column.
 * Multiple Possiblities: A table can have several candidate keys (Employee_ID, 
   SSN, Email, etc).  
 * Selection: One candidate is choosen as a primary key. 
   which is [smaller in size (like: ID), can uniquely identify each row,
   should not have Null Value to become Primary Key]. 
 * Null Values: Can sometimes contain null values, though primary key cannot.  

-- ==========================================================================
Learning Assigment
	1) Primary Key
    2) Foreign Key
    3) Super Key
    4) Candidate Key
    5) Types of Relationship

