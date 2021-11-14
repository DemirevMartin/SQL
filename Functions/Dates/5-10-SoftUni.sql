--5
SELECT EmployeeID, FirstName, LastName, HireDate
FROM Employees
WHERE DATENAME(weekday, HireDate) LIKE 'Monday';

--6
SELECT FirstName, HireDate
FROM Employees
WHERE YEAR(HireDate) = 2000;

--7
SELECT FirstName, LastName, HireDate
FROM Employees
WHERE MONTH(HireDate) = 6;

--8
SELECT FirstName, HireDate
FROM Employees
WHERE DATEDIFF(year, HireDate, GETDATE()) > 20
ORDER BY HireDate DESC;

--9
SELECT EmployeeID, LastName, HireDate, EOMONTH(HireDate) AS [First Salary]
FROM Employees;

--10
SELECT EmployeeID, LastName, HireDate, DATEDIFF(day, HireDate, EOMONTH(HireDate)) AS [Days Worked]
FROM Employees