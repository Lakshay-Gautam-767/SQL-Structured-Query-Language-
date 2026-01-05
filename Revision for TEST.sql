show databases;
use world;
select database(); -- To see which database we are currently using
create database school;
show databases;
show tables;
desc city;
select * from city;
select population, name from city;
select name, population, population + 10 from city;
select name, populATION
from city; -- case insensitive
select name, population + 12 + 124 + 535 + 5353 as 'alias' from city;

# Question 1: Write a query to fetch all columns from the city table where 
-- the district is exactly 'kabol'.
select * from city where district = 'kabol';

# Question 2: Retrieve all data from the city table for every district 
-- except for the one named 'kabol'.
select * from city where district != 'kabol';

# Question 3: Select all columns from the country table, but only for 
-- the countries named 'India' or 'Pakistan'.
select * from country where name in ('India', 'Pakistan');

# Question 4: Get all records from the country table where the continent 
-- is 'Asia'.
select * from country where continent = 'Asia';

# Question 5: List only the name and independence year from the country 
-- table for all countries that gained independence between the years 
-- 1901 and 2000. 
select name, indepyear from country where indepyear between 1901 and 2000;
 
# Question 6: Write a query to fetch the Code, Name, and Region from the 
-- country table, excluding those where the region is 'middle east'.
select code, name, region from country where region != 'middle east';

# Question 7: Retrieve the Name, IndepYear, and Population from the country 
-- table, along with a new calculated column showing a 10% increase in the 
-- current population.
select name, indepyear, population, population*1.1 as 'Expected'
from country;

# Question 8: Select all columns from the country table for countries where 
-- the LifeExpectancy is exactly 38.3 or 66.4.
select * from country where LifeExpectancy in (38.3, 66.4);

# Question 9: Get the Name, Continent, Population, and GNP from the country 
-- table for all countries where the population is not within the range of 
-- 5,000 to 200,000.
select name, continent, population, GNP from country where population 
not between 5000 and 200000;

# Question 10: Write a query to fetch the Name and Continent from the country 
-- table for all countries located in 'Asia' using the LIKE operator.
select name, continent from country where continent like 'Asia';

# Question 11: Retrieve the Name and Continent from the country table where 
-- the Continent starts with the letter 'A'.
select name, continent from country where continent like 'A%';

# Question 12: Select the Name and Continent from the country table for 
-- countries where the Continent ends with the letter 'a'.
select name, continent from country where continent like '%a';

# Question 13: Find the Name of all countries where the name contains the 
-- sequence 'ad' anywhere in it.
select name from country where name like '%ad%';

# Question 14: Get the Name from the country table for countries where the 
-- name starts with 'Ir' and is exactly 4 characters long.
select name from country where name like 'Ir__';

# Question 15: Write a query to retrieve the Name, Continent, and Region from 
-- the country table where the continent is not 'Europe'.
select name, continent, region from country where continent != 'Europe';

# Question 16: Find the Name, Continent, and Region of countries where the 
-- second letter of the region name is 'a'.
select name, continent, region from country where region like '_a%';

# Question 17: Get the Name, Continent, and Region from the country table 
-- where the third character from the end of the continent name is 'i'.
select name, continent, region from country where continent like '%i__';

# Question 18: List the Name, Continent, and Region from the country table 
-- for all countries where the continent name has a minimum of 5 characters.
select name, continent, region from country where continent like '%_____%';

# Question 19: Fetch the Name, Continent, and Region from the country table 
-- where the second letter of the continent is 'c' and the second-to-last 
-- character is 'i'.
select name, continent, region from country where continent like '_c%i_';

# Question 20: Get the Name, Continent, and Region from the country table 
-- where the country name contains at least two 'a's separated by at least 
-- one other character.
select name, continent, region from country where name like '%a_a%';

# Question 21: Write a query to fetch the Name and Continent from the country 
-- table for all countries located in either 'Asia' or 'Africa' using the OR 
-- operator.
select name, continent from country where continent = 'Asia' or 
continent = 'Africa';

# Question 22: Retrieve the Name and Continent from the country table for 
-- countries in 'Asia' or 'Africa' using the IN operator.
select name, continent from country where continent in ('Asia','Africa');

# Question 23: (Interview Style): Extract all details from the country table 
-- specifically for the countries 'Albania' and 'Netherlands'. 
-- (Note: Think about why AND won't work here even though we are asking for 
-- both countries).
select * from country where name like 'Albania' or name like 'Netherlands';

# Question 24: Write a query to display the Name of all countries in all small 
-- letters. Give this column an alias named 'lower'.
select lower(name) as 'lower' from country;

# Question 25: Show the Name of countries and a second column that tells you 
-- exactly how many characters are in each name.
select name, char_length(name) from country;

# Question 26: From the actor table, join the first_name and last_name together 
-- with a single space between them.
use sakila; 
select concat(first_name, ' ', last_name) as 'Full Name' from actor;

# Question 27: Display the first_name and last_name combined as one column 
-- called 'Full Name', ensuring there is a space between them.
select concat_ws(' ', first_name, last_name) as 'Full Name' from actor; 

# Question 28: For the first_name column, show only the part of the name 
-- starting from the 3rd letter until the very end.
select first_name, substr(first_name, 3) from actor;

# Question 29: Get only the second letter of every first_name from the 
-- actor table.
select first_name, substr(first_name, 2,1) from actor; 

# Question 30: You have the string 'xxx hey xxx'. Write a query that 
-- cleans this string by removing the 'x' characters from both the start 
-- and the end.
select 'xxx hey xxx', trim(both "x" from 'xxx hey xxx');

# Question 31: Modify the display of first_name so that every value shown 
-- is exactly 4 characters long. If a name is shorter than 4, add '#' to 
-- the left side to fill the gap.
select first_name, lpad(first_name, 4, '#') from actor;

# Question 32: Find the numerical position where the letter 'E' first 
-- appears in each first_name.
select first_name, instr(first_name, 'E') from actor; 

# Question 33: Look for the letter 'E' in the first_name, but your search 
-- should ignore the first two characters and start looking from the 3rd 
-- character onwards.
select first_name, locate('E', first_name, 3) from actor;

# Question 34: Write a query to swap every 'P' found in the first_name 
-- column with a '#' symbol.
select first_name, replace(first_name, 'P', '#') from actor;

# Question 35: Compare the strings 'nick' and 'nick2'. What result do you 
-- get, and what does that number tell you about which string is "smaller" 
-- or "greater"?
select strcmp('nick', 'nick2');

# Question 36: Write a query to display the Name and Continent of all 
-- countries, but show the name in all capital letters and the continent in 
-- all small letters.
use world;
select upper(name), lower(continent) from country;

# Question 36: Create a single string for each row that combines the Name, Code, 
-- and the word 'regex', separated by hyphens (e.g., Aruba-ABW-regex).
select concat_ws('-', name, code, 'regex') from country;

# Question 37: From the country table, extract exactly 3 characters from the country 
-- name, starting from the 2nd character, but only for countries whose name starts 
-- with 'Ug'.
select name, substr(name, 2, 3) from country where name like 'Ug%';


# Question 38: Retrieve the last 3 characters of every country name.
select name, substr(name, -3, 3) from country;

# Question 39: For each country, find the last 5 characters of the name, but from 
-- those five, display only the first 3.
select name, substr(name, -5, 5) from country limit 3;


