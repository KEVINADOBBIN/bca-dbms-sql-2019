-- EXPERIMENT 01
-- STUDENT DATABASE

-- Drop table if it already exists
DROP TABLE IF EXISTS student;

-- 1. Create STUDENT table
CREATE TABLE student (
    regno INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    dob DATE,
    marks INTEGER
);

-- 2. Remove the existing attribute MARKS
ALTER TABLE student DROP COLUMN marks;

-- 3. Change datatype of REGNO from INTEGER to STRING
-- SQLite does not allow direct datatype change
-- So we recreate the table

ALTER TABLE student RENAME TO student_old;

CREATE TABLE student (
    regno TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    dob DATE
);

INSERT INTO student (regno, name, dob)
SELECT regno, name, dob FROM student_old;

DROP TABLE student_old;

-- 4. Add new attribute PHONE
ALTER TABLE student ADD COLUMN phone INTEGER;

-- 5. Insert tuples into STUDENT table
INSERT INTO student VALUES ('100', 'Stanly', '2000-01-15', 9108735025);
INSERT INTO student VALUES ('101', 'Ruben',  '2000-08-25', 9988776655);
INSERT INTO student VALUES ('102', 'Shajan', '2000-03-19', 8976543102);
INSERT INTO student VALUES ('103', 'Novel',  '2000-05-25', 6362066144);
INSERT INTO student VALUES ('104', 'Alfred', '2000-12-06', 9980102738);

-- 6. Display all tuples
SELECT * FROM student;
