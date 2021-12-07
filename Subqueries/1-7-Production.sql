--1
SELECT GoodsID, GoodsName
FROM Goods
WHERE GoodsID NOT IN (SELECT GoodsID FROM Sales 
				  WHERE OrderID IN (SELECT OrderID FROM Orders 
						WHERE YEAR(OrderDate) = 2016));

--2
SELECT GoodsName
FROM Goods
WHERE GoodsID IN (SELECT GoodsID FROM Sales 
				  WHERE OrderID IN (SELECT OrderID FROM Orders 
						WHERE OrderDate >= '2015-12-01' AND OrderDate <= '2015-12-03'));

--3
SELECT OrderID, OrderDate, CustomerID
FROM Orders
WHERE OrderID IN (SELECT OrderID FROM BankTransactions 
				  WHERE TransactionDate IS NOT NULL);

--4
SELECT GoodsID, GoodsName, TradePrice
FROM Goods G
WHERE TradePrice > ANY (SELECT TradePrice FROM Goods D WHERE G.GoodsID <> D.GoodsID AND D.GoodsName LIKE '%???????%')
ORDER BY TradePrice ASC;

--5
SELECT GoodsID, GoodsName, TradePrice
FROM Goods
WHERE TradePrice > ALL (SELECT TradePrice FROM Goods WHERE GoodsID IN (SELECT OrderID FROM Orders WHERE OrderDate LIKE '2015-10-01'))
ORDER BY TradePrice ASC;

--6
SELECT GoodsID, GoodsName, TradePrice
FROM Goods
WHERE TradePrice > (SELECT AVG(TradePrice) FROM Goods WHERE GoodsName LIKE '%[пѕ]анталон%') 
ORDER BY TradePrice DESC;

--7
SELECT *
FROM Sales S
WHERE QuantitySold >= (SELECT FLOOR(AVG(QuantitySold)) FROM Sales A WHERE A.GoodsID = S.GoodsID) + QuantitySold * 50 / 100
ORDER BY QuantitySold ASC;