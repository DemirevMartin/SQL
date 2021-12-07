--1
SELECT JobID AS [Код на позиция], JobName AS [Позиция], 
	ISNULL(FORMAT(Salary, 'C', 'bg-BG'), 0) AS [Заплата]
FROM Jobs
WHERE JobName LIKE '%инженер%'
ORDER BY Salary DESC;

--2
SELECT JobID AS [Код на позиция], JobName AS [Позиция], 
	IIF(Salary IS NULL, 0, Salary) AS [Заплата]
FROM Jobs
ORDER BY 
	CASE 
		WHEN JobName LIKE '%програмист%' THEN 1
		WHEN JobName LIKE '%администратор%' THEN 2
		ELSE 3
	END, Salary DESC;

--3
SELECT ApplicantID AS [Код], 
		IIF(Experience > 5, Name + ' *', Name) AS [Име],
		Experience AS [Стаж (г.)]
FROM Applicants
ORDER BY Name ASC;

--4
SELECT JobName AS [Професия], FORMAT(AVG(Salary), 'C', 'BG') AS [Средна заплата]
FROM Jobs
GROUP BY JobName
ORDER BY JobName;

--5
SELECT RecruiterID AS [Код на посредник], 
	MAX(Experience) AS [Макс. стаж на кандидатите], MIN(Experience) AS [Мин. стаж на кандидатите]
FROM Applicants
GROUP BY RecruiterID;

--6
SELECT E.EmployerName AS [Работодател], E.Phone AS [Тел. на работодател], J.JobName AS [Позиция], 
	J.NumberOfVacancies AS [Бр. работни места], J.Salary AS [Заплата]
FROM Employers E
INNER JOIN Jobs J
ON E.EmployerID = J.EmployerID 
WHERE Salary IS NOT NULL
ORDER BY NumberOfVacancies ASC, Salary DESC;

--7
SELECT E.EmployerName AS [Работодател], SUM(J.NumberOfVacancies) AS [Бр. работни места]
FROM Employers E
INNER JOIN Jobs J
ON E.EmployerID = J.EmployerID 
GROUP BY E.EmployerName
ORDER BY SUM(J.NumberOfVacancies) DESC;

--8
SELECT E.EmployerName AS [Работодател], J.JobName AS [Позиция], A.Name AS [Име на кандидат], 
	A.Experience AS [Стаж (г.)], 
	CASE 
		WHEN Experience > 10 THEN 'висок'
		WHEN Experience >= 3 AND Experience <= 10 THEN 'среден'
		ELSE 'нисък'
	END AS [Приоритет]
FROM Jobs J
INNER JOIN Applicants A
ON J.JobID = A.JobID
INNER JOIN Employers E
ON E.EmployerID = J.EmployerID
ORDER BY Experience DESC, A.Name ASC;