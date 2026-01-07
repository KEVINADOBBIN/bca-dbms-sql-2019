-- EXPERIMENT: STUDENT-COURSE DATABASE
-- FILE: experiment09_student_course.sql

PRAGMA foreign_keys = ON;

-- Drop tables if they exist
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS course;

-- 1. Create STUDENT table
CREATE TABLE student (
    name VARCHAR(20),
    number INTEGER PRIMARY KEY,
    class VARCHAR(20),
    major VARCHAR(20)
);

-- 2. Create COURSE table
CREATE TABLE course (
    coursename VARCHAR(20),
    courseno INTEGER PRIMARY KEY,
    hours INTEGER,
    dept VARCHAR(20)
);

-- 3. Insert records into STUDENT
INSERT INTO student VALUES ('Som', 1, '2BCA', 'Computer');
INSERT INTO student VALUES ('Jenny', 2, '2BBA', 'Biology');
INSERT INTO student VALUES ('Ramesh', 3, '3BCOM', 'Business');
INSERT INTO student VALUES ('Anu', 4, '2BCA', 'Computer');
INSERT INTO student VALUES ('Suresh', 5, '3BCA', 'Computer');

-- 4. Insert records into COURSE
INSERT INTO course VALUES ('Java', 101, 4, 'Computer');
INSERT INTO course VALUES ('Algebra', 102, 3, 'Maths');
INSERT INTO course VALUES ('History', 103, 2, 'Arts');
INSERT INTO course VALUES ('Physics', 104, 5, 'Physics');
INSERT INTO course VALUES ('Accounts', 105, 3, 'Commerce');

-- 5. Display all STUDENT records
SELECT * FROM student;

-- 6. Display all COURSE records
SELECT * FROM course;

-- 7. Display students whose major is 'Computer'
SELECT *
FROM student
WHERE major = 'Computer';
