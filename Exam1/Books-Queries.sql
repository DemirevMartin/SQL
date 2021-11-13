--4
SELECT Title, Author, Publisher, Pages, Price, Quantity
FROM Books
ORDER BY Publisher ASC, Price DESC;

--5
SELECT Publisher AS [Издателство], Pages AS [Страници], Quantity AS [Налични бройки]
FROM Books
WHERE Pages > 500 
ORDER BY Pages ASC;

--6
SELECT Title AS [Заглавие], Author AS [Автор], Publisher AS [Издателство], Price AS [Цена]
FROM Books
WHERE Price >= 19 AND Price <= 22;

--7
SELECT Title + ' от ' + Author AS [Книги на изчерпване]
FROM Books
WHERE Quantity < 15;

--8
CREATE VIEW V_ExpBooksU500 AS
SELECT TOP (3) Title, Author, Publisher, Pages, Price
FROM Books
WHERE Pages < 500
ORDER BY Price DESC;

SELECT * FROM V_ExpBooksU500;

--9
SELECT *
INTO Books_2
FROM Books
WHERE Quantity > 0;

--10
DELETE FROM Books_2
WHERE Publisher LIKE 'Бард';

--11
UPDATE Books_2
SET Quantity = Quantity + 15
WHERE Quantity < 30;

--12
UPDATE Books_2
SET Price = Price + Price * 20 / 100
WHERE Publisher LIKE 'Сиела' OR Publisher LIKE 'Егмонт';

--13
DELETE FROM Books_2
WHERE Author LIKE 'А%';

--14 
TRUNCATE TABLE Books_2;