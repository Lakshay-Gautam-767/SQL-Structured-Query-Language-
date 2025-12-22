-- group by
use world;
select region from country group by region;
select * from country;

 select region, count(name), count(continent), 
count(distinct(continent)) from country
group by region;

select * from country;

select region, avg(population) from country group by region;

# Incomplete Above
-- -----------------------------------------
## Make notes before 12:11 of 16th August. 
/* 
Find out how many city are there in each district from the 
city table */

select * from city;
select district, count(name)as 'Total City' from city group by district;

# In each district We want to find out the total no of city 
-- but only for those city which have a population of more than
-- 1 lakh
# where (sabse pehle execute), then group by, then aggregate function(like count)
# where ----> group by ----> count()
select district, count(name) from city where population > 100000 
group by district;


select count(name) from country where continent = 'Asia' and IndepYear > 1950;

# Ques: Get Total Country which got independence after 1950 in each continent.  
# Here also "group by" se pehle data filter hoga, then group by, then aggregate function
select continent, count(name) from country where IndepYear>1950 group by continent;

# Now we have to find total population
select continent, sum(population) from country group by continent;

# Now, find total population of those continent where the total population
-- in the continent is greater than 100 
 
# NOTE: 
# 1. Where can only filter those data which exist in our table's column. 
  -- "where sum(population) > 100" [❌ Wrong, sum(population) does not 
							     -- exist in our table, It was the output. 
                                 -- so we cannot apply "sum()" in where]

# RULE 📝: Where will only filter those data which exist in my table.


# Interview Question
# Ques: What is the difference between where and having clause? (Very common question for Interview)
/* The WHERE clause is used to filter individual rows from a table before 
   grouping. In contrast, the HAVING clause is used to filter results based 
   on aggregate columns (such as COUNT, SUM, MAX, or MIN) after the grouping 
   has been performed
    
   The WHERE clause is applied before GROUP BY, while the HAVING clause is applied 
   after GROUP BY.
*/

-- having to filter data based on aggregate column like sum, count, max
select continent, sum(population) from country group by continent 
having sum(population)>100;


# Question: You have to find out the continent name, total population 
-- for each continent where the country is having a life expectancy 
-- of greater than 35.0 % 

select continent, sum(population) from country where LifeExpectancy > 35.00
group by continent; # Read Note 👇 
# Note: We didn't use HAVING here because there is no aggregate function 
-- on LifeExpectancy. We only use having to filter aggregate column.
-- LifeExpectancy is already present so we use where, here.  


# Question-1: You need to find out the government form, total country 
-- for each government form where the total number of country should 
-- be greater than 30
select GovernmentForm, count(name) from country group by GovernmentForm 
having count(name) > 30.00;
# Or You Can Also Do Like This, Both are Same. 
select GovernmentForm, count(name) as totalcountry from country 
group by GovernmentForm having totalcountry > 30.00;

# Question-2: You need to find out GovernmentForm, the total country
-- for each GovernmentForm only for the country having their capital 
-- greater than 30 and total population greater than 3 lakh. 

select * from country;


