-- EXPERIMENT 03
-- ORDER PROCESSING DATABASE

PRAGMA foreign_keys = ON;

-- Drop tables if already exist
DROP TABLE IF EXISTS shipment;
DROP TABLE IF EXISTS order_item;
DROP TABLE IF EXISTS item;
DROP TABLE IF EXISTS custorder;
DROP TABLE IF EXISTS warehouse;
DROP TABLE IF EXISTS customer;

-- CUSTOMER TABLE
CREATE TABLE customer (
    custno INTEGER PRIMARY KEY,
    cname TEXT NOT NULL,
    city TEXT
);

-- CUSTOMER ORDER TABLE
CREATE TABLE custorder (
    orderno INTEGER PRIMARY KEY,
    custno INTEGER,
    odate DATE NOT NULL,
    ordamt REAL,
    FOREIGN KEY (custno) REFERENCES customer(custno)
);

-- ITEM TABLE
CREATE TABLE item (
    itemno INTEGER PRIMARY KEY,
    unitprice REAL
);

-- ORDER_ITEM TABLE
CREATE TABLE order_item (
    orderno INTEGER,
    itemno INTEGER,
    qty INTEGER,
    PRIMARY KEY (orderno, itemno),
    FOREIGN KEY (orderno) REFERENCES custorder(orderno),
    FOREIGN KEY (itemno) REFERENCES item(itemno)
);

-- WAREHOUSE TABLE
CREATE TABLE warehouse (
    warehouseno INTEGER PRIMARY KEY,
    city TEXT NOT NULL
);

-- SHIPMENT TABLE
CREATE TABLE shipment (
    orderno INTEGER,
    warehouseno INTEGER,
    shipdate DATE,
    PRIMARY KEY (orderno),
    FOREIGN KEY (orderno) REFERENCES custorder(orderno),
    FOREIGN KEY (warehouseno) REFERENCES warehouse(warehouseno)
);

-- INSERT INTO CUSTOMER
INSERT INTO customer VALUES (1,'Ajay','Bangalore');
INSERT INTO customer VALUES (2,'Anu','Mysore');
INSERT INTO customer VALUES (3,'Vinay','Delhi');
INSERT INTO customer VALUES (4,'Veena','Mumbai');
INSERT INTO customer VALUES (5,'Reena','Kochi');

-- INSERT INTO CUSTOMER ORDER
INSERT INTO custorder VALUES (10,1,'2019-02-12',2345);
INSERT INTO custorder VALUES (20,2,'2019-01-13',567);
INSERT INTO custorder VALUES (30,3,'2019-03-12',7858);
INSERT INTO custorder VALUES (40,4,'2019-12-15',4444);
INSERT INTO custorder VALUES (50,5,'2019-01-02',8000);

-- INSERT INTO ITEM
INSERT INTO item VALUES (100,10);
INSERT INTO item VALUES (300,7);
INSERT INTO item VALUES (400,9);
INSERT INTO item VALUES (500,40);

-- INSERT INTO ORDER_ITEM
INSERT INTO order_item VALUES (10,100,5);
INSERT INTO order_item VALUES (20,300,3);
INSERT INTO order_item VALUES (30,400,2);
INSERT INTO order_item VALUES (40,500,10);

-- INSERT INTO WAREHOUSE
INSERT INTO warehouse VALUES (1,'Bangalore');
INSERT INTO warehouse VALUES (2,'Mysore');
INSERT INTO warehouse VALUES (3,'Calicut');
INSERT INTO warehouse VALUES (4,'Punjab');
INSERT INTO warehouse VALUES (5,'Nellore');

-- INSERT INTO SHIPMENT
INSERT INTO shipment VALUES (10,2,'2019-01-12');
INSERT INTO shipment VALUES (20,3,'2019-03-15');
INSERT INTO shipment VALUES (30,3,'2019-03-13');
INSERT INTO shipment VALUES (40,4,'2018-09-12');
INSERT INTO shipment VALUES (50,5,'2019-12-18');

-- QUERY 1:
-- List order number and ship date for orders shipped from warehouse no 3
SELECT orderno, shipdate
FROM shipment
WHERE warehouseno = 3;

-- QUERY 2:
-- Customer name, number of orders, average order amount
SELECT c.cname,
       COUNT(o.orderno) AS total_orders,
       AVG(o.ordamt) AS avg_order_amount
FROM customer c
JOIN custorder o ON c.custno = o.custno
GROUP BY c.cname;
