--8
SELECT CountryName AS [Country], Population / 1000000 AS [Population (mln)]
FROM Countries
WHERE Population > 1000000
ORDER BY Population DESC;

--9
SELECT PeakName, Elevation AS [Elevation (m)], FORMAT(Elevation / 0.3048, 'F1') AS [Elevation (ft)]
FROM Peaks
ORDER BY Elevation DESC;

--10
SELECT CountryName AS [Country Name], IsoCode AS [ISO Code]
FROM Countries
WHERE NOT (IsoCode = LEFT(CountryName, 3))
ORDER BY IsoCode ASC;

--11
SELECT PeakName, RiverName, LOWER(LEFT(PeakName, LEN(PeakName) - 1)) + RiverName AS [Mix]
FROM Peaks, Rivers
WHERE UPPER(RIGHT(PeakName, 1)) = LEFT(RiverName, 1)
ORDER BY Mix ASC;

--12
SELECT CountryName AS [Country], ContinentName AS [Continent]
FROM Continents, Countries
WHERE Continents.ContinentCode = Countries.ContinentCode AND LEFT(CountryName, 1) = LEFT(ContinentName, 1)
ORDER BY Country ASC;

--13
CREATE VIEW V_Smallest AS
SELECT MIN(Elevation) AS [Smallest]
FROM Peaks;

SELECT PeakName AS [Peak], Elevation
FROM Peaks, V_Smallest
WHERE Elevation > V_Smallest.Smallest * 3
ORDER BY Elevation ASC;