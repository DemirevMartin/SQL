--3
SELECT ID AS [Номенклатурен №], DateOfManufacture AS [Дата на производство], ExpiryDateInDays AS [Срок на годност], 
       DATEADD(day, ExpiryDateInDays, DateOfManufacture) AS [Дата на годност]
FROM Medicines

--4
SELECT ID AS [Номенклатурен №], YEAR(DateOfManufacture) AS [Година на производство], DateOfManufacture AS [Дата на производство]
FROM Medicines