--1
SELECT OrderID, DAY(OrderDate) AS [Ден], DATENAME(MONTH, OrderDate) AS [Месец], YEAR(OrderDate) AS [Година], 
		DATENAME(WEEKDAY, OrderDate) AS [Ден от седмицата]
FROM Orders
ORDER BY OrderID ASC;

--2
CREATE VIEW V_Income AS
SELECT GoodsName AS [Good], RetailPrice AS [Retail], RetailPrice - TradePrice AS [Income]
FROM Goods
WHERE RetailPrice - TradePrice > TradePrice * 50 / 100;
-------
SELECT Good AS [Стока], FORMAT(Retail, 'C', 'bg-BG') AS [Продажна цена], FORMAT(Income, 'C', 'bg-BG') AS [Печалба]
FROM V_Income
ORDER BY Income DESC, Good ASC;

--3
SELECT GoodsName AS [Стока]
FROM Goods
ORDER BY
	CASE
		WHEN LOWER(GoodsName) LIKE '%яке%' THEN 1
		WHEN LOWER(GoodsName) LIKE '%риза%' THEN 2
		WHEN LOWER(GoodsName) LIKE '%пуловер%' THEN 3
		WHEN LOWER(GoodsName) LIKE '%панталон%' THEN 4
		ELSE 5
	END, GoodsName;

--4
SELECT Name AS [Клиент], MOL AS [МОЛ], COUNT(Orders.OrderID) AS [Брой поръчки]
FROM Customers
INNER JOIN Orders
ON Orders.CustomerID = Customers.CustomerID
GROUP BY Name, MOL
ORDER BY COUNT(Orders.OrderID) DESC;

--5
--DROP VIEW V_Payment
CREATE VIEW V_Payment AS
SELECT O.OrderID, O.OrderDate, BT.TransactionDate, MOF.Method
FROM Orders O
LEFT OUTER JOIN BankTransactions BT
ON BT.OrderID = O.OrderID
LEFT OUTER JOIN MethodOfPayment MOF
ON BT.MethodID = MOF.MethodID;

----5a
SELECT OrderID AS [Поръчка №], FORMAT(OrderDate, 'dd.MM.yyyy') AS [Дата на поръчка], 
		FORMAT(TransactionDate, 'dd.MM.yyyy') AS [Дата на плащане], Method AS [Начин на плащане]
FROM V_Payment
WHERE TransactionDate IS NOT NULL
ORDER BY OrderID ASC;

-----5b
SELECT OrderID AS [Поръчка №], FORMAT(OrderDate, 'dd.MM.yyyy') AS [Дата на поръчка], 
		IIF(TransactionDate IS NULL, 'Няма плащане', FORMAT(TransactionDate, 'dd.MM.yyyy')) AS [Дата на плащане], 
		IIF(Method IS NULL, ' ', Method) AS [Начин на плащане]
FROM V_Payment
ORDER BY OrderID ASC;

--6
CREATE VIEW V_Quantity AS
SELECT g.GoodsName, IIF(s.QuantitySold IS NULL, 0, s.QuantitySold) as [QuantitySold]
FROM Goods g
LEFT OUTER JOIN Sales s
ON g.GoodsID = s.GoodsID
------
SELECT GoodsName AS [Стока], SUM(QuantitySold) AS [Поръчано количество]
FROM V_Quantity
GROUP BY GoodsName
ORDER BY SUM(QuantitySold) DESC, GoodsName ASC;

--6.0
SELECT COUNT(QuantitySold) AS [Брой непоръчвани стоки]
FROM V_Quantity
WHERE QuantitySold = 0;

--7
--DROP VIEW V_Total
CREATE VIEW V_Total AS
SELECT O.OrderID, O.OrderDate, SUM(S.QuantitySold * RetailPrice) AS [Total]
FROM Orders O
INNER JOIN Sales S
ON O.OrderID = S.OrderID
INNER JOIN Goods G
ON G.GoodsID = S.GoodsID
GROUP BY O.OrderID, O.OrderDate;
-----------------
SELECT OrderID AS [Поръчка №], FORMAT(OrderDate, 'dd.MM.yyyy') AS [Дата], 
		FORMAT(Total, 'C', 'BG') AS [Стойност]
FROM V_Total
ORDER BY OrderID ASC;

--8
SELECT C.Name AS [Клиент], FORMAT(O.OrderDate, 'dd.MM.yyyy') AS [Дата на поръчка], 
	IIF(BT.TransactionDate IS NULL, DATEDIFF(DAY, O.OrderDate, '2016-06-15'), 
	DATEDIFF(DAY, O.OrderDate, BT.TransactionDate)) AS [Забавяне (дни)]
FROM Orders O
INNER JOIN Customers C
ON C.CustomerID = O.CustomerID
LEFT OUTER JOIN BankTransactions BT
ON O.OrderID = BT.OrderID
ORDER BY C.Name, O.OrderDate;