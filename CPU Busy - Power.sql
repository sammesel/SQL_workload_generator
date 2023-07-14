-- http://blog.sqlauthority.com/2013/02/22/sql-server-t-sql-script-to-keep-cpu-busy/
-- make CPU busy
DECLARE    @T DATETIME, @F BIGINT;
SET @T = GETDATE();
WHILE DATEADD(SECOND,60,@T)>GETDATE()
	SET    @F=POWER(2,30);	
