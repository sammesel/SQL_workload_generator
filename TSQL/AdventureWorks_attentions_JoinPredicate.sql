SELECT * 
FROM Sales.SalesOrderHeader AS soh,Sales.SalesOrderDetail AS sod,Production.Product AS p 
WHERE 
	soh.SalesOrderID = 43600 + @@SPID
	and 
	sod.SalesOrderID = 43600 + @@SPID 
