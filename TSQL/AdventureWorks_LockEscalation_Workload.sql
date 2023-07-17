
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
