create database [lab four]

use [lab four]
Go

create table Employee(Employee_Number int, Employee_Name varChar(20), Job_type varChar(20), Salary decimal(8,4),Datee date )

alter table Employee alter column Salary numeric(8,2)

insert into Employee(Employee_Number, Employee_Name, Job_type, Salary,Datee )
Values(1,'Hashir','Software Engineer',10000.0,'2/18/2024'),
(1,'Hashir','Software Engineer',11000.0,'2/18/2024'),
(2,'Momin','Software Engineer',12000.0,'4/19/2024'),
(3,'Muneeb','Software Engineer',13000.0,'8/28/2024'),
(4,'Kashif','Software Engineer',14000.0,'12/31/2024'),
(5,'Momin','Software Engineer',15000.0,'11/7/2024'),
(6,'Muhammad','Software Engineer',16000.0,'1/9/2024')

select * from Employee

update Employee set Job_type='Sofware Engineer' 

update Employee set Job_type='Doctor' where Employee_Number=3

update Employee set Job_type='Manager' where Employee_Number=6

create table Department(Department_No int , Department_Name varChar(20), BlockName char(2) )

insert into Department(Department_No, Department_Name, BlockName )
Values(001,'Computer Science','Z '),
(002,'Business Law',' S'),
(003,'Intro to Sociology','C'),
(004,'Intro to Pschcology','A'),
(005,'Intro to Law','B'),
(006,'Technology','E'),
(007,'Communication','F')

Delete from Department where Department_No=001
Delete from Department where Department_No=005

select * from Department