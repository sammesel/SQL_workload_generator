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

-- this script runs the 'report' using a tempdb object 10 times - each time the loop generates a random number for the next CustomerID
--     the loop is created externally by the OSTRESS batch files

DECLARE @arg_CustomerID INT = 0
DECLARE @tmp_ErrorCount INT = 0

DECLARE @Upper INT;
DECLARE @Lower INT
DECLARE @Rpt_Counter INT = 0;

SELECT 
        @Lower = MIN(CustomerID) ---- The lowest random number
       ,@Upper = MAX(CustomerID)
FROM 
       Sales.SalesOrderHeader 

SELECT @arg_CustomerID = ROUND(((@Upper - @Lower -1) * RAND() + @Lower), 0)
WHILE (@arg_CustomerID IS NOT NULL) AND (@Rpt_Counter <1000)
BEGIN
       -- sp_help 'Sales.SalesOrderDetail'
       -- sp_help 'Production.Product'
       BEGIN TRY
             DROP TABLE #sales_report
       END TRY
       BEGIN CATCH
             --PRINT 'Temp table #sales_report does not exist. Code will proceed'
             SET @tmp_ErrorCount += 1
       END CATCH
       CREATE TABLE #sales_report (
             SalesOrderId INT NOT NULL
             ,OrderQty           SMALLINT NOT NULL
             ,ProductID          INT NOT NULL
             ,Name               CHAR(100) NOT NULL
             ,Class              NCHAR(4) NULL
             ,UnitPrice          MONEY  NOT NULL
             ,LineTotal          MONEY  NOT NULL
       )
       -- select * from sys.systypes order by name
       INSERT #sales_report (
             SalesOrderId 
             ,OrderQty           
             ,ProductID          
             ,Name               
             ,Class              
             ,UnitPrice          
             ,LineTotal          
       )
       SELECT
             SOD.SalesOrderId
             ,SOD.OrderQty
             ,SOD.ProductID
             ,P.Name
             ,P.Class 
             ,SOD.UnitPrice
             ,SOD.LineTotal
       FROM
             Sales.SalesOrderHeader SOH 
             INNER JOIN Sales.SalesOrderDetail SOD 
                    ON SOH.SalesOrderID = SOD.SalesOrderID
             INNER JOIN Production.Product P
                    ON SOD.ProductID = P.ProductID
       WHERE
                    CustomerID = @arg_CustomerID

       SELECT @arg_CustomerID , * FROM #sales_report

       SELECT @arg_CustomerID = ROUND(((@Upper - @Lower -1) * RAND() + @Lower), 0)
       SELECT @Rpt_Counter += 1

END



