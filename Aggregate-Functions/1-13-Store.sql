--1
SELECT SUM(PurchaseAmt) AS [Sum]
FROM Orders;

--2
SELECT FORMAT(AVG(PurchaseAmt), 'F2') AS [Avg]
FROM Orders;

--3
SELECT COUNT(DISTINCT SalemanID) AS [Count]
FROM Orders;

--4
SELECT COUNT(CustomerID) AS [Count]
FROM Customers;

--5
SELECT MAX(PurchaseAmt) AS [Max]
FROM Orders;

--6
SELECT City, MAX(Grade) AS [Max Grade]
FROM Customers
GROUP BY(City);

--7
SELECT CustomerID, MAX(PurchaseAmt) AS [Max Purchase Amount]
FROM Orders
GROUP BY CustomerID;

--8
SELECT CustomerID, OrdDate, MAX(PurchaseAmt) AS [Max Purchase]
FROM Orders
GROUP BY CustomerID, OrdDate
ORDER BY CustomerID;

--9
SELECT SalemanID, MAX(PurchaseAmt) AS [Max]
FROM Orders
WHERE OrdDate LIKE '2012-08-17'
GROUP BY SalemanID;

--10
SELECT CustomerID, OrdDate, MAX(PurchaseAmt) AS [Max]
FROM Orders
GROUP BY CustomerID, OrdDate
HAVING MAX(PurchaseAmt) > 2000;

--11
SELECT CustomerID, OrdDate, MAX(PurchaseAmt) AS [Max]
FROM Orders
GROUP BY CustomerID, OrdDate
HAVING MAX(PurchaseAmt) >= 2000 AND MAX(PurchaseAmt) <= 5500;

--12
SELECT CustomerID, OrdDate, MAX(PurchaseAmt) AS [Max]
FROM Orders
GROUP BY CustomerID, OrdDate
HAVING MAX(PurchaseAmt) IN (2000, 3000, 5760);

--13
SELECT COUNT(OrdDate) AS [Count]
FROM Orders
WHERE OrdDate LIKE '2012-08-17';