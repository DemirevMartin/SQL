--1
CREATE DATABASE Hotel
GO

--2
CREATE TABLE Income(
ID INT NOT NULL IDENTITY(1,1),
Date Date NOT NULL,
RoomNum INT NOT NULL,
Service VARCHAR(40),
Value MONEY,
PRIMARY KEY (ID)
);
GO

--3
SET IDENTITY_INSERT Income ON
INSERT INTO Income(ID, Date, RoomNum, Service, Value)
VALUES (1, '1/2/2005', 203, 'ski wardrobe', 17),
		(2, '1/2/2005', 101, 'restaurant', 23),
		(3, '1/2/2005', 205, 'fitness', 5),
		(4, '1/2/2005', 204, 'ski wardrobe', 22),
		(5, '2/2/2005', 106, 'sauna', 8),
		(6, '2/2/2005', 308, 'restaurant', 16),
		(7, '1/2/2005', 101, 'sauna', 16),
		(8, '2/2/2005', 303, 'fitness', 10),
		(9, '2/2/2005', 304, 'room service', 17),
		(10, '2/2/2005', 308, 'ski wardrobe', 22),
		(11, '3/2/2005', 309, 'fitness', 15),
		(12, '3/2/2005', 311, 'sauna', 7),
		(13, '3/2/2005', 318, 'restaurant', 25)
SET IDENTITY_INSERT Income OFF