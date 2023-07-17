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
