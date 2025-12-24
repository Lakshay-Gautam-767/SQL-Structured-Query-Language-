# 18th December
/******************************************************************************
 * DATA MODELING AND RELATIONSHIPS:                                           *
 ******************************************************************************/

-- 1. WHAT IS A DATA MODEL?
-- ========================
-- A Data Model is a way to define the structure of our data. 
-- It helps us decide how to organize, store, and manage information 
-- in our database to ensure efficiency and data integrity.

-- 2. THE THREE TYPES OF DATA MODELS
-- ================================
-- [Conceptual Model] -> High-level entities and attributes.
-- [Logical Model]    -> Defining relationships between tables.
-- [Physical Model]   -> Actual implementation (Tables, Columns, Data Types).

-- 3. WHY DO WE NEED RELATIONSHIPS?
-- ================================
-- Data segregation avoids "Data Redundancy" (Duplication).
-- Problems with single-table storage:
--   * Storage Cost    : Duplicate data = More space = More money.
--   * Performance     : Queries become slow with redundant data.
--   * Processing Cost : Machines work harder to process duplicate rows.

-- 4. KEY TERMS IN RELATIONSHIPS
-- ============================
-- > PRIMARY KEY : Makes a column UNIQUE for every row (No duplicates, No NULLs).
				-- So that we can make (One to One, One to Many, Many to One) relationship.                   
-- > FOREIGN KEY : A column that points to the Primary Key of another table.
				-- Foreign Key is used to set the relationship with another table.  

-- 5. TYPES OF RELATIONSHIPS
-- =========================
-- * One-to-One (1:1)   : Record in A matches exactly one in B.
-- * One-to-Many (1:N)  : [Most Common] One Customer -> Many Orders.
-- * Many-to-Many (M:N) : Multiple in A -> Multiple in B. 
--                        (Note: Usually avoided to prevent ambiguity).

-- 6. NORMALIZATION
-- ================
-- Definition: Technique to remove redundancy.
-- Example (1NF): No multiple values in a single cell.
-- Use Case: Keep 'City' and 'Country' in separate tables to avoid 
--           repeating country details for every city.

use world;
select * from city; 
select * from country;

-- 7. IDENTIFYING THE PRIMARY KEY
-- ==============================
-- Problem: Columns like 'Name', 'District' or 'Population' can have 
-- duplicates (e.g., Jaipur).
-- Solution: Need a unique identifier for every record.

-- * How to Verify: 
-- i) First Method: If inbuild database has mentioned column as primary key
-- Rule: Use [DESCRIBE table_name;] to check the Primary Key.
describe city; 	# ID is Primary Key here. 
describe country; # Code is Primary Key here. 

-- ii) Second Method: 
select count(code), count(distinct(code)) from country; # Both are same, 
-- that means no duplicate values are present so we can choose it as a 
-- primary key. 

-- iii) Third Method: Use common sense that if value are duplicate then it
-- can't be the primary key. 

-- * Observations:
--   - City Table    : 'ID' is the PK (Unique & No NULLs).
--   - Country Table : 'Code' (e.g., IND, AFG) is the PK.


-- 8. ESTABLISHING RELATIONSHIPS (FOREIGN KEY)
-- ==========================================
-- Definition: A Foreign Key in a "Child Table" refers to the Primary Key 
--             in a "Parent Table".

-- * Logic in World Database:
--   - Parent (Country) : PK(Primary Key) is 'Code'.
		-- Because 'Code' is unique in each row of country table (like 'IND' only one time)
--   - Child (City)    : FK(Foreigner Key) is 'CountryCode'.
		-- Because  'CountryCode' have duplicate values. (like 'AFG' many times)
-- * Why? 'CountryCode' can repeat in City table (One country has many cities),
--   linking back to one unique country.


-- 9. SQL JOINS: CONNECTING TABLES
-- ===============================
/* If we want to connect 2 or more tables than we use joins. Join helps to 
   connect the table with the help of Foreign Key and Primary Key. We use 
   join so that we can find the information from another table. */
-- Use JOIN to combine rows based on related columns.

-- [BEST PRACTICE: ALIASES]
-- To avoid "Ambiguity" (jab do tables mein same column name ho, jaise 'Name'),
-- we use short names.
-- Example: FROM City AS c | FROM Country AS co
-- Access as: c.Name (City) vs co.Name (Country)

select * from city;
select c.name, c.countrycode from city as c;

-- Example A: Joining City and Country (To get Continent)
SELECT cy.id, cy.name, cy.countrycode, cnt.code, 
cnt.name, cnt.continent FROM city AS cy
JOIN country AS cnt 
where cy.countrycode = cnt.code;    # (where) This is old way
-- <============= BOTH ARE SAME===============>
SELECT cy.id, cy.name, cy.countrycode, cnt.code, 
cnt.name, cnt.continent FROM country AS cnt
JOIN city AS cy
ON cy.countrycode = cnt.code;       # (on) This is a modern and standard way. 

-- ===========================================================================
# Question: Find the city name, city population, the country name along
-- with the governmentForm for each city.
select cy.name, cy.population, cnt.name, cnt.governmentform from city as cy
join country as cnt on cy.countrycode = cnt.code;

# Question: Get the country name, country's population and the language spoken 
-- with the percentage of each language.  
select cnt.name, cnt.population, cl.language, cl.percentage from country as cnt
join countrylanguage as cl where cnt.code = cl.countrycode;
-- *************************** END OF NOTES ***************************