--USE AdventureWorksPTO ;
--GO -- 
/*

-- Displays information in a table format about the procedure cache.
DBCC PROCCACHE WITH NO_INFOMSGS 


SELECT * FROM sys.dm_resource_governor_resource_pools;
GO
DBCC FREEPROCCACHE ('default');
GO
DBCC FREEPROCCACHE WITH NO_INFOMSGS
SELECT * FROM sys.dm_resource_governor_resource_pools;
GO
DBCC FREEPROCCACHE ('default');
GO
*/
/*
-- 9.The following SET options are plan-reuse-affecting.
Number		SET option name
1			ANSI_NULL_DFLT_OFF
2			ANSI_NULL_DFLT_ON
3			ANSI_NULLS
4			ANSI_PADDING
5			ANSI_WARNINGS
6			ARITHABORT
7			CONCAT_NULL_YIELDS_NULL
8			DATEFIRST
9			DATEFORMAT
10			FORCEPLAN
11			LANGUAGE
12			NO_BROWSETABLE
13			NUMERIC_ROUNDABORT
14			QUOTED_IDENTIFIER
SELECT @@SPID % 9 , @@SPID 
SELECT DATEPART(ss,getdate())
*/
IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy

SELECT TerritoryID, SalesQuota, SUM(SalesYTD) 'TotalSalesYTD', GROUPING(SalesQuota) AS 'Grouping'
FROM Sales.SalesPerson
GROUP BY TerritoryID, SalesQuota WITH ROLLUP
OPTION (RECOMPILE);
GO -- 

IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy

SELECT *
FROM Sales.SalesPerson
OPTION (RECOMPILE);
GO -- 

IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT D.Name
    ,CASE 
    WHEN GROUPING_ID(D.Name, E.JobTitle) = 0 THEN E.JobTitle
    WHEN GROUPING_ID(D.Name, E.JobTitle) = 1 THEN N'Total: ' + D.Name 
    WHEN GROUPING_ID(D.Name, E.JobTitle) = 3 THEN N'Company Total:'
        ELSE N'Unknown'
    END AS N'Job Title'
    ,COUNT(E.BusinessEntityID) AS N'Employee Count'
FROM HumanResources.Employee E
    INNER JOIN HumanResources.EmployeeDepartmentHistory DH
        ON E.BusinessEntityID = DH.BusinessEntityID
    INNER JOIN HumanResources.Department D
        ON D.DepartmentID = DH.DepartmentID     
WHERE DH.EndDate IS NULL
    AND D.DepartmentID IN (@@SPID,@@SPID+1)
GROUP BY ROLLUP(D.Name, E.JobTitle)
OPTION (RECOMPILE);
GO -- 

IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT D.Name
    ,E.JobTitle
    ,GROUPING_ID(D.Name, E.JobTitle) AS 'Grouping Level'
    ,COUNT(E.BusinessEntityID) AS N'Employee Count'
FROM HumanResources.Employee AS E
    INNER JOIN HumanResources.EmployeeDepartmentHistory AS DH
        ON E.BusinessEntityID = DH.BusinessEntityID
    INNER JOIN HumanResources.Department AS D
        ON D.DepartmentID = DH.DepartmentID     
WHERE DH.EndDate IS NULL
    AND D.DepartmentID IN (@@SPID,@@SPID+2)
GROUP BY ROLLUP(D.Name, E.JobTitle)
HAVING GROUPING_ID(D.Name, E.JobTitle) = 0 --All titles
OPTION (RECOMPILE);
GO -- 

IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT D.Name
    ,E.JobTitle
    ,GROUPING_ID(D.Name, E.JobTitle) AS 'Grouping Level'
    ,COUNT(E.BusinessEntityID) AS N'Employee Count'
FROM HumanResources.Employee AS E
    INNER JOIN HumanResources.EmployeeDepartmentHistory AS DH
        ON E.BusinessEntityID = DH.BusinessEntityID
    INNER JOIN HumanResources.Department AS D
        ON D.DepartmentID = DH.DepartmentID     
WHERE DH.EndDate IS NULL
    AND D.DepartmentID IN (@@SPID,@@SPID+3)
GROUP BY ROLLUP(D.Name, E.JobTitle)
HAVING GROUPING_ID(D.Name, E.JobTitle) = 1 --Group by Name;
OPTION (RECOMPILE);
GO -- 

IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
DECLARE @CurrentEmployee hierarchyid
SELECT @CurrentEmployee = OrganizationNode 
FROM HumanResources.Employee
WHERE LoginID = 'adventure-works\david0'
OPTION (RECOMPILE);

SELECT OrganizationNode.ToString() AS Text_OrganizationNode, *
FROM HumanResources.Employee
WHERE OrganizationNode.GetAncestor(@@SPID % 3) = @CurrentEmployee 
OPTION (RECOMPILE);
GO -- 

IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
DECLARE @CurrentEmployee hierarchyid
SELECT @CurrentEmployee = OrganizationNode 
FROM HumanResources.Employee
WHERE LoginID = 'adventure-works\ken0'
OPTION (RECOMPILE);
SELECT OrganizationNode.ToString() AS Text_OrganizationNode, *
FROM HumanResources.Employee
WHERE OrganizationNode.GetAncestor(@@SPID % 3) = @CurrentEmployee 
OPTION (RECOMPILE);
GO -- 

IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
DECLARE @CurrentEmployee hierarchyid
SELECT @CurrentEmployee = OrganizationNode 
FROM HumanResources.Employee
WHERE LoginID = 'adventure-works\david0'
OPTION (RECOMPILE);
SELECT OrganizationNode.ToString() AS Text_OrganizationNode, *
FROM HumanResources.Employee
WHERE OrganizationNode.GetAncestor(@@SPID % 3) = @CurrentEmployee 
OPTION (RECOMPILE);
GO -- 

IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
DECLARE @CurrentEmployee hierarchyid ;
DECLARE @TargetEmployee hierarchyid ;
SELECT @CurrentEmployee = '/2/3/1.2/5/3/' ;
SELECT @TargetEmployee = @CurrentEmployee.GetAncestor(@@SPID % 3) ;
SELECT @TargetEmployee.ToString(), @TargetEmployee ;
GO -- 

IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT CustomerID, OrderDate, SubTotal, TotalDue
FROM Sales.SalesOrderHeader
WHERE SalesPersonID = @@SPID % 3
ORDER BY OrderDate 
OPTION (RECOMPILE);
GO -- 

IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT SalesPersonID, CustomerID, OrderDate, SubTotal, TotalDue
FROM Sales.SalesOrderHeader
ORDER BY SalesPersonID, OrderDate 
OPTION (RECOMPILE);
GO -- 

IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT *
FROM Production.Product
ORDER BY Name ASC
OPTION (RECOMPILE);
GO -- 

IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT p.*
FROM Production.Product AS p
ORDER BY Name ASC
OPTION (RECOMPILE);
GO -- 

IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT Name, ProductNumber, ListPrice AS Price
FROM Production.Product 
ORDER BY Name ASC
OPTION (RECOMPILE);
GO -- 

IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT Name, ProductNumber, ListPrice AS Price
FROM Production.Product 
WHERE ProductLine = 'R' 
AND DaysToManufacture < (@@SPID % 5)
ORDER BY Name ASC
OPTION (RECOMPILE);
GO -- 

IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT p.Name AS ProductName, 
NonDiscountSales = (OrderQty * UnitPrice),
Discounts = ((OrderQty * UnitPrice) * UnitPriceDiscount)
FROM Production.Product AS p 
INNER JOIN Sales.SalesOrderDetail AS sod
ON p.ProductID = sod.ProductID 
ORDER BY ProductName DESC
OPTION (RECOMPILE);
GO -- 

IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT 'Total income is', ((OrderQty * UnitPrice) * (1.0 - UnitPriceDiscount)), ' for ',
p.Name AS ProductName 
FROM Production.Product AS p 
INNER JOIN Sales.SalesOrderDetail AS sod
ON p.ProductID = sod.ProductID 
ORDER BY ProductName ASC
OPTION (RECOMPILE);
GO -- 

IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT DISTINCT JobTitle
FROM HumanResources.Employee
ORDER BY JobTitle
OPTION (RECOMPILE);
GO -- 

IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT DISTINCT Name
FROM Production.Product AS p 
WHERE EXISTS
    (SELECT *
     FROM Production.ProductModel AS pm 
     WHERE p.ProductModelID = pm.ProductModelID
           AND pm.Name LIKE 'Long-Sleeve Logo Jersey%')
