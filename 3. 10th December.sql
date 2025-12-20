# 10th December
-- where clause, we will filter data
select * from city where district = 'kabol';  # '=' comparing operator
select * from city where district <> 'kabol'; # '<>' and '!=' both are same
select * from country where Name in ('India', 'Pakistan'); # to select some specific values 
select * from country where Continent = 'Asia'; # for fun
select name, indepyear from country where indepyear between 1901 and 2000; # between: (to filter data between a range)

# Questions
select * from country;
# 1. Get the Code, Name, Region where the region is not middle east
select code, name, region from country where region != 'middle east';
# 2. Get the Name, indepyear, population with the expected 10% increase in population.alter
select name, indepyear, population, population * 1.1 as 'Expected 10% increase' from country;
# 3. Get all the columns of the country where life expectancy is 38.3 or 66.4 
select * from country where 'LifeExpectancy' in (38.3 or 66.4);
# 4. Get the name, continent, population and GNP column from the table where the population is not from 5 thousand to 2 lakh.
select name, continent, population, GNP from country where population not between 5000 and 200000;


# Like Operator 
# like pattern ko search krna 
select name, continent from country where continent = 'Asia';
select name, continent from country where continent like 'Asia';
-- Special character are called wildcard which have specific work
# 1. 	'%': Finding 0 or more characters
		select name, continent from country where continent like 'A%'; 
		select name, continent from country where continent like '%a';
		select name, continent from country where name like '%ad%';
# 2. 	'_' (underscore): 1 character
		select name from country where name like 'Ir__';
-- =============================================================