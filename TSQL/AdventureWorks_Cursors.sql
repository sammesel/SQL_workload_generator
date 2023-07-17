/* 
This Sample Code is provided for the purpose of illustration only and is not intended
	to be used in a production environment.  THIS SAMPLE CODE AND ANY RELATED INFORMATION ARE
	PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT
	NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR
	PURPOSE.  
	We grant You a nonexclusive, royalty-free right to use and modify the Sample Code
	and to reproduce and distribute the object code form of the Sample Code, provided that You
	agree: 
	(i) to not use Our name, logo, or trademarks to market Your software product in which
		the Sample Code is embedded; 
	(ii) to include a valid copyright notice on Your software product
		in which the Sample Code is embedded; 
	and (iii) to indemnify, hold harmless, and defend Us and
		Our suppliers from and against any claims or lawsuits, including attorneys fees, that arise or
		result from the use or distribution of the Sample Code.
*/

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



