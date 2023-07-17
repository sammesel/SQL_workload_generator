CREATE OR ALTER PROCEDURE usp_create_temp_table_small
AS
CREATE TABLE #temp_db_table_small (col1 INT);
GO

CREATE OR ALTER PROCEDURE usp_create_temp_table_medsize
AS
CREATE TABLE #temp_db_table_medsize (col1 INT, col2 char(4000)  )
GO

CREATE OR ALTER PROCEDURE usp_create_temp_table_large
AS
CREATE TABLE #temp_db_table_large (col1 INT, col2 datetime, col3 char(7000) )
GO