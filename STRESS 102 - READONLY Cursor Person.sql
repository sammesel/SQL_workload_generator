-- =============================================
-- Declare and using a READ_ONLY cursor
-- =============================================
DECLARE ReadOnly_Cursor CURSOR
READ_ONLY
FOR SELECT FirstName, Lastname, Suffix FROM Person.Person ORDER BY LastName, FirstName

DECLARE @Fname varchar(100), @Lname varchar(100), @Suffix VARCHAR(40)
OPEN ReadOnly_Cursor

FETCH NEXT FROM ReadOnly_Cursor INTO @Fname, @Lname, @Suffix
WHILE (@@fetch_status <> -1)
BEGIN
	IF (@@fetch_status <> -2)
	BEGIN
--		PRINT 'add user defined code here'
--		eg.
		DECLARE @message varchar(100)
		SELECT @message = 'Reading: ' + @Fname + ' ' + @Lname
		PRINT @message
	END
	FETCH NEXT FROM ReadOnly_Cursor INTO @Fname, @LName, @Suffix
END

CLOSE ReadOnly_Cursor
DEALLOCATE ReadOnly_Cursor
GO

