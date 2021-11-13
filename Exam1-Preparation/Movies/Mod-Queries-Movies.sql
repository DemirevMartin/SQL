--1
SELECT Title, Genre, Rating, Company, Income
FROM Movies
ORDER BY Company ASC, Rating DESC

--2
SELECT Title AS [Заглавие], Genre AS [Жанр], Income AS [Приходи от продажби]
FROM Movies
WHERE Genre LIKE N'Комедия'
ORDER BY Income DESC;

--3 
SELECT Title AS [Заглавие], Genre AS [Жанр], Rating AS [Рейтинг], Income AS [Приходи от продажби]
FROM Movies
WHERE (Company LIKE 'Paramount' OR Company LIKE 'Fox') AND Rating < 6
ORDER BY Title ASC;

--4
SELECT Title AS [Заглавие]
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
WHERE Company = 'Fox' AND Genre = N'Анимация';

--9
UPDATE MoviesCopy
SET Genre = N'Приключенски'
WHERE Genre LIKE N'Екшън';

--10
UPDATE MoviesCopy
SET Rating = 9
WHERE Rating > 8;

--11
TRUNCATE TABLE MoviesCopy;