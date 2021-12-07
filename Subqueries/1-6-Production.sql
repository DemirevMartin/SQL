--1
SELECT *
FROM Goods
WHERE (SELECT MIN(TradePrice) FROM Goods) = TradePrice;

--2
SELECT *
FROM Goods
WHERE TradePrice > (SELECT AVG(TradePrice) FROM Goods);

--3
SELECT GoodsName, 
		(SELECT SUM(QuantitySold) 
		FROM Sales s
		WHERE g.GoodsID = s.GoodsID) AS [CountOfGoodsSales]
FROM Goods g
ORDER BY GoodsName ASC;

--3 LEFT JOIN
SELECT g.GoodsName, SUM(s.QuantitySold) AS [CountOfGoodsSales]
FROM Goods g
LEFT JOIN Sales s 
ON s.GoodSID = g.GoodSID
GROUP BY g.GoodsName
ORDER BY G.GoodsName ASC;

--4
SELECT DISTINCT CustomerID, Name, MOL
FROM (SELECT C.CustomerID, C.Name, C.MOL, O.OrderDate 
		FROM Orders O, Customers C
		WHERE C.CustomerID = O.CustomerID) AS [Subquery]
WHERE OrderDate = '2015-10-01';

--4 
SELECT CustomerID, Name, MOL
FROM Customers
WHERE CustomerID IN (SELECT CustomerID
					 FROM Orders
					 WHERE OrderDate = '2015-10-01');

--4 INNER JOIN
SELECT DISTINCT C.CustomerID, C.Name, C.MOL
FROM Customers C
INNER JOIN Orders O
ON C.CustomerID = O.CustomerID
WHERE OrderDate = '2015-10-01';

--5
SELECT GoodsID, GoodsName
FROM Goods
WHERE GoodsID NOT IN 
		(SELECT GoodsID
		 FROM Sales
		 WHERE OrderID IN 
			(SELECT OrderID 
			 FROM Orders
			 WHERE MONTH(OrderDate) = 10));

--6
SELECT GoodsID, GoodsName, RetailPrice
FROM Goods G1
WHERE RetailPrice IN (SELECT DISTINCT TOP (3) RetailPrice
				  FROM Goods
				  ORDER BY RetailPrice DESC)
ORDER BY RetailPrice DESC;