-- EXPERIMENT 04
-- LIBRARY DATABASE

-- Drop table if it already exists
DROP TABLE IF EXISTS library;

-- Create LIBRARY table
CREATE TABLE library (
    bookid INTEGER PRIMARY KEY,
    title TEXT,
    author TEXT,
    publisher TEXT,
    yearpub INTEGER,
    price REAL
);

-- Insert five tuples into LIBRARY table
INSERT INTO library VALUES (123,'DBMS','Chitra Ravi','Subhas',2014,240);
INSERT INTO library VALUES (124,'DS','Nagaraj','Neeraj',2015,280);
INSERT INTO library VALUES (125,'NS','Don Bosco','Poko',2014,320);
INSERT INTO library VALUES (126,'DM','Rama','Himalaya',2013,200);
INSERT INTO library VALUES (127,'PST','Sreeni','Subhas',2016,290);

-- Display all tuples
SELECT * FROM library;

-- Display different publishers
SELECT DISTINCT publisher FROM library;

-- Arrange books in alphabetical order of title
SELECT * FROM library ORDER BY title;

-- List books whose price is between 100 and 300
SELECT * FROM library
WHERE price BETWEEN 100 AND 300;
