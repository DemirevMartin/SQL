CREATE DATABASE SampleDB_12;

CREATE TABLE Cities(
ID INT PRIMARY KEY,
CityName NVARCHAR(20) NOT NULL UNIQUE,
Population INT CHECK (Population > 0) DEFAULT 50000
);

INSERT INTO Cities
VALUES (1, '�����', 1200000), (2, '�����', 355000), (3, '�������', 359012), (4, '������', 206000),
(5, '����', 160000), (6, '����� ������', 30000), (7, '������', 108000), (8, '������ ', 95305);

INSERT INTO Cities(ID, CityName)
VALUES (11, '����������'), (12, '����'), (13, '������');

CREATE TABLE PersonalData(
ID INT PRIMARY KEY IDENTITY(1000, 1),
PersonName NVARCHAR(40) NOT NULL,
CurrentLocationID INT NOT NULL FOREIGN KEY REFERENCES Cities(ID),
Age INT CHECK(Age >= 16) DEFAULT 21,
Occupation NVARCHAR(20) CHECK(Occupation IN ('������', '�������', '�������', '����������', '���������')) DEFAULT '�������',
YearsOfService INT DEFAULT 0,
CONSTRAINT CHK_YearsOfService
CHECK (YearsOfService >= 0 AND YearsOfService <= Age - 15)
);

INSERT INTO PersonalData
VALUES ('���� ������', 1, 22, '�������', 4), ('������ �������', 11, 57, '�������', 34),
('������ �����', 2, 77, '���������', 45), ('����� ��������', 5, 59, '����������', 44);

INSERT INTO PersonalData(PersonName, CurrentLocationID, Age, Occupation)
VALUES ('����� �������', 12, 17, '������'), ('����� ������', 8, 18, '������');

INSERT INTO PersonalData(PersonName, CurrentLocationID)
VALUES ('���� ������', 2), ('���� �������', 3);