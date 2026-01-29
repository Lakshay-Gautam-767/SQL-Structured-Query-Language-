use sakila;
select * from payment;

select amount from payment where payment_id = 2 or payment_id = 3; -- It is 
-- returning more than 1 row so it is multi-row subquery. 

select * from payment where amount = (select amount from payment where
payment_id = 2 or payment_id = 3); -- Error, we can't use '=' operator with
-- Multi-row subquery because, In SQL we filter amount/data row by row(one 
-- by one) so we can't compare single/one amount with 2 amount(here).
-- so we should use 'in' here in this situation.

select * from payment where amount in (select amount from payment where 
payment_id = 2 or payment_id = 3); # Correct Code ✅, 'in' (Matches any 
-- value in the list)  
# Note: 'not in' means reverse here(should not be in the list) 

-- ===========================================================
# 1) Any
select * from payment where amount =any (select amount from payment where 
payment_id = 2 or payment_id = 3); # =any (0.99, 5.99), amount can be 
-- equal to 0.99 or amount equals to 5.99 
# Note: '=any' and 'in' both perform same task.

select * from payment where amount >any (select amount from payment where 
payment_id = 2 or payment_id = 3); # >any, means greater than any values

select * from payment where amount <any (select amount from payment where 
payment_id = 2 or payment_id = 3); # <any, means less than any values of 
-- the subset. 

# 2) All
# Note: we cannot do '=all' ❌ (This is wrong, give error)

select * from payment where amount >all (select amount from payment where 
payment_id = 2 or payment_id = 3); # >all, means greater than all values 
-- of the subquery. (greater than, maximum value of the subquery)

select * from payment where amount <all (select amount from payment where 
payment_id = 2 or payment_id = 3); # <all, means less than all values 
-- of the subquery. (less than, minimum value of the subquery)
 
 # Note: We can't compare NULL with any values(like 0, 43, etc)
 # ifnull(gdp, 0): This function means, inside gdp column if null is present 
				-- then replace it with 0. 

# Solve only question-6 on this website for now. 
# Website: https://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial 

# Learning Assigment:
# 1) What is Correlated Subquery, and how it  works?
# 2) What are Constraints in SQL? 