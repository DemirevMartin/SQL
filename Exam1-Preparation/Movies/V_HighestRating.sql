--5
CREATE VIEW V_HighestRating AS
SELECT TOP (1) Title AS [��������], Genre AS [����], Rating AS [�������]
FROM Movies
ORDER BY Rating DESC;