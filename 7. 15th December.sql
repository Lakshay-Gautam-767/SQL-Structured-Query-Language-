# 15th December


# We have already learned functions like (date, string, number) [scalar functions]
-- Now We Will Learn Aggregate Functions

# Aggregate Functions (To perform the calculations on set of rows) 
  -- [multi-line function category] (means it will applied on
  --       				             multiple lines and will give only one or
  --                                 two/three rows output as a result)


select * from country;
select count(indepyear) from country;  #Counts total no of values in indepyear column

# count(*) means every rows will be counted even if there is missing data 
-- or have null values, all will be counted.
select count(*) from country; 

# Note but 'count(column_name)' means only those rows data will be counted 
-- where there is NOT NULL, means data is not missing. only those value counts. 
select count(*), count(indepyear) from country;

/* If we wish to find out the unique values combination on two or more columns 
then we can use distinct here, to do this */

select distinct continent, region from country;

-- Note WE Generally do not apply distinct on numbers because there is very less
-- chance of duplicacy in numbers, but we apply distinct on strings because there
-- is high chance of duplicacy

select count(population) from country;  #---- counts total no of population of world 
select sum(population) from country;    # --- calculate the sum/addition of all population
select avg(population) from country;    # --- calculate average of all population 


# Question-1 Find the unique goverment in 'Asia' 
select count(distinct(GovernmentForm)) from country where continent = 'Asia';

# Question-2 Find the total population only which is available 
-- in 'Africa' Continent
select sum(population) from country where continent = 'Africa';

select count(name), sum(population), count(distinct(indepyear)) 
from country where continent = 'Africa';

/*
# IMPORTANT NOTE Aggregate vs. Normal Columns 
You cannot select a normal column (like Name) alongside an 
aggregate function (like COUNT) unless you use a grouping 
mechanism. This is because the aggregate function returns one 
row, while the normal column might have hundreds of rows, 
causing a mismatch. */

/*
Question
Get the total country, the average surface area, the total 
population for the country which has got their independence from
the year 1947 to 1998. (these two years should not be included) */

select count(name), avg(SurfaceArea), sum(population) from country 
where indepyear > 1947 and indepyear < 1998;

/*
Question 
Get the total number of country and the number of unique continents
along with the average population and the total capitals
for the country starting with 'a' or starting with 'd' */ 
  
select count(name), count(distinct(continent)), avg(population),
sum(capital) from country where name like 'A%' or name like 'D%';



# Question Calculate how many country are there in 'Asia'
select continent, count(name) from country where continent = 'Asia';
select continent, count(name) from country where continent = 'Africa'; # Now for Africa
select continent, count(name) from country where continent = 'Europe'; # Now for Europe

# Very Lengthy Task 😡😰
# Better option is to use the "group by"
select continent, count(*) from country group by continent;
 


/*
VERY IMPORTANT NOTE
POINTS WHICH I Have learned.
1.  We never use "distinct" and "group by" together, Agr hum "distinct" ko 
	"group by" vale column mein, apply krna chahte hai.  	 
	====> REASON: Because group by automatically, values ko unique kr deta hai.	
    IndepYear ✅	
	DISTINCT(IndepYear) ❌ (Wrong Way, group by automatically, do distinct)

2. Use COUNT(*) in "by group", instead of COUNT(IndepYear) 
	COUNT(*)  ✅ (Use in proffesional Industry)
	COUNT(IndepYear)  ❌ (Wrong Way)
	SELECT IndepYear, COUNT(*) from country group by IndepYear;

3. Joh ColumnName group by mein hai, vohi ColumnName hum select mein dalenge.
	SELECT IndepYear, COUNT(*) from country group by IndepYear;
    Notice group by aur Select, dono mein IndepYear hai, dono mein same. 
    So Group By mein hum second column nhi dal skte. 
		KYUNKI:
        FOR Example: Let's suppose This is Database 
			Name,IndepYear
			India,1947
			Pakistan,1947
			Myanmar,1948
            
            NOW When you run "SELECT IndepYear, COUNT(*), Name from country 
            group by IndepYear;"
				So jab aap kahenge GROUP BY IndepYear, toh database 1947 ka 
                ek hi row banayega.
					1.  Count ke liye toh asaan hai: Wo ginte hue bol dega 
					    "1947 mein 2 countries hain".
					2.  Lekin jab aap SELECT Name karte hain, toh database 
						confuse ho jata hai: "1947 wali ek row mein main 
                        'India' likhu ya 'Pakistan'?" 
-- ==============================================================================
 		NOTE 📝 I Would say ki jab tumhein esa likhne ka man ho 
COUNT(IndepYear) aur "group by" bhi IndepYear ho toh COUNT(*) likho 
but agr tumhara COUNT(name) likhne ka man hai aur group by IndepYear
hai(dono different hai) then tum COUNT(name) likhoge.
========================================================================
Pdh lena jaise taise krke, I know yeh overdose ho rha hai but pdh lena 
Esko dhyan se. 
	COUNT(*)  SQL is Asia wale tukde mein jaakar total lines
			  count karega. Lines = 3. Toh result aayega 3.

	COUNT(Name) SQL Name column mein jayega aur dekhega kitne 
				 Non-Null names hain. Lines = 3. Toh result aayega 3.

	COUNT(IndepYear) SQL IndepYear column mein jayega. Wahan China 
    ka year NULL hai, toh usey skip kar dega. Lines = 2. Toh result aayega 2.
*/

