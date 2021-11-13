-- Creating the StoreDB_v2 database
CREATE DATABASE StoreDB_v2 COLLATE Cyrillic_General_CI_AS;

use StoreDB_v2
GO

-- Creating Salemans table
CREATE TABLE Salemans
(
	SalemanID INT NOT NULL PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
	City VARCHAR(50) NOT NULL,
	Commission FLOAT NOT NULL
);

-- Creating Customers table
CREATE TABLE Customers
(
	CustomerID INT NOT NULL PRIMARY KEY,
	CustName VARCHAR(50) NOT NULL,
	City VARCHAR(50) NOT NULL,
	Grade INT NOT NULL,
	-- SalemanID INT FOREIGN KEY REFERENCES Salemans(SalemanID)
);

-- Creating Orders table
CREATE TABLE Orders
(
	OrdID INT NOT NULL PRIMARY KEY,
	PurchaseAmt MONEY NOT NULL,
	OrdDate DATE NOT NULL,
	CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
	SalemanID INT FOREIGN KEY REFERENCES Salemans(SalemanID),
);

-- Data input in Salemans table
INSERT INTO Salemans
VALUES (1, 'James Hoog', 'New York', 0.15),
		(2, 'Nail Knite', 'Paris', 0.13),
		(3, 'Lauson Hen', 'San Jose', 0.12),
		(5, 'Pit Alex', 'London', 0.11),
		(6, 'Mc Lyon', 'Paris', 0.14),
		(7, 'Paul Adam', 'Rome', 0.13);


-- Data input in Customers table
INSERT INTO Customers
VALUES (1, 'Brad Guzan', 'London', 100),
		(2, 'Nick Rimando', 'New York', 100),
		(3, 'Jozy Altidor', 'Moscow', 200),
		(4, 'Fabian Johnson', 'Paris', 300),
		(5, 'Graham Zusi', 'California', 200),
		(6, 'Brad Davis', 'New York', 200),
		(7, 'Julian Green', 'London', 300),
		(8, 'Geoff Cameron', 'Berlin', 100);


-- Data input in Orders table
INSERT INTO Orders
VALUES (1, 150.5, '2012-10-05', 5, 2),
		(2, 65.26, '2012-10-05', 2, 1),
		(3, 2480.4, '2012-10-10', 8, 3),
		(4, 110.5, '2012-08-17', 8, 3),
		(5, 2400.6, '2012-07-27', 7, 1),
		(6, 948.5, '2012-09-10', 5, 2),
		(7, 5760, '2012-09-10', 2, 1),
		(8, 270.65, '2012-09-10', 1, 5),
		(9, 1983.43, '2012-10-10', 4, 6),
		(10, 75.29, '2012-08-17', 3, 7),
		(11, 250.45, '2012-06-27', 8, 2),
		(12, 3045.6, '2012-04-25', 2, 1);
