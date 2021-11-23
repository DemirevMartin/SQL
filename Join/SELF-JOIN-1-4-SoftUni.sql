--1
SELECT e.EmployeeID, e.FirstName, e.LastName, e.ManagerID, m.FirstName + ' ' + m.LastName AS [ManagerName]
FROM Employees e
INNER JOIN Employees m
ON m.EmployeeID = e.ManagerID
ORDER BY EmployeeID ASC;

--2
SELECT m.FirstName + ' ' + m.LastName AS [ManagerName], m.JobTitle, COUNT(e.EmployeeID) AS [Num of Employees]
FROM Employees e
INNER JOIN Employees m
ON m.EmployeeID = e.ManagerID
GROUP BY m.FirstName + ' ' + m.LastName, m.JobTitle
ORDER BY COUNT(e.EmployeeID) DESC;

--3
SELECT m.FirstName + ' ' + m.LastName AS [ManagerName], m.JobTitle, d.Name AS [Department],
		COUNT(e.EmployeeID) AS [Num of Employees]
FROM Employees e
INNER JOIN Employees m
ON m.EmployeeID = e.ManagerID
INNER JOIN Departments d
ON d.DepartmentID = m.DepartmentID
GROUP BY m.FirstName + ' ' + m.LastName, m.JobTitle, d.Name
ORDER BY COUNT(e.EmployeeID) DESC;

--4
SELECT e.FirstName + ' ' + e.LastName AS [EmployeeName], t1.Name AS [Town], m.FirstName + ' ' + m.LastName AS [ManagerName], t2.Name  AS [Town]
FROM Employees e
INNER JOIN Employees m
ON m.EmployeeID = e.ManagerID
INNER JOIN Addresses a1
ON a1.AddressID = e.AddressID
INNER JOIN Towns t1
ON a1.TownID = t1.TownID
INNER JOIN Addresses a2
ON a2.AddressID = m.AddressID
INNER JOIN Towns t2
ON a2.TownID = t2.TownID
WHERE t1.Name = t2.Name
ORDER BY EmployeeName ASC;