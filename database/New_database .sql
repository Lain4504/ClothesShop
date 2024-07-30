CREATE DATABASE Clothes_Website;
GO

USE Clothes_Website;
GO

-- Table: Categories
CREATE TABLE Categories (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName NVARCHAR(15) NOT NULL,
    Description NTEXT
);
GO

-- Table: OrderDetails
CREATE TABLE OrderDetails (
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity FLOAT NOT NULL,
    UnitPrice MONEY,
    Discount FLOAT,
    PRIMARY KEY (OrderID, ProductID)
);
GO

-- Table: Orders
CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    Date DATE NOT NULL,
    UserName NVARCHAR(50) NOT NULL,
    TotalMoney MONEY,
    Status BIT NOT NULL
);
GO

-- Table: Products
CREATE TABLE Products(
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[SupplierID] [int] NULL,
	[CategoryID] [int] NULL,
	[QuantityPerUnit] [nvarchar](100) NULL,
	[UnitPrice] [money] NULL,
	[UnitsInStock] [smallint] NULL,
	[QuantitySold] [int] NULL,
	[StarRating] [smallint] NULL,
	[Discontinued] [bit] NULL,
	[image] [nvarchar](max) NULL,
	[describe] [nvarchar](max) NULL,
	[releaseDate] [date] NULL,
	[Discount] [float] NULL,
	[status] [bit] NOT NULL

);
GO

-- Table: Suppliers
CREATE TABLE Suppliers (
    SupplierID INT IDENTITY(1,1) PRIMARY KEY,
    CompanyName NVARCHAR(40) NOT NULL,
    ContactName NVARCHAR(50),
    Country NVARCHAR(50),
    Phone NVARCHAR(24),
    HomePage NTEXT
);
GO

-- Table: Users
CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    UserName NVARCHAR(50) NOT NULL UNIQUE,
    FullName NVARCHAR(50) NOT NULL,
    Password NVARCHAR(50) NOT NULL,
    RoleID INT NOT NULL,
    Image NVARCHAR(50),
    Email NVARCHAR(50),
    BirthDay DATE NOT NULL,
    Address NVARCHAR(200),
    Phone NVARCHAR(11) NOT NULL,
    Status BIT NOT NULL
);
GO

-- Table: Wallets
CREATE TABLE Wallets (
    WalletID INT IDENTITY(1,1) PRIMARY KEY,
    UserName NVARCHAR(50),
    Balance DECIMAL(10, 2)
);
GO

-- Insert initial data
INSERT INTO Categories (CategoryName, Description) VALUES 
(N'Áo khoác', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit'),
(N'Áo Polo', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit'),
(N'Áo Sơmi', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit'),
(N'Sweater', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit'),
(N'Áo thun', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit'),
(N'Quần dài', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit'),
(N'Quần jean', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit'),
(N'Quần ngắn', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit'),
(N'Ba lô', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit'),
(N'Mũ', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit'),
(N'Tất', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit');
GO



-- Insert data into Suppliers
INSERT INTO Suppliers (CompanyName, ContactName, Country, Phone, HomePage) VALUES 
(N'Versace', N'Supplier Contact Versace', N'Italy', N'+39 02 1234 5678', N'http://www.versace.com'),
(N'Hugo Boss', N'Supplier Contact Hugo Boss', N'Germany', N'+49 30 9876 5432', N'http://www.hugoboss.com'),
(N'Jaguar', N'Supplier Contact Jaguar', N'United Kingdom', N'+44 20 3456 7890', N'http://www.jaguar.com'),
(N'Armani', N'Supplier Contact Armani', N'Italy', N'+39 02 2345 6789', N'http://www.armani.com');
GO

-- Insert data into Users
INSERT INTO Users (UserName, FullName, Password, RoleID, Image, Email, BirthDay, Address, Phone, Status) VALUES 
(N'11ne', N'Tính anh thật tồi', N'pass123word', 2, N'images/users/user11.png', N'user4@gmail.com', '2003-04-18', N'Có chỗ đứng', N'7890123456', 0),
(N'12dau', N'Ngủ đi', N'pass456word', 2, N'images/users/user12.png', N'user5@gmail.com', '1998-09-03', N'303 Birch St, CityF', N'3456789012', 1),
(N'13kia', N'Đàn ông đích thực', N'pass789word', 2, N'images/users/user13.png', N'user6@gmail.com', '1993-12-25', N'404 Cedar St, CityG', N'9012345678', 1),
(N'14day', N'Thế em là mây', N'pass789word', 2, N'images/users/user14.png', N'user7@gmail.com', '1991-06-10', N'505 Pine St, CityH', N'5678901234', 1),
(N'15do', N'Càng nặng ký', N'pass123word', 2, N'images/users/user15.png', N'user8@gmail.com', '1994-03-27', N'Không dám bung cánh vì sợ em tung cánh', N'2345678901', 1);
GO

-- Insert data into Wallets
INSERT INTO Wallets (UserName, Balance) VALUES 
(N'john_doe', 300.00),
(N'john_doeee', 0.00),
(N'phuuthanh2003', 500.00),
(N'user1', 200.00),
(N'user10', 150.00);
GO

-- Add foreign keys
ALTER TABLE OrderDetails ADD CONSTRAINT FK_OrderDetail_Order FOREIGN KEY (OrderID) REFERENCES Orders (OrderID) ON DELETE CASCADE;
ALTER TABLE OrderDetails ADD CONSTRAINT FK_OrderDetail_Product FOREIGN KEY (ProductID) REFERENCES Products (ProductID) ON DELETE CASCADE;
ALTER TABLE Orders ADD CONSTRAINT FK_Order_User FOREIGN KEY (UserName) REFERENCES Users (UserName);
ALTER TABLE Products ADD CONSTRAINT FK_Products_Category FOREIGN KEY (CategoryID) REFERENCES Categories (CategoryID);
ALTER TABLE Products ADD CONSTRAINT FK_Products_Supplier FOREIGN KEY (SupplierID) REFERENCES Suppliers (SupplierID) ON DELETE SET NULL;
ALTER TABLE Wallets ADD CONSTRAINT FK_Wallets_User FOREIGN KEY (UserName) REFERENCES Users (UserName);
GO
