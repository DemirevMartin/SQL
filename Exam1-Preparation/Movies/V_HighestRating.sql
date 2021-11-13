--5
CREATE VIEW V_HighestRating AS
SELECT TOP (1) Title AS [Заглавие], Genre AS [Жанр], Rating AS [Рейтинг]
FROM Movies
ORDER BY Rating DESC;