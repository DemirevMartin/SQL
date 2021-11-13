--4
SELECT ID, RoomNum, Service, Value
INTO ServiceLessThan20
FROM Income
WHERE Value < 20;

--5
SELECT *
INTO IncomeCopy
FROM Income

--6
DELETE FROM IncomeCopy
WHERE (RoomNum = 203 OR RoomNum = 205) AND Date = '2005-01-02';

--7
UPDATE IncomeCopy
SET Service = 'fitness'
WHERE Service LIKE 'sauna';

--8
UPDATE IncomeCopy
SET Value = Value + 1;

--9
UPDATE IncomeCopy
SET Value = Value - Value * 10 / 100
WHERE Value > 20;

--10
UPDATE IncomeCopy
SET Value = Value - Value * 50 / 100
WHERE Service = 'fitness' AND Date = '2005-02-02';

--11
UPDATE IncomeCopy
SET Date = Getdate();

--12
TRUNCATE TABLE IncomeCopy;