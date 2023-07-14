DROP TABLE IF EXISTS writelog_table_small
GO
CREATE TABLE writelog_table_small (col1 INT NULL);
GO
DROP TABLE IF EXISTS writelog_table_medsize
GO
CREATE TABLE writelog_table_medsize (col1 INT NULL, col2 char(4000)  NULL )
GO
DROP TABLE IF EXISTS writelog_table_large
GO
CREATE TABLE writelog_table_large (col1 INT  NULL, col2 datetime  NULL, col3 char(7000) NULL )
GO


CREATE OR ALTER PROCEDURE usp_insert_writelog_table_small
AS
INSERT writelog_table_small (col1 )
SELECT object_id from SYS.OBJECTS
GO

CREATE OR ALTER PROCEDURE usp_insert_writelog_table_medsize
AS
INSERT writelog_table_medsize (col1 , col2)
SELECT object_id,name from SYS.OBJECTS
GO

CREATE OR ALTER PROCEDURE usp_insert_writelog_table_large
AS
INSERT writelog_table_large (col1 , col2, col3)
SELECT object_id,getdate(),name from SYS.OBJECTS
GO