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
		PRINT '@Arg_BirthDateYear	= ' + CAST(@Arg_BirthDateYear AS CHAR(5))
		PRINT '@Arg_TerritoryID		= ' + CAST(@Arg_TerritoryID AS CHAR(5))
		PRINT '@Arg_SalesYear		= ' + CAST(@Arg_SalesYear AS CHAR(5))

	END

	-- 1st
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
	WHERE  p.LastName = @Person_LastName 
	option(HASH join)

	-- hash match
	-- 2nd
	SELECT soh.BillToAddressID
	FROM   Sales.Customer AS c
		   LEFT OUTER JOIN
		   Sales.SalesOrderHeader AS soh
		   ON c.CustomerID = soh.CustomerID

	-- hash match
	-- 3rd
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
		soh.customerId = @arg_CustomerID 
	option(HASH join)

	-- hash + parallelism
	-- 4th
	SELECT   p.Name,
			 sod.OrderQty,
			 sod.UnitPrice,*
	FROM     Production.Product AS p
			 INNER JOIN
			 Sales.SalesOrderDetail AS sod
			 ON p.ProductID = sod.ProductID
	--WHERE
	--	sod.ProductId = @arg_ProductID 
	--ORDER BY p.Name DESC
--	option(HASH join)

	--5TH
	SELECT   p.Name,
			 sod.OrderQty,
			 sod.UnitPrice
	FROM     Production.Product AS p
			 INNER JOIN
			 Sales.SalesOrderDetail AS sod
			 ON p.ProductID = sod.ProductID
	--WHERE
	--	sod.ProductId = @arg_ProductID 
--	option(HASH join)

	-- hash match
	-- 6TH
	SELECT 
		SOH.*
	FROM 
		Sales.SalesOrderDetail AS SOD
		INNER JOIN Sales.SalesOrderHeader AS soh
			ON SOH.SalesOrderID = SOD.SalesOrderID 
	WHERE
		TerritoryID = @Arg_TerritoryID 
		AND
		ProductID = @arg_ProductID 
	option(HASH join)

	SELECT @arg_CustomerID = ROUND(((@Upper_CustomerID - @Lower_CustomerID -1) * RAND() + @Lower_CustomerID), 0)
	SELECT @PersonID  = ROUND(((@Upper_PersonID - @Lower_PersonID -1) * RAND() + @Lower_PersonID), 0)
	SELECT @Person_LastName  = LastName FROM Person.Person WHERE BusinessEntityID = @PersonID 
	SELECT @arg_ProductID = ROUND(((@Upper_ProductID - @Lower_ProductID -1) * RAND() + @Lower_ProductID), 0)
	SELECT @Arg_BirthDateYear = ROUND(((@Upper_BirthDateYear - @Lower_BirthDateYear -1) * RAND() + @Lower_BirthDateYear), 0)
	SELECT @Arg_TerritoryID = ROUND(((@Upper_TerritoryID - @Lower_TerritoryID -1) * RAND() + @Lower_TerritoryID), 0)
	SELECT @Arg_SalesYear = ROUND(((@Upper_SalesYear - @Lower_SalesYear -1) * RAND() + @Lower_SalesYear), 0)

	SELECT @Rpt_Counter += 1

END

