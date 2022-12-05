CREATE DATABASE CandleCo;
GO

USE CandleCo;
CREATE TABLE Products(
	ProductID int NOT NULL,
	ScentName varchar(80) NOT NULL,
	Description varchar(200) NOT NULL,
	sizeOz int NOT NULL,
	CostSupplies money,
	SalePrice money,
	PRIMARY KEY(ProductID)
);
GO
CREATE TABLE Customers(
	CustomerID int NOT NULL,
	FirstName varchar(20) NOT NULL,
	LastName varchar(30) NOT NULL,
	Zipcode varchar(10) NOT NULL,
	Address varchar(100),
	Email varchar(30),
	Phone varchar(15),
	PRIMARY KEY(CustomerID)
);

GO
CREATE TABLE Zipcode(
	ZipID varchar(10) NOT NULL,
	City varchar(30) NOT NULL,
	State varchar(2) NOT NULL,
	PRIMARY KEY(ZipID)
);
GO
CREATE TABLE Locations(
	LocID int NOT NULL,
	Name varchar(20) NOT NULL,
	PRIMARY KEY(LocID)
);
GO
CREATE TABLE Orders(
	OrdID int NOT NULL,
	OrderDate datetime,
	LocID int NOT NULL,
	CustomerID int NOT NULL,
	PRIMARY KEY(OrdID)
);
GO
CREATE TABLE OrderDetails(
	OrdDetID int NOT NULL,
	OrderID int NOT NULL,
	ProductID int NOT NULL,
	Quantity int,
	PRIMARY KEY(OrdDetID)
);
GO