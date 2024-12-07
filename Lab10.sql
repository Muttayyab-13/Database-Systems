create database LAB10
use LAB10
go


CREATE TABLE salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(5, 2)
);



CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesman_id INT,
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);


CREATE TABLE orders (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10, 2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);



INSERT INTO salesman (salesman_id, name, city, commission) VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12);



INSERT INTO customer (customer_id, cust_name, city, grade, salesman_id) VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006),
(3009, 'Geoff Cameron', 'Berlin', NULL, 5003),
(3003, 'Jozy Altidore', 'Moscow', 200, 5007);



INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(70001, 150.50, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3002, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.50, '2012-08-17', 3009, 5003),
(70007, 948.50, '2012-09-10', 3005, 5002),
(70005, 2400.60, '2012-07-27', 3007, 5001),
(70008, 5760.00, '2012-09-10', 3002, 5001);

--1
SELECT s.name AS Salesman,c.cust_name AS Customer,s.city
FROM salesman s
JOIN customer c ON s.city = c.city;

--2
SELECT o.ord_no,o.purch_amt, c.cust_name,c.city
FROM orders o
JOIN customer c ON o.customer_id = c.customer_id
WHERE o.purch_amt BETWEEN 500 AND 2000;


--3
SELECT c.cust_name AS Customer,c.city,s.name AS Salesman,s.commission
FROM customer c
JOIN salesman s ON c.salesman_id = s.salesman_id;


--4
SELECT c.cust_name AS Customer, 
 c.city AS Customer_City,s.name AS Salesman,  s.commission
FROM customer c
JOIN salesman s ON c.salesman_id = s.salesman_id
WHERE s.commission > 0.12;
--5
SELECT c.cust_name AS Customer ,c.city AS Customer_City, s.name AS Salesman, 
 s.city AS Salesman_City, s.commission
FROM customer c 
JOIN salesman s ON c.salesman_id = s.salesman_id
WHERE s.city <> c.city AND s.commission > 0.12;
--6
SELECT o.ord_no, o.ord_date,o.purch_amt, .cust_name AS Customer_Name
,c.grade,s.name AS Salesman, s.commission
FROM orders o
JOIN customer c ON  o.customer_id = c.customer_id
JOIN salesman s ON  o.salesman_id = s.salesman_id;

--7

--8
Select c.cust_name,c.city,c.grade,s.salesman_id,s.name as salemanName
from customer c
join salesman s on s.salesman_id=c.salesman_id
order by c.customer_id asc


--9
Select c.cust_name,c.city,c.grade,s.salesman_id,s.name as salemanName
from customer c
join salesman s on s.salesman_id=c.salesman_id
where c.grade<300
order by c.customer_id asc

--10

Select c.cust_name,c.city,o.ord_no,o.ord_date,o.purch_amt
from customer c
left join  orders o  on o.customer_id=c.customer_id
order by o.ord_date asc

--11
SELECT c.cust_name AS Customer_Name,c.city,o.ord_no,
o.ord_date,o.purch_amt,s.name AS Salesman, s.commission
FROM customer c
left JOIN orders o  ON  o.customer_id = c.customer_id
left JOIN salesman s ON  o.salesman_id = s.salesman_id;



--12
SELECT 
    s.salesman_id,
    s.name AS salesman_name,
    s.city AS salesman_city,
    s.commission,
	count(c.cust_name) as NumberOFCustomers
FROM 
    salesman s
LEFT JOIN 
    customer c ON s.salesman_id = c.salesman_id
GROUP BY 
    s.salesman_id, s.name, s.city, s.commission
ORDER BY 
    s.name ASC;


--13
SELECT  c.cust_name AS Customer_Name
,c.city,s.name AS Salesman,o.ord_no, o.ord_date,o.purch_amt
FROM orders o
JOIN customer c ON  o.customer_id = c.customer_id
JOIN salesman s ON  o.salesman_id = s.salesman_id;

--14
SELECT distinct  
    s.name AS salesman_name,c.customer_id
FROM 
    salesman s
LEFT JOIN 
    customer c ON s.salesman_id = c.salesman_id
left join  orders o on o.customer_id=c.customer_id
where (o.purch_amt>=2000 and c.grade is not null) or (c.customer_id is null)

--15
SELECT c.cust_name,count(o.ord_no) AS noOFOrders,c.city,o.ord_no,
o.ord_date,o.purch_amt
FROM customer c
left JOIN orders o  ON  o.customer_id = c.customer_id
left JOIN salesman s ON  o.salesman_id = s.salesman_id
group by c.cust_name,c.city,o.ord_no,
o.ord_date,o.purch_amt


















