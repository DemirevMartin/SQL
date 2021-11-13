-- Creating the RadioDB database
CREATE DATABASE RadioDB COLLATE Cyrillic_General_CI_AS;

-- Creating a Advertising table
CREATE TABLE Advertising
(
	ID INT NOT NULL PRIMARY KEY,
	Company NVARCHAR(50) NOT NULL,
	DurationOfBroadcasting INT NOT NULL,
	Views INT NOT NULL
);

-- Data input in Advertising table
INSERT INTO Advertising
VALUES (1, 'Кафе Елит', 3, 2),
		(2, 'Бира Загорка', 3, 3),
		(3, 'Бира Ариана', 2, 2),
		(4, 'фирма Ростел', 3, 4),
		(5, 'Шаркови и СИЕ', 2, 4),
		(6, 'фирма Лечител', 4, 4),
		(7, 'Добавка Ботаник', 2, 3),
		(8, 'фирма Слънце', 3, 3),
		(9, 'фирма Фитофарма', 2, 2),
		(10, 'Козметика Фортекс', 4, 3),
		(11, 'фирма Хигиенист', 4, 2),
		(12, 'фирма Цветелина ООД', 3, 3),
		(13, 'фирма Юлия ЕТ', 3, 2),
		(14, 'Биопрограма ЕАД', 3, 3),
		(15, 'фирма Българска стевия ООД', 2, 2),
		(16, 'лаборатория Биофар', 3, 4),
		(17, 'фирма Нутрим', 2, 4);