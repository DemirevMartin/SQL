--1
SELECT Title, Genre, Rating, Company, Income
FROM Movies
ORDER BY Company ASC, Rating DESC

--2
SELECT Title AS [��������], Genre AS [����], Income AS [������� �� ��������]
FROM Movies
WHERE Genre LIKE N'�������'
ORDER BY Income DESC;

--3 
SELECT Title AS [��������], Genre AS [����], Rating AS [�������], Income AS [������� �� ��������]
FROM Movies
WHERE (Company LIKE 'Paramount' OR Company LIKE 'Fox') AND Rating < 6
ORDER BY Title ASC;

--4
SELECT Title AS [��������]
FROM Movies
WHERE Title LIKE '% %'
ORDER BY Title ASC;

--5
SELECT * FROM V_HighestRating;

--6
SELECT *
INTO MoviesCopy
FROM Movies;

--7
DELETE FROM MoviesCopy
WHERE Rating < 6;

--8
DELETE FROM MoviesCopy
WHERE Company = 'Fox' AND Genre = N'��������';

--9
UPDATE MoviesCopy
SET Genre = N'������������'
WHERE Genre LIKE N'�����';

--10
UPDATE MoviesCopy
SET Rating = 9
WHERE Rating > 8;

--11
TRUNCATE TABLE MoviesCopy;