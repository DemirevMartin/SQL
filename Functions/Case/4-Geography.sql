--4
SELECT CountryName, AreaInSqKm, 
	CASE
	--Europe
		WHEN ContinentCode LIKE 'EU' 
			THEN IIF(AreaInSqKm < 100, 'tiny', IIF(AreaInSqKm >= 100 AND AreaInSqKm < 45000, 'small', 
				    IIF(AreaInSqKm >= 45000 AND AreaInSqKm < 150000, 'medium', IIF(AreaInSqKm >= 150000 AND AreaInSqKm < 300000, 'large', 'extra large'))))
	--Africa
		WHEN ContinentCode LIKE 'AF' 
			THEN IIF(AreaInSqKm < 1000, 'tiny', IIF(AreaInSqKm >= 1000 AND AreaInSqKm < 60000, 'small', 
				    IIF(AreaInSqKm >= 60000 AND AreaInSqKm < 200000, 'medium', IIF(AreaInSqKm >= 200000 AND AreaInSqKm < 350000, 'large', 'extra large'))))
	END AS [Area description]
FROM Countries
WHERE ContinentCode IN ('EU', 'AF')
ORDER BY CountryName ASC;