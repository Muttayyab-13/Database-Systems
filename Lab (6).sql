create database DreamHome
use DreamHome
Go

create table Branch (
	branchNo varchar(20) NOT NULL Primary Key,
	street varchar(100) NOT NULL,
	city varchar(50) NOT NULL,
	postcode varchar(20) NOT NULL);



	INSERT into Branch (branchNo, street, city, postcode) VALUES (N'B001', 'NH#79 I-10/2', 'NISB', 'N52000')
INSERT into Branch (branchNo, street, city, postcode) VALUES (N'B002', 'NH#78 SUPPLY', 'NABT', 'N53000')
INSERT into Branch (branchNo, street, city, postcode) VALUES (N'B003', 'NH#79 I-10/2', 'NISB', 'N54000') 
INSERT into Branch (branchNo, street, city, postcode) VALUES (N'B004', 'NH#80 MANDIAN', 'NABT', 'N55000')
INSERT into Branch (branchNo, street, city, postcode) VALUES (N'B005', 'NH#81 MANDIAN', 'NABT', 'N56000')
INSERT into Branch (branchNo, street, city, postcode) VALUES (N'B006', 'NH#82 MANDIAN', 'NABT', 'N57000')
INSERT into Branch (branchNo, street, city, postcode) VALUES (N'B007', 'NH#83 MANDIAN', 'NABT', 'N58000')

Select * from Branch


create table Staff (staffNo varchar(20) NOT NULL PRIMARY KEY,
	fName varchar(50) NOT NULL,
	lName varchar(50) NOT NULL, 
	position varchar(50) NOT NULL,
	sex varchar(1) NOT NULL,
	DOB Date NOT NULL,
	salary DECIMAL NOT NULL,
	branchNo varchar(20) NOT NULL References Branch(branchNo));

INSERT into Staff (staffNo, fName, lName, position, sex, DOB, salary, branchNo) VALUES
('NSA85', N'Mary', N'Howe', N'Assistant', N'F', '1970-01-01 ', '9000', N'B001'),
('NSA86', N'William', N'Ford', N'Supervisor', N'M', '1980-01-01 ', '10000', N'B002'),
('NSA87', N'David', N'Beech', N'Admin', N'M', '1990-01-01', '11000', N'B003'),
('NSA88', N'Momin', N'Brand', N'HR', N'F', '2007-01-01 ', '12000', N'B004'),
('NSA89', N'Muttayyab', N'Brand', N'HR', N'M', '2001-09-01 ', '18000', N'B005'),
('NSA90', N'Hashir', N'Brand', N'HR', N'M', '1999-07-01 ', '18000', N'B006'),
('NSA91', N'ali', N'Brand', N'HR', N'M', '2000-02-01 ', '15000', N'B007');

create table Client (clientNo varchar(20) NOT NULL PRIMARY KEY,
fName varchar(50) NOT NULL, 
lName varchar(50) NOT NULL, 
telNo varchar(20) NOT NULL,
prefType varchar(50) NOT NULL, 
maxRent DECIMAL NOT NULL)

INSERT into	Client(clientNo,fName,lName,telNo,prefType,maxRent)
Values
('C1','Momin', 'Ali','030238181','HOUSE',50000)
INSERT into	Client(clientNo,fName,lName,telNo,prefType,maxRent)
Values
('C2','elias', 'jadoon','030238181','HOUSE',50000),
('C3','asim', 'Khan','030238181','HOUSE',50000),
('C4','muneeb', 'hashim','030238181','HOUSE',50000),
('C5','muttayyab', 'tanoli','030238181','HOUSE',50000),
('C6','hasher', 'pathan','030238181','HOUSE',50000),
('C7','Ali', 'Khan','030238181','HOUSE',50000)

Select * from Client

create table PrivateOwner (
ownerNo varchar(20) NOT NULL PRIMARY KEY,
fName varchar(50) NOT NULL,
lName varchar(50) NOT NULL,
adress varchar(50) NOT NULL,
telNo varchar(20) NOT NULL)

EXEC sp_rename 'PrivateOwner.address', 'adress', 'COLUMN';

