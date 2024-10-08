CREATE DATABASE Clothes_Website;
USE [Clothes_Website]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/18/2024 11:16:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](15) NOT NULL,
	[Description] [ntext] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 7/18/2024 11:16:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [float] NOT NULL,
	[UnitPrice] [money] NULL,
	[Discount] [float] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/18/2024 11:16:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[TotalMoney] [money] NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/18/2024 11:16:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
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
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 7/18/2024 11:16:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[ContactName] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[Phone] [nvarchar](24) NULL,
	[HomePage] [ntext] NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/18/2024 11:16:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[RoleID] [int] NOT NULL,
	[Image] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[BirthDay] [date] NOT NULL,
	[Address] [nvarchar](200) NULL,
	[Phone] [nvarchar](11) NOT NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wallets]    Script Date: 7/18/2024 11:16:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wallets](
	[WalletID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Balance] [decimal](10, 2) NULL,
 CONSTRAINT [PK_Wallets] PRIMARY KEY CLUSTERED 
(
	[WalletID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (1, N'Men', N'Chọn lựa từ áo thun cơ bản đến áo sơ mi sang trọng, áo nam của chúng tôi được thiết kế để tạo nên phong cách hoàn hảo cho bạn')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (2, N'Women', N'Từ quần jeans năng động đến quần tây lịch lãm, bộ sưu tập quần nam của chúng tôi mang đến sự thoải mái và phong cách cho mọi dịp')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (3, N'Phu Kien', N'Hoàn thiện phong cách của bạn với những phụ kiện nam tinh tế, từ đồng hồ, thắt lưng đến kính mát và nhiều hơn nữa')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (1, CAST(N'2023-11-27' AS Date), N'user9', 155.9300, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (2, CAST(N'2023-12-01' AS Date), N'user10', 155.9300, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (3, CAST(N'2023-11-25' AS Date), N'user1', 155.9300, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (4, CAST(N'2023-05-24' AS Date), N'user3', 195.9600, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (5, CAST(N'2023-12-15' AS Date), N'user2', 92.9500, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (6, CAST(N'2022-02-05' AS Date), N'user3', 519.8800, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (7, CAST(N'2021-07-12' AS Date), N'user6', 196.9300, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (8, CAST(N'2023-07-03' AS Date), N'user5', 176.2000, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (9, CAST(N'2023-10-18' AS Date), N'user1', 131.9300, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (10, CAST(N'2023-08-21' AS Date), N'user5', 196.0000, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (11, CAST(N'2023-07-26' AS Date), N'user6', 196.6500, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (12, CAST(N'2023-06-22' AS Date), N'user4', 129.1300, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (13, CAST(N'2023-12-21' AS Date), N'user2', 92.9500, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (14, CAST(N'2023-02-28' AS Date), N'user4', 119.8800, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (15, CAST(N'2023-07-22' AS Date), N'user2', 96.9300, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (16, CAST(N'2022-07-21' AS Date), N'user2', 56.9300, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (17, CAST(N'2023-11-26' AS Date), N'user2', 13.5000, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (18, CAST(N'2023-12-15' AS Date), N'user1', 26.1300, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (19, CAST(N'2023-12-31' AS Date), N'user5', 16.9300, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (20, CAST(N'2023-12-22' AS Date), N'user6', 19.9300, 0)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (21, CAST(N'2022-12-11' AS Date), N'user10', 167.9300, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (22, CAST(N'2023-12-26' AS Date), N'user9', 93.5000, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (23, CAST(N'2023-12-24' AS Date), N'user9', 16.1300, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (24, CAST(N'2023-12-23' AS Date), N'user8', 96.9300, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (25, CAST(N'2022-12-22' AS Date), N'user7', 50.9300, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (26, CAST(N'2023-12-21' AS Date), N'user6', 225.5000, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (27, CAST(N'2023-12-27' AS Date), N'user1', 22.1300, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (28, CAST(N'2023-12-28' AS Date), N'user5', 17.9300, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (29, CAST(N'2023-12-29' AS Date), N'user6', 11.9300, 0)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (30, CAST(N'2022-12-11' AS Date), N'user10', 167.9300, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (31, CAST(N'2023-12-28' AS Date), N'user9', 93.5000, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (32, CAST(N'2022-12-17' AS Date), N'user10', 167.9300, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (33, CAST(N'2023-12-29' AS Date), N'user9', 93.5000, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (34, CAST(N'2023-12-30' AS Date), N'user9', 16.1300, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (35, CAST(N'2023-12-26' AS Date), N'user8', 96.9300, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (36, CAST(N'2022-12-25' AS Date), N'user7', 50.9300, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (37, CAST(N'2023-12-24' AS Date), N'user6', 225.5000, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (38, CAST(N'2023-12-23' AS Date), N'user1', 22.1300, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (39, CAST(N'2023-12-22' AS Date), N'user5', 17.9300, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (40, CAST(N'2023-12-21' AS Date), N'user6', 11.9300, 0)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (41, CAST(N'2022-12-20' AS Date), N'user10', 167.9300, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (42, CAST(N'2023-12-19' AS Date), N'user9', 93.5000, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (43, CAST(N'2023-12-25' AS Date), N'user2', 16.1300, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (44, CAST(N'2023-12-22' AS Date), N'user8', 76.9300, 1)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (45, CAST(N'2023-12-22' AS Date), N'user6', 279.9300, 0)
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (46, CAST(N'2023-12-25' AS Date), N'user2', 216.9300, 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (1, N'AO THUN NAM TAY NGAN', 1, 1, N'100ml 75ml', 19.9900, 100, 20, 5, 0, N'images/products/nam/aothun1.jpg, images/products/nam/aothun2.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', CAST(N'2023-10-02' AS Date), 0.7, 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (2, N'Quan JEAN ', 2, 1, N'125ml 50ml', 29.9900, 50, 10, 3, 0, N'images/products/nam/jean1.jpg, images/products/nam/jean2.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', CAST(N'2023-11-02' AS Date), 0.5, 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (3, N'KAKI', 3, 1, N'100ml 25ml 75ml', 39.9900, 75, 15, 3, 0, N'images/products/nam/kaki1.jpg, images/products/nam/kaki2.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', CAST(N'2016-10-02' AS Date), 0.3, 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (4, N'POLO', 4, 1, N'100ml', 49.9900, 120, 30, 4, 0, N'images/products/nam/polo1.jpg, images/products/nam/polo2.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', CAST(N'2023-10-02' AS Date), 0.45, 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (5, N'Somi', 5, 1, N'100ml', 59.9900, 80, 25, 5, 0, N'images/products/nam/somi1.jpg, images/products/nam/somi2.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', CAST(N'2023-05-02' AS Date), 0.7, 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (6, N'Ao Khoac Nu', 1, 2, N'50ml', 19.9900, 100, 20, 4, 0, N'images/products/nu/aokhoac1.jpg, images/products/nu/aokhoac2.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', CAST(N'2023-05-01' AS Date), 0, 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (7, N'JEan nu', 2, 2, N'50ml', 29.9900, 50, 10, 5, 0, N'images/products/nu/jean1.jpg, images/products/nu/jean2.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', CAST(N'2023-05-12' AS Date), 0.5, 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (8, N'kaki nu', 3, 2, N'75ml', 39.9900, 75, 15, 4, 0, N'images/products/nu/kaki1.jpg, images/products/nu/kaki2.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', CAST(N'2019-09-08' AS Date), 0.45, 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (9, N'somi nu', 9, 2, N'100ml', 59.9900, 110, 22, 3, 0, N'images/products/nu/somi1.jpg, images/products/nu/somi2.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', CAST(N'2022-02-03' AS Date), 0.5, 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (10, N'Ao thun nu', 8, 2, N'100ml 125ml', 79.9900, 150, 35, 3, 0, N'images/products/nu/thun1.jpg, images/products/nu/thun2.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', CAST(N'2023-07-01' AS Date), 0.7, 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (11, N'Bang DO', 1, 3, N'100ml', 9.9900, 50, 20, 5, 0, N'images/products/phukien/bangdo1.jpg, images/products/phukien/bangdo2.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', CAST(N'2023-04-12' AS Date), 0, 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (12, N'tat', 2, 3, N'100ml', 19.9900, 100, 20, 5, 0, N'images/products/phukien/tat1.jpg, images/products/phukien/tat2.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', CAST(N'2023-05-11' AS Date), 0, 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (13, N'tui deo bn', 3, 3, N'100ml', 14.9900, 90, 15, 5, 0, N'images/products/phukien/tuideobn1.jpg, images/products/phukien/tuideobn2.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', CAST(N'2022-12-11' AS Date), 0, 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (14, N'tui to te', 4, 3, N'3 chai 5ml', 9.9900, 50, 22, 5, 0, N'images/products/phukien/tuitote1.jpg, images/products/phukien/tuitote2.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', CAST(N'2023-06-12' AS Date), 0, 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (15, N'vi', 5, 3, N'5ml', 19.9900, 80, 25, 5, 0, N'images/products/phukien/vi1.jpg, images/products/phukien/vi2.jpg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', CAST(N'2023-09-12' AS Date), 0, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [Country], [Phone], [HomePage]) VALUES (1, N'Versace', N'Supplier Contact Versace', N'Italy', N'+39 02 1234 5678', N'http://www.versace.com')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [Country], [Phone], [HomePage]) VALUES (2, N'Hugo Boss', N'Supplier Contact Hugo Boss', N'Germany', N'+49 30 9876 5432', N'http://www.hugoboss.com')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [Country], [Phone], [HomePage]) VALUES (3, N'Jaguar', N'Supplier Contact Jaguar', N'United Kingdom', N'+44 20 3456 7890', N'http://www.jaguar.com')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [Country], [Phone], [HomePage]) VALUES (4, N'Armani', N'Supplier Contact Armani', N'Italy', N'+39 02 2345 6789', N'http://www.armani.com')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [Country], [Phone], [HomePage]) VALUES (5, N'Paco Rabanne', N'Supplier Contact Paco Rabanne', N'France', N'+33 1 3456 7890', N'http://www.pacorabanne.com')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [Country], [Phone], [HomePage]) VALUES (6, N'Ralph Lauren', N'Supplier Contact Ralph Lauren', N'USA', N'+1 212 555 1234', N'http://www.ralphlauren.com')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [Country], [Phone], [HomePage]) VALUES (7, N'Bvlgari', N'Supplier Contact Bvlgari', N'Italy', N'+39 06 1234 5678', N'http://www.bvlgari.com')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [Country], [Phone], [HomePage]) VALUES (8, N'Coach', N'Supplier Contact Coach', N'USA', N'+1 212 555 6789', N'http://www.coach.com')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [Country], [Phone], [HomePage]) VALUES (9, N'Kenzo', N'Supplier Contact Kenzo', N'France', N'+33 1 8765 4321', N'http://www.kenzo.com')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [Country], [Phone], [HomePage]) VALUES (10, N'D&G', N'Supplier Contact D&G', N'Italy', N'+39 02 3456 7890', N'http://www.dolcegabbana.com')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [Country], [Phone], [HomePage]) VALUES (11, N'Jean Paul Gaultier', N'Supplier Contact Jean Paul Gaultier', N'France', N'+33 1 2345 6789', N'http://www.jeanpaulgaultier.com')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [Country], [Phone], [HomePage]) VALUES (12, N'Ajmal', N'Supplier Contact Ajmal', N'United Arab Emirates', N'+971 4 1234 5678', N'http://www.ajmalperfume.com')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [Country], [Phone], [HomePage]) VALUES (13, N'Calvin Klein', N'Supplier Contact Calvin Klein', N'USA', N'+1 212 555 7890', N'http://www.calvinklein.com')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [Country], [Phone], [HomePage]) VALUES (14, N'The Body Shop', N'Supplier Contact The Body Shop', N'United Kingdom', N'+44 20 9876 5432', N'http://www.thebodyshop.com')
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [Country], [Phone], [HomePage]) VALUES (15, N'Lattafa', N'Supplier Contact Lattafa', N'United Arab Emirates', N'+971 6 2345 6789', N'http://www.lattafa.com')
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [UserName], [FullName], [Password], [RoleID], [Image], [Email], [BirthDay], [Address], [Phone], [status]) VALUES (14, N'11ne', N'Tính anh thật tồi', N'pass123word', 2, N'images/users/useR11.png', N'user4@gmail.com', CAST(N'2003-04-18' AS Date), N'Có chỗ đứng', N'7890123456', 0)
INSERT [dbo].[Users] ([UserID], [UserName], [FullName], [Password], [RoleID], [Image], [Email], [BirthDay], [Address], [Phone], [status]) VALUES (15, N'12dau', N'Ngủ đi', N'pass456word', 2, N'images/users/user12.png', N'user5@gmail.com', CAST(N'1998-09-03' AS Date), N'303 Birch St, CityF', N'3456789012', 1)
INSERT [dbo].[Users] ([UserID], [UserName], [FullName], [Password], [RoleID], [Image], [Email], [BirthDay], [Address], [Phone], [status]) VALUES (16, N'13kia', N'Đàn ông đích thực', N'pass789word', 2, N'images/users/user13.png', N'user6@gmail.com', CAST(N'1993-12-25' AS Date), N'404 Cedar St, CityG', N'9012345678', 1)
INSERT [dbo].[Users] ([UserID], [UserName], [FullName], [Password], [RoleID], [Image], [Email], [BirthDay], [Address], [Phone], [status]) VALUES (17, N'14day', N'Thế em là mây', N'pass789word', 2, N'images/users/user14.png', N'user7@gmail.com', CAST(N'1991-06-10' AS Date), N'505 Pine St, CityH', N'5678901234', 1)
INSERT [dbo].[Users] ([UserID], [UserName], [FullName], [Password], [RoleID], [Image], [Email], [BirthDay], [Address], [Phone], [status]) VALUES (18, N'15do', N'Càng nặng ký', N'pass123word', 2, N'images/users/user15.png', N'user8@gmail.com', CAST(N'1994-03-27' AS Date), N'Không dám bung cánh vì sợ em tung cánh', N'2345678901', 1)
INSERT [dbo].[Users] ([UserID], [UserName], [FullName], [Password], [RoleID], [Image], [Email], [BirthDay], [Address], [Phone], [status]) VALUES (19, N'16roi', N'Tôi lấy vợ', N'pass456word', 2, N'images/users/user16.png', N'user9@gmail.com', CAST(N'1997-08-14' AS Date), N'Một tay bắt cọp', N'8901234567', 1)
INSERT [dbo].[Users] ([UserID], [UserName], [FullName], [Password], [RoleID], [Image], [Email], [BirthDay], [Address], [Phone], [status]) VALUES (1, N'john_doe', N'John Doe', N'password123', 1, N'images/users/user.png', N'aaaa@gmail.com', CAST(N'2003-08-09' AS Date), N'123 Main St, CityA', N'12345678901', 1)
INSERT [dbo].[Users] ([UserID], [UserName], [FullName], [Password], [RoleID], [Image], [Email], [BirthDay], [Address], [Phone], [status]) VALUES (3, N'john_doeee', N'John Doe', N'password123', 2, N'images/users/user.png', N'aaaa@gmail.com', CAST(N'2003-08-09' AS Date), N'123 Main St, CityA', N'12345678901', 1)
INSERT [dbo].[Users] ([UserID], [UserName], [FullName], [Password], [RoleID], [Image], [Email], [BirthDay], [Address], [Phone], [status]) VALUES (2, N'phuuthanh2003', N'Phùng Hữu Thành', N'123', 1, N'images/users/thanh.png', N'phuuthanh20033@gmail.com', CAST(N'2003-08-09' AS Date), N'60 Nguyễn Văn Trỗi', N'0707064154', 1)
INSERT [dbo].[Users] ([UserID], [UserName], [FullName], [Password], [RoleID], [Image], [Email], [BirthDay], [Address], [Phone], [status]) VALUES (4, N'user1', N'Khoái ăn sang', N'password123', 2, N'images/users/user1.png', N'phunghthanh2203@gmail.com', CAST(N'1995-02-15' AS Date), N'456 Oak St, CityB', N'9876543210', 1)
INSERT [dbo].[Users] ([UserID], [UserName], [FullName], [Password], [RoleID], [Image], [Email], [BirthDay], [Address], [Phone], [status]) VALUES (13, N'user10', N'Cai một hún', N'pass789word', 2, N'images/users/user10.png', N'user10@gmail.com', CAST(N'1996-01-05' AS Date), N'Người đàn bà vu khống', N'4567890123', 1)
INSERT [dbo].[Users] ([UserID], [UserName], [FullName], [Password], [RoleID], [Image], [Email], [BirthDay], [Address], [Phone], [status]) VALUES (5, N'user2', N'User Two', N'password456', 2, N'images/users/user2.png', N'user2@gmail.com', CAST(N'1990-07-22' AS Date), N'789 Pine St, CityC', N'1239874560', 1)
INSERT [dbo].[Users] ([UserID], [UserName], [FullName], [Password], [RoleID], [Image], [Email], [BirthDay], [Address], [Phone], [status]) VALUES (6, N'user3', N'User Three', N'password789', 2, N'images/users/user3.png', N'user3@gmail.com', CAST(N'1988-11-30' AS Date), N'Chả sợ chi', N'6543217890', 1)
INSERT [dbo].[Users] ([UserID], [UserName], [FullName], [Password], [RoleID], [Image], [Email], [BirthDay], [Address], [Phone], [status]) VALUES (7, N'user4', N'User Four', N'pass123word', 2, N'images/users/user4.png', N'user4@gmail.com', CAST(N'1992-04-18' AS Date), N'202 Elm St, CityE', N'7890123456', 0)
INSERT [dbo].[Users] ([UserID], [UserName], [FullName], [Password], [RoleID], [Image], [Email], [BirthDay], [Address], [Phone], [status]) VALUES (8, N'user5', N'Tối em có sang', N'pass456word', 2, N'images/users/user5.png', N'user5@gmail.com', CAST(N'1998-09-03' AS Date), N'303 Birch St, CityF', N'3456789012', 1)
INSERT [dbo].[Users] ([UserID], [UserName], [FullName], [Password], [RoleID], [Image], [Email], [BirthDay], [Address], [Phone], [status]) VALUES (9, N'user6', N'Nho từ điển', N'pass789word', 2, N'images/users/user6.png', N'user6@gmail.com', CAST(N'1993-12-25' AS Date), N'404 Cedar St, CityG', N'9012345678', 1)
INSERT [dbo].[Users] ([UserID], [UserName], [FullName], [Password], [RoleID], [Image], [Email], [BirthDay], [Address], [Phone], [status]) VALUES (10, N'user7', N'User Seven', N'pass789word', 2, N'images/users/user7.png', N'user7@gmail.com', CAST(N'1991-06-10' AS Date), N'Ban lãnh đạo', N'5678901234', 1)
INSERT [dbo].[Users] ([UserID], [UserName], [FullName], [Password], [RoleID], [Image], [Email], [BirthDay], [Address], [Phone], [status]) VALUES (11, N'user8', N'User Eight', N'pass123word', 2, N'images/users/user8.png', N'user8@gmail.com', CAST(N'1994-03-27' AS Date), N'606 Elm St, CityI', N'2345678901', 1)
INSERT [dbo].[Users] ([UserID], [UserName], [FullName], [Password], [RoleID], [Image], [Email], [BirthDay], [Address], [Phone], [status]) VALUES (12, N'user9', N'User Nine', N'pass456word', 2, N'images/users/user9.png', N'user9@gmail.com', CAST(N'1997-08-14' AS Date), N'707 Oak St, CityJ', N'8901234567', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Wallets] ON 

INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (1, N'john_doe', CAST(300.00 AS Decimal(10, 2)))
INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (2, N'john_doeee', CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (3, N'phuuthanh2003', CAST(500.00 AS Decimal(10, 2)))
INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (4, N'user1', CAST(200.00 AS Decimal(10, 2)))
INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (5, N'user10', CAST(150.00 AS Decimal(10, 2)))
INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (6, N'user2', CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (7, N'user3', CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (8, N'user4', CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (9, N'user5', CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (10, N'user6', CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (11, N'user7', CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (12, N'user8', CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (13, N'user9', CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (14, N'11ne', CAST(20.00 AS Decimal(10, 2)))
INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (15, N'12dau', CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (16, N'13kia', CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (17, N'14day', CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (18, N'15do', CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (19, N'user8', CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (20, N'16roi', CAST(20.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Wallets] OFF
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetail]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_ProductDetail] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_ProductDetail]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserName])
REFERENCES [dbo].[Users] ([UserName])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Category]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Supplier]
GO
ALTER TABLE [dbo].[Wallets]  WITH CHECK ADD  CONSTRAINT [FK_Wallets_Users] FOREIGN KEY([UserName])
REFERENCES [dbo].[Users] ([UserName])
GO
ALTER TABLE [dbo].[Wallets] CHECK CONSTRAINT [FK_Wallets_Users]
GO
