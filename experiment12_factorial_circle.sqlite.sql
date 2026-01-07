-- Example 1: Circle Table
-- create table
CREATE TABLE circle (
    radius INTEGER,
    area REAL
);

-- insert data (manually, since SQLite has no loops)
INSERT INTO circle (radius, area) VALUES (5, 3.14*5*5);
INSERT INTO circle (radius, area) VALUES (6, 3.14*6*6);
INSERT INTO circle (radius, area) VALUES (7, 3.14*7*7);
INSERT INTO circle (radius, area) VALUES (8, 3.14*8*8);
INSERT INTO circle (radius, area) VALUES (9, 3.14*9*9);
INSERT INTO circle (radius, area) VALUES (10, 3.14*10*10);

-- view circle table
SELECT * FROM circle;

-- Example 2: Factorial using Recursive CTE
-- factorial of 5
WITH RECURSIVE factorial(n, fact) AS (
    SELECT 1, 1         -- base case
    UNION ALL
    SELECT n+1, (n+1)*fact FROM factorial WHERE n < 5
)
SELECT * FROM factorial;
