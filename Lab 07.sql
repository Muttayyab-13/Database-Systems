-- Create the database
CREATE DATABASE RealEstateDB;

-- Use the database
USE RealEstateDB;

-- Create the Staff table
CREATE TABLE Staff (
    staffNo INT PRIMARY KEY,
    fName VARCHAR(50),
    lName VARCHAR(50),
    position VARCHAR(50),
    DOB DATE,
    salary DECIMAL(10, 2),
    branchNo VARCHAR(10)
);

-- Create the PropertyForRent table
CREATE TABLE PropertyForRent (
    propertyNo INT PRIMARY KEY,
    type VARCHAR(50),
    rooms INT,
    rent DECIMAL(10, 2)
);

-- Create the Viewing table
CREATE TABLE Viewing (
    viewingId INT PRIMARY KEY,
    propertyNo INT,
    viewDate DATE,
    FOREIGN KEY (propertyNo) REFERENCES PropertyForRent(propertyNo)
);

-- Insert sample data into Staff
INSERT INTO Staff (staffNo, fName, lName, position, DOB, salary, branchNo) VALUES
(1, 'Alice', 'Smith', 'Manager', '1980-01-15', 50000.00, 'B001'),
(2, 'Bob', 'Johnson', 'Assistant', '1990-05-23', 30000.00, 'B001'),
(3, 'Charlie', 'Williams', 'Manager', '1985-08-30', 60000.00, 'B002'),
(4, 'David', 'Jones', 'Sales', '1992-11-12', 25000.00, 'B003'),
(5, 'Alice', 'Brown', 'Assistant', '1988-03-04', 28000.00, 'B002'),
(6, NULL , 'Davis', 'Sales', '1983-06-29', 32000.00, 'B003');

-- Insert sample data into PropertyForRent
INSERT INTO PropertyForRent (propertyNo, type, rooms, rent) VALUES
(1, 'Apartment', 2, 350.00),
(2, 'House', 3, 500.00),
(3, 'Studio', 1, 250.00),
(4, 'Apartment', 2, 450.00),
(5, null, 4, 600.00);

-- Insert sample data into Viewing
INSERT INTO Viewing (viewingId, propertyNo, viewDate) VALUES
(1, 1, '2004-05-05'),
(2, 2, '2004-05-15'),
(3, 3, '2004-05-20'),
(4, 4, '2004-05-25'),
(5, 5, NULL);


SELECT staffNo, fName, lName, salary
FROM Staff
ORDER BY salary DESC;

SELECT staffNo, fName , lName , salary 
FROM Staff 
ORDER BY salary  , StaffNo ASC;

SELECT DISTINCT fName FROM STAFF ORDER BY fName DESC;
SELECT  fName FROM STAFF ORDER BY fName ASC;

SELECT fName, lName, position, DOB, salary 
FROM STAFF 
ORDER BY DOB, salary DESC;


SELECT COUNT(salary) FROM Staff;
SELECT COUNT(fName) FROM Staff;
SELECT COUNT(*) FROM Staff;
SELECT COUNT(type) FROM PropertyForRent;
SELECT COUNT(*) AS myCount FROM PropertyForRent ;
SELECT COUNT(DISTINCT propertyNo) AS myCount FROM Viewing WHERE viewDate BETWEEN '2004-05-01' AND '2004-05-31';
SELECT COUNT(staffNo) AS myCount, SUM(salary) AS mySum FROM Staff WHERE position = 'Manager';
SELECT MIN(salary) AS myMin, MAX(salary) AS myMax, AVG(salary) AS myAvg FROM Staff;

SELECT COUNT(fName) AS myName , SUM(salary) AS mySalary , MIN(DOB) as myDOB FROM Staff  WHERE StaffNo BETWEEN 1 AND 7 ;


SELECT position, COUNT(*) AS numStaff
FROM Staff
GROUP BY position
HAVING COUNT(*) > 1;

SELECT branchNo , Count(*) AS numBranch
FROM STAFF 
GROUP BY branchNo
HAVING COUNT(*) >1 ;

SELECT FNAME , COUNT(*) AS TPERSON
FROM STAFF
GROUP BY FNAME
HAVING COUNT(*) != 1

SELECT staffNo, fName, lName, position, salary
FROM Staff
WHERE salary > ANY (SELECT salary FROM Staff WHERE branchNo = 'B001');

SELECT * 
FROM STAFF 
WHERE SALARY < ALL(SELECT SALARY FROM STAFF WHERE POSITION = 'MANAGER')