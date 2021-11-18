--1
SELECT *
FROM Items AS i
INNER JOIN Companies AS c
ON c.ComID = i.ComID;

--2
CREATE VIEW V_AvgPriceByComName AS
SELECT AVG(Price) AS [Avg Price], ComName
FROM Items AS i
INNER JOIN Companies AS c
ON c.ComID = i.ComID
GROUP BY ComName;
--------
SELECT *
FROM V_AvgPriceByComName;

--3
SELECT *
FROM V_AvgPriceByComName
WHERE [Avg Price] >= 350;

--4
--DROP VIEW V_MaxPriceByCompany
/*CREATE VIEW V_MaxPriceByCompany AS
SELECT DENSE_RANK() OVER (PARTITION BY ComName ORDER BY Price DESC) AS [PriceRank],
		ItemName, Price, ComName
FROM Items AS i
INNER JOIN Companies AS c
ON c.ComID = i.ComID;
-------
SELECT ItemName, Price, ComName
FROM V_MaxPriceByCompany
WHERE PriceRank = 1
ORDER BY ItemName ASC, Price DESC;*/

SELECT i.ItemName, i.Price, c.ComName
FROM Items AS i
INNER JOIN Companies AS c
ON c.ComID = i.ComID
	AND i.Price =  
	(
		SELECT MAX(i.Price)
		FROM Items i
		WHERE i.ComID = c.ComID
	)
ORDER BY i.ItemName, i.Price DESC;