INSERT into PrivateOwner(ownerNo,fName,lName,adress,telNo)
values('111','Momin','Abdurrehman','Lalazar Colony','03238529621'),
('222','Hashim','Khan','Musazai Colony','03119585075'),
('333', 'Zain', 'Ali', 'Dalan Road', '03041234567'),
('444', 'Ayesha', 'Khan', 'Mall Road', '03071237890'),
('555', 'Saad', 'Iqbal', 'Cantt Area', '03109876543'),
('666', 'Fatima', 'Shah', 'Gulbahar Colony', '03216549876'),
('777', 'Omar', 'Farooq', 'University Town', '03451234567')



create table PropertyForRent (
propertyNo varchar(20) NOT NULL PRIMARY KEY,
street varchar(100) NOT NULL,
city varchar(50) NOT NULL,
postcode varchar(20) NOT NULL,
type varchar(10) NOT NULL,
rooms int NOT NULL, rent DECIMAL NOT NULL, ownerNo varchar(20) References PrivateOwner(ownerNo),
staffNo varchar(20)  NOT  NULL  References  Staff(staffNo),
branchNo  varchar(20) NOT NULL References Branch(branchNo)); 

INSERT INTO PropertyForRent (propertyNo, street, city, postcode, type, rooms, rent, ownerNo, staffNo, branchNo)
VALUES
('P001', 'NH#10', 'NISB', 'N52000', 'House', 4, 50000, '111', 'NSA85', 'B001'),
('P002', 'NH#11', 'NABT', 'N53000', 'Flat', 3, 40000, '222', 'NSA86', 'B002'),
('P003', 'NH#12', 'NISB', 'N54000', 'House', 5, 60000, '333', 'NSA87', 'B003'),
('P004', 'NH#13', 'NABT', 'N55000', 'Flat', 2, 35000, '444', 'NSA88', 'B004'),
('P005', 'NH#14', 'NABT', 'N56000', 'House', 6, 70000, '555', 'NSA89', 'B005'),
('P006', 'NH#15', 'NABT', 'N57000', 'House', 4, 50000, '666', 'NSA90', 'B006'),
('P007', 'NH#16', 'NABT', 'N58000', 'Flat', 3, 45000, '777', 'NSA91', 'B007');


create table Viewing (
clientNo varchar(20) NOT NULL References Client(clientNo),
propertyNo varchar(20) NOT NULL References PropertyForRent(propertyNo), 
viewDate  DateTime  NOT  NULL,
comment varchar(200)  NOT  NULL)

INSERT INTO Viewing (clientNo, propertyNo, viewDate, comment)
VALUES
('C1', 'P001', '2024-10-01 10:00:00', 'Client liked the property but found the rent too high'),
('C2', 'P002', '2024-10-02 12:30:00', 'Client interested but concerned about parking'),
('C3', 'P003', '2024-10-03 14:00:00', 'Client loved the house, considering signing lease'),
('C4', 'P004', '2024-10-04 16:00:00', 'Client found the property too small'),
('C5', 'P005', '2024-10-05 11:00:00', 'Client interested, negotiating the rent'),
('C6', 'P006', '2024-10-06 09:00:00', 'Client liked the area but wants more rooms'),
('C7', 'P007', '2024-10-07 15:30:00', 'Client happy with the property, booking another visit');


create  table  Registration(
clientNo  varchar(20)  NOT  NULL  References Client(clientNo),
branchNo  varchar(20)  NOT  NULL  References Branch(branchNo),
staffNo varchar(20) NOT NULL References Staff(staffNo), 
dateJoined  DateTime  NOT  NULL)

INSERT INTO Registration (clientNo, branchNo, staffNo, dateJoined)
VALUES
('C1', 'B001', 'NSA85', '2024-10-01 09:00:00'),
('C2', 'B002', 'NSA86', '2024-10-02 09:00:00'),
('C3', 'B003', 'NSA87', '2024-10-03 09:00:00'),
('C4', 'B004', 'NSA88', '2024-10-04 09:00:00'),
('C5', 'B005', 'NSA89', '2024-10-05 09:00:00'),
('C6', 'B006', 'NSA90', '2024-10-06 09:00:00'),
('C7', 'B007', 'NSA91', '2024-10-07 09:00:00');


SELECT * FROM STAFF
SELECT * FROM Branch, STAFF 
SELECT * FROM Branch, STAFF WHERE Branch.branchNo = Staff.branchNo;
SELECT * FROM Branch, STAFF WHERE Branch.branchNo = N'B007'


Update Branch set city='ABT' where branchNo='B007'

Delete from Viewing where clientNo='C1'

Drop table Registration 


Alter table Viewing Add commentTwo varChar(20)