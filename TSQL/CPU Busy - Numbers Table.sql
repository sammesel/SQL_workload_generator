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

-- http://sqlblog.com/blogs/linchi_shea/archive/2011/07/22/performance-impact-stored-procedures-sql-batches-and-cpu-usage.aspx

set nocount on
go

WITH 
	E00(N) AS (SELECT 1 UNION ALL SELECT 1),
	E02(N) AS (SELECT 1 FROM E00 a, E00 b),
	E04(N) AS (SELECT 1 FROM E02 a, E02 b),
	E08(N) AS (SELECT 1 FROM E04 a, E04 b),
	E16(N) AS (SELECT 1 FROM E08 a, E08 b),
	E32(N) AS (SELECT 1 FROM E16 a, E16 b),
cteTally(N) AS (SELECT ROW_NUMBER() OVER (ORDER BY N) FROM E32)
SELECT *
FROM cteTally
WHERE N <= 4000000-- @@SPID * @@SPID;
