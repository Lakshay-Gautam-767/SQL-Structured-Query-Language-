# 5th January
/* Revising Old Code
use world;
select * from city;
select * from country;

city join country on city.countrycode = country.code
where

select * from country order by population, name;

CASE when condition then output

case 
when age > 18 then '__________'
else '323232'
end 
*/

/*
# Subquery: A SQL subquery is a query within another query, It is used to
-- perform the calculations based on related tables and also used to 
-- perform calculations based on dynamic conditions.

Example: I need to get the name of a person whose salary is same as the 
salary of Tushar.  
+---------+--------+
| name    | Salary |
+---------+--------+
| Tushar  | 10000  |
| Aman    | 20000  |
| Shubham | 10000  |
+---------+--------+
1) What is the salary of Tushar? 
	select salary from table where name = 'Tushar'; 
2) If we knew the answer(1) then we can find out the person whose salary 
   is same as the salary of tushar. 
	select * from table where salary = 10000;
    
Now Merge It, dynamically. (Subquery)
select * from table where salary = (select salary from table where name = 'Tushar');
|_____________________________|      |___________________________________________|
          Outer Query                                 Inner Query

Question-1: We need to find out only those payment information whose amount should be 
		  equal to payment_id 5. */
use sakila;
select * from sakila.payment where amount = (select amount from sakila.payment where
payment_id = 5);

# Question-2: Find all the payment information where the staff surving for the 
-- payment id 8 should be same. 
select * from sakila.payment where staff_id = (select staff_id from 
sakila.payment where payment_id = 8);

# Question-3: Get the payment_id, amount and the payment date where the month of payment 
-- should be same as of payment_id 20. 
select payment_id, amount, payment_date from sakila.payment 
where month(payment_date) = (select month(payment_date) from sakila.payment
where payment_id = 20);

# Question-4: Get the amount and the total number of payments done for each amount, where
-- the amount should be less than the amount of rental_id 1725
select amount, count(*) from sakila.payment where 
amount < (select amount from sakila.payment where rental_id = 1725)
group by amount;

# Question-5: Get the month and the total amount spend from the payment table 
-- where the month is greater than the month of customer_id 1, with the 
-- payment_id 3
select month(payment_date), sum(amount) from sakila.payment 
where month(payment_date) > (select month(payment_date) from sakila.payment
where customer_id = 1 and payment_id = 3) group by month(payment_date);

/* 
Types of Subqueries: Based on the result returned by the inner query, subqueries 
are categorized:
A. Single-Row Subquery: The inner query returns exactly one row and one column 
                        (a single value).
    Operators used: =, >, <, >=, <=, <>.
	Note: All examples covered in this session so far were Single-Row Subqueries.

B. Multi-Row Subquery: The inner query returns multiple rows.
	Operators used: IN, ANY, ALL.
    Special Note: In multiple row subquery we can't use (>, <, =, != operators)
    Example (Preview): Finding payments that match the amounts of multiple 
    specific payment IDs.
*/
use sakila;
select * from payment where amount in (select amount from payment where 
payment_id = 2 or payment_id = 3);  -- multirow subquery

# Now on this website, solve Q-1, 2 and remaining also(for practice)
-- atleast 1 to 5.  
# Website: https://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial