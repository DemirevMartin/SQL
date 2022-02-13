/*
Тригърът за UPDATE да записва старото и новото състояние на
баланса по сметката, както и съкращението 'upd'

Тригърът за DELETE да записва старото състояние на баланса по
сметката u NULL за ново, както и съкращението 'del'

Да се използва таблицата deleted, която има същата структура като BankAccounts, но
съдържа само редовете за изтриване (или старите стойности при UPDATE)*/

-----Insert
CREATE TRIGGER tr_insTrigger ON BankAccounts
AFTER INSERT
AS BEGIN
	IF ROWCOUNT_BIG() = 0 RETURN --Нищо не е добавено

	INSERT INTO Logs_BankAccounts
	SELECT AccID, Null, Balance, GETDATE(), 'ins'
	FROM inserted
END
GO

-----Update
CREATE OR ALTER TRIGGER tr_updTrigger ON BankAccounts
AFTER UPDATE
AS BEGIN
	IF ROWCOUNT_BIG() = 0 RETURN
	INSERT INTO Logs_BankAccounts
	SELECT AccID, Balance, (SELECT Balance FROM inserted), GETDATE(), 'upd'
	FROM deleted
END
GO

-----Delete
CREATE OR ALTER TRIGGER tr_delTrigger ON BankAccounts
AFTER DELETE
AS BEGIN
	IF ROWCOUNT_BIG() = 0 RETURN
	INSERT INTO Logs_BankAccounts
	SELECT AccID, Balance, NULL, GETDATE(), 'del'
	FROM deleted
END
GO


-----Tests
INSERT INTO BankAccounts
VALUES (1000), (1500), (2000), (2500)

UPDATE BankAccounts
SET Balance = 1200
WHERE Balance = 2000

DELETE FROM BankAccounts WHERE Balance = 1200