--1
--DROP VIEW V_DiffDates
CREATE VIEW V_DiffDates AS
SELECT Name, StartDate, EndDate, 
		DATEDIFF(month, StartDate, EndDate) AS [Diff]
FROM Projects;
------
SELECT Name, FORMAT(StartDate, 'dd.MM.yyyy') AS [Start Date], FORMAT(EndDate, 'dd.MM.yyyy') AS [End Date], 
	CASE
		WHEN Diff <= 9 THEN 'Short-term'
		WHEN (Diff > 9 AND Diff <= 18) THEN 'Medium-term'
		WHEN (Diff > 19 AND Diff <= 72) THEN 'Long-term'
		ELSE 'Endless'
	END AS [Duration]
FROM V_DiffDates
ORDER BY 
	CASE 
		WHEN EndDate IS NULL THEN 1
		ELSE 0
	END, EndDate, StartDate ASC, [Name] ASC;

--2
SELECT DISTINCT FORMAT(StartDate, 'dd.MM.yyyy') AS [Start Date],
		CASE
			WHEN MONTH(StartDate) IN (3, 4, 5) THEN 'Spring'
			WHEN MONTH(StartDate) IN (6, 7, 8) THEN 'Summer'
			WHEN MONTH(StartDate) IN (9, 10, 11) THEN 'Autumn'
			WHEN MONTH(StartDate) IN (1, 2, 12) THEN 'Winter'
			END AS [Start Season]
FROM Projects
ORDER BY [Start Season];

--3 COMPARE FirstName and LastName
SELECT FirstName, LastName
FROM Employees
ORDER BY IIF(FirstName < LastName, FirstName, LastName) ASC;