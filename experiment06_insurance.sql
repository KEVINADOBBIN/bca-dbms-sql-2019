-- EXPERIMENT 06
-- INSURANCE DATABASE

PRAGMA foreign_keys = ON;

-- Drop tables if they already exist
DROP TABLE IF EXISTS participated;
DROP TABLE IF EXISTS owns;
DROP TABLE IF EXISTS accident;
DROP TABLE IF EXISTS car;
DROP TABLE IF EXISTS person;

-- PERSON TABLE
CREATE TABLE person (
    driverid TEXT PRIMARY KEY,
    name TEXT,
    address TEXT
);

-- CAR TABLE
CREATE TABLE car (
    regno TEXT PRIMARY KEY,
    model TEXT,
    year INTEGER
);

-- ACCIDENT TABLE
CREATE TABLE accident (
    reportno INTEGER PRIMARY KEY,
    adate DATE,
    location TEXT
);

-- OWNS TABLE
CREATE TABLE owns (
    driverid TEXT,
    regno TEXT,
    PRIMARY KEY (driverid, regno),
    FOREIGN KEY (driverid) REFERENCES person(driverid),
    FOREIGN KEY (regno) REFERENCES car(regno)
);

-- PARTICIPATED TABLE
CREATE TABLE participated (
    driverid TEXT,
    regno TEXT,
    reportno INTEGER,
    damageamt INTEGER,
    PRIMARY KEY (driverid, regno, reportno),
    FOREIGN KEY (driverid) REFERENCES person(driverid),
    FOREIGN KEY (regno) REFERENCES car(regno),
    FOREIGN KEY (reportno) REFERENCES accident(reportno)
);

-- INSERT INTO PERSON
INSERT INTO person VALUES ('10','Vimal','Sanjay Nagar');
INSERT INTO person VALUES ('11','Rajesh','Yelahanka');
INSERT INTO person VALUES ('12','Kiran','Malleshwaram');
INSERT INTO person VALUES ('13','Renu','Sahakaranagar');
INSERT INTO person VALUES ('14','Charles','Kalyan Nagar');

-- INSERT INTO CAR
INSERT INTO car VALUES ('KA04A111','Lancer',2015);
INSERT INTO car VALUES ('KA05B222','Lamborghini',2010);
INSERT INTO car VALUES ('KA06C333','MG',2017);
INSERT INTO car VALUES ('KA07D444','Benz',2016);
INSERT INTO car VALUES ('KA08E555','Audi',2015);

-- INSERT INTO ACCIDENT
INSERT INTO accident VALUES (100,'2016-01-20','Babusapalya');
INSERT INTO accident VALUES (101,'2014-03-30','Babusapalya');
INSERT INTO accident VALUES (102,'2018-02-25','Chelikere');
INSERT INTO accident VALUES (103,'2013-12-23','Hennur');
INSERT INTO accident VALUES (104,'2011-11-10','Ulsoor');

-- INSERT INTO OWNS
INSERT INTO owns VALUES ('10','KA04A111');
INSERT INTO owns VALUES ('11','KA05B222');
INSERT INTO owns VALUES ('12','KA06C333');
INSERT INTO owns VALUES ('13','KA07D444');
INSERT INTO owns VALUES ('14','KA08E555');

-- INSERT INTO PARTICIPATED
INSERT INTO participated VALUES ('10','KA04A111',100,20000);
INSERT INTO participated VALUES ('11','KA05B222',101,15000);
INSERT INTO participated VALUES ('12','KA06C333',102,30000);
INSERT INTO participated VALUES ('13','KA07D444',103,10000);
INSERT INTO participated VALUES ('14','KA08E555',104,5000);

-- (a) Update damage amount for a specific regno and reportno
UPDATE participated
SET damageamt = 25000
WHERE regno = 'KA06C333' AND reportno = 102;

-- (b) Add a new accident
INSERT INTO accident VALUES (105,'2002-01-26','Babuwapalya');

-- Add participation for new accident
INSERT INTO participated VALUES ('14','KA06C333',105,12000);

-- IV. Find total number of accidents in year 2002
SELECT COUNT(*) AS total_accidents_2002
FROM accident
WHERE adate BETWEEN '2002-01-01' AND '2002-12-31';

-- V. Find number of accidents involving cars of model 'Lancer'
SELECT COUNT(*) AS lancer_accidents
FROM car c
JOIN participated p ON c.regno = p.regno
WHERE c.model = 'Lancer';
