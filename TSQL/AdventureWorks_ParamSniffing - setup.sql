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

-- this script creates the Stored Procedure used by the [AdventureWorks_ParamSniffing.sql]
--USE [AdventureWorksPTO]
--GO

/****** Object:  StoredProcedure [dbo].[getRowsByStateProvinceID]    Script Date: 3/3/2016 4:35:14 PM ******/
DROP PROCEDURE [dbo].[getRowsByStateProvinceID]
GO

/****** Object:  StoredProcedure [dbo].[getRowsByStateProvinceID]    Script Date: 3/3/2016 4:35:14 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getRowsByStateProvinceID]
@stateProvinceID INT
AS
SELECT *
FROM   Person.Address AS a
WHERE  a.StateProvinceID = @stateProvinceID;


GO