OPTION (RECOMPILE);
GO -- 

IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT DISTINCT Name
FROM Production.Product
WHERE ProductModelID IN
    (SELECT ProductModelID 
     FROM Production.ProductModel
     WHERE Name LIKE 'Long-Sleeve Logo Jersey%')
OPTION (RECOMPILE);
GO -- 

IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT DISTINCT p.LastName, p.FirstName 
FROM Person.Person AS p 
JOIN HumanResources.Employee AS e
    ON e.BusinessEntityID = p.BusinessEntityID WHERE 5000.00 IN
    (SELECT Bonus
     FROM Sales.SalesPerson AS sp
     WHERE e.BusinessEntityID = sp.BusinessEntityID)
OPTION (RECOMPILE);
GO -- 

IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT p1.ProductModelID
FROM Production.Product AS p1
GROUP BY p1.ProductModelID
HAVING MAX(p1.ListPrice) >= ALL
    (SELECT AVG(p2.ListPrice)
     FROM Production.Product AS p2
     WHERE p1.ProductModelID = p2.ProductModelID)
OPTION (RECOMPILE);
GO -- 

IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT DISTINCT pp.LastName, pp.FirstName 
FROM Person.Person pp JOIN HumanResources.Employee e
ON e.BusinessEntityID = pp.BusinessEntityID WHERE pp.BusinessEntityID IN 
(SELECT SalesPersonID 
FROM Sales.SalesOrderHeader
WHERE SalesOrderID IN 
(SELECT SalesOrderID 
FROM Sales.SalesOrderDetail
WHERE ProductID IN 
(SELECT ProductID 
FROM Production.Product p 
WHERE ProductNumber = 'BK-M68B-42')))
OPTION (RECOMPILE);
GO -- 

IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT SalesOrderID, SUM(LineTotal) AS SubTotal
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
ORDER BY SalesOrderID
OPTION (RECOMPILE);
GO -- 

IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT ProductID, SpecialOfferID, AVG(UnitPrice) AS 'Average Price', 
    SUM(LineTotal) AS SubTotal
FROM Sales.SalesOrderDetail
GROUP BY ProductID, SpecialOfferID
ORDER BY ProductID
OPTION (RECOMPILE);
GO -- 

IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT ProductModelID, AVG(ListPrice) AS 'Average List Price'
FROM Production.Product
WHERE ListPrice > $1000
GROUP BY ProductModelID
ORDER BY ProductModelID
OPTION (RECOMPILE);
GO -- 

IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT AVG(OrderQty) AS 'Average Quantity', 
NonDiscountSales = (OrderQty * UnitPrice)
FROM Sales.SalesOrderDetail
GROUP BY (OrderQty * UnitPrice)
ORDER BY (OrderQty * UnitPrice) DESC
OPTION (RECOMPILE);
GO -- 

------

/* http://msdn.microsoft.com/en-us/library/ms187731.aspx
J. Using GROUP BY with ORDER BY 
The following example finds the average price of each type of 
product and orders the results by average price.
*/
IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT ProductID, AVG(UnitPrice) AS 'Average Price'
FROM Sales.SalesOrderDetail
WHERE OrderQty > 10
GROUP BY ProductID
ORDER BY AVG(UnitPrice)
OPTION (RECOMPILE);
GO -- 

------

/* http://msdn.microsoft.com/en-us/library/ms187731.aspx
K. Using the HAVING clause 
The first example that follows shows a HAVING clause with an 
aggregate function. It groups the rows in the SalesOrderDetail 
table by product ID and eliminates products whose average order 
quantities are five or less. The second example shows a HAVING 
clause without aggregate functions. 
*/
IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT ProductID 
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING AVG(OrderQty) > (@@SPID % 6)
ORDER BY ProductID
OPTION (RECOMPILE);
GO -- 

/*
This query uses the LIKE clause in the HAVING clause. 
*/

IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT SalesOrderID, CarrierTrackingNumber 
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID, CarrierTrackingNumber
HAVING CarrierTrackingNumber LIKE '4BD%'
ORDER BY SalesOrderID 
OPTION (RECOMPILE);
GO --   

------

