# ------------------------------------------
# 12th December
-- -----------------------------------
# Revision
# select --> data retrieve/access
# query --> multiple line and in case sensitive
# where (filter) and, or, between, in, like
# between(work on range of values)
# in (work on specific set of values)
# like (It is a operator which helps to find pattern) --> (%, _)
-- -----------------------------------
# Functions: Functions are basically a set of statements, which
-- we write only one time. and we can use them n number of times. 
	-- code reusable
# Types of functions
# 1) Scaler Functions: It will be applied on each row and it will
-- give output for each row.
		# row by row (result for each row)
# 2) Multi-line Functions: It will be applied on multiple lines
-- and it will give one output.	

# Note: In the starting we will learn scaler functions.
# scaler can be apply on anyone like (date, int, float, string)

# String Functions (Very Important for interviews, solving ques.) 
-- case conversion 
use world;
select name, continent, upper(name), lower(name) from country; 

-- concat
select name, continent, concat(name, '-', code, '-','regex') from country;
-- concat with a seperator
select name, continent, concat_ws('-', name, code, 'regex') from country;

-- substr (sub string): --> character extract based on the position.
select name, substr(name, 1), substr(name,2,3) from country;  # 2 se start kiya 3 character chahiye.

select name, substr(name, 2, 4) from country where name like 'Ug%';

select name, substr(name, -3) from country; # Yha pe -3 ka mtlb hai ki last ke 3 character chahiye
select name, substr(name, -5, 3) from country; # last ke 5 character se shuru krke keval 3 character chahiye. 

# Question: Find only those country whose country name's first 
-- character should be equal to continent's first character.
select name, continent from country where substr(name, 1, 1) = substr(continent, 1, 1);
# Ques-2: Find only those country whose country name's starting 
# 3 characters should be 'alg' 
select name, continent from country where substr(name, 1, 3) = 'alg';

-- instr => search position of character
select name, instr(name, 'e') from country;

-- length => (kitna byte use hua)
select length(' yash');
select length('ॐ'); 

-- char_length: to get total character 
select char_length('ॐ'); 

-- trim: (remove extra spaces or characters from the string)
-- ltrim, rtrim

# ltrim used to remove only white space from left side
# rtrim used to remove only white space from right side
# trim: But trim used to remove not only white space but it can also 
#       remove any character from both side, or left side, or right side
#       according to our need.

select char_length('   yash     ');
select char_length(trim('   yash     '));
select ltrim('      yash        '); 
select rtrim('      yash        '); 

# Data is case sensitive
select trim(both 'g' from '    yashgggggggg');

select name, trim(both 'a' from name) from country where name like '%a';

select name, population from country where name in ('India', 'China');

-- lpad and rpad -- to create data of fixed characters. 
select name, population, lpad(population, 10, 0) from country;

# HomeWork: Solve Questions on HackerOne after selecting the filter
# SQL (Basic) in skills, Easy in Difficulty, Basic Select in Domain
#==================================================================