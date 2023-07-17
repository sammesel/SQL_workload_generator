-- =============================================
-- Declare and using an UPDATE cursor
-- =============================================
--sp_help 'person.person'

SET NOCOUNT ON
DECLARE @v1 varchar(100), 
	@v2 varchar(100),
	@v3 varchar(20)

DECLARE	UPD_Cursor CURSOR 
FOR SELECT firstname, LastName, Suffix FROM Person.Person
FOR UPDATE of Suffix

DECLARE @count smallint
SELECT @count = 1

OPEN UPD_Cursor
FETCH NEXT FROM UPD_Cursor INTO @v1, @v2, @v3

WHILE (@@fetch_status <> -1)
BEGIN
	IF (@@fetch_status <> -2)
	BEGIN
--		PRINT	'add user-defined code here...'
--		eg
		--PRINT 'updating record of ' + @v1 + ' ' + @v2 + ' ' + isnull(@v3,' [no suffix]')
		BEGiN TRANSACTION

			UPDATE Person.Person
			SET Suffix = CAST(@count AS varchar(5))
			WHERE FirstName = @v1 and LastName = @v2

			-- WAITFOR DELAY '00:00:01'

		COMMIT TRANSACTION
	END
	FETCH NEXT FROM UPD_Cursor INTO @v1, @v2, @v3
	SELECT @count = @count + 1
END

CLOSE UPD_Cursor
DEALLOCATE UPD_Cursor
GO

