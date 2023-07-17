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
-- BASIC OPERATORS
/* SETUP */
--Create a table that we can create indexes on.
SELECT * INTO #SalesIndexDemo 
FROM Sales.SalesOrderDetail;
GO

-- TABLE SCAN
SELECT * FROM #SalesIndexDemo WHERE ProductID=776

--create indexes
CREATE NONCLUSTERED INDEX Sales_ID_ModifiedDate_A ON #SalesIndexDemo(ModifiedDate, CarrierTrackingNumber);
GO
CREATE NONCLUSTERED INDEX Sales_ID_ModifiedDate_B ON #SalesIndexDemo(ModifiedDate) INCLUDE (CarrierTrackingNumber);
GO

-- INDEX SEEK

SELECT CarrierTrackingNumber 
FROM #SalesIndexDemo 
WHERE ModifiedDate = '2006-01-01 00:00:00.000'

-- INDEX SCAN:
SELECT ModifiedDate
FROM #SalesIndexDemo 
WHERE CarrierTrackingNumber  = '00C8-44A6-B1'

-- INDEX SEEK + (RID) LOOKUP
SELECT * FROM #SalesIndexDemo 
WHERE ModifiedDate = '2006-01-01 00:00:00.000'
--		AND ModifiedDate = '2006-01-01 00:00:00.000'


CREATE INDEX Sales_ID_ModifiedDate_Extended ON #SalesIndexDemo(ModifiedDate,CarrierTrackingNumber)
	include (ProductID , UnitPrice, SalesOrderDetailID, SalesOrderID);
GO
-- INDEX SEEK
SELECT UnitPrice, ProductID , SalesOrderDetailID , CarrierTrackingNumber
FROM #SalesIndexDemo 
WHERE ModifiedDate = '2006-01-01 00:00:00.000'

-- INDEX SCAN:
SELECT UnitPrice, SalesOrderDetailID , CarrierTrackingNumber
FROM #SalesIndexDemo 
WHERE  ProductID = 745

-- INDEX SEEK + (RID) LOOKUP
SELECT * FROM #SalesIndexDemo 
WHERE ModifiedDate = '2006-01-01 00:00:00.000'

-- CLUSTERED SCAN:
CREATE UNIQUE CLUSTERED INDEX Sales_ID_Index ON #SalesIndexDemo(rowguid, CarrierTrackingNumber, LineTotal);
GO
SELECT * FROM #SalesIndexDemo 
WHERE LineTotal Between 3500 and 3600

-- INDEX SEEK + (KEY) LOOKUP
SELECT * FROM #SalesIndexDemo 
WHERE ModifiedDate = '2006-01-01 00:00:00.000'


-- CLEAN UP
IF EXISTS (SELECT name FROM sys.tables WHERE name = 'SalesIndexDemo' and SCHEMA_ID = 1)
   DROP TABLE #SalesIndexDemo;
GO



-- Point out
-- which subtrees have the most rows
-- lookup
-- show missing index details
-- which operations cost the most
SELECT p.Title + ' ' + p.FirstName + ' ' + p.LastName AS FullName,
       c.AccountNumber,
       s.Name
FROM   Person.Person AS p
       INNER JOIN
       Sales.Customer AS c
       ON c.PersonID = p.BusinessEntityID
       INNER JOIN
       Sales.Store AS s
       ON s.BusinessEntityID = c.StoreID
WHERE  p.LastName = 'Koski';

-- loop joins
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
WHERE  e.JobTitle = 'Marketing Assistant';

-- hash match
SELECT soh.BillToAddressID
FROM   Sales.Customer AS c
       LEFT OUTER JOIN
       Sales.SalesOrderHeader AS soh
       ON c.CustomerID = soh.CustomerID;


--merge join
SELECT poh.PurchaseOrderID,
       poh.OrderDate,
       pod.ProductID,
       pod.DueDate,
       poh.VendorID
FROM   Purchasing.PurchaseOrderHeader AS poh
       INNER JOIN
       Purchasing.PurchaseOrderDetail AS pod
       ON poh.PurchaseOrderID = pod.PurchaseOrderID;


-- hash match
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
       ON soh.CreditCardID = c.CreditCardID;

-- hash + parallelism
-- what happens to the cost when the order by is dropped?
SELECT   p.Name,
         sod.OrderQty,
         sod.UnitPrice
FROM     Production.Product AS p
         INNER JOIN
         Sales.SalesOrderDetail AS sod
         ON p.ProductID = sod.ProductID
ORDER BY p.Name DESC;

SELECT   p.Name,
         sod.OrderQty,
         sod.UnitPrice
FROM     Production.Product AS p
         INNER JOIN
         Sales.SalesOrderDetail AS sod
         ON p.ProductID = sod.ProductID



--showplan warning example
-- be sure to turn off Display Actual Execution Plan!
-- prepare data
CREATE TABLE #tblTest
(
          c1 INT         PRIMARY KEY CLUSTERED,
          c2 INT        ,
          c3 CHAR (1000)
);

GO
SET NOCOUNT ON;

BEGIN TRANSACTION;

DECLARE @i AS INT;

SET @i = 1;

WHILE @i <= 10000
          BEGIN
                    INSERT  INTO #tblTest (c1, c2, c3)
                    VALUES              (@i, @i, 'a');
                    SET @i = @i + 1;
          END

COMMIT TRANSACTION;

GO
SET STATISTICS XML ON;

GO
SELECT   *
FROM     #tblTest
WHERE    c1 <= 7000
ORDER BY c2
OPTION (MAXDOP 1);

GO
SET STATISTICS XML OFF;
