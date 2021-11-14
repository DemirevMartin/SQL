--1a
SELECT COUNT(Id) AS [Records]
FROM WizzardDeposits

--1b
CREATE VIEW V_GroupDeposits AS 
SELECT DepositGroup
FROM WizzardDeposits
GROUP BY DepositGroup;
-----
SELECT COUNT(DepositGroup) AS [Deposit groups]
FROM V_GroupDeposits

--1c
SELECT COUNT(Id) AS [Wizards of age 21-50]
FROM WizzardDeposits
WHERE Age >= 21 AND Age <= 50;

--2a
SELECT MAX(MagicWandSize) AS [LongestMagicWand]
FROM WizzardDeposits;

--2b
SELECT AVG(DepositAmount) AS [Average Deposit Amount]
FROM WizzardDeposits;

--3
SELECT DepositGroup, AVG(MagicWandSize) AS [Average MagicWand Size]
FROM WizzardDeposits
GROUP BY DepositGroup;

--4
--DROP VIEW V_Creators
CREATE VIEW V_Creators AS
SELECT MagicWandCreator, MIN(MagicWandSize) AS [Minimum]
FROM WizzardDeposits
GROUP BY MagicWandCreator
----
SELECT TOP (2) MagicWandCreator
FROM V_Creators
ORDER BY Minimum DESC;

--5
SELECT DepositGroup, SUM(DepositAmount) AS [TotalSum]
FROM WizzardDeposits
GROUP BY DepositGroup;

--6
SELECT MIN(DepositAmount) AS [Min Deposit], MAX(DepositAmount) AS [Max Deposit]
FROM WizzardDeposits
WHERE MagicWandCreator LIKE 'Ollivander family';

--7
SELECT MagicWandSize, SUM(DepositAmount) AS [TotalSum]
FROM WizzardDeposits
GROUP BY MagicWandSize
HAVING SUM(DepositAmount) < 150000;

--8
SELECT DepositGroup, MagicWandCreator, MIN(DepositCharge) AS [MInDepositCharge]
FROM WizzardDeposits
GROUP BY DepositGroup, MagicWandCreator
ORDER BY MagicWandCreator ASC, DepositGroup ASC;

--9
CREATE VIEW V_AgeGroup AS
SELECT CASE
			WHEN Age <= 10 THEN '[0-10]'
			WHEN Age > 10 AND Age <= 20 THEN '[11-20]'
			WHEN Age > 20 AND Age <= 30 THEN '[21-30]'
			WHEN Age > 30 AND Age <= 40 THEN '[31-40]'
			WHEN Age > 40 AND Age <= 50 THEN '[41-50]'
			WHEN Age > 50 AND Age <= 60 THEN '[51-60]'
			ELSE '[61+]'
		END AS [AgeGroup]
FROM WizzardDeposits;
------
SELECT AgeGroup,
		COUNT(AgeGroup) AS [WizardCount]
FROM V_AgeGroup
GROUP BY AgeGroup;

--10
SELECT DISTINCT LEFT(FirstName, 1) AS [FirstLetter]
FROM WizzardDeposits
WHERE DepositGroup LIKE 'Troll Chest'
ORDER BY [FirstLetter] ASC;

--11
SELECT DepositGroup, IsDepositExpired, AVG(DepositInterest) AS [AverageInterest]
FROM WizzardDeposits
WHERE DepositStartDate > '1985-01-01'
GROUP BY DepositGroup, IsDepositExpired
ORDER BY DepositGroup DESC, IsDepositExpired ASC;
