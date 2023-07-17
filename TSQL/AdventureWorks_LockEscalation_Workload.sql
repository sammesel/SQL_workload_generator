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

BEGIN TRAN;
	DELETE  dbo.LockDemo 
	WHERE   Session_ID = @@SPID
	--SELECT  resource_type, request_mode, request_type, COUNT(*)
	--FROM    sys.dm_tran_locks
	--WHERE   request_session_id = @@SPID
	--GROUP BY resource_type,request_mode, request_type;
COMMIT TRAN


BEGIN TRAN;

	INSERT  INTO dbo.LockDemo ( Session_ID, SomeValue  )
	SELECT TOP ( 25000 )
			@@SPID, CAST(a.number AS BIGINT) * CAST(b.number AS BIGINT)
	FROM    master.dbo.spt_values a
			CROSS JOIN master.dbo.spt_values b;

	--SELECT  resource_type, request_mode, request_type, COUNT(*)
	--FROM    sys.dm_tran_locks
	--WHERE   request_session_id = @@SPID
	--GROUP BY resource_type,request_mode, request_type;

COMMIT TRAN

-- 7500 rows
BEGIN TRAN;
	UPDATE TOP ( 7500 ) dbo.LockDemo SET SomeValue = +10
	WHERE Session_ID = @@SPID;
	--SELECT  resource_type, request_mode, request_type, COUNT(*)
	--FROM    sys.dm_tran_locks
	--WHERE   request_session_id = @@SPID
	--GROUP BY resource_type,request_mode, request_type;

	--SELECT type, COUNT(*) as [Entries], SUM(pages_kb) as [Pages KB]
	--FROM sys.dm_os_memory_clerks
	--WHERE type LIKE '%LOCK%'
	--GROUP BY type
COMMIT;
