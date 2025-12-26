# 22nd December
/* =========================================================
Revision
# Why we need to store our data in multiple tables instead 
  of a single table?
  * To remove data duplicacy
  * To reduce the size of our data
  So that we can save money spended on Data Storage and Data 
  Processing Power. 
============================================================
# What is Join?
It helps to connect 2 or more tables, and it helps to extract the 
data from multiple tables.  

# Why we need Join?
Because our data exists in multiple tables and we want to get those tables 
at a single place, that's why we use Join.
*/
use world;
select * from city;
-- id, population is looking different. (Population may not be unique)
-- id can be my primary key

# But don't belive it, until you have proof.
describe city;    # Here ID is clearly Primary Key.

 








