--1
SELECT * 
FROM Products
ORDER BY SalesAgent ASC;

--2
SELECT Product, FirstTrimester, SecondTrimester
FROM Products
WHERE Product LIKE 'Tea' OR Product LIKE '%tea%';

--3
SELECT Product, FirstTrimester, SecondTrimester
FROM Products
WHERE Product LIKE '%Cafe%' OR Product LIKE '%cafe%';

--4
SELECT TOP (1) Product, FirstTrimester 
FROM Products
ORDER BY FirstTrimester DESC;

--5
SELECT TOP (1) Product, SecondTrimester 
FROM Products
ORDER BY SecondTrimester ASC;

--6
SELECT *
FROM Products
WHERE FirstTrimester > 16000
      AND SecondTrimester > 20000;

--7
SELECT *
FROM Products
WHERE SecondTrimester > FirstTrimester + 4000;