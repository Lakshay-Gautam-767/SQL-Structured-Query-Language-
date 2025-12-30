# 25th December

/* # Use this script, to create new table. So that we can work on it. 
use concepts;
show tables;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    major VARCHAR(50)
);

INSERT INTO students (student_id, student_name, major) VALUES
(1, 'Aarav', 'Computer Science'),
(2, 'Bhavya', 'Mathematics'),
(3, 'Chetan', 'Physics'),
(4, 'Diya', 'Computer Science'),
(5, 'Esha', 'Mathematics'),
(6, 'Farhan', 'Physics'),
(7, 'Gauri', 'Computer Science'),
(8, 'Harsh', 'Mathematics'),
(9, 'Isha', 'Physics'),
(10, 'Jay', 'Computer Science'),
(11, 'Kiran', 'Mathematics'),
(12, 'Leena', 'Physics'),
(13, 'Manav', 'Computer Science'),
(14, 'Neha', 'Mathematics'),
(15, 'Om', 'Physics'),
(16, 'Pooja', 'Computer Science'),
(17, 'Qadir', 'Mathematics'),
(18, 'Riya', 'Physics'),
(19, 'Sahil', 'Computer Science'),
(20, 'Tina', 'Mathematics');


CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_name VARCHAR(50),
    credits INT
);

INSERT INTO enrollments (enrollment_id, student_id, course_name, credits) VALUES
(101, 1, 'Data Structures', 4),
(102, 1, 'Algorithms', 4),
(103, 2, 'Linear Algebra', 3),
(104, 3, 'Quantum Mechanics', 4),
(105, 4, 'Operating Systems', 4),
(106, 5, 'Statistics', 3),
(107, 6, 'Electromagnetism', 4),
(108, 7, 'Databases', 4),
(109, 8, 'Probability', 3),
(110, 9, 'Thermodynamics', 4),
(111, 10, 'Computer Networks', 4),
(112, 11, 'Calculus II', 3),
(113, 12, 'Optics', 4),
(114, 13, 'Machine Learning', 4),
(115, 14, 'Discrete Math', 3),
(116, 15, 'Nuclear Physics', 4),
(117, 16, 'Software Engineering', 4),
(118, 17, 'Numerical Methods', 3),
(119, 18, 'Solid State Physics', 4),
(120, 1, 'Artificial Intelligence', 4);
*/

show tables;
select * from students;
select * from enrollments;

# Question-1: Find the students who enrolled in courses
# Hint: Concept of Inner Join
select st.student_id, st.student_name, en.enrollment_id, 
en.course_name from students as st 
JOIN enrollments as en ON st.student_id = en.student_id;

# Question-2: Find the students even with no Enrollments.
# Hint: Concept of Left Join
select st.student_id, st.student_name, en.enrollment_id,
en.course_name from students as st
left join enrollments as en ON st.student_id = en.student_id;

# Questions-3: Find All Enrollments even if student is missing. 
# Hint: Concept of Right Join
select st.student_id, st.student_name, en.enrollment_id,
en.course_name from students as st
right join enrollments as en ON st.student_id = en.student_id;

# Question-4: Find all student names who do not have any enrollments. 
select st.student_id, st.student_name, en.enrollment_id, 
en.course_name from students as st 
left JOIN enrollments as en ON st.student_id = en.student_id
where en.enrollment_id is NULL; -- we cannot use, = 'NULL' (wrong)❌

# Question-5: Write a sql query to find out the total number of courses
-- each student is enrolled in.  
select st.student_id, st.student_name, count(en.enrollment_id) 
from students as st 
join enrollments as en ON st.student_id = en.student_id group by 
st.student_id, st.student_name;

# Question-6: Write a sql query to calculate the total credits earned 
-- by each student including the student who have not enrolled in 
-- any courses. 
select st.student_id, st.student_name, sum(en.credits) from students as st
left join enrollments as en ON st.student_id = en.student_id 
group by st.student_id, st.student_name;

# Question-7: Write a sql query to find the students who have enrolled 
-- in more than 2 courses
select st.student_id, st.student_name, count(en.enrollment_id) 
from students as st join enrollments as en ON st.student_id = en.student_id
group by student_id, st.student_name having count(en.enrollment_id) > 2; 

# Question-8: Find out the total number of student in each major
select major, count(student_id) from students group by major;

# Question-9: Write a sql query to calculate total credits earned by 
-- students in each major. 
select st.major, sum(en.credits) from students as st
join enrollments as en on st.student_id = en.student_id 
group by st.major, st.student_name;
 
# Question-10: Write a sql query to find the student who enrolled in
-- highest number of courses.  
select st.student_id, st.student_name, count(en.enrollment_id) 
from students as st join enrollments as en
ON st.student_id = en.student_id group by st.student_id
order by count(en.enrollment_id) desc limit 1; 

/* -- NEW CONCEPT 

Limit and Offset (Finding N-th Highest)
These keywords are used to restrict the number of rows returned and 
skip specific rows.
	* LIMIT n: Returns only the first n rows.
	* OFFSET n: Skips the first n rows.
*/