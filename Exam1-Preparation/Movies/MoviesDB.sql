CREATE DATABASE MoviesDB;

CREATE TABLE Movies(
ID INT NOT NULL PRIMARY KEY,
Title NVARCHAR(100) NOT NULL,
Genre NVARCHAR(40) NOT NULL,
Rating FLOAT NOT NULL,
Company NVARCHAR(40) NOT NULL,
Income MONEY NOT NULL
);