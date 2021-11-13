--5
CREATE VIEW V_EmployeeNameJobTitle AS
SELECT TOP (1515) LastName + ', ' + FirstName AS [Full Name], JobTitle AS [Job Title] 
FROM Employees
WHERE  MiddleName IS NOT NULL
ORDER BY LastName DESC;