/* http://msdn.microsoft.com/en-us/library/ms187731.aspx
L. Using HAVING and GROUP BY 
The following example shows using GROUP BY, HAVING, WHERE, and 
ORDER BY clauses in one SELECT statement. It produces groups and 
summary values but does so after eliminating the products with 
prices over $25 and average order quantities under 5. It also 
organizes the results by ProductID.
*/
IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT ProductID 
FROM Sales.SalesOrderDetail
WHERE UnitPrice < 25.00
GROUP BY ProductID
HAVING AVG(OrderQty) > (@@SPID % 6)
ORDER BY ProductID
OPTION (RECOMPILE);
GO -- 

------

/* http://msdn.microsoft.com/en-us/library/ms187731.aspx
M. Using HAVING with SUM and AVG 
The following example groups the SalesOrderDetail table by product 
ID and includes only those groups of products that have orders 
totaling more than $1000000.00 and whose average order quantities 
are less than 3.
*/
IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT ProductID, AVG(OrderQty) AS AverageQuantity, SUM(LineTotal) AS Total
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(LineTotal) > $1000000.00
AND AVG(OrderQty) < (@@SPID % 4)
OPTION (RECOMPILE);
GO -- 

/*
To see the products that have had total sales greater than 
$2000000.00, use this query:
*/
IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT ProductID, Total = SUM(LineTotal)
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(LineTotal) > $2000000.00
OPTION (RECOMPILE);
GO -- 

/*
If you want to make sure there are at least one thousand five 
hundred items involved in the calculations for each product, use 
HAVING COUNT(*) > 1500 to eliminate the products that return totals 
for fewer than 1500 items sold. The query looks like this:
*/
IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT ProductID, SUM(LineTotal) AS Total
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING COUNT(*) > (@@SPID % 17)*10
OPTION (RECOMPILE);
GO -- 

/*
Let's drive some CPU
*/
IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
Select * from Production.Product A
cross join Production.ProductModel B
OPTION (RECOMPILE);
GO -- 

IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT ProductID, SUM(LineTotal) AS Total
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING COUNT(*) > 1500
OPTION (RECOMPILE);
GO -- 

------

/* http://msdn.microsoft.com/en-us/library/ms187731.aspx
N. Calculating group totals by using --COMPUTE BY 
The following example uses two code examples to show the use 
of --COMPUTE BY. The first code example uses one --COMPUTE BY with 
one aggregate function, and the second code example uses one 
--COMPUTE BY item and two aggregate functions.

This query calculates the sum of the orders, for products with 
prices less than $5.00, for each type of product.
*/
IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT ProductID, LineTotal
FROM Sales.SalesOrderDetail
WHERE UnitPrice < $5.00
ORDER BY ProductID, LineTotal
--COMPUTE SUM(LineTotal) BY ProductID
OPTION (RECOMPILE);
GO -- 

/*
This query retrieves the product type and order total for 
products with unit prices under $5.00. The --COMPUTE BY 
clause uses two different aggregate functions.
*/
IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT ProductID, LineTotal
FROM Sales.SalesOrderDetail
WHERE UnitPrice < $5.00
ORDER BY ProductID, LineTotal
--COMPUTE SUM(LineTotal), MAX(LineTotal) BY ProductID
OPTION (RECOMPILE);
GO -- 

------

/*  http://msdn.microsoft.com/en-us/library/ms187731.aspx
O. Calculating grand values by using --COMPUTE without BY 
The --COMPUTE keyword can be used without BY to generate grand 
totals, grand counts, and so on.

The following example finds the grand total of the prices and 
advances for all types of products les than $2.00.
*/
IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT ProductID, OrderQty, UnitPrice, LineTotal
FROM Sales.SalesOrderDetail
WHERE UnitPrice < $2.00
--COMPUTE SUM(OrderQty), SUM(LineTotal)
OPTION (RECOMPILE);
GO -- 

/*
You can use --COMPUTE BY and --COMPUTE without BY in the same query. 
The following query finds the sum of order quantities and line 
totals by product type, and then computes the grand total of 
order quantities and line totals.
*/
IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT ProductID, OrderQty, UnitPrice, LineTotal
FROM Sales.SalesOrderDetail
WHERE UnitPrice < $5.00
ORDER BY ProductID
OPTION (RECOMPILE);
--COMPUTE SUM(OrderQty), SUM(LineTotal) BY ProductID
--COMPUTE SUM(OrderQty), SUM(LineTotal);
GO -- 

------

