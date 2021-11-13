--Geography--
--9
SELECT PeakName, Elevation
FROM Peaks
WHERE (PeakName LIKE 'M%' OR PeakName LIKE 'K%') AND Elevation <= 4500;

--10
SELECT TOP (30) CountryName, Population
FROM Countries
WHERE ContinentCode LIKE 'EU'
ORDER BY Population DESC, CountryName ASC;

--11
SELECT CountryName, CurrencyCode, ContinentCode
FROM Countries
WHERE NOT (ContinentCode LIKE 'AS' OR ContinentCode LIKE 'AF') AND CurrencyCode LIKE '%D'
ORDER BY CountryName ASC; 

--12
SET ARITHABORT OFF
SET ANSI_WARNINGS OFF
SELECT TOP (15) CountryName, (Population / AreaInSqKm) AS [Population density]
FROM Countries
WHERE NOT (AreaInSqKm = 0)
ORDER BY [Population density] DESC;