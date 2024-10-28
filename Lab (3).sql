create database [Lab One];



create table Students(std_id int,fName varchar(15),lName nvarchar(10),CGPA int);

use [first Lab]
Go

Insert into	Students(std_id,fName,lName,CGPA) Values(1,'Amna','Ali',3)
Insert into	Students(std_id,fName,lName,CGPA) Values(2,'Hashir','Chaudhary',4)
Insert into	Students(std_id,fName,lName,CGPA) Values(3,'Abdul','Momin',2)
Insert into	Students(std_id,fName,lName,CGPA) Values(4,'Muneeb','Khan',3)

Select * From Students where CGPA>2

create table Employee(E_id int not null,eFname varchar(15),eLName nvarchar(10));

insert into Employee(E_id,eFname,eLName)values(01,'Momina','ahmed')
insert into Employee(E_id,eFname,eLName)values(01,'Amina','momin')
insert into Employee(E_id,eFname,eLName)values(01,'hira','bilal')
insert into Employee(eFname,eLName)values('ahmed','ali') 

select * from Employee


create table Transcript(Transcript_ID int PRIMARY KEY, S_ID int NOT NULL, Course_Code varchar(10) NOT NULL,Course_Name varchar(50) NOT NULL,Grade char(2),Semester varchar(10));

insert into Transcript(Transcript_ID, S_ID, Course_Code, Course_Name, Grade, Semester) 
VALUES (1, 1, 'CS101', 'Computer Science Basics', 'B', 'Fall2023');

insert into Transcript(Transcript_ID, S_ID, Course_Code, Course_Name, Grade, Semester) 
VALUES (2, 2, 'CS102', 'Object-Oriented Programming', 'A', 'Fall2023');

insert into Transcript(Transcript_ID, S_ID, Course_Code, Course_Name, Grade, Semester) 
VALUES (3, 3, 'MTH101', 'Calculus I', 'B+', 'Fall2023');

insert into Transcript(Transcript_ID, S_ID, Course_Code, Course_Name, Grade, Semester) 
VALUES (4, 4, 'PHY101', 'Physics I', 'A', 'Fall2023');

Select * from Transcript