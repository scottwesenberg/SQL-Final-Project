/* Final Project Procedures */

-- Retrieve & displays data
/*
USE CandleCo;
GO
CREATE PROC spCustomers
AS
SELECT * FROM Customers
ORDER BY LastName;
GO

USE CandleCo;
EXEC spCustomers;
*/
/*

-- Takes input parameter

USE CandleCo;
GO
CREATE PROC spGetOrder
	@OrderID int
AS
BEGIN
	SELECT * FROM OrderDetails
	WHERE OrderID = @OrderID;
END
GO

USE CandleCo;
EXEC spGetOrder 3
*/
/*

-- Takes one input parameter and returns four output parameters
USE CandleCo;
GO
CREATE PROC spContactInformation
	@CustomerID int,
	@FirstName nvarchar(30) OUTPUT,
	@LastName nvarchar(50) OUTPUT,
	@PhoneNumber nvarchar(30) OUTPUT,
	@Email nvarchar(50) OUTPUT
AS
SELECT @FirstName = FirstName, @LastName = LastName, @PhoneNumber = Phone, @Email = Email
FROM Customers 
WHERE CustomerID = @CustomerID;
GO
-- Run the procedure
DECLARE @FirstName nvarchar(30);
DECLARE @LastName nvarchar(50);
DECLARE @Phone nvarchar(30);
DECLARE @Email nvarchar(50);
EXEC spContactInformation 1, @FirstName OUTPUT, @LastName OUTPUT, @Phone OUTPUT, @Email OUTPUT;
SELECT @FirstName AS 'First Name', @LastName AS 'Last Name', @Phone AS 'Phone Number', @Email AS 'Email';


-- Stored procedure that has return value 
USE CandleCo;
GO
CREATE PROC spOrdersCount
AS
DECLARE @OrdersCount int;
SELECT @OrdersCount = COUNT(*)
FROM Customers 
RETURN @OrdersCount;
GO

DECLARE @OrdersCount int;
EXEC @OrdersCount = spOrdersCount;
PRINT 'There have been ' + CONVERT(varchar, @OrdersCount) + ' orders placed & stored in this database';
GO
*/
/* Final Project User Defined Functions 

-- creates function
USE CandleCo;
GO
CREATE FUNCTION fnGetLocation
    (@LocName nvarchar(50) = '%')
    RETURNS int
BEGIN
    RETURN (SELECT LocID FROM Locations WHERE [Name] Like @LocName);
END; 

-- uses function
GO
SELECT * FROM Locations 
WHERE LocID = dbo.fnGetLocation('Amazon%');



USE CandleCo;
GO
CREATE FUNCTION fnProducts
	(@ProdName nvarchar(50) = '%')
	RETURNS table
RETURN
	(SELECT * FROM Products WHERE ScentName LIKE @ProdName);
GO
SELECT * FROM dbo.fnProducts('%Cinn%');
*/

 /*Final Project Triggers 

 USE CandleCo;
 GO
 SELECT * INTO CustTransaction
 FROM Customers
 WHERE 1=0;

 USE CandleCo;
 ALTER TABLE CustTransaction
 ADD Activity varchar(50);
 GO
 
CREATE TRIGGER CustTransaction_INSERT ON Customers
    AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @CustomerID int
	DECLARE @FirstName nvarchar(30)
	DECLARE @LastName nvarchar(50)
	DECLARE @Address nvarchar(100)
	DECLARE @Zip nvarchar(20)
	DECLARE @PhoneNumber nvarchar(30)
	DECLARE @Email nvarchar(50)

    SELECT @CustomerID =INSERTED.CustomerID, @FirstName = INSERTED.FirstName, @LastName = INSERTED.LastName,
	@Address = INSERTED.Address, @Zip = INSERTED.Zipcode, @PhoneNumber = INSERTED.Phone, @Email = INSERTED.Email
	FROM INSERTED

    INSERT INTO CustTransaction VALUES(@CustomerID,@FirstName, @LastName,@Address, @Zip, @PhoneNumber, @Email, 'Inserted' )
END
GO

INSERT INTO Customers VALUES(9,'Mac','Miller','100 Blue Slide ave','49694','(231)-123-555','NULL');
GO

SELECT * FROM CustTransaction;
GO
*/
/*
 CREATE TRIGGER CustTransaction_Delete ON Customers
    AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @CustomerID int
	DECLARE @FirstName nvarchar(30)
	DECLARE @LastName nvarchar(50)
	DECLARE @Address nvarchar(100)
	DECLARE @Zip nvarchar(20)
	DECLARE @PhoneNumber nvarchar(30)
	DECLARE @Email nvarchar(10)

    SELECT @CustomerID =DELETED.CustomerID, @FirstName = DELETED.FirstName, @LastName = DELETED.LastName,
	@Address = DELETED.Address, @Zip = DELETED.Zipcode, @PhoneNumber = DELETED.Phone, @Email = DELETED.Email
	FROM DELETED

    INSERT INTO CustTransaction VALUES(@CustomerID,@FirstName, @LastName,@Address, @Zip, @PhoneNumber, @Email, 'Deleted' )
END
GO

DELETE FROM Customers WHERE CustomerID = 9;
GO

SELECT * FROM CustTransaction;

GO

 CREATE TRIGGER CustTransaction_Update ON Customers
    AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @CustomerID int
	DECLARE @FirstName nvarchar(30)
	DECLARE @LastName nvarchar(50)
	DECLARE @Address nvarchar(100)
	DECLARE @Zip nvarchar(20)
	DECLARE @PhoneNumber nvarchar(30)
	DECLARE @Email nvarchar(10)

    SELECT @CustomerID =INSERTED.CustomerID, @FirstName = INSERTED.FirstName, @LastName = INSERTED.LastName,
	@Address = INSERTED.Address, @Zip = INSERTED.Zipcode, @PhoneNumber = INSERTED.Phone, @Email = INSERTED.Email
	FROM INSERTED

    INSERT INTO CustTransaction VALUES(@CustomerID,@FirstName, @LastName,@Address, @Zip, @PhoneNumber, @Email, 'Updated' )
END
GO

INSERT INTO Customers VALUES(10,'ASAP','Rocky','200 Rocky Rd','49696','(231)-123-9999','NULL');
GO
UPDATE Customers 
SET FirstName = 'Anthony'
WHERE CustomerID = 10;
GO
SELECT * FROM CustTransaction;
*/