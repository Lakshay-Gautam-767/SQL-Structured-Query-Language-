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
	
select continent, sum(population) from country where sum(population)>100 group by continent;



