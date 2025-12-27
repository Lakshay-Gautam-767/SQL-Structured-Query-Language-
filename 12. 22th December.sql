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

# Another way to check it.
select count(id), count(distinct id) from city;
select count(population), count(distinct population) from city; # clearly notice, duplicate values exists.

select * from country;  # --> Code ---> Primary Key
select * from city;     # --> CountryCode ---> Foreign Key

# Creating Alias of Table
select ct.name, ct.district from city as ct; # ✅

/*
# Common Error 
select ct.name, ct.district from city as 'ct'; ❌ -- NOT possible 
-- with 'ct' (single quotes), but it was possible while creating alias 
-- for column name. 
*/ 

# Creating alias of table and accessing columns
select ct.name, ct.district from city as ct; 
select cnty.code, cnty.name from country as cnty;

# Question: We want the city name and their respective country name.
-- city.countrycode = country.code
-- ct.countrycode = cnty.code     
select ct.name, cnty.name from city as ct join country as cnty ON 
ct.countrycode = cnty.code;
 
/* Understanding Error
select ct.name, cnty.name, name from city as ct join country as cnty ON 
ct.countrycode = cnty.code; -- error; name --> ambiguous(name of city or country?) 
*/

# Question: You need to find the city name and the population of the city
-- along with the governmentForm in that city with the population from highest
-- to the lowest. [Easy Task 😎]
select ct.name, ct.population, cnty.GovernmentForm from city as ct join 
country as cnty ON ct.countrycode = cnty.code ORDER by ct.population DESC;

# Question: You need to get the country name, country population and all 
-- the languages spoken in each country. 
-- HINT: Use Country table and CountryLanguage Table.   
select cnty.name, cnty.population, cl.language from country as cnty 
join countrylanguage as cl ON cnty.code = cl.countrycode; 

-- HERE 
# Primary Key ---> Code in country table.  
# Foreign Key ---> CountryCode in countrylanguage table. 
-- =====================================================================
use sakila;
select * from actor;
select * from film_actor;

# Question: Get the actor_id and the first name along with it's film id.
select ar.actor_id, ar.first_name, fm.film_id from actor as ar
join film_actor as fm ON ar.actor_id = fm.actor_id;

-- ====================================================================
# In film actor table can anyone be the primary key?
describe film_actor; 
select * from film_actor;
select count(film_id), count(distinct film_id) from film_actor;
select count(actor_id), count(distinct actor_id) from film_actor;

select film_id, count(film_id) from film_actor group by film_id 
having film_id > 1;  # New IDEA/Invention 
-- ====================================================================
/*
# Question: What is the actor name along with the movie he has worked.
You have to use 3 Tables here. 
--> Actor Table
--> Film_Actor Table
--> Film Table 
*/
select * from actor;
select * from film_actor;
select * from film;

select ar.first_name, ar.last_name, fm.title from actor as ar
join film_actor as fa join film as fm 
ON ar.actor_id = fa.actor_id and fa.film_id = fm.film_id;
-- ====================================================================
# Learning Assigment: Learn about these: 👇
# 1. Left Join
# 2. Right Join
# 3. Natural Join