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
--
-- THIS SCRIPT creates the STORED PROCEDURES that are used on script [AdventureWorks_CPU.sql]
--
--USE AdventureWorksPTO;
--go

/****************
CREATE THE SCHEMA
********************/
IF SCHEMA_ID(N'test')  IS NULL
	EXEC sp_executesql N'CREATE SCHEMA test AUTHORIZATION dbo'
GO

/****************
CREATE Silly Stored Procedures in the Schema
********************/
IF OBJECT_ID(N'test.EmployeeByLastName', 'P') IS NULL
	EXEC sp_executesql N'CREATE PROCEDURE test.EmployeeByLastName as return 0'
GO
ALTER PROCEDURE test.EmployeeByLastName
	@lName nvarchar(255)
AS
	SELECT @lName = N'%' + @lName + N'%'

	select *
	FROM HumanResources.vEmployee
	WHERE LastName LIKE @lName
GO

IF OBJECT_ID(N'test.EmployeeByFirstName', 'P') IS NULL
	EXEC sp_executesql N'CREATE PROCEDURE test.EmployeeByFirstName as return 0'
GO
ALTER PROCEDURE test.EmployeeByFirstName
	@fName nvarchar(255)
AS
	SELECT @fName = '%' + @fName + '%'

	select *
	FROM HumanResources.vEmployee
	WHERE FirstName LIKE @fName
GO

IF OBJECT_ID(N'test.EmployeeDepartmentHistoryByLastName', 'P') IS NULL
	EXEC sp_executesql N'CREATE PROCEDURE test.EmployeeDepartmentHistoryByLastName as return 0'
GO
ALTER PROCEDURE test.EmployeeDepartmentHistoryByLastName
	@lName nvarchar(255)
AS
	SELECT @lName = N'%' + @lName + N'%'

	select *
	FROM HumanResources.vEmployeeDepartmentHistory
	WHERE LastName LIKE @lName
GO

IF OBJECT_ID(N'test.EmployeeDepartmentHistoryByFirstName', 'P') IS NULL
	EXEC sp_executesql N'CREATE PROCEDURE test.EmployeeDepartmentHistoryByFirstName as return 0'
GO
ALTER PROCEDURE test.EmployeeDepartmentHistoryByFirstName
	@fName nvarchar(255)
AS
	SELECT @fName = '%' + @fName + '%'

	select *
	FROM HumanResources.vEmployeeDepartmentHistory
	WHERE FirstName LIKE @fName
GO

IF OBJECT_ID(N'test.ProductAndDescriptionByKeyword', 'P') IS NULL
	EXEC sp_executesql N'CREATE PROCEDURE test.ProductAndDescriptionByKeyword as return 0'
GO
ALTER PROCEDURE test.ProductAndDescriptionByKeyword
	@keyword nvarchar(255)
AS
	SELECT @keyword = '%' + @keyword + '%'

	select *
	FROM Production.vProductAndDescription
	WHERE Name LIKE @keyword OR ProductModel like @keyword OR description LIKE @keyword
GO
