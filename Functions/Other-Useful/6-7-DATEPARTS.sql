--6 !!! TABLE Projects FROM DATABASE SoftUni IS USED!!!
SELECT DISTINCT StartDate, 
	IIF(MONTH(StartDate) IN (7, 8) OR ((MONTH(StartDate) = 9) AND (DAY(StartDate) <= 14)), '����� ��������!', '������ ��������!!!')
FROM Projects;

--7
SELECT DISTINCT StartDate, 
	IIF(DATEPART(hour, StartDate) IN (23, 0, 1, 2, 3, 4), '���', IIF(DATEPART(hour, StartDate) IN (5, 6, 7, 8, 9), '������', 
		IIF(DATEPART(hour, StartDate) IN (19, 20, 21, 22), '�����', '���')))
FROM Projects;