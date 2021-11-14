--1
SELECT FirstName, LastName
FROM Employees
WHERE LEN(FirstName) * 2 = LEN(LastName)
ORDER BY FirstName ASC;

--2
SELECT FirstName, LastName
FROM Employees
WHERE CHARINDEX('an', FirstName) <= 7 AND CHARINDEX('an', FirstName) >= 3
ORDER BY FirstName ASC;

--3
SELECT FirstName, LastName
FROM Employees
WHERE RIGHT(FirstName, 1) LIKE LOWER(LEFT(LastName, 1))
ORDER BY FirstName ASC;

--4
SELECT LEFT(LastName, 2) + REPLICATE('*', LEN(LastName) - 2) AS [Employee], FORMAT(Salary, 'C') AS [Annual salary]
FROM Employees
WHERE Salary > 50000
ORDER BY Salary DESC;

--5
SELECT FirstName, LastName, FORMAT(Salary / 12, 'C') AS [Monthly salary]
FROM Employees
WHERE  ManagerID IS NULL
ORDER BY FirstName ASC;

--6
SELECT Name
FROM Towns
WHERE NOT (CHARINDEX(LOWER(LEFT(Name, 1)), RIGHT(Name, LEN(Name) - 1)) = 0)
ORDER BY Name ASC;

--7
SELECT Name
FROM Towns
WHERE NOT(CHARINDEX(RIGHT(Name, 1), 'database') = 0)
ORDER BY REVERSE(Name) ASC;