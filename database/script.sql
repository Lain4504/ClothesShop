--drop database Perfume_Website 


CREATE DATABASE Perfume_Website 

USE [Perfume_Website]
-- Tạo bảng [dbo].[Users]
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1),
	[UserName] [nvarchar](50) PRIMARY KEY NOT NULL ,
	[FullName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[RoleID] [int] NOT NULL,
	[Image] [nvarchar](50) NULL,
	[Email] [nvarchar](50)  NULL,
	[BirthDay] date NOT NULL,
	[Address] [nvarchar](200) NULL,
	[Phone] [nvarchar](11) NOT NULL,
	[status] bit NOT NULL
)

INSERT INTO [dbo].[Users] ([UserName], [FullName], [Password], [Address],[Image], [Email], [BirthDay], [Phone], [RoleID], [status])
VALUES 
    ('john_doe', 'John Doe', 'password123', N'123 Main St, CityA', 'images/users/user.png', 'aaaa@gmail.com', '2003-08-09', '12345678901', 1, 1),
	('phuuthanh2003', N'Phùng Hữu Thành', '123', N'60 Nguyễn Văn Trỗi', 'images/users/thanh.png', 'phuuthanh20033@gmail.com', '2003-08-09', '0707064154', 1 , 1),
	('john_doeee', N'John Doe', 'password123', N'123 Main St, CityA', 'images/users/user.png', 'aaaa@gmail.com', '2003-08-09', '12345678901', 2, 1),
	('user1', N'Khoái ăn sang', 'password123', N'456 Oak St, CityB', 'images/users/user1.png', 'phunghthanh2203@gmail.com', '1995-02-15', '9876543210', 2, 1),
    ('user2', N'User Two', 'password456', N'789 Pine St, CityC', 'images/users/user2.png', 'user2@gmail.com', '1990-07-22', '1239874560', 2, 1),
    ('user3', N'User Three', 'password789', N'Chả sợ chi', 'images/users/user3.png', 'user3@gmail.com', '1988-11-30', '6543217890', 2, 1),
    ('user4', N'User Four', 'pass123word', N'202 Elm St, CityE', 'images/users/user4.png', 'user4@gmail.com', '1992-04-18', '7890123456', 2, 0),
    ('user5', N'Tối em có sang', 'pass456word', N'303 Birch St, CityF', 'images/users/user5.png', 'user5@gmail.com', '1998-09-03', '3456789012', 2, 1),
    ('user6', N'Nho từ điển', 'pass789word', N'404 Cedar St, CityG', 'images/users/user6.png', 'user6@gmail.com', '1993-12-25', '9012345678', 2, 1),
    ('user7', N'User Seven', 'pass789word', N'Ban lãnh đạo', 'images/users/user7.png', 'user7@gmail.com', '1991-06-10', '5678901234', 2, 1),
    ('user8', N'User Eight', 'pass123word', N'606 Elm St, CityI', 'images/users/user8.png', 'user8@gmail.com', '1994-03-27', '2345678901', 2, 1),
    ('user9', N'User Nine', 'pass456word', N'707 Oak St, CityJ', 'images/users/user9.png', 'user9@gmail.com', '1997-08-14', '8901234567', 2, 1),
    ('user10', N'Cai một hún', 'pass789word', N'Người đàn bà vu khống', 'images/users/user10.png', 'user10@gmail.com', '1996-01-05', '4567890123', 2, 1),
	('11ne', N'Tính anh thật tồi', 'pass123word', N'Có chỗ đứng', 'images/users/useR11.png', 'user4@gmail.com', '2003-04-18', '7890123456', 2, 0),
    ('12dau', N'Ngủ đi', 'pass456word', N'303 Birch St, CityF', 'images/users/user12.png', 'user5@gmail.com', '1998-09-03', '3456789012', 2, 1),
    ('13kia', N'Đàn ông đích thực', 'pass789word', N'404 Cedar St, CityG', 'images/users/user13.png', 'user6@gmail.com', '1993-12-25', '9012345678', 2, 1),
    ('14day', N'Thế em là mây', 'pass789word', N'505 Pine St, CityH', 'images/users/user14.png', 'user7@gmail.com', '1991-06-10', '5678901234', 2, 1),
    ('15do', N'Càng nặng ký', 'pass123word', N'Không dám bung cánh vì sợ em tung cánh', 'images/users/user15.png', 'user8@gmail.com', '1994-03-27', '2345678901', 2, 1),
    ('16roi', N'Tôi lấy vợ', 'pass456word', N'Một tay bắt cọp', 'images/users/user16.png', 'user9@gmail.com', '1997-08-14', '8901234567', 2, 1);

