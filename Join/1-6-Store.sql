--1
SELECT o.OrdDate, o.OrdDate, c.CustName, o.PurchaseAmt
FROM Orders AS o
INNER JOIN Customers AS c
ON o.CustomerID = c.CustomerID;

--2
CREATE VIEW V_Profit AS
SELECT o.OrdID, FORMAT(o.PurchaseAmt, 'C') AS [OrderValue], s.Name AS [Sales Agent], s.Commission, o.PurchaseAmt * s.Commission AS [Profit]
FROM Orders AS o
INNER JOIN Salemans AS s
ON o.SalemanID = s.SalemanID;
----
SELECT OrdID, OrderValue, [Sales Agent], Commission, FORMAT(Profit, 'C') AS [Profit]
FROM V_Profit
WHERE Profit > 20;

--3
SELECT o.OrdID, OrdDate, o.PurchaseAmt, c.CustName AS [Customer Name], c.Grade, s.Name AS [Saleman], s.Commission
FROM Orders AS o
INNER JOIN Salemans AS s
ON o.SalemanID = s.SalemanID
INNER JOIN Customers AS c
ON o.CustomerID = C.CustomerID;

--4
SELECT c.CustName, c.City, s.Name AS [Sales Agent], s.City AS [Sales Agent City]
FROM Customers AS c
INNER JOIN Salemans AS s
ON c.City = s.City
ORDER BY c.City ASC;

--5
SELECT c.CustName AS [Customer Name], c.City, o.OrdID, o.OrdDate, o.PurchaseAmt AS [Order Amount]
FROM Customers AS c
LEFT OUTER JOIN Orders AS o
ON c.CustomerID = o.CustomerID
ORDER BY o.OrdDate ASC;

--6
SELECT *
FROM Orders
CROSS JOIN Customers;
