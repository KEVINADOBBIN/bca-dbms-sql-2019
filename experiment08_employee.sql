-- EXPERIMENT 08
-- EMPLOYEE DATABASE

-- Drop table if it already exists
DROP TABLE IF EXISTS employee;

-- Create EMPLOYEE table
CREATE TABLE employee (
    empid INTEGER PRIMARY KEY,
    empname TEXT,
    gender TEXT,
    age INTEGER
);

-- Insert five rows into the table
INSERT INTO employee VALUES (101,'Anu','Female',27);
INSERT INTO employee VALUES (102,'Ajay','Male',22);
INSERT INTO employee VALUES (103,'Sam','Male',25);
INSERT INTO employee VALUES (104,'Stephen','Male',30);
INSERT INTO employee VALUES (105,'Rohel','Male',27);

-- Display all records
SELECT * FROM employee;

-- 1. Display names of employees whose age >= 30
SELECT empname
FROM employee
WHERE age >= 30;

-- 2. Display names of all female employees whose age > 25
SELECT empname
FROM employee
WHERE gender = 'Female' AND age > 25;

-- 3. Display names of employees whose age is between 22 and 25
SELECT empname
FROM employee
WHERE age BETWEEN 22 AND 25;

-- 4. Display details of employees whose name starts with letter 'A'
SELECT *
FROM employee
WHERE empname LIKE 'A%';