/* http://msdn.microsoft.com/en-us/library/ms187731.aspx
P. Calculating computed sums on all rows 
The following example shows only three columns in the select 
list and gives totals based on all order quantities and all line 
totals at the end of the results.
*/
IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT ProductID, OrderQty, LineTotal
FROM Sales.SalesOrderDetail
--COMPUTE SUM(OrderQty), SUM(LineTotal);
OPTION (RECOMPILE);
GO -- 

------

/* http://msdn.microsoft.com/en-us/library/ms187731.aspx
Q. Using more than one --COMPUTE clause 
The following example finds the sum of the prices of all orders 
whose unit price is less than $5 organized by product ID and order 
quantity, as well as the sum of the prices of all orders less than 
$5 organized by product ID only. You can use different aggregate 
functions in the same statement by including more than one --COMPUTE 
BY clause.
*/
IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT ProductID, OrderQty, UnitPrice, LineTotal
FROM Sales.SalesOrderDetail
WHERE UnitPrice < $5.00
ORDER BY ProductID, OrderQty, LineTotal
--COMPUTE SUM(LineTotal) BY ProductID, OrderQty
--COMPUTE SUM(LineTotal) BY ProductID;
OPTION (RECOMPILE);
GO -- 

------

/* http://msdn.microsoft.com/en-us/library/ms187731.aspx
R. Comparing GROUP BY with --COMPUTE 
The first example that follows uses the --COMPUTE clause to 
calculate the sum of all orders whose product's unit price 
is less than $5.00, by type of product. The second example 
produces the same summary information by using only GROUP BY.
*/
IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT ProductID, LineTotal
FROM Sales.SalesOrderDetail
WHERE UnitPrice < $5.00
ORDER BY ProductID
--COMPUTE SUM(LineTotal) BY ProductID;
OPTION (RECOMPILE);
GO -- 

/*
This is the second query that uses GROUP BY.
*/
IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT ProductID, SUM(LineTotal) AS Total
FROM Sales.SalesOrderDetail
WHERE UnitPrice < $5.00
GROUP BY ProductID
ORDER BY ProductID
OPTION (RECOMPILE);
GO -- 

------
/* http://msdn.microsoft.com/en-us/library/ms187731.aspx
S. Using SELECT with GROUP BY, --COMPUTE, and ORDER BY clauses 
The following example returns only those orders whose unit 
price is less than $5, and then computes the line total sum 
by product and the grand total. All computed columns appear 
within the select list.
*/
IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT ProductID, OrderQty, SUM(LineTotal) AS Total
FROM Sales.SalesOrderDetail
WHERE UnitPrice < $5.00
GROUP BY ProductID, OrderQty
ORDER BY ProductID, OrderQty
--COMPUTE SUM(SUM(LineTotal)) BY ProductID, OrderQty
--COMPUTE SUM(SUM(LineTotal));
OPTION (RECOMPILE);
GO -- 

------

/* http://msdn.microsoft.com/en-us/library/ms187731.aspx
T. Using the INDEX optimizer hint 
The following example shows two ways to use the INDEX 
optimizer hint. The first example shows how to force the 
optimizer to use a nonclustered index to retrieve rows from 
a table, and the second example forces a table scan by using 
an index of 0.
*/
IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT pp.FirstName, pp.LastName, e.NationalIDNumber
FROM HumanResources.Employee AS e WITH (INDEX(AK_Employee_NationalIDNumber))
JOIN Person.Person AS pp on e.BusinessEntityID = pp.BusinessEntityID
WHERE LastName = 'Johnson'
OPTION (RECOMPILE);
GO -- 

-- Force a table scan by using INDEX = 0.
IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT pp.LastName, pp.FirstName, e.JobTitle
FROM HumanResources.Employee AS e WITH (INDEX = 0) JOIN Person.Person AS pp
ON e.BusinessEntityID = pp.BusinessEntityID
WHERE LastName = 'Johnson'
OPTION (RECOMPILE);
GO -- 

------

/* http://msdn.microsoft.com/en-us/library/ms187731.aspx
U. Using OPTION and the GROUP hints 
The following example shows how the OPTION (GROUP) clause
is used with a GROUP BY clause.
*/
IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT ProductID, OrderQty, SUM(LineTotal) AS Total
FROM Sales.SalesOrderDetail
WHERE UnitPrice < $5.00
GROUP BY ProductID, OrderQty
ORDER BY ProductID, OrderQty
OPTION (HASH GROUP, FAST 10, RECOMPILE);
GO -- 

