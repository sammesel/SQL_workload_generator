-- SELECT @@SPID - CAST( (@@SPID/10) as INTEGER)*10
--USE AdventureWorksPTO
--GO
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

--Use AdventureWorksPTO
--GO

DECLARE @DEBUG	INT = 0
DECLARE @arg_CustomerID INT = 0
DECLARE @PersonID INT = 0
DECLARE @arg_ProductID INT = 0
DECLARE @Arg_BirthDateYear INT = 0
DECLARE @Arg_SalesYear INT = 0
DECLARE @Arg_TerritoryID INT = 0

DECLARE @tmp_ErrorCount INT = 0

DECLARE @Upper_CustomerID INT;
DECLARE @Lower_CustomerID INT
DECLARE @Upper_PersonID INT;
DECLARE @Lower_PersonID INT
DECLARE @Person_LastName nvarchar(100)
DECLARE @Upper_BirthDateYear INT;
DECLARE @Lower_BirthDateYear INT;

DECLARE @Upper_TerritoryID INT;
DECLARE @Lower_TerritoryID INT
DECLARE @Upper_SalesYear INT;
DECLARE @Lower_SalesYear INT


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

SELECT 
	 @Lower_BirthDateYear = MIN(YEAR(BirthDate)) ---- The lowest random number
	,@Upper_BirthDateYear = MAX(YEAR(BirthDate))
	/* RANDOM_HELPER */
FROM 
	HumanResources.Employee AS e

SELECT 
	 @Lower_TerritoryID = MIN(TerritoryID) ---- The lowest random number
	,@Upper_TerritoryID = MAX(TerritoryID)
	/* RANDOM_HELPER */
FROM 
	Sales.SalesTerritory

SELECT 
	@Upper_SalesYear  = year(MIN(SalesOrderHeader.OrderDate) ),
	@Lower_SalesYear  = year(MAX(SalesOrderHeader.OrderDate) )
	/* RANDOM_HELPER */
FROM
	Sales.SalesOrderHeader


SELECT @arg_CustomerID = ROUND(((@Upper_CustomerID - @Lower_CustomerID -1) * RAND() + @Lower_CustomerID), 0)
SELECT @PersonID  = ROUND(((@Upper_PersonID - @Lower_PersonID -1) * RAND() + @Lower_PersonID), 0)
SELECT @Person_LastName  = LastName FROM Person.Person WHERE BusinessEntityID = @PersonID 

SELECT @arg_ProductID = ROUND(((@Upper_ProductID - @Lower_ProductID -1) * RAND() + @Lower_ProductID), 0)
SELECT @Arg_BirthDateYear = ROUND(((@Upper_BirthDateYear - @Lower_BirthDateYear -1) * RAND() + @Lower_BirthDateYear), 0)

SELECT @Arg_TerritoryID = ROUND(((@Upper_TerritoryID - @Lower_TerritoryID -1) * RAND() + @Lower_TerritoryID), 0)
SELECT @Arg_SalesYear = ROUND(((@Upper_SalesYear - @Lower_SalesYear -1) * RAND() + @Lower_SalesYear), 0)


DECLARE @stmt NVARCHAR(4000)
DECLARE @replacement varchar(100)

WHILE (@arg_CustomerID IS NOT NULL) AND (@Rpt_Counter <100)
BEGIN

	SET @replacement = 'WHERE /* -- ' + CAST(@@SPID as CHAR(5)) + ' -- */'

	IF @DEBUG	= 1
	BEGIN
		
		PRINT 'EXECUTION			= ' + cast(@Rpt_Counter+1 as CHAR(5))
		PRINT '@arg_CustomerID		= ' + CAST(@arg_CustomerID AS CHAR(5))
		PRINT '@PersonID			= ' + CAST(@PersonID AS CHAR(5))
		PRINT '@Person_LastName		= ' + @Person_LastName
		PRINT '@arg_ProductID		= ' + CAST(@arg_ProductID AS CHAR(5))
		PRINT '@Arg_BirthDateYear	= ' + CAST(@Arg_BirthDateYear AS CHAR(5))
		PRINT '@Arg_TerritoryID		= ' + CAST(@Arg_TerritoryID AS CHAR(5))
		PRINT '@Arg_SalesYear		= ' + CAST(@Arg_SalesYear AS CHAR(5))

	END

	SET @stmt = ''
	SET @stmt ='
	SELECT p.Title + '''' + p.FirstName + '''' + p.LastName AS FullName,
		   c.AccountNumber,
		   s.Name
	FROM   Person.Person AS p
		   INNER JOIN
		   Sales.Customer AS c
		   ON c.PersonID = p.BusinessEntityID
		   INNER JOIN
		   Sales.Store AS s
		   ON s.BusinessEntityID = c.StoreID
	WHERE  p.LastName = ' + char(39) + @Person_LastName + char(39) + ';';
	SET @stmt= REPLACE(@stmt,'WHERE',@replacement);
	IF @@SPID % 3 =1
		SET @stmt=UPPER(@stmt)
	IF @@SPID % 3 =2
		SET @stmt=LOWER(@stmt)
