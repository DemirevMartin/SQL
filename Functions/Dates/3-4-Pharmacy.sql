--3
SELECT ID AS [������������� �], DateOfManufacture AS [���� �� ������������], ExpiryDateInDays AS [���� �� �������], 
       DATEADD(day, ExpiryDateInDays, DateOfManufacture) AS [���� �� �������]
FROM Medicines

--4
SELECT ID AS [������������� �], YEAR(DateOfManufacture) AS [������ �� ������������], DateOfManufacture AS [���� �� ������������]
FROM Medicines