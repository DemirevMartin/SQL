--1
SELECT CustomerID, Name, Address, MOL, Phone
FROM Customers
WHERE CustomerID IN (SELECT CustomerID FROM Orders WHERE OrderDate LIKE '2015-10-01');

--2
SELECT OrderDate AS [Dates]
FROM Orders
WHERE OrderDate NOT IN
		(SELECT OrderDate
		 FROM Orders
		 WHERE OrderID IN (SELECT OrderID FROM Sales WHERE GoodsID = 3))
ORDER BY OrderDate DESC

--3
SELECT GoodsName, RetailPrice
FROM Goods G
WHERE RetailPrice NOT IN (SELECT RetailPrice FROM Goods D WHERE G.GoodsID <> D.GoodsID)
ORDER BY RetailPrice DESC;

--3.1
SELECT GoodsName AS [Стока], RetailPrice AS [Цена]
FROM Goods G
WHERE RetailPrice NOT IN (SELECT RetailPrice FROM Goods D WHERE G.GoodsID <> D.GoodsID)
	OR GoodsName IN (SELECT TOP(1) GoodsName FROM Goods S WHERE G.RetailPrice = S.RetailPrice ORDER BY GoodsName DESC)
ORDER BY RetailPrice DESC;

--4
SELECT Name
FROM (SELECT C.Name, BT.MethodID FROM Customers C, Orders O, BankTransactions BT 
	  WHERE C.CustomerID = O.CustomerID AND BT.OrderID = O.OrderID) AS [GetOrders]
GROUP BY Name
HAVING COUNT(MethodID) = 1
ORDER BY Name ASC;