--1
SELECT FirstName, MiddleName, LastName, 
       CONCAT(LEFT(FirstName, 1), IIF(MiddleName IS NULL, '*', LEFT(MiddleName, 1)), LEFT(LastName, 1)) AS [Abbr]
FROM Employees
ORDER BY FirstName ASC;

--2          -------TWO SOLUTIONS FOR THE FORMAT OF THE DATE AND WHERE STATEMENT!-------
SELECT Name, FORMAT(StartDate, 'd', 'de-DE') AS [Start date], FORMAT(EndDate, 'dd.MM.yyyy') AS [End date]
FROM Projects
WHERE DATEDIFF(day, StartDate, IIF(EndDate IS NULL, GETDATE(), EndDate)) < 365
--2 way: DATEADD(year, 1, StartDate) > ISNULL(EndDate, GETDATE())
ORDER BY StartDate ASC;

--3
SELECT DISTINCT FirstName, DENSE_RANK() OVER (ORDER BY LEN(FirstName) ASC) AS [Rank]
FROM Employees
ORDER BY [Rank], FirstName ASC;

--4
SELECT ROW_NUMBER() OVER (PARTITION BY DepartmentID ORDER BY JobTitle, LastName ASC) AS [Rank],
	   DepartmentID, JobTitle, LastName
FROM Employees
ORDER BY DepartmentID, JobTitle, LastName ASC;

--5
CREATE VIEW V_TopSalariesPerDep AS
SELECT ROW_NUMBER() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS [Rank],
	   DepartmentID, Salary
FROM Employees
---------
SELECT DepartmentID, Salary
FROM V_TopSalariesPerDep
WHERE [Rank] <= 2
ORDER BY DepartmentID ASC, Salary DESC;