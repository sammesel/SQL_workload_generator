set nocount on
go
declare @a float

DECLARE    @T DATETIME;
SET @T = GETDATE();
WHILE DATEADD(SECOND,60,@T)>GETDATE()
	select @a = cos(2.5);