-- Tạo bảng [dbo].[Categories]
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](15) NOT NULL,
	[Description] [ntext] NULL,
	CONSTRAINT [PK_Categories] PRIMARY KEY([CategoryID])
)

INSERT INTO [dbo].[Categories] ([CategoryName], [Description])
VALUES 
    ('Men', N'Các quý ông tìm đến nước hoa để làm gì? Có lẽ là để thơm tho, nam tính và làm chỉn chu thêm phong cách của bản thân, phải chứ? Namperfume thấu hiểu các quý ông của 
	chúng ta, đem tới cho đấng mày râu những mùi hương tươm tất, gọn gàng, cuốn hút, đôi khi là quyền lực choáng ngợp, và chắc chắn không thể quên được sự bụi bặm phóng khoáng đặc
	trưng của phái mạnh.'),
    ('Women', N'Nước hoa từ những ngày đầu đã được tạo ra là để phục vụ cho phái đẹp, vì thế dường như trong thế giới mùi hương, những sự lựa chọn cho nữ giới là phong phú
	và nhiều màu sắc hơn cả. Là do vậy, namperfume luôn muốn đem đến cho các quý cô xinh đẹp những lựa chọn tuyệt vời, từ quyến rũ, sang trọng, quyền lực đến nhẹ nhàng, ngây thơ, 
	và không thể thiếu một chút gợi cảm lả lơi, ngả ngốn...'),
    ('Kids', N'Nước hoa cho bé thường được làm từ những thành phần thiên nhiên, đảm bảo an toàn và giúp mang đến cho bé mùi hương dịu nhẹ, dễ chịu. 
	Ngoài ra, sử dụng nước hoa còn giúp kích thích khứu giác của bé phát triển.'),
    ('Unisex', N'Nước hoa unisex là dòng nước hoa phù hợp cho mọi giới tính, dù là nam hay nữ cũng đều dùng chung sản phẩm này. Cùng một chái nước hoa nhưng khi mày râu dùng sẽ trở nên 
	lịch lãm, một nàng sỡ hữu nét quyến rũ yêu kều sẽ trở nên hấp dẫn hơn nữa.'),
	('Giftset', N'Giftset – hay còn gọi là bộ quà tặng, là tập hợp nhiều loại sản phẩm khác nhau. Chúng đều có tính ứng dụng cao để phục vụ cho công việc và cả trong cuộc sống hàng ngày. 
	Tất cả các sản phẩm trong bộ Giftset đều có liên quan đến nhau, tính thẩm mỹ cao để mang đến sự hài lòng cho người nhận.');


-- Tạo bảng [dbo].[Suppliers]
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[ContactName] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[Phone] [nvarchar](24) NULL,
	[HomePage] [ntext] NULL,
	CONSTRAINT [PK_Suppliers] PRIMARY KEY([SupplierID])
)



INSERT INTO [dbo].[Suppliers] ([CompanyName], [ContactName], [Country], [Phone], [HomePage])
VALUES 
    ('Versace', 'Supplier Contact Versace', 'Italy', '+39 02 1234 5678', 'http://www.versace.com'),
    ('Hugo Boss', 'Supplier Contact Hugo Boss', 'Germany', '+49 30 9876 5432', 'http://www.hugoboss.com'),
    ('Jaguar', 'Supplier Contact Jaguar', 'United Kingdom', '+44 20 3456 7890', 'http://www.jaguar.com'),
    ('Armani', 'Supplier Contact Armani', 'Italy', '+39 02 2345 6789', 'http://www.armani.com'),
    ('Paco Rabanne', 'Supplier Contact Paco Rabanne', 'France', '+33 1 3456 7890', 'http://www.pacorabanne.com'),
    ('Ralph Lauren', 'Supplier Contact Ralph Lauren', 'USA', '+1 212 555 1234', 'http://www.ralphlauren.com'),
    ('Bvlgari', 'Supplier Contact Bvlgari', 'Italy', '+39 06 1234 5678', 'http://www.bvlgari.com'),
    ('Coach', 'Supplier Contact Coach', 'USA', '+1 212 555 6789', 'http://www.coach.com'),
    ('Kenzo', 'Supplier Contact Kenzo', 'France', '+33 1 8765 4321', 'http://www.kenzo.com'),
    ('D&G', 'Supplier Contact D&G', 'Italy', '+39 02 3456 7890', 'http://www.dolcegabbana.com'),
    ('Jean Paul Gaultier', 'Supplier Contact Jean Paul Gaultier', 'France', '+33 1 2345 6789', 'http://www.jeanpaulgaultier.com'),
    ('Ajmal', 'Supplier Contact Ajmal', 'United Arab Emirates', '+971 4 1234 5678', 'http://www.ajmalperfume.com'),
    ('Calvin Klein', 'Supplier Contact Calvin Klein', 'USA', '+1 212 555 7890', 'http://www.calvinklein.com'),
    ('The Body Shop', 'Supplier Contact The Body Shop', 'United Kingdom', '+44 20 9876 5432', 'http://www.thebodyshop.com'),
    ('Lattafa', 'Supplier Contact Lattafa', 'United Arab Emirates', '+971 6 2345 6789', 'http://www.lattafa.com');

-- Tạo bảng [dbo].[Products]
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
	[status] bit Not null,
	CONSTRAINT [PK_Products] PRIMARY KEY([ProductID]),
	CONSTRAINT [FK_Products_Supplier]
    FOREIGN KEY ([SupplierID])
    REFERENCES [dbo].[Suppliers] ([SupplierID]) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT [FK_Products_Category] 
    FOREIGN KEY ([CategoryID])
    REFERENCES [dbo].[Categories] ([CategoryID]) 
)

INSERT INTO [dbo].[Products] (
    [ProductName], 
    [SupplierID], 
    [CategoryID], 
    [QuantityPerUnit], 
    [UnitPrice], 
    [UnitsInStock], 
    [QuantitySold], 
    [StarRating], 
    [Discontinued],
	[image],
	[describe],
	[releaseDate],
	[Discount],
	[status]
	)
VALUES 
    -- 20 products for Men (https://missi.com.vn/danh-muc/nuoc-hoa-nam/)
    ('NAUTICA VOYAGE N-83 EDT', 1, 1, '100ml 75ml', 19.99, 100, 20, 5, 0, 'images/products/Men/1-1.png, images/products/Men/1-2.png', 
	N'Nautica Voyage N-83 Eau de Toilette for men là mùi hương mang đến cho bạn cảm giác tươi mát, và yếu tố nam tính và mạnh mẽ của phái mạnh. Mở đầu bằng sự kết hợp giữa Hương biển, Tinh dầu lá chanh và Bạc hà, tổ hợp hương thơm trong tầng hương đầu khiến không gian trở nên trong lành và chắc hẳn tầng hương này sẽ giúp những chàng trai thể hiện phong cách phóng khoáng và năng động.', '2023-10-02',0.7, 1),

    ('JEAN PAUL GAULTIER LE MALE ELIXIR', 2, 1, '125ml 50ml', 29.99, 50, 10, 3, 0, 'images/products/Men/2-1.png, images/products/Men/2-2.png', 
	N'Vị ngọt làm nên tính cách của Jean Paul Gaultier Le Male Elixir đến từ Vanilla và Mật ong. Vanilla bông phấn mịn màng, quyện cùng Mật ong sánh đặc, tạo nên tông vị mềm mại nhưng vẫn da diết vô cùng.', '2023-11-02',0.5, 1),

    ('NAUTICA VOYAGE SPORT EDT', 3, 1, '100ml 25ml 75ml', 39.99, 75, 15, 3, 0, 'images/products/Men/3-1.png, images/products/Men/3-2.png', 
	N'Nautica Voyage Sport mang đậm dấu ấn của phiên bản gốc 2006. Như thể Nauticađang kêu gọi chúng ta một lần nữa chèo trên con thuyền Gỗ và bắt lấy những con sóng xanh rì. Lấy cảm hứng từ tinh thần thể thao của những chàng trai, Nautica Voyage Sport công bố là một phiên bản mang đậm vẻ đẹp thể thao, năng động.', '2016-10-02',0.3, 1),

    ('MONTALE AOUD LEATHER EDP', 4, 1, '100ml', 49.99, 120, 30, 4, 0, 'images/products/Men/4-1.png, images/products/Men/4-2.png', 
	N'Montale Aoud Leather khai thác nét đẹp của nốt hương Da thuộc, Trầm hương và Nhụy nghệ tây. Nói là các yếu tố mạnh mẽ, nhưng Da thuộc và Trầm hương lại được Montale xử lý rất uyển chuyển trong Aoud Leather, chúng hòa quyện lại với nhau và bổ trợ qua lại một cách thú vị.', '2023-10-02',0.45, 1),

    ('MOSCHINO TOY BOY', 5, 1, '100ml', 59.99, 80, 25, 5, 0, 'images/products/Men/5-1.png, images/products/Men/5-2.png', 
	N'Toy Boy là dòng nước hoa nam của thương hiệu Moschino mới được ra mắt vào năm 2019 và được thiết kế bởi giám đốc sáng tạo Jeremy Scott. Toy Boy diễn giải về một người đàn ông tự tin, năng động, đầy hoài bão và đam mê, nhưng không ngại thể hiện khía cạnh hóm hỉnh và hài hước của bản thân.', '2023-05-02',0.7, 1),
   
  

	
	-- 10 products kids (https://missi.com.vn/danh-muc/nuoc-hoa-niche/)

	('LACOSTE EAU DE LACOSTE L.12.12 BLANC PURE', 1, 3, '50ml', 19.99, 100, 20, 4, 0, 'images/products/Kids/6-1.png, images/products/Kids/6-2.png', 
	N'Nổi tiếng toàn thế giới với dòng áo Polo thể thao đặc trưng, nhà Lacoste đã tham gia một sân chơi lớn hơn khi cho ra mắt dòng nước hoa cho nam đầu tiên, và để tạo nên thành công ấy,không thể không kể đến Lacoste White.', '2023-05-01', 0.0, 1),

    ('KILIAN LOVE DON’T BE SHY EDP', 2, 3, '50ml', 29.99, 50, 10, 5, 0,'images/products/Kids/7-1.png, images/products/Kids/7-2.png', 
	N'Nước hoa có thể bám tốt hay không tốt tùy thuộc vào thời gian, không gian, cơ địa, chế độ sinh hoạt, ăn uống của bạn, việc sử dụng một loại nước hoa trong thời gian dài có thể khiến bạn bị quen mùi, dẫn đến hiện tượng không nhận biết được mùi hương. Mang theo nước hoa bên mình hoặc trang bị những mẫu mini tiện dụng để giúp bản thân luôn tự tin mọi lúc mọi nơi.' , '2023-05-12',0.5, 1),

    ('CALVIN KLEIN CK ONE GOLD', 3, 3, '75ml', 39.99, 75, 15, 4, 0,'images/products/Kids/8-1.png, images/products/Kids/8-2.png',
	N'Nếu ai đó đã từng là fan trung thành với mùi hương của CK one, hẳn sẽ rất vui mừng khi nhà CK ưu ái cho ra đời một phiên bản mới với cái tên CK one Gold. Hiện đại hơn, cá tính hơn, và phủ lên đó thứ cảm xúc bằng Vàng', '2019-09-08', 0.45, 1),

	 ('CALVIN KLEIN CK FREE', 9, 3, '100ml', 59.99, 110, 22, 3, 0 ,'images/products/Kids/9-1.png, images/products/Kids/9-2.png',
	N'Nốt hương đầu tiên là những hương thơm Thảo mộc mát mẻ, hương xanh trong Ngải cứu đem lại một cảm giác khoan khoái, nhẹ nhàng bất tận. Nhưng đó chưa hẳn là mùi hương cốt yếu, cái hay của CK Free là sự hoà quyện độc đáo giữa Da lộn và mùi của Gỗ.' , '2022-02-03',0.5, 1),

    ('LOUIS VUITTON PACIFIC CHILL EDP', 8, 3, '100ml 125ml', 79.99, 150, 35, 3, 0,'images/products/Kids/10-1.png, images/products/Kids/10-2.png',
	N'LOUIS VUITTON PACIFIC CHILL EDP: Như một lựa chọn không thể thiếu với nam giới vào những ngày oi bức, Versace Pour Homme là mùi hương được rất được ưa chuộng cho các anh đang bắt đầu tìm cho mình một mùi hương dễ chịu, dễ gần và đa dụng.' , '2023-07-01',0.7, 1),

	-- 7 gift set products (https://missi.com.vn/danh-muc/gift-set/)
    ('GIFTSET MISSI LOVE SHOT', 1, 5, '100ml', 9.99, 50, 20, 5, 0, 'images/products/Gift/1-1.png, images/products/Gift/1-2.png',
	N'Giftset Missi Love Shot gồm 3 mùi đỉnh nhất hiện nay là Delina Parfum De Marly EDP, Le Labo Another 13, Narciso Pure Musc, chai 2ml có vòi xịt.', '2023-04-12',0, 1),

	('SET YSL Y EDP', 2, 5, '100ml', 19.99, 100, 20, 5, 0, 'images/products/Gift/2-1.png, images/products/Gift/2-2.png',
	N'Set bao gồm: 1 nước hoa fullsize 100ml ,1 chai mini 10ml dạng xịt bỏ túi cực xịn sò', '2023-05-11',0, 1),

	('GIFTSET MISSI ONE MORE', 3, 5, '100ml', 14.99, 90, 15, 5, 0, 'images/products/Gift/3-1.png, images/products/Gift/3-2.png',
	N'Giftset Missi One More gồm 3 mùi hot nhất của nam hiện nay là: Tomford Ombre Leather, Dior Sauvage Elixir, Chanel Bleu EDP, có 3 chai xịt 2ml.', '2022-12-11',0, 1),

	('SET DIOR NỮ 3 CHAI 5ML – JADORE, JOY, MISS DIOR', 4, 5, '3 chai 5ml', 9.99, 50, 22, 5, 0, 'images/products/Gift/4-1.png, images/products/Gift/4-2.png',
	N'Set Dior 3 chai chắn cũng sẽ là sự lựa chọn vô cùng tuyệt vời để làm quà tặng cho bạn bè hay người ấy bởi thiết kế vô cùng sang trọng và nhiều mùi nước hoa để chọn lựa cho đi chơi, đi làm hay đi tiệc đều được.', '2023-06-12',0, 1),

	('SET BVLGARI 3 CHAI 15ML', 5, 5, '5ml', 19.99, 80, 25, 5, 0, 'images/products/Gift/5-1.png, images/products/Gift/5-2.png',
	N'Bộ quà tặng Bvlgari Omnia gồm 3 sản phẩm: Nước hoa Bvlgari Omnia Coral EDT 15ml, Nước hoa Bvlgari Omnia Crystalline EDT 15ml, Nước hoa Bvlgari Omnia Amethyste EDT 15ml', '2023-09-12',0, 1),

	('SET SCANDAL POUR HOMME', 6, 5, '100ml 150ml', 17.99, 70, 30, 5, 0, 'images/products/Gift/6-1.png, images/products/Gift/6-2.png',
	N'Jean Paul Gaultier Scandal Pour Homme EDT thuộc tông mùi hương ngọt đặc trưng của nước hoa dòng thương hiệu Jean Paul Gaultier. Ngay trong lần xịt đầu tiên, bạn sẽ cảm nhận được mùi hương chua nhẹ nhàng tươi mát của cam quýt. Kết hợp cùng mùi hương tựa thảo mộc, nốt hương xanh của xô thơm. Hương thơm hoà vào nhau đánh thức khứu giác của bạn bởi mùi hương vô cùng nịnh mũi. ', '2022-07-12',0, 1)

	;