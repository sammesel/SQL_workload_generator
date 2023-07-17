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

