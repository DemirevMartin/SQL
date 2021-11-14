--1 DROP VIEW V_PricePerDay
CREATE VIEW V_PricePerDay AS
SELECT Company, DurationOfBroadcasting, [Views], 
	   ROUND((DurationOfBroadcasting * [Views] * 3.01), 2) AS [PricePerDay]
FROM Advertising

SELECT Company AS [Фирма], DurationOfBroadcasting AS [Продължителност на излъчване (ед.)], [Views] AS [Брой излъчвания], 
		FORMAT(PricePerDay, 'C', 'bg-BG') AS [PricePerDay]
FROM V_PricePerDay;
--2
CREATE VIEW V_Discount AS
SELECT Company, PricePerDay, 
	   CASE 
		   WHEN PricePerDay <= 14 THEN 0
		   WHEN PricePerDay > 14 AND [PricePerDay] <= 29 THEN (PricePerDay * 5 / 100)
		   ELSE (PricePerDay * 7 / 100)
	   END AS [Discount]
FROM V_PricePerDay

SELECT Company AS [Фирма], PricePerDay, 
		FORMAT(Discount, 'C', 'bg-BG') AS [Discount]
FROM V_Discount;

--3
CREATE VIEW V_Combined AS
SELECT Company, FORMAT(PricePerDay, 'C', 'bg-BG') AS [PricePerDay], FORMAT(Discount, 'C', 'bg-BG') AS [Discount],
		PricePerDay - Discount AS [TotalPrice]
FROM V_Discount

SELECT Company, PricePerDay, Discount, FORMAT(TotalPrice, 'C', 'bg-BG') AS [TotalPrice], IIF(TotalPrice > 20, 'yes', 'no') AS [FreeAdvertisement]
FROM V_Combined

--4
SELECT Company
FROM Advertising
ORDER BY 
    CASE 
		WHEN LOWER(LEFT(Company, 1)) LIKE N'ф' THEN 0
		WHEN UPPER(LEFT(Company, 1)) LIKE N'Б' THEN 1
		WHEN UPPER(LEFT(Company, 1)) LIKE N'К' THEN 2
		ELSE 3
	END,
	Company ASC;

--5
SELECT ROW_NUMBER() OVER (PARTITION BY DurationOfBroadcasting ORDER BY Company ASC) AS [Company Rank],
		Company, DurationOfBroadcasting
FROM Advertising
ORDER BY DurationOfBroadcasting DESC;

--6
SELECT DENSE_RANK() OVER (PARTITION BY [Views] ORDER BY LEN(Company) ASC) AS [Rank], 
		Company, [Views]
FROM Advertising
ORDER BY [Views] ASC;