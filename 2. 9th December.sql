# 9th December
show databases;
use world;
select database();  -- To see output current database
create database schoool;
show tables; 	-- display tables
use regex_l4;
create table tushar(salary int, age int); 
desc tushar;   -- describe about tables
select * from city;
# ----------------------
# New File
select population, name from city;  -- To access any columns, it can be print in any order
select name, population, population+10 from city;  -- just print/no changes

Select Name, POPULATION
 from 
 city; -- Can be written in multiple lines, not case sensitive
 
 -- alias
 select *, population+12-4-24-42 as 'new population' from city;
 
 # Learning Assigment
 # Q-1: What is Database
 # Q-2: What is File System and How it is different from DBMS?
 # Q-3: Types of DBMS and the name of each one. 
 # Q-4: DBMS vs RDBMS
# Tommorow we will learn where clause
-- ================================================================
-- Pre-Requisite
# In Python, etc languages we use '==' but in sql we use '=' for comparing
# '!=' and '<>' both are same
# 'between' (To filter data between a range)
select * from city where population between 1 and 50;
# 'in' (to get data for a specific set of values)
select * from city where population in(42, 559, 800);
-- not (do not include that range or those values) 
select * from city where population not in(42, 559, 800);
select * from city where population not between 1 and 50;
-- =============================================================