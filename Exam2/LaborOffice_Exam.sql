--1
SELECT JobID AS [��� �� �������], JobName AS [�������], 
	ISNULL(FORMAT(Salary, 'C', 'bg-BG'), 0) AS [�������]
FROM Jobs
WHERE JobName LIKE '%�������%'
ORDER BY Salary DESC;

--2
SELECT JobID AS [��� �� �������], JobName AS [�������], 
	IIF(Salary IS NULL, 0, Salary) AS [�������]
FROM Jobs
ORDER BY 
	CASE 
		WHEN JobName LIKE '%����������%' THEN 1
		WHEN JobName LIKE '%�������������%' THEN 2
		ELSE 3
	END, Salary DESC;

--3
SELECT ApplicantID AS [���], 
		IIF(Experience > 5, Name + ' *', Name) AS [���],
		Experience AS [���� (�.)]
FROM Applicants
ORDER BY Name ASC;

--4
SELECT JobName AS [��������], FORMAT(AVG(Salary), 'C', 'BG') AS [������ �������]
FROM Jobs
GROUP BY JobName
ORDER BY JobName;

--5
SELECT RecruiterID AS [��� �� ���������], 
	MAX(Experience) AS [����. ���� �� �����������], MIN(Experience) AS [���. ���� �� �����������]
FROM Applicants
GROUP BY RecruiterID;

--6
SELECT E.EmployerName AS [�����������], E.Phone AS [���. �� �����������], J.JobName AS [�������], 
	J.NumberOfVacancies AS [��. ������� �����], J.Salary AS [�������]
FROM Employers E
INNER JOIN Jobs J
ON E.EmployerID = J.EmployerID 
WHERE Salary IS NOT NULL
ORDER BY NumberOfVacancies ASC, Salary DESC;

--7
SELECT E.EmployerName AS [�����������], SUM(J.NumberOfVacancies) AS [��. ������� �����]
FROM Employers E
INNER JOIN Jobs J
ON E.EmployerID = J.EmployerID 
GROUP BY E.EmployerName
ORDER BY SUM(J.NumberOfVacancies) DESC;

--8
SELECT E.EmployerName AS [�����������], J.JobName AS [�������], A.Name AS [��� �� ��������], 
	A.Experience AS [���� (�.)], 
	CASE 
		WHEN Experience > 10 THEN '�����'
		WHEN Experience >= 3 AND Experience <= 10 THEN '������'
		ELSE '�����'
	END AS [���������]
FROM Jobs J
INNER JOIN Applicants A
ON J.JobID = A.JobID
INNER JOIN Employers E
ON E.EmployerID = J.EmployerID
ORDER BY Experience DESC, A.Name ASC;