-- =============================================
-- Declare and using a READ_ONLY cursor
-- =============================================
--USE AdventureWorksPTO
--GO
DECLARE test_cursor CURSOR READ_ONLY
FOR select AddressId, AddressLine1 from person.address
DECLARE @AddrLine1 varchar(100)
DECLARE @AddrID int

OPEN test_cursor

FETCH NEXT FROM test_cursor INTO @AddrID, @AddrLine1
WHILE (@@fetch_status <> -1)
BEGIN
	IF (@@fetch_status <> -2)
	BEGIN
		DECLARE @message varchar(100)
		SELECT @message = 'my Adress is: ' + @AddrLine1
		--PRINT @message
	END
	FETCH NEXT FROM test_cursor INTO @AddrID, @AddrLine1
END
CLOSE test_cursor
DEALLOCATE test_cursor
GO

----- not using cursors

--DECLARE @AddrLine1 varchar(100)
--DECLARE @AddrID int
--DECLARE @message varchar(100)

--SELECT @AddrID = MIN(AddressID) FROM person.address
--WHILE @AddrID IS NOT NULL
--BEGIN

--	SELECT @AddrLine1 = AddressLine1 
--	FROM person.address
--	WHERE AddressID = @AddrID
	 
--	SELECT @message = 'my Adress is: ' + @AddrLine1
--	PRINT @message
	
--	SELECT 
--		@AddrID = MIN(AddressID) 
--	FROM 
--		person.address
--	WHERE	
--		AddressID > @AddrID
--END



