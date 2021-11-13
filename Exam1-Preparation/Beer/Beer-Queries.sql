--1
SELECT BrandBeer, Packaging, RequestedQuantity, DateOfTheOrder, Status, Price
FROM Orders
ORDER BY Packaging ASC, BrandBeer ASC;

--2
SELECT BrandBeer AS [Марка пиво], Packaging AS [Разфасовка], RequestedQuantity AS [Заявено количество], Status AS [Статус]
FROM Orders
WHERE Status LIKE N'изпълнена'
ORDER BY RequestedQuantity DESC;

--3
SELECT BrandBeer AS [Марка пиво], Packaging AS [Разфасовка], Status AS [Статус], Price AS [Цена]
FROM Orders
WHERE Price > 0.5 AND Price < 1 AND Packaging LIKE N'кутия'
ORDER BY BrandBeer ASC;

--4
SELECT DateOfTheOrder AS [Дата на поръчката], BrandBeer AS [Марка пиво]
FROM Orders
WHERE MONTH(DateOfTheOrder) > 7
--WHERE DateOfTheOrder > '2005-07-31'
ORDER BY DateOfTheOrder DESC;

--5
CREATE VIEW V_Top3RequestedQuantity AS
SELECT TOP (3) BrandBeer AS [Марка пиво], Packaging AS [Разфасовка], RequestedQuantity AS [Заявено количество]
FROM Orders
ORDER BY RequestedQuantity DESC;

SELECT * FROM V_Top3RequestedQuantity;

--6
SELECT *
INTO OrdersCopy
FROM Orders;

--7
DELETE FROM OrdersCopy
WHERE Packaging LIKE N'наливно';

--8
DELETE FROM OrdersCopy
WHERE BrandBeer LIKE N'Амстел%' AND RequestedQuantity < 300;

--9
UPDATE OrdersCopy
SET Packaging = N'наливно'
WHERE Packaging LIKE N'бутилка';

--10
UPDATE OrdersCopy
SET Status = N'предстои изпълнение'
WHERE Status LIKE N'за изпълнение';

--11
TRUNCATE TABLE OrdersCopy;