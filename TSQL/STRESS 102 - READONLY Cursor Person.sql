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

