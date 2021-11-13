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
VALUES (1, '���� ����', 3, 2),
		(2, '���� �������', 3, 3),
		(3, '���� ������', 2, 2),
		(4, '����� ������', 3, 4),
		(5, '������� � ���', 2, 4),
		(6, '����� �������', 4, 4),
		(7, '������� �������', 2, 3),
		(8, '����� ������', 3, 3),
		(9, '����� ���������', 2, 2),
		(10, '��������� �������', 4, 3),
		(11, '����� ���������', 4, 2),
		(12, '����� ��������� ���', 3, 3),
		(13, '����� ���� ��', 3, 2),
		(14, '����������� ���', 3, 3),
		(15, '����� ��������� ������ ���', 2, 2),
		(16, '����������� ������', 3, 4),
		(17, '����� ������', 2, 4);