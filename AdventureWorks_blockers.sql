-- SELECT @@SPID - CAST( (@@SPID/10) as INTEGER)*10
--
/* 
	This Sample Code is provided for the purpose of illustration only and is not intended
	to be used in a production environment.  THIS SAMPLE CODE AND ANY RELATED INFORMATION ARE
	PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT
	NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR
	PURPOSE.  We grant You a nonexclusive, royalty-free right to use and modify the Sample Code
	and to reproduce and distribute the object code form of the Sample Code, provided that You
	agree: 
	(i) to not use Our name, logo, or trademarks to market Your software product in which
	the Sample Code is embedded; 
	(ii) to include a valid copyright notice on Your software product
	in which the Sample Code is embedded; 
	and	(iii) to indemnify, hold harmless, and defend Us and
	Our suppliers from and against any claims or lawsuits, including attorneys fees, that arise or
	result from the use or distribution of the Sample Code.
*/

SET NOCOUNT ON
GO

DECLARE @DEBUG	INT = 0
DECLARE @arg_CustomerID INT = 0
DECLARE @PersonID INT = 0
DECLARE @arg_ProductID INT = 0

DECLARE @tmp_ErrorCount INT = 0

DECLARE @Upper_CustomerID INT;
DECLARE @Lower_CustomerID INT
DECLARE @Upper_PersonID INT;
DECLARE @Lower_PersonID INT
DECLARE @Person_LastName nvarchar(100)
DECLARE @Upper_ProductID INT;
DECLARE @Lower_ProductID INT

DECLARE @Rpt_Counter INT = 0;

SELECT 
	 @Lower_CustomerID = MIN(CustomerID) ---- The lowest random number
	,@Upper_CustomerID = MAX(CustomerID)
	/* RANDOM_HELPER */
FROM 
	Sales.SalesOrderHeader 

SELECT 
	 @Lower_PersonID = MIN(BusinessEntityID) ---- The lowest random number
	,@Upper_PersonID = MAX(BusinessEntityID)
	/* RANDOM_HELPER */
FROM 
	Person.Person

SELECT 
	 @Lower_ProductID = MIN(ProductID) ---- The lowest random number
	,@Upper_ProductID = MAX(ProductID)
FROM 
	Production.product
	/* RANDOM_HELPER */
WHERE
	ProductID>100

SELECT @arg_CustomerID = ROUND(((@Upper_CustomerID - @Lower_CustomerID -1) * RAND() + @Lower_CustomerID), 0)
SELECT @PersonID  = ROUND(((@Upper_PersonID - @Lower_PersonID -1) * RAND() + @Lower_PersonID), 0)
SELECT @Person_LastName  = LastName FROM Person.Person WHERE BusinessEntityID = @PersonID 
SELECT @arg_ProductID = ROUND(((@Upper_ProductID - @Lower_ProductID -1) * RAND() + @Lower_ProductID), 0)


DECLARE @stmt NVARCHAR(4000)
DECLARE @replacement varchar(100)
DECLARE @DELAY CHAR(12) 
DECLARE @MS INT = @@SPID % 1000
IF @MS<10
	SET @DELAY = CONCAT( '00:00:00.00' , cast( @@SPID AS char(1)))
IF @MS<100
	SET @DELAY = CONCAT( '00:00:00.0' , cast( @@SPID AS char(2)))
IF @MS<1000
	SET @DELAY = CONCAT( '00:00:00.' , cast( @@SPID AS char(3)))
	
WHILE (@arg_CustomerID IS NOT NULL) AND (@Rpt_Counter <100 )
BEGIN

--	SET @replacement = 'WHERE /* -- ' + CAST(@@SPID as CHAR(5)) + ' -- */'


	IF @DEBUG	= 1
	BEGIN
		PRINT 'EXECUTION			= ' + cast(@Rpt_Counter+1 as CHAR(5))
		PRINT '@arg_CustomerID		= ' + CAST(@arg_CustomerID AS CHAR(5))
		PRINT '@PersonID			= ' + CAST(@PersonID AS CHAR(5))
		PRINT '@Person_LastName		= ' + @Person_LastName
		PRINT '@arg_ProductID		= ' + CAST(@arg_ProductID AS CHAR(5))
	END

	-- 1st blocker
	BEGIN TRANSACTION
		UPDATE Person.Person
		SET Title = 'no' 
		FROM   Person.Person AS p
			   INNER JOIN
			   Sales.Customer AS c
			   ON c.PersonID = p.BusinessEntityID
			   INNER JOIN
			   Sales.Store AS s
			   ON s.BusinessEntityID = c.StoreID
		WHERE  p.LastName = @Person_LastName 
		WAITFOR DELAY @DELAY
	ROLLBACK 

	-- 2nd blocker
	BEGIN TRANSACTION 
		UPDATE Sales.SalesOrderHeader
		SET AccountNumber = 'A'
		WHERE customerId = @arg_CustomerID 
		WAITFOR DELAY @DELAY
	ROLLBACK 
	
	--3rd
	BEGIN TRANSACTION 
		UPDATE PRODUCTION.PRODUCT
		SET   Name = 'A'
		WHERE ProductId = @arg_ProductID 
		WAITFOR DELAY @DELAY
	ROLLBACK 
		
	SELECT @arg_CustomerID = ROUND(((@Upper_CustomerID - @Lower_CustomerID -1) * RAND() + @Lower_CustomerID), 0)
	SELECT @PersonID  = ROUND(((@Upper_PersonID - @Lower_PersonID -1) * RAND() + @Lower_PersonID), 0)
	SELECT @Person_LastName  = LastName FROM Person.Person WHERE BusinessEntityID = @PersonID 
	SELECT @arg_ProductID = ROUND(((@Upper_ProductID - @Lower_ProductID -1) * RAND() + @Lower_ProductID), 0)

	SELECT @Rpt_Counter += 1

END

