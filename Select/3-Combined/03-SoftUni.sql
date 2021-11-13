--SoftUni--
--1
SELECT TOP (5) FirstName, LastName
FROM Employees
ORDER BY Salary DESC;

--2 
SELECT FirstName, LastName
FROM Employees
WHERE NOT (DepartmentID = 4)

--3 
SELECT *
FROM Employees
ORDER BY Salary DESC, FirstName ASC, LastName DESC, MiddleName ASC

--4
SELECT * FROM V_EmployeesSalaries;

--5
SELECT * FROM V_EmployeeNameJobTitle;

--6
SELECT DISTINCT JobTitle
FROM Employees
WHERE JobTitle LIKE '% %'
ORDER BY JobTitle ASC;

--7
SELECT TOP (10) *
FROM Projects
ORDER BY StartDate ASC, Name ASC;

--8
SELECT TOP (7) FirstName, LastName, HireDate
FROM Employees
ORDER BY HireDate DESC;