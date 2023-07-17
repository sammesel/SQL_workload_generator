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

-- ===================================
-- Step 1) Setup
-- ===================================
/*
Select * Into SalesOrderDetails from Sales.SalesOrderDetail
Select * Into Product from Production.Product 

SET IDENTITY_INSERT dbo.product ON
Insert into dbo.Product([ProductID],[Name],[ProductNumber],[MakeFlag],[FinishedGoodsFlag],[Color],[SafetyStockLevel]
,[ReorderPoint],[StandardCost],[ListPrice],[Size],[SizeUnitMeasureCode],[WeightUnitMeasureCode],[Weight],[DaysToManufacture]
,[ProductLine],[Class],[Style],[ProductSubcategoryID],[ProductModelID],[SellStartDate],[SellEndDate],[DiscontinuedDate]
,[rowguid],[ModifiedDate])
Select * from Production.Product
Go 50
*/

-- ===================================
-- Step 2) Runup the CPU
-- ===================================

SELECT p.Name AS ProductName, safetystocklevel,
NonDiscountSales = (OrderQty * UnitPrice),
Discounts = ((OrderQty * UnitPrice) * UnitPriceDiscount)
FROM Product AS p 
INNER JOIN sales.SalesOrderDetail AS sod
ON p.ProductID = sod.ProductID 
and safetystocklevel > 300
ORDER BY ProductName DESC

