create database enrollmentSystem

use enrollmentSystem
Go

CREATE TABLE Student (
    snum INT PRIMARY KEY,
    sname VARCHAR(100),
    major VARCHAR(100),
    level VARCHAR(50),
    age INT
);

CREATE TABLE Class (
    name VARCHAR(100),
    meets_at TIME,
    room VARCHAR(50),
    fid INT,
    PRIMARY KEY (name),
    FOREIGN KEY (fid) REFERENCES Faculty(fid)
);

CREATE TABLE Enrolled (
    snum INT,
    ename VARCHAR(100),
    PRIMARY KEY (snum, ename),
    FOREIGN KEY (snum) REFERENCES Student(snum),
    FOREIGN KEY (ename) REFERENCES Class(name)
);

CREATE TABLE Faculty (
    fid INT PRIMARY KEY,
    fname VARCHAR(100),
    deptid INT
);

INSERT INTO Student (snum, sname, major, level, age) VALUES
(101, 'John Doe', 'Computer Science', 'Undergraduate', 20),
(102, 'Jane Smith', 'Mathematics', 'Undergraduate', 22),
(103, 'Alice Johnson', 'Physics', 'Graduate', 25),
(104, 'Bob Lee', 'Computer Science', 'Undergraduate', 21),
(105, 'Charlie Brown', 'Engineering', 'Graduate', 24);

INSERT INTO Faculty (fid, fname, deptid) VALUES
(201, 'Dr. Robert White', 1),
(202, 'Dr. Susan Black', 2),
(203, 'Dr. Michael Green', 3),
(204, 'Dr. Emily Blue', 1),
(205, 'Dr. David Gray', 4);


INSERT INTO Class (name, meets_at, room, fid) VALUES
('CS101', '09:00:00', 'Room 101', 201),
('MATH201', '10:00:00', 'Room 202', 202),
('PHYS301', '11:00:00', 'Room 303', 203),
('CS102', '13:00:00', 'Room 104', 204),
('ENGR105', '14:00:00', 'Room 205', 205);

INSERT INTO Enrolled (snum, ename) VALUES
(101, 'CS101'),
(102, 'MATH201'),
(103, 'PHYS301'),
(104, 'CS102'),
(105, 'ENGR105'),
(101, 'MATH201'),
(104, 'PHYS301');


Select C.name from Class C where room='Room 104'

Union

Select E.ename from Enrolled E
Group by ename
having count(E.snum)>1

Select F.fname 
from Faculty F
join Class C on F.fid=C.fid
join Enrolled E on C.name=E.ename
group by F.fid,F.fname
having count(E.snum)>1;


