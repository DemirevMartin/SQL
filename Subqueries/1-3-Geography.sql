--1
SELECT CountryName
FROM Countries C
WHERE CountryCode IN (SELECT CountryCode FROM MountainsCountries MC WHERE C.CountryCode = MC.CountryCode)
   OR CountryCode IN (SELECT CountryCode FROM CountriesRivers CR WHERE C.CountryCode = CR.CountryCode)
ORDER BY CountryName;

--2
SELECT CountryName
FROM Countries
WHERE ContinentCode LIKE 'AF' 
		AND AreaInSqKm < (SELECT AVG(AreaInSqKm) FROM Countries WHERE ContinentCode LIKE 'AF') 
		AND Population > (SELECT AVG(Population) FROM Countries WHERE ContinentCode LIKE 'AF')
ORDER BY CountryName ASC;

--2.2
SELECT CountryName, (SELECT ContinentName FROM Continents WHERE C.ContinentCode = Continents.ContinentCode) AS [ContinentName]
FROM Countries C 
WHERE AreaInSqKm < (SELECT AVG(CAST(AreaInSqKm AS BIGINT)) FROM Countries N WHERE C.ContinentCode = N.ContinentCode) 
		AND Population > (SELECT AVG(CAST(Population AS BIGINT)) FROM Countries T WHERE C.ContinentCode = T.ContinentCode)
ORDER BY [ContinentName] ASC, CountryName ASC;

--3***
SELECT RiverName
FROM Rivers 
WHERE Id IN (SELECT RiverId FROM CountriesRivers 
			 WHERE CountryCode IN (SELECT CountryCode FROM MountainsCountries 
					WHERE MountainId IN (SELECT MountainId FROM Peaks 
						GROUP BY MountainId HAVING COUNT(MountainId) > 2)))
ORDER BY RiverName ASC;