# Find how many country get independent in each year
select indepyear, count(*) from country group by indepyear;
select name, indepyear from country where indepyear = 1971;



select *  from country;
# Find how many country have different Government form. 
select GovernmentForm, count(*) from country group by GovernmentForm;

# Note-2 Whenever we do "group by" then we cannot select any other column.

select continent, count(name), sum(population), avg(population),
max(population), min(population), max(indepyear), min(indepyear) from
country group by continent;

# Question In each country you have to find out the total city,
# the total district, the unique district, the total population,
# from the city table.
select countrycode, count(name),count(district), count(distinct(district)),
sum(population) from city group by countrycode;


select * from city;
select countrycode, count(*), count(district), count(distinct district),
sum(Population) from city group by countrycode;
-- ================================================================================
# Self Study
# Extra Practice Questions from GEMINI

/*Q-1: Count countries per Continent
	Task Find out how many countries are there in each continent.
	Hint Use COUNT() and group by the Continent column in the 
		  country table. */

SELECT Continent, count(name) from country group by continent;  
/*
Aapko COUNT(ColumnName) tabhi use karna chahiye jab aap jan-bujhkar sirf 
unhi rows ko count karna chahte hain jahan data present ho.

	Example:
		SELECT Continent, COUNT(*) FROM country... -> Saari countries count hongi.
        
		SELECT Continent, COUNT(IndepYear) FROM country... -> Sirf wahi countries 
													 count hongi jo independent hain.
*/


# OR 

SELECT Continent, count(*) from country group by continent;  # Theory is written below

/*
# Doubt: Esmein '*' use krne se sari country name kaise count ho gyi 
continent ki. continent ka kuch aur bhi toh count ho skta tha like 
LifeExpectancy, ya kuch aur . kyunki itni sari columns hai toh country 
ka name kaise ho gya?  
#-------------------------------------------
1. COUNT(*) ka matlab kya hai?
Jab aapne likha GROUP BY Continent, toh database ne continents ke 
dher (groups) bana diye.
		* Asia ka ek dher
		* Europe ka ek dher
        
Ab COUNT(*) ka matlab hai: "Is group ke dher mein kitni rows (records)
hain, unhe gino." Kyunki har row ek country ko represent karti hai, 
isliye row ginnne ka matlab indirectly Country count karna hi hota hai.
Database ko farak nahi padta ki column mein Name likha hai ya LifeExpectancy,
wo bas "entry" ginta hai.
*/

/*
Q2. Average Life Expectancy per Region
	Task Display each Region and its average LifeExpectancy.
	Hint Use AVG(LifeExpectancy) and group by Region. */

select * from country;
select region, avg(LifeExpectancy) from country group by region;


/*
Q3. Total Population of each Continent (Filtered)
	Task Show the total population of each continent. 
*/
select * from country;
select Continent, sum(Population) from country group by Continent;


/*
Q-4. Number of Films per Rating
	Task The film table has a rating column (G, PG, R, etc.). 
    Find out how many movies are there for each rating.
	
    Hint Select rating and COUNT(film_id) from the film table. */
use sakila;
select * from film_list;
select rating, count(distinct(title)) from film_list group by rating;
