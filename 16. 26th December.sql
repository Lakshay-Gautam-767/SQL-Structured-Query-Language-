# 26th December 
select name, population from world.country;  # To access any database from another database

-- ============================================================================================
# If-Else in SQL 
-- if(condition, True, False) 		# Simple If-Else
select name, if(population>100000, 'Large Populaton', 'Small Population') from country;

-- if( condition, True, if(condition, True, False)) 	# Nested If-Else(elif) conditions
select name, if(population<10000, 'Small Populaton', if( population between 10000 and 100000,
'Medium Population', 'Large Population')) as 'if-else' from country;
-- ============================================================================================

/*
1. What is the CASE Statement?
The CASE statement is SQL’s way of handling If-Else logic. It allows 
us to create new output values based on specific conditions.
	* It works like a bridge between raw data and categorized data.
	* It is much cleaner and more readable than using "Nested IF" 
	  functions. */
SELECT name, 
CASE 
	when population < 10000 then 'Small Population'
	when population between 10000 and 100000 then 'Medium Population'
	else 'Large Population'
end as 'status' from country;


SELECT count(*), 
CASE 
	when population < 10000 then 'Small Population'
	when population between 10000 and 100000 then 'Medium Population'
	else 'Large Population'
end as 'status' from country
group by status order by status;
-- =====================================================================================

select continent, count(case
when population >= 50000 then 1 else 0
end) from world.country
group by continent;   # Includes 0 and 1

select continent, sum(case
when population >= 50000 then 1 else 0
end) from world.country
group by continent;	  # Includes 1 because(sum of 0 + 1 = 1)
-- =====================================================================================
# Task: Now Try to solve Question-13 from this website ✅
-- https://sqlzoo.net/wiki/The_JOIN_operation