-- String Functions
-- LENGTH(): Returns the number of characters in a string.

-- UPPER() & LOWER(): Converts the entire string to uppercase or lowercase, 
-- useful for standardizing dirty data.

-- TRIM(): Removes leading and trailing white spaces from a string. Variations 
-- include LTRIM() (left space only) and RTRIM() (right space only).

-- LEFT() & RIGHT(): Extracts a specified number of characters from the left or 
-- right side of a string.

-- SUBSTRING(): Extracts a portion of text based on a starting position and a 
-- specified length (e.g., SUBSTRING(column, start_position, length)).

-- REPLACE(): Swaps specific characters in a string with new characters.

-- LOCATE(): Finds the numerical index position of a specific sequence of 
-- characters within a string.

-- CONCAT(): Joins two or more columns/strings together into one single string 
-- (e.g., combining first name and last name).

SELECT LENGTH('skyfall');

SELECT * FROM employee_demographics;

SELECT first_name, LENGTH(first_name)
FROM employee_demographics
ORDER BY 2;

SELECT UPPER('Sky');
SELECT LOWER('SKY');

SELECT first_name, UPPER(first_name)
FROM employee_demographics;

SELECT TRIM('     sky              ');
SELECT LTRIM('     sky              ');
SELECT RTRIM('     sky              ');

SELECT first_name, 
LEFT(first_name, 4), 
RIGHT(first_name, 4),
SUBSTRING(first_name, 3, 2),
birth_date,
SUBSTRING(birth_date, 6, 2) AS birth_month
FROM employee_demographics;

SELECT first_name, REPLACE(first_name, 'a', 'z') 
FROM employee_demographics;

SELECT LOCATE('x', 'ALEXANDER');

SELECT first_name, LOCATE('An', first_name)
FROM employee_demographics;

SELECT first_name, last_name,
CONCAT(first_name, ' ', last_name) AS full_name
FROM employee_demographics;