--Two global temp tables with sample data for demo purposes.
DROP TABLE IF EXISTS ##Employees
GO
CREATE TABLE ##Employees (
    EmpId INT IDENTITY,
    EmpName VARCHAR(16),
    Phone VARCHAR(16)
)
GO

INSERT INTO ##Employees (EmpName, Phone)
VALUES ('Martha', '800-555-1212'), ('Jimmy', '619-555-8080')
GO

DROP TABLE IF EXISTS ##Suppliers

CREATE TABLE ##Suppliers(
    SupplierId INT IDENTITY,
    SupplierName VARCHAR(64),
    Fax VARCHAR(16)
)
GO

INSERT INTO ##Suppliers (SupplierName, Fax)
VALUES ('Acme', '877-555-6060'), ('Rockwell', '800-257-1234')
GO

waitfor delay '00:01:00'

/*
DROP TABLE ##Employees
GO
DROP TABLE ##Suppliers
GO
*/

