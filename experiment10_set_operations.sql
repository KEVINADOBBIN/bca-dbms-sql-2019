-- EXPERIMENT: SET OPERATIONS (P and Q tables)
-- FILE: experiment10_set_operations.sql

PRAGMA foreign_keys = ON;

-- Drop tables if they exist
DROP TABLE IF EXISTS P;
DROP TABLE IF EXISTS Q;

-- 1. Create Table P
CREATE TABLE P (
    id INTEGER PRIMARY KEY,
    name VARCHAR(20)
);

-- 2. Create Table Q
CREATE TABLE Q (
    id INTEGER PRIMARY KEY,
    name VARCHAR(20)
);

-- 3. Insert Records into Table P
INSERT INTO P VALUES (101, 'Ajay');
INSERT INTO P VALUES (102, 'Anu');
INSERT INTO P VALUES (103, 'Aruna');
INSERT INTO P VALUES (104, 'Janu');
INSERT INTO P VALUES (105, 'Banu');

-- 4. Insert Records into Table Q
INSERT INTO Q VALUES (101, 'Ajay');
INSERT INTO Q VALUES (102, 'Anu');
INSERT INTO Q VALUES (106, 'Jenna');
INSERT INTO Q VALUES (107, 'Keerthi');
INSERT INTO Q VALUES (108, 'Ram');

-- 5. Display All Records from Both P and Q (UNION)
SELECT * FROM P
UNION
SELECT * FROM Q;

-- 6. Display Only Records that Exist in Both P and Q (INTERSECT)
SELECT * FROM P
INTERSECT
SELECT * FROM Q;

-- 7. Display Records in P but Not in Q (MINUS / EXCEPT)
-- SQLite uses EXCEPT
SELECT * FROM P
EXCEPT
SELECT * FROM Q;
