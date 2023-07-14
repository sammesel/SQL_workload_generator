
-- =============================================
-- Declare and using a KEYSET cursor
-- =============================================
DECLARE KEYSET_Cursor CURSOR
KEYSET
FOR SELECT FirstName, LastName, Title FROM Person.Person

-- sp_help 'person.person'
SET NOCOUNT ON
DECLARE @Fname varchar(100), @LName VARCHAR(100), @Title VARCHAR(16)

OPEN KEYSET_Cursor
DECLARE @icount INT = 0 

FETCH NEXT FROM KEYSET_Cursor INTO @Fname,@LName,@Title
WHILE (@@fetch_status <> -1)
BEGIN
	IF (@@fetch_status <> -2)
	BEGIN
--		PRINT 'add user defined code here' 
--		eg.

		Set @icount += 1

		PRINT 'updating record for ' + @Fname + ' ' + @Lname
		BEGIN TRANSACTION

			IF (@icount/2) = (@icount%2) 
				BEGIN
					UPDATE Person.Person
					SET Title = UPPER(@Title)
					WHERE CURRENT OF KEYSET_Cursor
				END
			ELSE
				BEGIN
					UPDATE Person.Person
					SET Title = LOWER(@Title)
					WHERE CURRENT OF KEYSET_Cursor
				END

			--WAITFOR DELAY '00:00:01'

		IF (@icount/3) = (@icount%3) 
			ROLLBACK TRANSACTION
		ELSE
			COMMIT TRANSACTION

	END
	FETCH NEXT FROM KEYSET_Cursor INTO @Fname,@LName,@Title
END

CLOSE KEYSET_Cursor
DEALLOCATE KEYSET_Cursor
GO

