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

