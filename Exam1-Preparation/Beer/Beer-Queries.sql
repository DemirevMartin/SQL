--1
SELECT BrandBeer, Packaging, RequestedQuantity, DateOfTheOrder, Status, Price
FROM Orders
ORDER BY Packaging ASC, BrandBeer ASC;

--2
SELECT BrandBeer AS [����� ����], Packaging AS [����������], RequestedQuantity AS [������� ����������], Status AS [������]
FROM Orders
WHERE Status LIKE N'���������'
ORDER BY RequestedQuantity DESC;

--3
SELECT BrandBeer AS [����� ����], Packaging AS [����������], Status AS [������], Price AS [����]
FROM Orders
WHERE Price > 0.5 AND Price < 1 AND Packaging LIKE N'�����'
ORDER BY BrandBeer ASC;

--4
SELECT DateOfTheOrder AS [���� �� ���������], BrandBeer AS [����� ����]
FROM Orders
WHERE MONTH(DateOfTheOrder) > 7
--WHERE DateOfTheOrder > '2005-07-31'
ORDER BY DateOfTheOrder DESC;

--5
CREATE VIEW V_Top3RequestedQuantity AS
SELECT TOP (3) BrandBeer AS [����� ����], Packaging AS [����������], RequestedQuantity AS [������� ����������]
FROM Orders
ORDER BY RequestedQuantity DESC;

SELECT * FROM V_Top3RequestedQuantity;

--6
SELECT *
INTO OrdersCopy
FROM Orders;

--7
DELETE FROM OrdersCopy
WHERE Packaging LIKE N'�������';

--8
DELETE FROM OrdersCopy
WHERE BrandBeer LIKE N'������%' AND RequestedQuantity < 300;

--9
UPDATE OrdersCopy
SET Packaging = N'�������'
WHERE Packaging LIKE N'�������';

--10
UPDATE OrdersCopy
SET Status = N'�������� ����������'
WHERE Status LIKE N'�� ����������';

--11
TRUNCATE TABLE OrdersCopy;