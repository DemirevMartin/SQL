CREATE OR ALTER PROC usp_MoneyTransfer(@wAccID INT, @dAccID INT, @amount DECIMAL(18,2))
AS BEGIN
		IF NOT EXISTS (SELECT * FROM Accounts WHERE AccountID = @wAccID) BEGIN
			PRINT 'Невалиден номер на сметка 1!'
			RETURN
		END
		IF NOT EXISTS (SELECT * FROM Accounts WHERE AccountID = @dAccID) BEGIN
			PRINT 'Невалиден номер на сметка 2!'
			RETURN
		END
		IF(@amount <= 0) BEGIN
			PRINT 'Невалидна сума!'
			RETURN
		END

		DECLARE @giver NVARCHAR(101) = (SELECT FirstName FROM Accounts WHERE AccountID = @wAccID) + ' ' 
			+ (SELECT FirstName FROM Accounts WHERE AccountID = @wAccID)
		DECLARE @reciever NVARCHAR(101) = (SELECT FirstName FROM Accounts WHERE AccountID = @dAccID) + ' ' 
			+ (SELECT FirstName FROM Accounts WHERE AccountID = @dAccID)
		PRINT @giver + ' прехвърля по сметката на ' + @reciever 
			+ ' сумата от ' + CONVERT(NVARCHAR, @amount) + ' лева'

		DECLARE @totalGiver DECIMAL(18,2) = (SELECT Balance FROM Accounts WHERE @wAccID = AccountID)
		DECLARE @totalReceiver DECIMAL(18,2) = (SELECT Balance FROM Accounts WHERE @dAccID = AccountID)

		IF(@totalGiver < @amount) BEGIN
			PRINT 'Прехвърлянето невъзможно – недостатъчна наличност!'
			RETURN
		END
		PRINT 'Наличност в сметка 1 преди операцията: ' + CONVERT(VARCHAR, @totalGiver)
		PRINT 'Наличност в сметка 2 преди операцията: ' + CONVERT(VARCHAR, @totalReceiver)

		BEGIN TRANSACTION
			UPDATE Accounts
			SET Balance = Balance - @amount
			WHERE AccountID = @wAccID
			PRINT 'Успешно изтеглена сума от сметка 1!'

			DECLARE @random INT = RAND()*3 + 1
			IF(@random = 3) BEGIN
				ROLLBACK
				PRINT 'Възникна софтуерен проблем. Неуспешно прехвърляне!'
				PRINT 'Наличност в сметка 1: ' + CONVERT(VARCHAR, @totalGiver)
				PRINT 'Наличност в сметка 2: ' + CAST(@totalReceiver AS VARCHAR)
				RETURN
			END

			UPDATE Accounts
			SET Balance = Balance + @amount
			WHERE AccountID = @dAccID
			SET @random = RAND()*3 + 1
			PRINT 'Успешно внесена сума в сметка 2!'
			IF(@random = 3) BEGIN
				ROLLBACK
				PRINT 'Възникна хардуерен проблем. Неуспешно прехвърляне!'
				PRINT 'Наличност в сметка 1: ' + CONVERT(VARCHAR, @totalGiver)
				PRINT 'Наличност в сметка 2: ' + CAST(@totalReceiver AS VARCHAR)
				RETURN
			END
		COMMIT

		SET @totalGiver = @totalGiver - @amount
		SET @totalReceiver = @totalReceiver + @amount
		PRINT 'Потвърждение за успешно извършен превод!'
		PRINT 'Нова наличност в сметка 1: ' + CONVERT(VARCHAR, @totalGiver)
		PRINT 'Нова наличност в сметка 2: ' + CONVERT(VARCHAR, @totalReceiver)
END;
GO
EXECUTE usp_MoneyTransfer 1, 6, 20;