------

/* http://msdn.microsoft.com/en-us/library/ms187731.aspx
V. Using the UNION query hint 
The following example uses the MERGE UNION query hint.
*/
IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT *
FROM HumanResources.Employee AS e1
UNION
SELECT *
FROM HumanResources.Employee AS e2
OPTION (MERGE UNION, RECOMPILE);
GO -- 

------
/* http://msdn.microsoft.com/en-us/library/ms187731.aspx
W. Using a simple UNION 
In the following example, the result set includes the contents
of the ProductModelID and Name columns of both the ProductModel
and Gloves tables.
*/
IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
IF OBJECT_ID ('dbo.Gloves', 'U') IS NOT NULL
	DROP TABLE dbo.Gloves;
-- Create Gloves table.
SELECT ProductModelID, Name
INTO dbo.Gloves
FROM Production.ProductModel
WHERE ProductModelID IN (3, 4)
OPTION (RECOMPILE);
GO -- 

-- Here is the simple union.
IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT ProductModelID, Name
FROM Production.ProductModel
WHERE ProductModelID NOT IN (3, 4)
UNION
SELECT ProductModelID, Name
FROM dbo.Gloves
ORDER BY Name
OPTION (RECOMPILE);
GO -- 

------

/* http://msdn.microsoft.com/en-us/library/ms187731.aspx
X. Using SELECT INTO with UNION 
In the following example, the INTO clause in the second SELECT
statement specifies that the table named ProductResults holds
the final result set of the union of the designated columns 
of the ProductModel and Gloves tables. Note that the Gloves 
table is created in the first SELECT statement.
*/
IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
IF OBJECT_ID ('dbo.ProductResults', 'U') IS NOT NULL
	DROP TABLE dbo.ProductResults;
IF OBJECT_ID ('dbo.Gloves', 'U') IS NOT NULL
	DROP TABLE dbo.Gloves;
-- Create Gloves table.
SELECT ProductModelID, Name
INTO dbo.Gloves
FROM Production.ProductModel
WHERE ProductModelID IN (3, 4)
OPTION (RECOMPILE);

SELECT ProductModelID, Name
INTO dbo.ProductResults
FROM Production.ProductModel
WHERE ProductModelID NOT IN (3, 4)
UNION
SELECT ProductModelID, Name
FROM dbo.Gloves
OPTION (RECOMPILE);

SELECT * 
FROM dbo.ProductResults
OPTION (RECOMPILE);
GO -- 

------

/* http://msdn.microsoft.com/en-us/library/ms187731.aspx
  Y. Using UNION of two SELECT statements with ORDER BY 
The order of certain parameters used with the UNION clause 
is important. The following example shows the incorrect and 
correct use of UNION in two SELECT statements in which a 
column is to be renamed in the output.
*/
IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
IF OBJECT_ID ('dbo.Gloves', 'U') IS NOT NULL
	DROP TABLE dbo.Gloves;
-- Create Gloves table.
SELECT ProductModelID, Name
INTO dbo.Gloves
FROM Production.ProductModel
WHERE ProductModelID IN (3, 4)
OPTION (RECOMPILE);
GO -- 


/* CORRECT */
IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT ProductModelID, Name
FROM Production.ProductModel
WHERE ProductModelID NOT IN (3, 4)
UNION
SELECT ProductModelID, Name
FROM dbo.Gloves
ORDER BY Name
OPTION (RECOMPILE);
GO -- 


------

--  http://msdn.microsoft.com/en-us/library/ms187731.aspx
/*Z. Using UNION of three SELECT statements to show the 
	effects of ALL and parentheses 
The following examples use UNION to combine the results 
of three tables that all have the same 5 rows of data. 
The first example uses UNION ALL to show the duplicated 
records, and returns all 15 rows. The second example uses 
UNION without ALL to eliminate the duplicate rows from the 
combined results of the three SELECT statements, and 
returns 5 rows. The third example uses ALL with the first 
UNION and parentheses enclose the second UNION that is not 
using ALL. The second UNION is processed first because it 
is in parentheses, and returns 5 rows because the ALL option 
is not used and the duplicates are removed. These 5 rows are 
combined with the results of the first SELECT by using the 
UNION ALL keywords. This does not remove the duplicates 
between the two sets of 5 rows. The final result has 10 rows.
*/
IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
IF OBJECT_ID ('dbo.EmployeeOne', 'U') IS NOT NULL
	DROP TABLE dbo.EmployeeOne;
