/*
Scott Wesenberg

Customers in Each State

USE CandleCo;
SELECT Zipcode.State, COUNT(DISTINCT Customers.CustomerID) As [Customer per State]
FROM Customers JOIN Zipcode ON Customers.Zipcode = Zipcode.ZipID
GROUP BY Zipcode.State
ORDER BY Zipcode.State ASC;

Items Ordered Total And Total Amount Sold for Each Item

SELECT COUNT(OrderDetails.ProductID) AS [Totals per Product], Products.ScentName, Products.sizeOz,
		SUM(OrderDetails.Quantity)* Products.SalePrice AS [Total Price Sold]
FROM OrderDetails JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY Products.ScentName, Products.sizeOz, Products.SalePrice, OrderDetails.ProductID
ORDER BY OrderDetails.ProductID;

Average Price per Product

SELECT COUNT(OrderDetails.ProductID) AS [Total Products Ordered],
		AVG(Products.SalePrice) AS [Average Per Product]
FROM OrderDetails JOIN Products ON OrderDetails.ProductID = Products.ProductID

Orders From Each City

SELECT Zipcode.City, COUNT(Orders.OrdID) AS [Number of Orders]
FROM Customers JOIN Zipcode ON Zipcode.ZipID=Customers.Zipcode
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Zipcode.City
ORDER BY Zipcode.City;

*/