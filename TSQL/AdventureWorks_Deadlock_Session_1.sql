waitfor delay '00:00:05'

BEGIN TRAN;   

UPDATE ##Employees
SET EmpName = 'Mary'
WHERE EmpId = 1

waitfor delay '00:00:20'

UPDATE ##Suppliers
SET Fax = N'555-1212'
WHERE SupplierId = 1

waitfor delay '00:00:20'

rollback transaction