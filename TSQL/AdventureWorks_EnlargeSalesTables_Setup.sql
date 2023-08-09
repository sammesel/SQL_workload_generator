/* 
	This Sample Code is provided for the purpose of illustration only and is not intended
	to be used in a production environment. THIS SAMPLE CODE AND ANY RELATED INFORMATION ARE
	PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT
	NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR
	PURPOSE. We grant You a nonexclusive, royalty-free right to use and modify the Sample Code
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

IF OBJECT_ID('Sales.SalesOrderHeaderEnlarged') IS  NULL
BEGIN
    CREATE TABLE Sales.SalesOrderHeaderEnlarged
        (
        SalesOrderID int NOT NULL IDENTITY (1, 1) NOT FOR REPLICATION,
        RevisionNumber tinyint NOT NULL,
        OrderDate datetime NOT NULL,
        DueDate datetime NOT NULL,
        ShipDate datetime NULL,
        Status tinyint NOT NULL,
        OnlineOrderFlag dbo.Flag NOT NULL,
        SalesOrderNumber  AS (isnull(N'SO'+CONVERT([nvarchar](23),[SalesOrderID],0),N'*** ERROR ***')),
        PurchaseOrderNumber dbo.OrderNumber NULL,
        AccountNumber dbo.AccountNumber NULL,
        CustomerID int NOT NULL,
        SalesPersonID int NULL,
        TerritoryID int NULL,
        BillToAddressID int NOT NULL,
        ShipToAddressID int NOT NULL,
        ShipMethodID int NOT NULL,
        CreditCardID int NULL,
        CreditCardApprovalCode varchar(15) NULL,
        CurrencyRateID int NULL,
        SubTotal money NOT NULL,
        TaxAmt money NOT NULL,
        Freight money NOT NULL,
        TotalDue  AS (isnull(([SubTotal]+[TaxAmt])+[Freight],(0))),
        Comment nvarchar(128) NULL,
        rowguid uniqueidentifier NOT NULL ROWGUIDCOL,
        ModifiedDate datetime NOT NULL
        )  ON [PRIMARY]

    ALTER TABLE Sales.SalesOrderHeaderEnlarged ADD CONSTRAINT
	PK_SalesOrderHeaderEnlarged_SalesOrderID PRIMARY KEY CLUSTERED 
	(
	SalesOrderID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

    CREATE UNIQUE NONCLUSTERED INDEX AK_SalesOrderHeaderEnlarged_rowguid ON Sales.SalesOrderHeaderEnlarged
        (
        rowguid
        ) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

    CREATE UNIQUE NONCLUSTERED INDEX AK_SalesOrderHeaderEnlarged_SalesOrderNumber ON Sales.SalesOrderHeaderEnlarged
	(
	SalesOrderNumber
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

    CREATE NONCLUSTERED INDEX IX_SalesOrderHeaderEnlarged_CustomerID ON Sales.SalesOrderHeaderEnlarged
        (
        CustomerID
        ) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

    CREATE NONCLUSTERED INDEX IX_SalesOrderHeaderEnlarged_SalesPersonID ON Sales.SalesOrderHeaderEnlarged
        (
        SalesPersonID
        ) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
END
GO

IF OBJECT_ID('Sales.SalesOrderDetailEnlarged') IS NULL
BEGIN
    CREATE TABLE Sales.SalesOrderDetailEnlarged
        (
        SalesOrderID int NOT NULL,
        SalesOrderDetailID int NOT NULL IDENTITY (1, 1),
        CarrierTrackingNumber nvarchar(25) NULL,
        OrderQty smallint NOT NULL,
        ProductID int NOT NULL,
        SpecialOfferID int NOT NULL,
        UnitPrice money NOT NULL,
        UnitPriceDiscount money NOT NULL,
        LineTotal  AS (isnull(([UnitPrice]*((1.0)-[UnitPriceDiscount]))*[OrderQty],(0.0))),
        rowguid uniqueidentifier NOT NULL ROWGUIDCOL,
        ModifiedDate datetime NOT NULL
        )  ON [PRIMARY]

    ALTER TABLE Sales.SalesOrderDetailEnlarged ADD CONSTRAINT
        PK_SalesOrderDetailEnlarged_SalesOrderID_SalesOrderDetailID PRIMARY KEY CLUSTERED 
        (
        SalesOrderID,
        SalesOrderDetailID
        ) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

    CREATE UNIQUE NONCLUSTERED INDEX AK_SalesOrderDetailEnlarged_rowguid ON Sales.SalesOrderDetailEnlarged
        (
        rowguid
        ) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    CREATE NONCLUSTERED INDEX IX_SalesOrderDetailEnlarged_ProductID ON Sales.SalesOrderDetailEnlarged
        (
        ProductID
        ) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

END
GO



CREATE OR ALTER FUNCTION dbo.GetNumsItzik(@low AS BIGINT, @high AS BIGINT)
  RETURNS TABLE
AS
RETURN
 
  WITH
    L0 AS ( SELECT 1 AS c 
            FROM (VALUES(1),(1),(1),(1),(1),(1),(1),(1),
                        (1),(1),(1),(1),(1),(1),(1),(1)) AS D(c) ),
    L1 AS ( SELECT 1 AS c FROM L0 AS A CROSS JOIN L0 AS B ),
    L2 AS ( SELECT 1 AS c FROM L1 AS A CROSS JOIN L1 AS B ),
    L3 AS ( SELECT 1 AS c FROM L2 AS A CROSS JOIN L2 AS B ),
    Nums AS ( SELECT ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) AS rownum
              FROM L3 )
  SELECT TOP(@high - @low + 1) @low + rownum - 1 AS n
  FROM Nums
  ORDER BY rownum;

