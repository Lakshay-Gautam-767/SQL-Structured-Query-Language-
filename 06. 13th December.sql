# 13th December 

# Numeric Function, Date Function
use world;
select * from country;
select LifeExpectancy from country;
 
select LifeExpectancy, round(LifeExpectancy) from country; # If value >= .5 then, it convert into upper value

select 83.62, round(83.62); # 83.62 ----> 84 because there is 6 after decimal point


# Question-1
/*
But what if, we do not want to round off the whole number we only want 
to round off the decimal value? 
Like in 83.62,  We only want to round off the *'6'* here(83.62, 1), then?
(means we want to round off the 1st decimal place here), here it is '6' 
on 1st decimal place [83.62]

Then we check the right side value after 6(1st decimal place). here there is '2'
2 < 5, so it will remain '.6', no change. 
# Result 83.6
*/
select 83.62, round(83.62, 1);

# Now another Question-2
/*Like in 83.68,  We only want to round off the *'8'* here(83.68, 2), then?
(means we want to round off the 2nd decimal place here), here it is '8' 
on 2nd decimal place [83.68]
Then we check the right side value after 8. here there is nothing, means '0'
0 < 5, so it will remain '8', no change. 
# Result 83.68
*/
select 83.68, round(83.68, 2);


# Now another Question-3
/*Like in 83.687,  We only want to round off the *'8'* here(83.68, 2), then?
(means we want to round off the 2nd decimal place here), here it is '8' 
on 2nd decimal place [83.687]
Then we check the right side value after 8. here there is '7'
7 !< 5, so it will become '9', promotted. 
# Result 83.69 
*/
select 83.687, round(83.687, 2);

/*
Summary: To round off a number, look at the digit to the immediate right 
of the target decimal place. If that digit is less than 5, the target value
 remains unchanged. However, if it is 5 or greater, the target value is 
 rounded up by 1.
*/

/*
456.23
6 ------> one's place
5 ------> ten's place
4 ------> hundred's place
Now Tricky Question on HackerOne: Round Off to the nearest hundred's place.
OR MAY BE 
Round Off to the nearest tenth/ten's place.
So in the [456.23] if we are talking about ten's place then it means '56'
Either this 56 will become 60 or 50. 


round(6.23, 1) It means we want to round of the Decimal place

round(6.23, -1) It means we want to round off before the Decimal place
-1 means we want to round off 6. 
Situation:
			If 6 !< 5:
				then: 6 will become 10
			Elif 6 < 5:  (Hypothetical Situation)
				then: 6 will remain 0. */
select (6.23), round(6.23, -1);

/*
Now Question: 
round(46.23, -1)
What will be the result? 
# Result: 50
# Reason: 6 becomes 10, so than 1 carry will be on 4. Basic Calculation Further  
*/
select (46.23), round(46.23, -1);


/*
Now Question: 
round(46.23, -2)
What will be the result? 
It should come in your mind that, either this 4 become 0 or 100
# Result: 0
*/
select (46.23), round(46.23, -2);

/*
Now Question: 
round(76.23, -2)
What will be the result? 
# Result: 100
*/
select (76.23), round(76.23, -2);


/*
Now Question: 
round(276.23, -2)
What will be the result? 
# Result: 300
*/
select (276.23), round(276.23, -2);

# Imaginary Question
select (1276.23), round(1276.23, -2);
# Result: 1300


/*
Now Question: 
round(476.23, -3)
What will be the result? 
Think: Is 4 less than 5? if yes then 4---> 0, If Not then x ----> x+1 
# Result: 0
*/
select (476.23), round(476.23, -3);

# Now If round(476.23, -5)
# Think: Toh esmein -5 pe 0 hai, so 0 < 5. 
# Remember: - means (decimal se pehle)
# Result: 0
select (476.23), round(476.23, -5);
-- ---------------------------------------------------------------------
-- ---------------------------------------------------------------------

# Truncate: It just extracts the decimal values. It does not do round off. 
select 456.67, round(456.67, 1), truncate(456.67, 2); 

# Mod: It helps to find the remainder of (a,b). It means (a % b)
select mod(43, 3), mod(43.6, 3);

# Power: Helps to find out the exponential/power of (x, y) it means (x ^ y)
# pow(base, exponent) function returns the value of a number raised 
--    to the power of another number (for example, pow(2, 3) returns 8).
select pow(2,3);

# ceil: The ceil() function returns the smallest integer value
--      that is greater than or equal to a specified number.
select ceil(4.2);
select ceil(4);

# floor: It converts float/decimal number into the integer value.
# The floor() function returns the largest integer value that is 
--            less than or equal to a specified number.
select floor(3.99999); 
select floor(3);

# Floor jyada kaam mein nhi ata. Round jyada kaam mein ata hai.
# ================================================================================

# Date: There are many inbuilt functions inside date. Their main role is to print 
     -- the date and time. 
select now(), current_timestamp(); #   It print the current date and time
select curtime(), current_time();   # It only print current time
select curdate(), current_date();   # It only print current date

-- add date
select now(), adddate('2025-10-29', 90);

use sakila; 
select * from payment;
select payment_date, adddate(payment_date, 2) from payment;


select now(), adddate(now(), interval 3 month); 

# subdate (Subtract Date)
select subdate(now(), 2); 

# To find your current Year and month, day
select year(now()), month(now()), day(now()), week(now());

# Extract: We can also extract Day, month, year, week from Extract. 
select extract(day from now()), extract(month from now()),
 extract(year from now()), extract(week from now());

/*
DATE_FORMAT(date, format): DATE_FORMAT function is used to 
display a date in a specific format. While functions like EXTRACT
or YEAR give you numeric values, DATE_FORMAT allows you to 
represent those values as Strings (text).
*/

select date_format(now(), '(%D-%M-%Y);  (%d-%m-%y);');
select date_format(now(), '(%H/%h:%i:%s %p)/%r;');
select date_format(now(), '(%W/%w)');  
select date_format(now(), '(%a %b)');

# =============================================================
/* Distinct: 
--> Helps to find out unique values
--> Remove duplicate elements. 
*/
use world;
select continent from country;  # Problem: Many Duplicate Continents

# AIM: We Want to find the unique continent (Basically wants to 
 --    remove the Duplicate Continent) 

select distinct(continent) from country;
# -----------------------------------------------------------------------------------
# Count: It counts the total no of values in column. 
select count(continent) from country; # It count all continent names
select count(distinct(continent)) from country;  # It count only unique continent names
# ====================================================================================
