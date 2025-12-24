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
-- Situation 1: This part is fine, but look at situation 2  
104 ----> D
104 ----> A 

-- Situation 2(Bottleneck): Here data is duplicate and redundant. 
NOTE: It get's worst when we also store address, etc. Then 
-- there will be to much duplicacy. 
20 ---> Aman ----> aman32@gmail.com
20 ---> Aman ----> aman32@gmail.com

# When there is duplicacy of data then it creates bottleneck of
 database. 
 
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

*/
