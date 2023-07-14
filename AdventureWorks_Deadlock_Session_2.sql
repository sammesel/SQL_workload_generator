waitfor delay '00:00:05'

BEGIN TRAN;   

UPDATE ##Suppliers
SET Fax = N'555-1212'
WHERE SupplierId = 1

waitfor delay '00:00:20'

UPDATE ##Employees
SET Phone = N'555-9999'
WHERE EmpId = 1


waitfor delay '00:00:20'

rollback transaction