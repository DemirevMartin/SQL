-- Creating the Pharmacy database
CREATE DATABASE PharmacyDB COLLATE Cyrillic_General_CI_AS;

-- Creating Medicines table
CREATE TABLE Medicines
(
	ID INT NOT NULL PRIMARY KEY,
	Quantity INT NOT NULL,
	DateOfManufacture DATE NOT NULL,
	ExpiryDateInDays INT NOT NULL,
	CurrentDate DATE NOT NULL DEFAULT (GETDATE())
);

-- Data input in Medicines table
INSERT INTO Medicines(ID, Quantity, DateOfManufacture, ExpiryDateInDays)
VALUES (1, 1200, '2015-05-03', 720),
		(2, 300, '2011-12-04', 540),
		(3, 200, '2014-03-05', 540),
		(4, 380, '2012-03-10', 720),
		(5, 1300, '2013-04-12', 600),
		(6, 240, '2013-05-16', 800),
		(7, 1120, '2016-07-11', 815),
		(8, 1140, '2013-02-12', 300),
		(9, 420, '2014-04-09', 700),
		(10, 540, '2015-04-10', 740),
		(11, 312, '2011-07-12', 520),
		(12, 1220, '2015-08-18', 640),
		(13, 1000, '2015-05-15', 320),
		(14, 2000, '2016-09-15', 750),
		(15, 300, '2012-12-01', 550);