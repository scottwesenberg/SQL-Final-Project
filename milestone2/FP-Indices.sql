USE CandleCo;
GO
CREATE INDEX idx_Zipcode ON Customers(Zipcode);
GO
CREATE INDEX idx_Location ON Orders(LocID);
GO
CREATE INDEX idx_Customer ON Orders(CustomerID);
GO
CREATE INDEX idx_Order ON OrderDetails(OrderID);
GO
CREATE INDEX idx_OrderProduct ON OrderDetails(ProductID);