show databases; # To see all databases
use sakila; 	# To use a particular database
select database();	# To check which database we are using
show tables;	# To see all databases in our database
desc actor;		# To see the structure of table


show databases;
use world;
select name, population from city;
select name, population+10 as 'new_population' from city;
 
select name, population from city where population between 1 and 50; 
select name, population from city where population in (42, 322, 2323); # If population is 42, 322, 2323 then show the row

select name, population from city where population = 42; # select row where city have population of 42 exactly