IF OBJECT_ID ('dbo.EmployeeTwo', 'U') IS NOT NULL
	DROP TABLE dbo.EmployeeTwo;
IF OBJECT_ID ('dbo.EmployeeThree', 'U') IS NOT NULL
	DROP TABLE dbo.EmployeeThree;

SELECT pp.LastName, pp.FirstName, e.JobTitle 
INTO dbo.EmployeeOne
FROM Person.Person AS pp JOIN HumanResources.Employee AS e
ON e.BusinessEntityID = pp.BusinessEntityID
WHERE LastName = 'Johnson'
OPTION (RECOMPILE);

SELECT pp.LastName, pp.FirstName, e.JobTitle 
INTO dbo.EmployeeTwo
FROM Person.Person AS pp JOIN HumanResources.Employee AS e
ON e.BusinessEntityID = pp.BusinessEntityID
WHERE LastName = 'Johnson'
OPTION (RECOMPILE);


SELECT pp.LastName, pp.FirstName, e.JobTitle 
INTO dbo.EmployeeThree
FROM Person.Person AS pp JOIN HumanResources.Employee AS e
ON e.BusinessEntityID = pp.BusinessEntityID
WHERE LastName = 'Johnson'
OPTION (RECOMPILE);

GO -- 

-- Union ALL
IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT LastName, FirstName, JobTitle
FROM dbo.EmployeeOne
UNION ALL
SELECT LastName, FirstName ,JobTitle
FROM dbo.EmployeeTwo
UNION ALL
SELECT LastName, FirstName,JobTitle 
FROM dbo.EmployeeThree
OPTION (RECOMPILE);
GO -- 

IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT LastName, FirstName,JobTitle
FROM dbo.EmployeeOne
UNION 
SELECT LastName, FirstName, JobTitle 
FROM dbo.EmployeeTwo
UNION 
SELECT LastName, FirstName, JobTitle 
FROM dbo.EmployeeThree
OPTION (RECOMPILE);
GO -- 

IF @@SPID % 9 = 0
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_OFF ON
	ELSE
		SET ANSI_NULL_DFLT_OFF OFF
IF @@SPID % 9 = 1
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULL_DFLT_ON ON
	ELSE
		SET ANSI_NULL_DFLT_ON OFF
IF @@SPID % 9 = 2
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_NULLS ON
	ELSE
		SET ANSI_NULLS OFF
IF @@SPID % 9 = 3
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_PADDING ON
	ELSE
		SET ANSI_PADDING OFF
IF @@SPID % 9 = 4
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ANSI_WARNINGS ON
	ELSE
		SET ANSI_WARNINGS OFF
IF @@SPID % 9 = 5
	IF DATEPART(ss,getdate()) % 2 = 0
		SET ARITHABORT ON
	ELSE
		SET ARITHABORT OFF
IF @@SPID % 9 = 6
	IF DATEPART(ss,getdate()) % 2 = 0
		SET CONCAT_NULL_YIELDS_NULL ON
	ELSE
		SET CONCAT_NULL_YIELDS_NULL OFF
IF @@SPID % 9 = 7
	IF DATEPART(ss,getdate()) % 6 = 0
		SET DATEFIRST 1
	IF DATEPART(ss,getdate()) % 6 = 1
		SET DATEFIRST 2
	IF DATEPART(ss,getdate()) % 6 = 2
		SET DATEFIRST 3
	IF DATEPART(ss,getdate()) % 6 = 3
		SET DATEFIRST 4
	IF DATEPART(ss,getdate()) % 6 = 4
		SET DATEFIRST 5
	IF DATEPART(ss,getdate()) % 6 = 5
		SET DATEFIRST 6
IF @@SPID % 9 = 8
	SET DATEFORMAT dmy
SELECT LastName, FirstName,JobTitle 
FROM dbo.EmployeeOne
UNION ALL
(
SELECT LastName, FirstName, JobTitle 
FROM dbo.EmployeeTwo
UNION
SELECT LastName, FirstName, JobTitle 
FROM dbo.EmployeeThree
);
GO -- 
