-- EXPERIMENT 07
-- BANK DATABASE

PRAGMA foreign_keys = ON;

-- Drop tables if already exist
DROP TABLE IF EXISTS depositor;
DROP TABLE IF EXISTS borrower;
DROP TABLE IF EXISTS account;
DROP TABLE IF EXISTS loan;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS branch;

-- BRANCH TABLE
CREATE TABLE branch (
    bname TEXT PRIMARY KEY,
    bcity TEXT,
    assets REAL
);

-- CUSTOMER TABLE
CREATE TABLE customer (
    cname TEXT PRIMARY KEY,
    street TEXT,
    city TEXT
);

-- ACCOUNT TABLE
CREATE TABLE account (
    accno INTEGER PRIMARY KEY,
    bname TEXT,
    balance REAL,
    FOREIGN KEY (bname) REFERENCES branch(bname)
);

-- DEPOSITOR TABLE
CREATE TABLE depositor (
    cname TEXT,
    accno INTEGER,
    PRIMARY KEY (cname, accno),
    FOREIGN KEY (cname) REFERENCES customer(cname),
    FOREIGN KEY (accno) REFERENCES account(accno)
);

-- LOAN TABLE
CREATE TABLE loan (
    loanno INTEGER PRIMARY KEY,
    bname TEXT,
    amount REAL,
    FOREIGN KEY (bname) REFERENCES branch(bname)
);

-- BORROWER TABLE
CREATE TABLE borrower (
    cname TEXT,
    loanno INTEGER,
    PRIMARY KEY (cname, loanno),
    FOREIGN KEY (cname) REFERENCES customer(cname),
    FOREIGN KEY (loanno) REFERENCES loan(loanno)
);

-- INSERT INTO BRANCH
INSERT INTO branch VALUES ('RT Nagar','Bangalore',67854);
INSERT INTO branch VALUES ('Jayanagar','Bangalore',98765);
INSERT INTO branch VALUES ('Kalyan Nagar','Bangalore',567879);
INSERT INTO branch VALUES ('Anna Nagar','Tamil Nadu',67895);
INSERT INTO branch VALUES ('BTM Layout','Bangalore',12345);

-- INSERT INTO CUSTOMER
INSERT INTO customer VALUES ('Ajay','Shivaji Nagar','Bangalore');
INSERT INTO customer VALUES ('Anil','Commercial Street','Bangalore');
INSERT INTO customer VALUES ('Anu','Rampura','Kerala');
INSERT INTO customer VALUES ('Vijay','KR Puram','Bangalore');
INSERT INTO customer VALUES ('Surya','Anna Street','Tamil Nadu');

-- INSERT INTO ACCOUNT
INSERT INTO account VALUES (1000,'RT Nagar',10000);
INSERT INTO account VALUES (2000,'Kalyan Nagar',30000);
INSERT INTO account VALUES (3000,'Jayanagar',40000);
INSERT INTO account VALUES (4000,'BTM Layout',50000);
INSERT INTO account VALUES (5000,'Anna Nagar',60000);

-- INSERT INTO DEPOSITOR
INSERT INTO depositor VALUES ('Ajay',1000);
INSERT INTO depositor VALUES ('Anil',2000);
INSERT INTO depositor VALUES ('Anu',3000);
INSERT INTO depositor VALUES ('Vijay',4000);
INSERT INTO depositor VALUES ('Surya',5000);

-- INSERT INTO LOAN
INSERT INTO loan VALUES (100,'RT Nagar',34000);
INSERT INTO loan VALUES (101,'Kalyan Nagar',67000);
INSERT INTO loan VALUES (102,'Jayanagar',54678);
INSERT INTO loan VALUES (103,'BTM Layout',66000);
INSERT INTO loan VALUES (104,'Anna Nagar',80000);

-- INSERT INTO BORROWER
INSERT INTO borrower VALUES ('Ajay',100);
INSERT INTO borrower VALUES ('Anil',101);
INSERT INTO borrower VALUES ('Anu',102);
INSERT INTO borrower VALUES ('Vijay',103);
INSERT INTO borrower VALUES ('Surya',104);

-- QUERY:
-- Find customers who have an account at all branches located in Bangalore
SELECT c.cname
FROM customer c
WHERE NOT EXISTS (
    SELECT b.bname
    FROM branch b
    WHERE b.bcity = 'Bangalore'
      AND NOT EXISTS (
          SELECT *
          FROM depositor d
          JOIN account a ON d.accno = a.accno
          WHERE d.cname = c.cname
            AND a.bname = b.bname
      )
);
