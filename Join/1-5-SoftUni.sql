--1
SELECT e.EmployeeID, e.JobTitle, e.AddressID, a.AddressText
FROM Employees AS e
INNER JOIN Addresses AS a
ON e.AddressID = a.AddressID
ORDER BY AddressID ASC;

--2
SELECT EmployeeID, FirstName, Salary, d.Name AS [DepartmentName] 
FROM Employees AS e
INNER JOIN Departments AS d
ON e.DepartmentID = d.DepartmentID
WHERE Salary > 15000
ORDER BY e.DepartmentID ASC;

--3
CREATE VIEW V_EmplProjects AS
SELECT e.EmployeeID, e.FirstName, ProjectID
FROM Employees AS e
LEFT OUTER JOIN EmployeesProjects AS ep
ON e.EmployeeID = ep.EmployeeID
--------
SELECT EmployeeID, FirstName
FROM V_EmplProjects
WHERE ProjectID IS NULL
ORDER BY EmployeeID ASC;

--4
CREATE VIEW V_ProjectName AS
SELECT e.EmployeeID, e.FirstName, p.Name AS [ProjectName], StartDate, EndDate
FROM EmployeesProjects AS ep
INNER JOIN Employees AS e
ON e.EmployeeID = ep.EmployeeID
INNER JOIN Projects AS p
ON ep.ProjectID = p.ProjectID
---------
SELECT EmployeeID, FirstName, ProjectName
FROM V_ProjectName
WHERE StartDate > '2002-08-13' AND EndDate IS NULL
ORDER BY EmployeeID ASC;

--5
SELECT EmployeeID, FirstName, IIF(YEAR(StartDate) >= 2005, NULL, ProjectName)
FROM V_ProjectName
WHERE EmployeeID = 24;