--	print @stmt
	EXECUTE sp_executesql @stmt

	-- hash match
	SET @stmt ='
	SELECT soh.BillToAddressID
	FROM   Sales.Customer AS c
		   LEFT OUTER JOIN
		   Sales.SalesOrderHeader AS soh
		   ON c.CustomerID = soh.CustomerID
	WHERE
		c.customerId = ' + CAST(@arg_CustomerID  as CHAR(5))
	SET @stmt= REPLACE(@stmt,'WHERE',@replacement);
	IF @@SPID % 3 =1
		SET @stmt=UPPER(@stmt)
	IF @@SPID % 3 =2
		SET @stmt=LOWER(@stmt)
--	print @stmt
	EXECUTE sp_executesql @stmt

	-- hash match
	SET @stmt ='
	SELECT soh.PurchaseOrderNumber,
		   soh.AccountNumber,
		   sod.OrderQty,
		   sod.LineTotal,
		   c.CardNumber
	FROM   Sales.SalesOrderHeader AS soh
		   INNER JOIN
		   Sales.SalesOrderDetail AS sod
		   ON soh.SalesOrderID = sod.SalesOrderID
		   INNER JOIN
		   Sales.CreditCard AS c
		   ON soh.CreditCardID = c.CreditCardID
	WHERE
		soh.customerId = ' + CAST(@arg_CustomerID as CHAR(5))
	SET @stmt= REPLACE(@stmt,'WHERE',@replacement);
	IF @@SPID % 3 =1
		SET @stmt=UPPER(@stmt)
	IF @@SPID % 3 =2
		SET @stmt=LOWER(@stmt)
--	print @stmt
	EXECUTE sp_executesql @stmt

	--merge join
	SET @stmt ='
	SELECT poh.PurchaseOrderID,
		   poh.OrderDate,
		   pod.ProductID,
		   pod.DueDate,
		   poh.VendorID,*
	FROM   Purchasing.PurchaseOrderHeader AS poh
		   INNER JOIN
		   Purchasing.PurchaseOrderDetail AS pod
		   ON poh.PurchaseOrderID = pod.PurchaseOrderID
	WHERE
		pod.ProductId = ' + CAST(@arg_ProductID as CHAR(5))

	SET @stmt= REPLACE(@stmt,'WHERE',@replacement);
	IF @@SPID % 3 =1
		SET @stmt=UPPER(@stmt)
	IF @@SPID % 3 =2
		SET @stmt=LOWER(@stmt)
--	print @stmt
	EXECUTE sp_executesql @stmt


	-- hash + parallelism
	-- what happens to the cost when the order by is dropped?
	SET @stmt ='
	SELECT   p.Name,
			 sod.OrderQty,
			 sod.UnitPrice,*
	FROM     Production.Product AS p
			 INNER JOIN
			 Sales.SalesOrderDetail AS sod
			 ON p.ProductID = sod.ProductID
	WHERE
		sod.ProductId = ' + CAST(@arg_ProductID as CHAR(5)) +
	'ORDER BY p.Name DESC;'
	SET @stmt= REPLACE(@stmt,'WHERE',@replacement);
	IF @@SPID % 3 =1
		SET @stmt=UPPER(@stmt)
	IF @@SPID % 3 =2
		SET @stmt=LOWER(@stmt)
