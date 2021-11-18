--6
SELECT c.CountryCode, m.MountainRange, p.PeakName, p.Elevation
FROM MountainsCountries AS mc
INNER JOIN Countries AS c
ON c.CountryCode = mc.CountryCode
INNER JOIN Mountains AS m
ON mc.MountainId = m.Id
INNER JOIN Peaks AS p
ON p.MountainId = mc.MountainId
WHERE CountryName LIKE 'Bulgaria' AND Elevation > 2200
ORDER BY Elevation DESC;

--7
SELECT c.CountryCode, COUNT(m.MountainRange) AS [NumOfMountainRanges]
FROM MountainsCountries AS mc
INNER JOIN Countries AS c
ON c.CountryCode = mc.CountryCode
INNER JOIN Mountains AS m
ON mc.MountainId = m.Id
WHERE c.CountryCode IN ('BG', 'RU', 'US')
GROUP BY c.CountryCode;

--8
SELECT c.CountryName, r.RiverName
FROM CountriesRivers AS cr
FULL OUTER JOIN Countries AS c
ON c.CountryCode = cr.CountryCode
FULL OUTER JOIN Rivers AS r
ON r.Id = cr.RiverId
WHERE c.ContinentCode LIKE 'AF'
ORDER BY CountryName ASC;