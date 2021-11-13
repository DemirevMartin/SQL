CREATE DATABASE SampleDB_12;

CREATE TABLE Cities(
ID INT PRIMARY KEY,
CityName NVARCHAR(20) NOT NULL UNIQUE,
Population INT CHECK (Population > 0) DEFAULT 50000
);

INSERT INTO Cities
VALUES (1, 'София', 1200000), (2, 'Варна', 355000), (3, 'Пловдив', 359012), (4, 'Бургас', 206000),
(5, 'Русе', 160000), (6, 'Стара Загора', 30000), (7, 'Плевен', 108000), (8, 'Сливен ', 95305);

INSERT INTO Cities(ID, CityName)
VALUES (11, 'Асеновград'), (12, 'Бяла'), (13, 'Банско');

CREATE TABLE PersonalData(
ID INT PRIMARY KEY IDENTITY(1000, 1),
PersonName NVARCHAR(40) NOT NULL,
CurrentLocationID INT NOT NULL FOREIGN KEY REFERENCES Cities(ID),
Age INT CHECK(Age >= 16) DEFAULT 21,
Occupation NVARCHAR(20) CHECK(Occupation IN ('ученик', 'студент', 'работещ', 'безработен', 'пенсионер')) DEFAULT 'работещ',
YearsOfService INT DEFAULT 0,
CONSTRAINT CHK_YearsOfService
CHECK (YearsOfService >= 0 AND YearsOfService <= Age - 15)
);

INSERT INTO PersonalData
VALUES ('Иван Петров', 1, 22, 'студент', 4), ('Христо Стойков', 11, 57, 'работещ', 34),
('Стайко Попов', 2, 77, 'пенсионер', 45), ('Ивана Зафирова', 5, 59, 'безработен', 44);

INSERT INTO PersonalData(PersonName, CurrentLocationID, Age, Occupation)
VALUES ('Ганка Гинкова', 12, 17, 'ученик'), ('Минчо Манчев', 8, 18, 'ученик');

INSERT INTO PersonalData(PersonName, CurrentLocationID)
VALUES ('Гина Радева', 2), ('Ради Руменов', 3);