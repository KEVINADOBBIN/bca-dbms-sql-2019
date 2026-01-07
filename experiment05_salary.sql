-- EXPERIMENT 05
-- SALARY DATABASE

-- Drop table if it already exists
DROP TABLE IF EXISTS empsalary;

-- Create EMPSALARY table
CREATE TABLE empsalary (
    empcode INTEGER PRIMARY KEY,
    empname TEXT,
    dob DATE,
    department TEXT,
    salary REAL
);

-- Insert five tuples into the table
INSERT INTO empsalary VALUES (101,'Rahul','1996-11-18','Accounts',30000);
INSERT INTO empsalary VALUES (102,'Divya','1997-03-24','Programmer',20000);
INSERT INTO empsalary VALUES (103,'Stephen','1997-12-26','Marketing',30000);
INSERT INTO empsalary VALUES (104,'Ajay','1996-11-24','Programmer',40000);
INSERT INTO empsalary VALUES (105,'Anu','1976-06-17','Accounts',28000);

-- Display all records
SELECT * FROM empsalary;

-- 1. Display number of employees working in each department
SELECT department,
       COUNT(empcode) AS no_of_emp
FROM empsalary
GROUP BY department;

-- 2. Find the sum of salaries of all employees
SELECT SUM(salary) AS sum_salary
FROM empsalary;

-- 3. Find sum and average salary of employees of Marketing department
SELECT SUM(salary) AS sum_salary,
       AVG(salary) AS avg_salary
FROM empsalary
WHERE department = 'Marketing';

-- 4. Find the highest salary
SELECT MAX(salary) AS max_salary
FROM empsalary;

-- 5. Find the lowest salary
SELECT MIN(salary) AS min_salary
FROM empsalary;

-- 6. Find total salary for each department
SELECT department,
       SUM(salary) AS total_salary
FROM empsalary
GROUP BY department;

-- 7. Increase salary of employees working as Programmer by 1000
UPDATE empsalary
SET salary = salary + 1000
WHERE department = 'Programmer';

-- Display table after update
SELECT * FROM empsalary;
