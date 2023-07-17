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
BEGIN TRANSACTION


DECLARE @TableVar TABLE
(OrigSalesOrderID int, NewSalesOrderID int)

INSERT INTO Sales.SalesOrderHeaderEnlarged 
	(RevisionNumber, OrderDate, DueDate, ShipDate, Status, OnlineOrderFlag, 
	 PurchaseOrderNumber, AccountNumber, CustomerID, SalesPersonID, TerritoryID, 
	 BillToAddressID, ShipToAddressID, ShipMethodID, CreditCardID, 
	 CreditCardApprovalCode, CurrencyRateID, SubTotal, TaxAmt, Freight, Comment, 
	 rowguid, ModifiedDate)
OUTPUT inserted.Comment, inserted.SalesOrderID
	INTO @TableVar
SELECT 
	RevisionNumber, 
	DATEADD(dd, number/100000, OrderDate) AS OrderDate, 
	DATEADD(dd, number/100000, DueDate),  
	DATEADD(dd, number/100000, ShipDate), 
	Status, OnlineOrderFlag, 
	PurchaseOrderNumber, 
	AccountNumber, 
	CustomerID, SalesPersonID, TerritoryID, BillToAddressID, 
	ShipToAddressID, ShipMethodID, CreditCardID, CreditCardApprovalCode, 
	CurrencyRateID, SubTotal, TaxAmt, Freight, SalesOrderID, 
	NEWID(), 
	DATEADD(dd, number/100000, ModifiedDate)
FROM Sales.SalesOrderHeader AS soh WITH (HOLDLOCK TABLOCKX)
CROSS JOIN (
		SELECT number
		FROM (	
		
				SELECT top 10 n as NUMBER FROM dbo.GetNumsItzik(1, 100000000) --OPTION(MAXDOP 1);
				ORDER BY NEWID() DESC 

		  ) AS tab
) AS Randomizer
ORDER BY OrderDate, number

INSERT INTO Sales.SalesOrderDetailEnlarged 
	(SalesOrderID, CarrierTrackingNumber, OrderQty, ProductID, 
	 SpecialOfferID, UnitPrice, UnitPriceDiscount, rowguid, ModifiedDate)
SELECT 
	tv.NewSalesOrderID, CarrierTrackingNumber, OrderQty, ProductID, 
	SpecialOfferID, UnitPrice, UnitPriceDiscount, NEWID(), ModifiedDate 
FROM Sales.SalesOrderDetail AS sod
JOIN @TableVar AS tv
	ON sod.SalesOrderID = tv.OrigSalesOrderID
ORDER BY sod.SalesOrderDetailID

COMMIT