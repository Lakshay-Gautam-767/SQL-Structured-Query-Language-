# 11th December 
#Questions
# 1. Get the name, continent and region from the country table 
#    where the continent is not same as Europe. 
select name, continent, region from country where continent != 'Europe';
# 2. Get the country name, continent and region from the country 
   # where the second letter of the region is 'a'. 
select name, continent, region from country where region like '_a%';
# 3. Get the country name, continent and region from the country 
   # where in the continent the last third character is 'i'
select name, continent, region from country where continent like '%i__';
# 4. Get the country name, continent and region from the country 
   # where the continent name should be minimum of 5 characters.
select name, continent, region from country where continent like '_____';
# 5. Get the country name, continent and region from the country 
   # where in the continent the second letter is 'c' and second 
   # last character is 'i'
select name, continent, region from country where continent like '_c%i_';
# 6. Now, Get the country name, continent and region from the country
# where atleast two 'a' should be present seperated with the character. 
select name, continent, region from country where name like '%a_a%';
-- ========================================
# Operators in SQL 
-- and, or
-- and: if both condition, condition 1 and condition 2 are correct then answer will be true otherwise false.alter
-- or: if anyone condition is correct then true otherwise false

-- both are same 
select name, continent from country where continent = 'Asia' or continent = 'Africa';
select name, continent from country where continent in ('Asia', 'Africa');


# --------------------------------------------------
# IQ Question: Extract all the details of Albania and Netherlands 
			 # country from the country table.

-- This is the biggest mistake we do. 
select * from country where name = 'Albania' and name = 'Netherlands'; -- This is wrong.
# We know that inside the Country name there cannot be two values 
# inside one column(name). So even if there is 'and' in question. 
# then also you cannot use 'and' operator here. Use your common sense. 

# So correct answer is 
select * from country where name like 'Albania' or name like 'Netherlands';
# -----------------------------------------------------
# Concatenating
# concat(name, ' ', 'City') 
# like if name = 'Shimla' then
# Output --> 'Shimla City'
# -------------------------------------
# Pre-Requisite[3 String Video]
select * from country;
# String Functions 
# lower(column_name): Converts into lower characters
select name, lower(name) as 'lower' from country;

# length(column_name): Count total no of characters but
#      not in the way you think, it return length of string in bytes
#  english character is generally of 1 byte, but other language 
#  may have different size of characters in bytes. 
select name, length(name) from country;

# char_length(column_name): It actually count the total number of 
	# characters in a string. It is a better way to count the total
	# no of characters in a string.

use sakila;
# concat(first_name, last_name): It concatenate/combine or add the
# 	value. So there is no seperator by default. We have to pass
#	on the seperator.
select first_name, last_name, concat(first_name,' ' , last_name) from actor;

# To overcome this problem, of putting this seperator again and again
# between all the field/column. So there is another method that is 
# concate_ws

# concate_ws: It is a method which contains the seperator
# in the starting and we provide the column name in the last. 
select first_name, last_name, concat_ws(' ', first_name, last_name) as 'Full Name' from actor;

# substr(): So the substring method basically help us in  extracting
# some particular portion of the data from a index position. and that
# particular index position is going to start from 1, not from 0. 
select first_name, substr(first_name, 1) from actor;
select first_name, substr(first_name, 3) from actor;

# We are telling to extract the data from index 2 and we want only
# 1 character.
select first_name, substr(first_name, 2, 1) from actor;

# trim method: It helps to remove white spaces from our data/column 
 -- name. 
select trim("    hey ");
# Leading: It helps to remove character from starting of our 
-- data/column_name. and we can also specify which character 
-- we want to remove.
select trim(leading " " from "    hey   ");

# Trailing: It helps to remove character from last values of our
-- data/column_name. and we can also specify which character 
-- we want to remove.
select trim(trailing " " from "    hey      " );

# Both: If we want to remove character from both left and right
-- then we use both. 
select trim(both "x" from "xxx hey xxx"  );
	# Note: It cannot remove it from middle or it cannot remove 
	# if you have extra white spaces in the beginning like this
	# select trim(both "x" from " xxx hxxxxey xxx"  ); -- fail to remove    


# Padding is used to ensure all strings in a column reach a 
-- specific length by adding a filler character. This is 
-- commonly used for formatting numerical data like phone numbers 
-- or salaries.

# lpad: Adds characters to the left side of the string 
-- until the desired length is met.
select first_name, lpad(first_name, 4, "#") from actor;  -- mostly used for numerical data like(salary, etc)

# rpad: Adds characters to the right side of the string.
select first_name, rpad(first_name, 5, "_") from actor;

# : Instr method is basically used to get the index 
-- position of the character/substring. It returns the index
-- of the first occurence of substring.
select first_name, instr(first_name, "E") from actor; -- If "E" is not present then it will give 0

# locate: Locate helps you to extract some particular substring
-- and their index position but from a certain position that 
-- we provide.
select first_name, locate("E", first_name, 3) from actor; 

# replace: The REPLACE method is used to replace a value 
-- within a string with another specified character or substring.
select first_name, replace(first_name, "P", "#") from actor;

# strcmp: STRCMP method is used to check that whether the string
-- are same or not. 
-- If both string are same then it gives 0
-- If first string is smaller as compare to 2nd then  it gives -1 
-- If first string is greater and second string is smaller then it gives 1
-- If any string is null in it, then it cannot be compared so result will be null itself.
select strcmp('nick', 'nick');
select strcmp('nick', 'nick2');
select strcmp('nick2', 'nick');
select strcmp('nick', null);