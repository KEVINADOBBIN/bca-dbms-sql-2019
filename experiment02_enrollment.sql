-- EXPERIMENT 02
-- STUDENT DATABASE (ENROLLMENT & BOOK ADOPTION)

PRAGMA foreign_keys = ON;

-- Drop tables if they already exist
DROP TABLE IF EXISTS book_adoption;
DROP TABLE IF EXISTS enroll;
DROP TABLE IF EXISTS textbook;
DROP TABLE IF EXISTS course;
DROP TABLE IF EXISTS student;

-- STUDENT TABLE
CREATE TABLE student (
    regno TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    major TEXT,
    bdate DATE
);

-- COURSE TABLE
CREATE TABLE course (
    courseno INTEGER PRIMARY KEY,
    cname TEXT NOT NULL,
    dept TEXT
);

-- TEXTBOOK TABLE
CREATE TABLE textbook (
    isbn INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    publisher TEXT,
    author TEXT
);

-- ENROLL TABLE
CREATE TABLE enroll (
    regno TEXT,
    courseno INTEGER,
    sem INTEGER NOT NULL,
    marks INTEGER,
    PRIMARY KEY (regno, courseno),
    FOREIGN KEY (regno) REFERENCES student(regno),
    FOREIGN KEY (courseno) REFERENCES course(courseno)
);

-- BOOK ADOPTION TABLE
CREATE TABLE book_adoption (
    courseno INTEGER,
    sem INTEGER,
    isbn INTEGER,
    PRIMARY KEY (courseno, sem),
    FOREIGN KEY (courseno) REFERENCES course(courseno),
    FOREIGN KEY (isbn) REFERENCES textbook(isbn)
);

-- INSERT INTO STUDENT
INSERT INTO student VALUES ('18BA1001','Stanley','BCA','2006-02-12');
INSERT INTO student VALUES ('18BC1001','Andrew','BSC','2005-09-12');
INSERT INTO student VALUES ('18MA1001','Mathan','MATHS','2001-01-10');
INSERT INTO student VALUES ('18BM1001','Arun','BOM','2004-11-16');

-- INSERT INTO COURSE
INSERT INTO course VALUES (10,'BCA','CompSci');
INSERT INTO course VALUES (12,'BCOM','Commerce');
INSERT INTO course VALUES (13,'BSC','Science');

-- INSERT INTO TEXTBOOK
INSERT INTO textbook VALUES (100,'DBMS','DEITEL','TOM');
INSERT INTO textbook VALUES (222,'JOURNALISM','TATA','JERRY');
INSERT INTO textbook VALUES (333,'GEN MATHS','BOSCO','SUBHASH');
INSERT INTO textbook VALUES (444,'FIN MGMT','PEARSON','AAMIR');

-- INSERT INTO ENROLL
INSERT INTO enroll VALUES ('18BA1001',10,2,99);
INSERT INTO enroll VALUES ('18BC1001',12,2,78);
INSERT INTO enroll VALUES ('18MA1001',13,2,89);

-- INSERT INTO BOOK ADOPTION
INSERT INTO book_adoption VALUES (10,2,100);
INSERT INTO book_adoption VALUES (12,2,222);
INSERT INTO book_adoption VALUES (13,2,333);

-- 3. Add a new textbook and adopt it
INSERT INTO textbook VALUES (555,'DS','ABC','Stanley');
INSERT INTO course VALUES (15,'BSC-CS','CompSci');
INSERT INTO book_adoption VALUES (15,2,555);

-- 5. List departments that have adopted books published by DEITEL
SELECT DISTINCT c.dept
FROM course c
JOIN book_adoption ba ON c.courseno = ba.courseno
JOIN textbook t ON ba.isbn = t.isbn
WHERE t.publisher = 'DEITEL';
