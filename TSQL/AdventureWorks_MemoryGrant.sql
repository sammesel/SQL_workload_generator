/* 
       This Sample Code is provided for the purpose of illustration only and is not intended
       to be used in a production environment.  THIS SAMPLE CODE AND ANY RELATED INFORMATION ARE
       PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT
       NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR
       PURPOSE.  We grant You a nonexclusive, royalty-free right to use and modify the Sample Code
       and to reproduce and distribute the object code form of the Sample Code, provided that You
       agree: 
       (i) to not use Our name, logo, or trademarks to market Your software product in which
       the Sample Code is embedded; 
       (ii) to include a valid copyright notice on Your software product
       in which the Sample Code is embedded; 
       and    (iii) to indemnify, hold harmless, and defend Us and
       Our suppliers from and against any claims or lawsuits, including attorneys fees, that arise or
       result from the use or distribution of the Sample Code.
*/


SELECT P.ProductID, P.Name, P.ProductNumber, P.MakeFlag, P.FinishedGoodsFlag, P.Color, P.SafetyStockLevel, P.ReorderPoint, P.StandardCost, 
P.ListPrice, P.Size, P.SizeUnitMeasureCode, P.WeightUnitMeasureCode, 
P.Weight, P.DaysToManufacture, P.ProductLine, P.Class, P.Style, P.ProductSubcategoryID, P.ProductModelID, P.SellStartDate, P.SellEndDate, 
P.DiscontinuedDate, P.rowguid, P.ModifiedDate, 
Production.ProductCategory.ProductCategoryID, Production.ProductCategory.Name AS Expr1, Production.ProductCategory.rowguid AS Expr2, 
Production.ProductCategory.ModifiedDate AS Expr3, 
Production.ProductDescription.ProductDescriptionID, Production.ProductDescription.Description, Production.ProductDescription.rowguid AS Expr4, 
Production.ProductDescription.ModifiedDate AS Expr5
FROM Production.Product AS P CROSS JOIN
Production.ProductCategory CROSS JOIN
Production.ProductDescription