--	print @stmt
	EXECUTE sp_executesql @stmt

	SET @stmt ='
	SELECT   p.Name,
			 sod.OrderQty,
			 sod.UnitPrice
	FROM     Production.Product AS p
			 INNER JOIN
			 Sales.SalesOrderDetail AS sod
			 ON p.ProductID = sod.ProductID
	WHERE
		sod.ProductId = ' + CAST(@arg_ProductID as CHAR(5)) 
	SET @stmt= REPLACE(@stmt,'WHERE',@replacement);
	IF @@SPID % 3 =1
		SET @stmt=UPPER(@stmt)
	IF @@SPID % 3 =2
		SET @stmt=LOWER(@stmt)
--	print @stmt
	EXECUTE sp_executesql @stmt


	-- loop joins
	SET @stmt ='
	SELECT FirstName,
		   LastName,
		   a.ModifiedDate
	FROM   Person.Person AS p
		   INNER JOIN
		   HumanResources.Employee AS e
		   ON p.BusinessEntityID = e.BusinessEntityID
		   INNER JOIN
		   Person.BusinessEntityAddress AS a
		   ON e.BusinessEntityID = a.BusinessEntityID
	WHERE	
		year(e.birthdate) = ' + CAST(@Arg_BirthDateYear AS CHAR(5))
	SET @stmt= REPLACE(@stmt,'WHERE',@replacement);
	IF @@SPID % 3 =1
		SET @stmt=UPPER(@stmt)
	IF @@SPID % 3 =2
		SET @stmt=LOWER(@stmt)
--	print @stmt
	EXECUTE sp_executesql @stmt


	SET @stmt ='
	SELECT
		* 
	FROM
		Sales.SalesTerritoryHistory
	WHERE
		TerritoryID = ' + CAST(@Arg_TerritoryID as CHAR(5)) + '
		AND
		StartDate >= ' + CAST(convert(date,'01/01/' + cast(@arg_salesyear as char(4)))  as CHAR(10))+ '
		AND 
		StartDate  <= ' + CAST(convert(date,'12/31/' + cast(@arg_salesyear as char(4)))  as CHAR(10))
	SET @stmt= REPLACE(@stmt,'WHERE',@replacement);
	IF @@SPID % 3 =1
		SET @stmt=UPPER(@stmt)
	IF @@SPID % 3 =2
		SET @stmt=LOWER(@stmt)
--	print @stmt
	EXECUTE sp_executesql @stmt


	-- hash match
	SET @stmt ='
	SELECT 
		SOH.*
	FROM 
		Sales.SalesOrderDetail AS SOD
		INNER JOIN Sales.SalesOrderHeader AS soh
			ON SOH.SalesOrderID = SOD.SalesOrderID 
	WHERE
		TerritoryID = ' + CAST(@Arg_TerritoryID as CHAR(5)) + ' 
		AND
		ProductID = ' + CAST( @arg_ProductID as CHAR(5)) 
	SET @stmt= REPLACE(@stmt,'WHERE',@replacement);
	IF @@SPID % 3 =1
		SET @stmt=UPPER(@stmt)
	IF @@SPID % 3 =2
		SET @stmt=LOWER(@stmt)
--	print @stmt
	EXECUTE sp_executesql @stmt

	SELECT @arg_CustomerID = ROUND(((@Upper_CustomerID - @Lower_CustomerID -1) * RAND() + @Lower_CustomerID), 0)
	SELECT @PersonID  = ROUND(((@Upper_PersonID - @Lower_PersonID -1) * RAND() + @Lower_PersonID), 0)
	SELECT @Person_LastName  = LastName FROM Person.Person WHERE BusinessEntityID = @PersonID 
	SELECT @arg_ProductID = ROUND(((@Upper_ProductID - @Lower_ProductID -1) * RAND() + @Lower_ProductID), 0)
	SELECT @Arg_BirthDateYear = ROUND(((@Upper_BirthDateYear - @Lower_BirthDateYear -1) * RAND() + @Lower_BirthDateYear), 0)
	SELECT @Arg_TerritoryID = ROUND(((@Upper_TerritoryID - @Lower_TerritoryID -1) * RAND() + @Lower_TerritoryID), 0)
	SELECT @Arg_SalesYear = ROUND(((@Upper_SalesYear - @Lower_SalesYear -1) * RAND() + @Lower_SalesYear), 0)

	SELECT @Rpt_Counter += 1

END

