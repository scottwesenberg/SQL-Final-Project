/*Final Project Views*/ 
/*USE CandleCo;
GO

 View 1

--create view--
GO
CREATE VIEW OrdersByCustomer
AS
SELECT Customers.CustomerID, FirstName, LastName, Phone, Orders.OrdID, Orders.OrderDate,
OrderDetails.Quantity, OrderDetails.Quantity*Products.SalePrice AS [Total For Product]
FROM Customers 
	INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
	INNER JOIN OrderDetails ON Orders.OrdID = OrderDetails.OrderID
	INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID
GO

-- using the view to display the data --
USE CandleCo;
SELECT * FROM OrdersByCustomer;
*/ 
/* View 2 

-- create view--
GO
CREATE VIEW ThankYouList
AS
SELECT LEFT(LastName, 1) + '., ' + Customers.FirstName AS Contact, Email
FROM Customers
INNER JOIN Orders ON Customers.CustomerID=Orders.CustomerID
INNER JOIN OrderDetails ON Orders.OrdID=OrderDetails.OrderID
WHERE Quantity>=2;
GO

-- using the view to display the data --
SELECT * FROM ThankYouList;
*/
/* View 3 

--create view--
GO
CREATE VIEW CustContactList
AS
SELECT FirstName, LastName, Phone, Email FROM Customers;
GO

-- using the view to display the data
SELECT * FROM CustContactList;
*/
/*  View 4 

--updatable--
CREATE VIEW InStock
AS
SELECT ProductID, ScentName, [Description], sizeOz, SalePrice
FROM Products;
GO

--original data--

SELECT * FROM InStock;

--update price--

GO
UPDATE InStock
SET SalePrice = 23.00
WHERE ProductID=4;
GO

--new data--

SELECT * FROM InStock;
*/