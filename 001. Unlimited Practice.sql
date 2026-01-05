-- ======================================================================
# SQL Unlimited Practice
-- ======================================================================
# Question-0: Use world database and then write a command to see which 
-- database you are using, then see all tables of world. then see all 
-- content inside country table. 
USE world;
select database();
show tables;
select * from country;
-- ======================================================================
# Question-1: Get the Code, Name, Region where the region is not middle east
select code, name, region from country where region != 'middle east';

# Question-2: Get the Name, indepyear, population with the expected 10% 
-- increase in population.
select name, indepyear, population, population*1.1 as 'Expected Population'
from country;

# Question-3: Get all the columns of the country where life expectancy 
-- is 38.3 or 66.4 
select * from country where LifeExpectancy in (38.3, 66.4);

# Question-4: Get the name, continent, population and GNP column from 
-- the table where the population is not from 5 thousand to 2 lakh.
select name, continent, population, GNP from country where population
not between 5000 and 200000;

# Question-5: Get the name, continent and region from the country table 
-- where the continent is not same as Europe. 
select name, continent, region from country where continent != 'Europe';

# Question-6: Get the country name, continent and region from the country 
-- where the second letter of the region is 'a'. 
select name, continent, region from country where region like '_a%';

# Question-7: Get the country name, continent and region from the country 
-- where in the continent the last third character is 'i'
select name, continent, region from country where continent like '%i__';

# Question-8: Get the country name, continent and region from the country 
-- where the continent name should be minimum of 5 characters.
select name, continent, region from country where continent like '%_____%';

# Question-9: Get the country name, continent and region from the country 
-- where in the continent the second letter is 'c' and second 
-- last character is 'i'
select name, continent, region from country where continent like '_c%i_';

# Question-10: Now, Get the country name, continent and region from the country
-- where atleast two 'a' should be present seperated with the character. 
select name, continent, region from country where name like '%a_a%';

# Question-11: Extract all the details of Albania and Netherlands 
-- country from the country table.
select * from country where name in ('Albania', 'Netherlands');

# Question-12: Find only those country whose country name's first character 
-- should be equal to continent's first character
select name, continent from country where substr(name, 1, 1) = substr(continent, 1, 1);

# Question-13: Find only those country whose country name's starting 
-- 3 characters should be 'alg' 
select * from country where name like 'alg%';
select * from country where substr(name, 1, 3) = 'alg';

# Question-14: Find the unique goverment in 'Asia' 
select count(distinct(GovernmentForm)) from country where continent like 'Asia';

# Question-15 Find the total population only which is available 
-- in 'Africa' Continent
select continent, sum(population) from country where continent = 'Africa';

