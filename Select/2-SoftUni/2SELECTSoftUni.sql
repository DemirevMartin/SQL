--2
SELECT *
FROM Departments;

--3
SELECT Name
FROM Departments;

--4
SELECT FirstName, LastName, Salary
FROM Employees;

--5
SELECT FirstName, MiddleName, LastName
FROM Employees;

--6
SELECT FirstName + '.' + LastName + '@softuni.bg' AS [Full Email Adress]
FROM Employees;

--7
SELECT DISTINCT Salary
FROM Employees
ORDER BY Employees.Salary ASC;

--8
SELECT *
FROM Employees
WHERE Employees.JobTitle = 'Sales Representative';

--9
SELECT FirstName, LastName, JobTitle
FROM Employees
WHERE Employees.Salary BETWEEN 20000 AND 30000;

--10
SELECT FirstName + ' ' + MiddleName + ' ' + LastName AS [Full Name]
FROM Employees
WHERE (Employees.Salary = 25000 OR Employees.Salary = 14000 OR Employees.Salary = 12500 OR Employees.Salary = 23600);

--11
SELECT FirstName, LastName
FROM Employees
WHERE Employees.ManagerId IS NULL;

--12
SELECT FirstName, LastName, Salary
FROM Employees
WHERE Employees.Salary > 50000
ORDER BY Salary DESC;