--1
CREATE DATABASE TestDB_12v;
--DROP TABLE Users
--2
CREATE TABLE Users(
ID INT UNIQUE NOT NULL IDENTITY(1, 1),
Username NVARCHAR(30) UNIQUE NOT NULL,
Password VARCHAR(26) NOT NULL,
ProfilePicture IMAGE,
LastLoginTime DATETIME CHECK(LastLoginTime > '2015-01-01' AND LastLoginTime < '2050-01-01'),
IsDeleted BIT
);

--3
ALTER TABLE Users
ADD CONSTRAINT PK_ID PRIMARY KEY(ID);

--4
ALTER TABLE Users
DROP CONSTRAINT PK_ID;

ALTER TABLE Users
ADD CONSTRAINT PK_ID_Username PRIMARY KEY(ID, Username);

--5
ALTER TABLE Users
ADD CONSTRAINT CHK_Pass CHECK (Password != '[^ @]%[^ @]');

--6
ALTER TABLE Users
ADD CONSTRAINT DF_LastLoginTime
DEFAULT GETDATE() FOR LastLoginTime;

--7
ALTER TABLE Users
DROP CONSTRAINT PK_ID_Username;

ALTER TABLE Users
ADD CONSTRAINT PK_ID_2 PRIMARY KEY(ID);

ALTER TABLE Users
ADD CONSTRAINT UC_Username UNIQUE(Username);

--8
/*INSERT INTO Users(Username, [Password], IsDeleted)
VALUES ('AlfonsoTheGreat', 'a1b2c3d4e5d6', 0), ('TheGoat', 'toaGehT', 1),
('5Ar', 'uguaoou', 1), ('5Ar', 'gfd23uguaoou', 0),
('QueenLatifa', '@gfd23uguaoou', 1), ('tOtO_B@T3T0', 'gfd23ug@uaoou ', 1) - contains incorrect data*/
--TRUNCATE TABLE Users
INSERT INTO Users(Username, Password, IsDeleted)
VALUES ('AlfonsoTheGreat', 'a1b2c3d4e5d6', 0), ('TheGoat', 'toaGehT', 1),
('5Ar', 'uguaoou', 1), ('5r', 'gfd23uguaoou', 0),
('QueenLatifa', '23uguaoou', 1), ('tOtO_B@T3T0', 'gfd23ug@uaoou', 1);

INSERT INTO Users(Username, Password, IsDeleted)
VALUES ('Gri6oDaBest', 'gfd23', 0), ('Kamata73', '23ugu', 1);