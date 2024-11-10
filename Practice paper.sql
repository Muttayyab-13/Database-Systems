create database MovieCollection 

use MovieCollection 
go


-- MovieStar Table
CREATE TABLE MovieStar (
    starName VARCHAR(100) PRIMARY KEY,
    address VARCHAR(200),
    gender CHAR(1),
    birthdate DATE
);

-- MovieExec Table
CREATE TABLE MovieExec (
    producer# INT PRIMARY KEY,
    producerName VARCHAR(100),
    address VARCHAR(200),
    netWorth DECIMAL(15, 2)
);

-- Studio Table
CREATE TABLE Studio (
    studioName VARCHAR(100) PRIMARY KEY,
    address VARCHAR(200),
    presC# INT
);

-- Movies Table
CREATE TABLE Movies (
    title VARCHAR(100),
    year INT,
    length INT,
    genre VARCHAR(50),
    studioName VARCHAR(100),
    producer# INT,
    PRIMARY KEY (title, year),
    FOREIGN KEY (studioName) REFERENCES Studio(studioName),
    FOREIGN KEY (producer#) REFERENCES MovieExec(producer#)
);

-- StarsIn Table
CREATE TABLE StarsIn (
    movieTitle VARCHAR(100),
    movieYear INT,
    starName VARCHAR(100),
    PRIMARY KEY (movieTitle, movieYear, starName),
    FOREIGN KEY (movieTitle, movieYear) REFERENCES Movies(title, year),
    FOREIGN KEY (starName) REFERENCES MovieStar(starName)
);

-- Movies Table
INSERT INTO Movies (title, year, length, genre, studioName, producer#) VALUES
('Inception', 2010, 148, 'Sci-Fi', 'Warner Bros', 101),
('The Dark Knight', 2008, 152, 'Action', 'Warner Bros', 101),
('Titanic', 1997, 195, 'Romance', 'Paramount', 102),
('Avatar', 2009, 162, 'Sci-Fi', '20th Century Fox', 103),
('The Godfather', 1972, 175, 'Crime', 'Paramount', 104);

-- StarsIn Table
INSERT INTO StarsIn (movieTitle, movieYear, starName) VALUES
('Inception', 2010, 'Leonardo DiCaprio'),
('The Dark Knight', 2008, 'Christian Bale'),
('Titanic', 1997, 'Leonardo DiCaprio'),
('Avatar', 2009, 'Zoe Saldana'),
('The Godfather', 1972, 'Al Pacino');

INSERT INTO StarsIn (movieTitle, movieYear, starName) VALUES
('Dil Wale', 2024, 'Sher Dil');

-- MovieStar Table
INSERT INTO MovieStar (starName, address, gender, birthdate) VALUES
('Leonardo DiCaprio', 'Los Angeles, CA', 'M', '1974-11-11'),
('Christian Bale', 'Santa Monica, CA', 'M', '1974-01-30'),
('Zoe Saldana', 'Passaic, NJ', 'F', '1978-06-19'),
('Al Pacino', 'New York, NY', 'M', '1940-04-25'),
('Kate Winslet', 'Reading, UK', 'F', '1975-10-05');

INSERT INTO MovieStar (starName, address, gender, birthdate) VALUES
('Sher Dil', 'Pakistan', 'M', '1974-11-11');

-- MovieExec Table
INSERT INTO MovieExec (producer#, producerName, address, netWorth) VALUES
(101, 'Christopher Nolan', 'London, UK', 20000000.00),
(102, 'James Cameron', 'Malibu, CA', 70000000.00),
(103, 'Jon Landau', 'Los Angeles, CA', 50000000.00),
(104, 'Francis Ford Coppola', 'San Francisco, CA', 25000000.00),
(105, 'Steven Spielberg', 'Los Angeles, CA', 350000000.00);

-- Studio Table
INSERT INTO Studio (studioName, address, presC#) VALUES
('Warner Bros', 'Burbank, CA', 201),
('Paramount', 'Hollywood, CA', 202),
('20th Century Fox', 'Century City, CA', 203),
('Universal', 'Universal City, CA', 204),
('Columbia Pictures', 'Culver City, CA', 205);




SELECT M.title, M.year, M.length, M.genre, MS.starName
FROM Movies M
INNER JOIN StarsIn MS ON M.title = MS.movieTitle AND M.year = MS.movieYear;

--Left Join
SELECT M.title, M.year, MS.starName
FROM Movies M
LEFT JOIN StarsIn MS ON M.title = MS.movieTitle AND M.year = MS.movieYear;

--Right Join
SELECT M.title, M.year, M.genre, MS.starName
FROM Movies M
RIGHT JOIN StarsIn MS ON M.title = MS.movieTitle AND M.year = MS.movieYear;


SELECT M.title, M.year, M.genre, MS.starName
FROM Movies M
FULL OUTER JOIN StarsIn MS ON M.title = MS.movieTitle AND M.year = MS.movieYear;


SELECT M.title, MS.starName
FROM Movies M
CROSS JOIN MovieStar MS;




Select 