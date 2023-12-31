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

/*
	Lock Escalation:  https://msdn.microsoft.com/en-us/library/ms184286.aspx

	Locking is all about maintaining data integrity.  

	It prevents multiple users from updating the same data at the same time (always) 
	and prevents users from reading dirty (uncommitted) data - as long as you aren't 
	using the NOLOCK hint or READ UNCOMMITTED transaction isolation level.

	The downside of locking is that it decreases concurrency.  Locked resources 
	are, to varying degrees, unavailable to other processes.  SQL Server leverages 
	many different kinds of locks, granular locking and varying lock durations in 
	an effort to maximize concurrent use of resources.

	Today we're going to look at lock granularity and lock escalation.

	SQL Server can lock resources at the row, page, partition or table level.  
	The more granular the locking, the more available resources are to other users.

	But each lock requires about 100 bytes of memory, so SQL Server implements 
	a lock escalation mechanism to convert many fine-grain locks into fewer 
	coarse-grain locks.  This reduces memory use, but increases the likelihood of
	concurrency contention.

	The default threshold for triggering lock escalation is > 5000 locks taken
	on a single table or index to execute a single T-SQL statement.  If for some
	reason escalation is not successful, it is retried for every 1250 additional
	locks acquired.

	Row locks (KEY or RID) and PAGE locks can escalate to table (OBJECT) locks.
	KEY and RID locks never escalate to PAGE locks.
	In SQL Server 2008 and later you can configure locking on partitioned tables
	to escalate to partitions rather than the full table.  This increases concurrency
	but introduces a potential for deadlocks.

	In the demo scripts below we'll run a few UPDATEs and SELECTs, look at the 
	the locks aquired and find the point where locking is escalated.  We'll also
	look at the configuration options you have available to change escalation 
	behavior.
*/

SET NOCOUNT ON;

-- Create and populate a heap
IF (OBJECT_ID('dbo.LockDemo')) IS NOT NULL
	DROP TABLE dbo.LockDemo;
CREATE TABLE dbo.LockDemo (Id INT IDENTITY, Session_ID INT, SomeValue BIGINT);
GO

