
SELECT ProductID , MAX(SalesOrderID) SalesOrderID
FROM [Sales].[SalesOrderDetail] s
GROUP BY ProductID
ORDER BY SalesOrderID

SELECT SalesOrderID, OrderDate, DueDate, ShipDate, TotalDue
FROM Sales.SalesOrderHeader
WHERE SalesOrderID < 50000
ORDER BY OrderDate;

SELECT *
FROM Sales.SalesOrderHeader
WHERE DueDate > ShipDate
ORDER BY OrderDate;
