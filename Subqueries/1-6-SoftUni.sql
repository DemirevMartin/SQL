--1
SELECT LastName AS [Служител], Salary AS [Заплата], 
		Salary - (SELECT MIN(Salary) FROM Employees) AS [Разлика]
FROM Employees
WHERE Salary  <=  (SELECT MIN(Salary)
		FROM Employees) * 120 / 100
GROUP BY LastName, Salary
ORDER BY LastName ASC;

--2
SELECT LastName, Salary
FROM Employees E
WHERE Salary = (SELECT MIN(Salary) FROM Employees WHERE DepartmentID = E.DepartmentID)
ORDER BY DepartmentID, LastName;

--3
SELECT AVG(Salary) AS [Average DepMan Salary]
FROM Employees
WHERE EmployeeID IN (SELECT DISTINCT ManagerID FROM Departments);

--4
SELECT EmployeeID, LastName
FROM Employees
WHERE AddressID IN (SELECT AddressID FROM Addresses 
					WHERE TownID IN (SELECT TownID 
									 FROM Towns WHERE Name IN ('Carnation', 'Index')))
ORDER BY EmployeeID ASC;

--5
SELECT FirstName, LastName, Salary, DepartmentID
FROM Employees E
WHERE E.Salary > ALL 
				 (SELECT Salary FROM Employees
				  WHERE DepartmentID = E.DepartmentID AND EmployeeID NOT LIKE E.EmployeeID)
ORDER BY E.DepartmentID;

--6
SELECT LastName, Salary, 
 (SELECT LastName FROM Employees E WHERE E.EmployeeID = M.ManagerID) AS [MgrLastName], 
 (SELECT Salary FROM Employees P WHERE P.EmployeeID = M.ManagerID) AS [MgrSalary]
FROM Employees M
WHERE (SELECT Salary FROM Employees P WHERE P.EmployeeID = M.ManagerID) < Salary
ORDER BY LastName ASC;