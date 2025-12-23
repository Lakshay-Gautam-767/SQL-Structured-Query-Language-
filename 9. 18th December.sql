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
-- > FOREIGN KEY : A column that points to the Primary Key of another table.

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
-- *************************** END OF NOTES ***************************