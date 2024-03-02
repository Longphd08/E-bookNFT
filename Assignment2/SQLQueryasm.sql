

CREATE DATABASE [java5]  

GO


USE  [java5] 

GO


CREATE TABLE [dbo].[Roles](

	[id] [varchar](255) NOT NULL,

	[name] [varchar](255) NOT NULL,


PRIMARY KEY CLUSTERED 

(

	[id] ASC

)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Authorities](

	[id] [int] IDENTITY(1,1) NOT NULL primary key,

	[Accountid] int not null,

	[Roleid] [varchar](255) not null,
	foreign key (Accountid) references Account (id),
	foreign key (Roleid) references Roles(id))

-- PRIMARY KEY CLUSTERED 

(

	[id] ASC

)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Account](

	[id] [int] IDENTITY(1,1) NOT NULL,

	[email] [varchar](255) NOT NULL,

	[password] [varchar](20) NOT NULL,

	[fullname] [nvarchar](100) NOT NULL,

	[avatar] [nvarchar](255) NOT NULL,

	[isActive] [bit] NULL,

	[Role] [varchar] not null,

PRIMARY KEY CLUSTERED 

(

	[id] ASC

)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Admin]    Script Date: 10/19/2023 4:05:43 AM ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[Admin](

	[id] [int] IDENTITY(1,1) NOT NULL,

	[username] [varchar](20) NOT NULL,

	[password] [varchar](20) NOT NULL,

	[fullname] [nvarchar](100) NOT NULL,

	[email] [varchar](255) NOT NULL,

	[phone] [varchar](11) NOT NULL,

	[birthday] [date] NOT NULL,

	[identityNumber] [varchar](12) NOT NULL,

	[avatar] [nvarchar](255) NOT NULL,

	[isActive] [bit] NULL,

	[Role] [varchar] not null,

PRIMARY KEY CLUSTERED 

(

	[id] ASC

)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Author]    Script Date: 10/19/2023 4:05:43 AM ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[Author](

	[id] [int] IDENTITY(1,1) NOT NULL,

	[name] [nvarchar](255) NOT NULL,

	[isActive] [bit] NULL,

PRIMARY KEY CLUSTERED 

(

	[id] ASC

)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Book]    Script Date: 10/19/2023 4:05:43 AM ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[Book](

	[id] [int] IDENTITY(1,1) NOT NULL,

	[title] [nvarchar](255) NOT NULL,

	[price] [float] NOT NULL,

	[qty] [int] NOT NULL,

	[introduction] [nvarchar](255) NOT NULL,

	[picturePath] [nvarchar](255) NOT NULL,

	[contentPath] [nvarchar](255) NOT NULL,

	[authorId] [int] NOT NULL,

	[categoryId] [int] NOT NULL,

	[publisherId] [int] NOT NULL,

	[isActive] [bit] NULL,

	[pdfPath] [nvarchar](255) NOT NULL,

PRIMARY KEY CLUSTERED 

(

	[id] ASC

)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[BooksOfAccount]    Script Date: 10/19/2023 4:05:43 AM ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[BooksOfAccount](

	[id] [bigint] IDENTITY(1,1) NOT NULL,

	[accountID] [int] NOT NULL,

	[bookID] [int] NOT NULL,

	[isActive] [bit] NULL,


 CONSTRAINT [PK_BooksOfAccount] PRIMARY KEY CLUSTERED 

(

	[id] ASC

)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Category]    Script Date: 10/19/2023 4:05:43 AM ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[Category](

	[id] [int] IDENTITY(1,1) NOT NULL,

	[name] [nvarchar](255) NOT NULL,

	[isActive] [bit] NULL,

PRIMARY KEY CLUSTERED 

(

	[id] ASC

)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[OrderDetail]    Script Date: 10/19/2023 4:05:43 AM ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[OrderDetail](

	[id] [bigint] IDENTITY(1,1) NOT NULL,

	[orderID] [int] NULL,

	[bookID] [int] NULL,

	[price] [float] NOT NULL,

	[isActive] [bit] NULL,

	[qty] [int] NOT NULL,

 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 

(

	[id] ASC

)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Orders]    Script Date: 10/19/2023 4:05:43 AM ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[Orders](

	[id] [int] IDENTITY(1,1) NOT NULL,

	[orderDate] [date] NOT NULL,

	[phone] [varchar](11) NOT NULL,

	[accountID] [int] NOT NULL,

	[isActive] [bit] NULL,

PRIMARY KEY CLUSTERED 

(

	[id] ASC

)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Publisher]    Script Date: 10/19/2023 4:05:43 AM ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE TABLE [dbo].[Publisher](

	[id] [int] IDENTITY(1,1) NOT NULL,

	[name] [nvarchar](255) NOT NULL,

	[isActive] [bit] NULL,

PRIMARY KEY CLUSTERED 

(

	[id] ASC

)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]

GO

SET IDENTITY_INSERT [dbo].[Account] ON 



INSERT [dbo].[Account] ([id], [email], [password], [fullname], [avatar], [isActive]) VALUES (1, N'ducpqps25526@fpt.edu.vn', N'1234', N'Phan Quý Đức', N'duc.jpg', 1)

INSERT [dbo].[Account] ([id], [email], [password], [fullname], [avatar], [isActive]) VALUES (3, N'nhuptqps25429@fpt.edu.vn', N'123', N'Pham Thị Quỳnh Như', N'nhu.jpg', 1)

INSERT [dbo].[Account] ([id], [email], [password], [fullname], [avatar], [isActive]) VALUES (4, N'longpdps25821@fpt.edu.vn', N'123', N'Phan Đăng Long', N'long.jpg', 1)

INSERT [dbo].[Account] ([id], [email], [password], [fullname], [avatar], [isActive]) VALUES (5, N'phanquiduc@gmail.com', N'123', N'Phan Quý Đức', N'42202483_1082348255257091_5084494173197828096_n.jpg', 1)

INSERT [dbo].[Account] ([id], [email], [password], [fullname], [avatar], [isActive]) VALUES (6, N'phanquiduc102@gmail.com', N'123', N'Phan Quý Đức', N'42202483_1082348255257091_5084494173197828096_n.jpg', 0)

INSERT [dbo].[Account] ([id], [email], [password], [fullname], [avatar], [isActive]) VALUES (7, N'phanquiduc122@gmail.com', N'123', N'Phan Quý Đức', N'42202483_1082348255257091_5084494173197828096_n.jpg', 1)

INSERT [dbo].[Account] ([id], [email], [password], [fullname], [avatar], [isActive]) VALUES (8, N'phanquiduc111@gmail.com', N'123', N'123', N'42202483_1082348255257091_5084494173197828096_n.jpg', 1)

INSERT [dbo].[Account] ([id], [email], [password], [fullname], [avatar], [isActive]) VALUES (9, N'phanquiduc1111@gmail.com', N'123', N'Phan Quý Đức', N'42202483_1082348255257091_5084494173197828096_n.jpg', 1)

INSERT [dbo].[Account] ([id], [email], [password], [fullname], [avatar], [isActive]) VALUES (11, N'phanquiducaa@gmail.com', N'123', N'adada', N'42202483_1082348255257091_5084494173197828096_n.jpg', 1)

INSERT [dbo].[Account] ([id], [email], [password], [fullname], [avatar], [isActive]) VALUES (12, N'phanquiduc111111123213@gmail.com', N'123', N'Phan Quý Đức', N'avatar.jpg', 1)

INSERT [dbo].[Account] ([id], [email], [password], [fullname], [avatar], [isActive]) VALUES (13, N'phanquid123123uc@gmail.com', N'123', N'Phan Quý Đức', N'avatar.jpg', 1)

INSERT [dbo].[Account] ([id], [email], [password], [fullname], [avatar], [isActive]) VALUES (14, N'phanquidu111112c@gmail.com', N'123', N'Phan Quý Đức', N'avatar.jpg', 1)

INSERT [dbo].[Account] ([id], [email], [password], [fullname], [avatar], [isActive]) VALUES (15, N'phanquiduc102123@gmail.com', N'123', N'Phan Quý Đức', N'avatar.jpg', 1)

INSERT [dbo].[Account] ([id], [email], [password], [fullname], [avatar], [isActive]) VALUES (16, N'phanquiduc1021232132@gmail.com', N'123', N'Phan Quý Đức', N'avatar.jpg', 1)

INSERT [dbo].[Account] ([id], [email], [password], [fullname], [avatar], [isActive]) VALUES (17, N'phanquiduc1231321@gmail.com', N'123', N'Phan Quý Đức', N'avatar.jpg', 1)

SET IDENTITY_INSERT [dbo].[Account] OFF

GO

SET IDENTITY_INSERT [dbo].[Admin] ON 



INSERT [dbo].[Admin] ([id], [username], [password], [fullname], [email], [phone], [birthday], [identityNumber], [avatar], [isActive]) VALUES (1, N'admin', N'123', N'Anh Admin', N'bokonldnl@gmail.com', N'01236589475', CAST(N'2003-04-28' AS Date), N'0215565876', N'admin.jpg', 1)

INSERT [dbo].[Admin] ([id], [username], [password], [fullname], [email], [phone], [birthday], [identityNumber], [avatar], [isActive]) VALUES (2, N'phanquiduc', N'123', N'Phan Quý Đức', N'phanquiduc11@gmail.com', N'0703032483', CAST(N'2004-04-07' AS Date), N'002111145658', N'42202483_1082348255257091_5084494173197828096_n.jpg', 1)

INSERT [dbo].[Admin] ([id], [username], [password], [fullname], [email], [phone], [birthday], [identityNumber], [avatar], [isActive]) VALUES (3, N'phanquiduc123', N'123', N'Phan Quý Đức', N'phanquiduc111@gmail.com', N'0703032483', CAST(N'2004-04-07' AS Date), N'002111145653', N'42202483_1082348255257091_5084494173197828096_n.jpg', 1)

INSERT [dbo].[Admin] ([id], [username], [password], [fullname], [email], [phone], [birthday], [identityNumber], [avatar], [isActive]) VALUES (4, N'aaa', N'123', N'Phan Quý Đức', N'phanquidu22c@gmail.com', N'0703032485', CAST(N'2023-10-16' AS Date), N'002555548622', N'516661.jpg', 0)

SET IDENTITY_INSERT [dbo].[Admin] OFF

GO

SET IDENTITY_INSERT [dbo].[Author] ON 



INSERT [dbo].[Author] ([id], [name], [isActive]) VALUES (1, N'Hector Malot', 1)

INSERT [dbo].[Author] ([id], [name], [isActive]) VALUES (2, N'Ernest Hemingway', 1)

INSERT [dbo].[Author] ([id], [name], [isActive]) VALUES (3, N'William Faulkner', 1)

INSERT [dbo].[Author] ([id], [name], [isActive]) VALUES (4, N'Nikolai Ostrovsky', 1)

INSERT [dbo].[Author] ([id], [name], [isActive]) VALUES (5, N'Paulo Coelho', 1)

INSERT [dbo].[Author] ([id], [name], [isActive]) VALUES (6, N'Stephen Hawking', 1)

INSERT [dbo].[Author] ([id], [name], [isActive]) VALUES (7, N'Margaret Munnerlyn Mitchell', 1)

INSERT [dbo].[Author] ([id], [name], [isActive]) VALUES (8, N'Victor Hugo', 1)

INSERT [dbo].[Author] ([id], [name], [isActive]) VALUES (9, N'Michael A. Singer', 1)

INSERT [dbo].[Author] ([id], [name], [isActive]) VALUES (10, N'Jeffrey Long, Paul Perry', 1)

INSERT [dbo].[Author] ([id], [name], [isActive]) VALUES (11, N'Ajahn Chah', 1)

INSERT [dbo].[Author] ([id], [name], [isActive]) VALUES (12, N'Brian L. Weiss', 1)

INSERT [dbo].[Author] ([id], [name], [isActive]) VALUES (13, N'Nguyễn Phong', 1)

INSERT [dbo].[Author] ([id], [name], [isActive]) VALUES (14, N'Satomi Myodo', 1)

INSERT [dbo].[Author] ([id], [name], [isActive]) VALUES (15, N'Baird T. Spalding', 1)

INSERT [dbo].[Author] ([id], [name], [isActive]) VALUES (16, N'Alexandra David Neel', 1)

INSERT [dbo].[Author] ([id], [name], [isActive]) VALUES (17, N'Jack London', 1)

INSERT [dbo].[Author] ([id], [name], [isActive]) VALUES (18, N'Jeffrey Archer', 1)

INSERT [dbo].[Author] ([id], [name], [isActive]) VALUES (19, N'Emily Bronte', 1)

INSERT [dbo].[Author] ([id], [name], [isActive]) VALUES (20, N'Jane Austen', 1)

INSERT [dbo].[Author] ([id], [name], [isActive]) VALUES (21, N'Antoine De Saint-Exup�ry', 1)

INSERT [dbo].[Author] ([id], [name], [isActive]) VALUES (22, N'Tolkien', 1)

INSERT [dbo].[Author] ([id], [name], [isActive]) VALUES (23, N'Jared Diamond', 1)

INSERT [dbo].[Author] ([id], [name], [isActive]) VALUES (24, N'Nguyễn Hiền Lệ', 1)

INSERT [dbo].[Author] ([id], [name], [isActive]) VALUES (25, N'Phan Thanh Gión', 1)

INSERT [dbo].[Author] ([id], [name], [isActive]) VALUES (26, N'John Barrow', 1)

INSERT [dbo].[Author] ([id], [name], [isActive]) VALUES (27, N'Lý Hy', 1)

INSERT [dbo].[Author] ([id], [name], [isActive]) VALUES (28, N'Yuval Noah Harari', 1)

INSERT [dbo].[Author] ([id], [name], [isActive]) VALUES (29, N'Erono Mundasep', 1)

INSERT [dbo].[Author] ([id], [name], [isActive]) VALUES (30, N'Hoàng Quốc Hợi', 1)

INSERT [dbo].[Author] ([id], [name], [isActive]) VALUES (31, N'Yuval Noah Harari', 1)

INSERT [dbo].[Author] ([id], [name], [isActive]) VALUES (32, N'Erono Mundasep', 1)

INSERT [dbo].[Author] ([id], [name], [isActive]) VALUES (33, N'Hoàng Quốc Hợi', 1)

SET IDENTITY_INSERT [dbo].[Author] OFF

GO

SET IDENTITY_INSERT [dbo].[Book] ON 



INSERT [dbo].[Book] ([id], [title], [price], [qty], [introduction], [picturePath], [contentPath], [authorId], [categoryId], [publisherId], [isActive], [pdfPath]) VALUES (2, N'Không Gia Đình', 109000, 20, N'1_Khong_gia_dinh.txt', N'khong-gia-dinh.jpg', N'1-khong-gia-dinh.jpg', 1, 1, 1, 1, N'1-khong-gia-dinh.pdf')

INSERT [dbo].[Book] ([id], [title], [price], [qty], [introduction], [picturePath], [contentPath], [authorId], [categoryId], [publisherId], [isActive], [pdfPath]) VALUES (3, N'Ông Già Và Biển Cả', 119000, 20, N'2-ong-gia-va-bien-ca.txt', N'ong_gia_va_bien_ca.jpg', N'2-ong-gia-va-bien-ca.docx', 2, 1, 2, 1,N'1-khong-gia-dinh.pdf')

INSERT [dbo].[Book] ([id], [title], [price], [qty], [introduction], [picturePath], [contentPath], [authorId], [categoryId], [publisherId], [isActive], [pdfPath]) VALUES (6, N'Âm Thanh Và Cuồng Nộ', 119000, 20, N'3-am-thanh-va-cuong-no.txt', N'am-thanh-va-cuong-no.jpg', N'3-am-thanh-va-cuong-no.docx', 3, 1, 3, 1,N'1-khong-gia-dinh.pdf')

INSERT [dbo].[Book] ([id], [title], [price], [qty], [introduction], [picturePath], [contentPath], [authorId], [categoryId], [publisherId], [isActive], [pdfPath]) VALUES (8, N'Thép Đã Tôi Thế Đấy', 159000, 20, N'4-thep-da-toi-the-day.txt', N'thep-da-toi-the-day.jpg', N'4-thep-da-toi-the-day.docx', 4, 1, 4, 1,N'1-khong-gia-dinh.pdf')

INSERT [dbo].[Book] ([id], [title], [price], [qty], [introduction], [picturePath], [contentPath], [authorId], [categoryId], [publisherId], [isActive], [pdfPath]) VALUES (9, N'Nhà Giả Kim', 179000, 20, N'5-nha-gia-kim.txt', N'nhagiakim_1.jpg', N'5-nha-gia-kim.docx', 5, 1, 5, 1,N'1-khong-gia-dinh.pdf')

INSERT [dbo].[Book] ([id], [title], [price], [qty], [introduction], [picturePath], [contentPath], [authorId], [categoryId], [publisherId], [isActive], [pdfPath]) VALUES (10, N'Lược sử Thời Gian', 299000, 20, N'6-luoc-su-thoi-gian.txt', N'luoc-su-thoi-gian.jpg', N'6-luoc-su-thoi-gian.docx', 6, 1, 6, 1,N'1-khong-gia-dinh.pdf')

INSERT [dbo].[Book] ([id], [title], [price], [qty], [introduction], [picturePath], [contentPath], [authorId], [categoryId], [publisherId], [isActive], [pdfPath]) VALUES (11, N'Cuốn Theo Chiều Gió', 319000, 20, N'7-cuon-theo-chieu-gio.txt', N'cuon-theo-chieu-gio.jpg', N'7-cuon-theo-chieu-gio.docx', 7, 1, 1, 1,N'1-khong-gia-dinh.pdf')

INSERT [dbo].[Book] ([id], [title], [price], [qty], [introduction], [picturePath], [contentPath], [authorId], [categoryId], [publisherId], [isActive], [pdfPath]) VALUES (12, N'Những Người Khốn Khó', 199000, 20, N'8-nhung-nguoi-khon-kho.txt', N'nhung-nguoi-khon-kho.jpg', N'8-nhung-nguoi-khon-kho.docx', 8, 1, 2, 1,N'1-khong-gia-dinh.pdf')

INSERT [dbo].[Book] ([id], [title], [price], [qty], [introduction], [picturePath], [contentPath], [authorId], [categoryId], [publisherId], [isActive], [pdfPath]) VALUES (13, N'Sự Sống Bất Tử', 319000, 20, N'10-su-song-bat-tu.txt', N'su-song-bat-tu.jpg', N'10-su-song-bat-tu.docx', 10, 2, 3, 1,N'1-khong-gia-dinh.pdf')

INSERT [dbo].[Book] ([id], [title], [price], [qty], [introduction], [picturePath], [contentPath], [authorId], [categoryId], [publisherId], [isActive], [pdfPath]) VALUES (14, N'Cởi Trói Linh Hồn', 99000, 20, N'9-coi-troi-linh-hon.txt', N'coi-troi-linh-hon.jpg', N'9-coi-troi-linh-hon.docx', 9, 2, 4, 1,N'1-khong-gia-dinh.pdf')

INSERT [dbo].[Book] ([id], [title], [price], [qty], [introduction], [picturePath], [contentPath], [authorId], [categoryId], [publisherId], [isActive], [pdfPath]) VALUES (15, N'Suối Nguồn Tâm Lnh', 119000, 20, N'11-suoi-nguon-tam-linh.txt', N'suoi-nguon-tam-linh.jpg', N'11-suoi-nguon-tam-linh.docx', 11, 2, 5, 1,N'1-khong-gia-dinh.pdf')

INSERT [dbo].[Book] ([id], [title], [price], [qty], [introduction], [picturePath], [contentPath], [authorId], [categoryId], [publisherId], [isActive], [pdfPath]) VALUES (16, N'Ám ảnh Từ Kiếp Trước', 149000, 20, N'12-am-anh-tu-kiep-truoc.txt', N'am-anh-tu-kiep-truoc.jpg', N'12-am-anh-tu-kiep-truoc.docx', 12, 2, 6, 1,N'1-khong-gia-dinh.pdf')

INSERT [dbo].[Book] ([id], [title], [price], [qty], [introduction], [picturePath], [contentPath], [authorId], [categoryId], [publisherId], [isActive], [pdfPath]) VALUES (17, N'Bên Rạng Tuyết Sơn', 279000, 20, N'13-ben-rang-tuyet-son.txt', N'ben-rang-tuyet-son.jpg', N'13-ben-rang-tuyet-son.docx', 13, 2, 1, 1,N'1-khong-gia-dinh.pdf')

INSERT [dbo].[Book] ([id], [title], [price], [qty], [introduction], [picturePath], [contentPath], [authorId], [categoryId], [publisherId], [isActive], [pdfPath]) VALUES (18, N'Hoa Trôi Trên Sông Nước', 189000, 20, N'14-hoa-troi-tren-song-nuoc.txt', N'hoa-troi-tren-song-nuoc.jpg', N'14-hoa-troi-tren-song-nuoc.docx', 14, 2, 2, 1,N'1-khong-gia-dinh.pdf')

INSERT [dbo].[Book] ([id], [title], [price], [qty], [introduction], [picturePath], [contentPath], [authorId], [categoryId], [publisherId], [isActive], [pdfPath]) VALUES (19, N'Hành Trình Về Phương Đông', 89000, 20, N'15-hanh-trinh-ve-phuong-dong.txt', N'hanh-trinh-ve-phuong-dong.jpg', N'15-hanh-trinh-ve-phuong-dong.docx', 15, 2, 3, 1,N'1-khong-gia-dinh.pdf')

INSERT [dbo].[Book] ([id], [title], [price], [qty], [introduction], [picturePath], [contentPath], [authorId], [categoryId], [publisherId], [isActive], [pdfPath]) VALUES (20, N'Huyết thuật và Các Đạo Sỉ', 319000, 20, N'16-huyen-thuat-va-cac-dao-si.txt', N'huyen-thuat-va-cac-dao-si-Tay_tang.jpg', N'16-huyen-thuat-va-cac-dao-si.docx', 16, 2, 4, 1,N'1-khong-gia-dinh.pdf')

INSERT [dbo].[Book] ([id], [title], [price], [qty], [introduction], [picturePath], [contentPath], [authorId], [categoryId], [publisherId], [isActive], [pdfPath]) VALUES (21, N'Tiếng Gọi Nơi Hoang Dả', 309000, 20, N'17-tieng-goi-noi-hoang-da.txt', N'tieng-goi-noi-hoang-da.jpg', N'17-tieng-goi-noi-hoang-da.docx', 17, 3, 5, 1,N'1-khong-gia-dinh.pdf')

INSERT [dbo].[Book] ([id], [title], [price], [qty], [introduction], [picturePath], [contentPath], [authorId], [categoryId], [publisherId], [isActive], [pdfPath]) VALUES (22, N'Hai Số Phận', 299000, 20, N'18-hai-so-phan.txt', N'hai-so-phan.jpg', N'18-hai-so-phan.docx', 18, 3, 6, 1,N'1-khong-gia-dinh.pdf')

INSERT [dbo].[Book] ([id], [title], [price], [qty], [introduction], [picturePath], [contentPath], [authorId], [categoryId], [publisherId], [isActive], [pdfPath]) VALUES (23, N'Nanh Trang', 289000, 20, N'19-nanh-trang.txt', N'nanh-trang.jpg', N'19-nanh-trang.docx', 17, 3, 1, 1,N'1-khong-gia-dinh.pdf')

INSERT [dbo].[Book] ([id], [title], [price], [qty], [introduction], [picturePath], [contentPath], [authorId], [categoryId], [publisherId], [isActive], [pdfPath]) VALUES (24, N'Đồi Gió Hú', 169000, 20, N'20-doi-gio-hu.txt', N'doi-gio-hu.jpg', N'20-doi-gio-hu.docx', 19, 3, 2, 1,N'1-khong-gia-dinh.pdf')

INSERT [dbo].[Book] ([id], [title], [price], [qty], [introduction], [picturePath], [contentPath], [authorId], [categoryId], [publisherId], [isActive], [pdfPath]) VALUES (25, N'Lý Trí và Tình Cảm', 179000, 20, N'21-ly-tri-va-tinh-cam.txt', N'ly-tri-va-tinh-cam.jpg', N'21-ly-tri-va-tinh-cam.docx', 20, 3, 3, 1,N'1-khong-gia-dinh.pdf')

INSERT [dbo].[Book] ([id], [title], [price], [qty], [introduction], [picturePath], [contentPath], [authorId], [categoryId], [publisherId], [isActive], [pdfPath]) VALUES (26, N'Nhà Thờ Đức Bà Paris', 159000, 20, N'22-nha-tho-duc-ba.txt', N'nha-tho-duc-ba-paris.jpg', N'22-nha-tho-duc-ba.docx', 8, 3, 4, 1,N'1-khong-gia-dinh.pdf')

INSERT [dbo].[Book] ([id], [title], [price], [qty], [introduction], [picturePath], [contentPath], [authorId], [categoryId], [publisherId], [isActive], [pdfPath]) VALUES (27, N'Hoàng Tử Bé', 149000, 20, N'23-hoang-tu-be.txt', N'hoang-tu-be.jpg', N'23-hoang-tu-be.docx', 21, 3, 5, 1,N'1-khong-gia-dinh.pdf')

INSERT [dbo].[Book] ([id], [title], [price], [qty], [introduction], [picturePath], [contentPath], [authorId], [categoryId], [publisherId], [isActive], [pdfPath]) VALUES (28, N'Chúa Tể Của Những Chiếc Nhẫn', 189000, 20, N'24-chua-te-cua-nhung-chiec-nhan.txt', N'chua-te-cua-nhung-chiec-nhan.jpg', N'24-chua-te-cua-nhung-chiec-nhan.docx', 22, 3, 6, 1,N'1-khong-gia-dinh.pdf')

INSERT [dbo].[Book] ([id], [title], [price], [qty], [introduction], [picturePath], [contentPath], [authorId], [categoryId], [publisherId], [isActive], [pdfPath]) VALUES (29, N'Sung vi trung va thep', 89000, 20, N'25-sung-vi-trung.txt', N'sung-vi-trung-va-thep.jpg', N'25-sung-vi-trung.docx', 23, 4, 1, 1,N'1-khong-gia-dinh.pdf')

INSERT [dbo].[Book] ([id], [title], [price], [qty], [introduction], [picturePath], [contentPath], [authorId], [categoryId], [publisherId], [isActive], [pdfPath]) VALUES (30, N'Trăm Năm Nhìn Lại', 99000, 20, N'26-tram-nam-nhin-lai.txt', N'tram-nam-nhin-lai.jpg', N'26-tram-nam-nhin-lai.docx', 24, 4, 2, 1,N'1-khong-gia-dinh.pdf')

INSERT [dbo].[Book] ([id], [title], [price], [qty], [introduction], [picturePath], [contentPath], [authorId], [categoryId], [publisherId], [isActive], [pdfPath]) VALUES (31, N'Lịch Sử Thế Giới', 109000, 20, N'27-lich-su-the-gioi.txt', N'lich-su-the-gioi.jpg', N'27-lich-su-the-gioi.docx', 25, 4, 3, 1,N'1-khong-gia-dinh.pdf')

INSERT [dbo].[Book] ([id], [title], [price], [qty], [introduction], [picturePath], [contentPath], [authorId], [categoryId], [publisherId], [isActive], [pdfPath]) VALUES (32, N'Một Chuyến Du hành', 209000, 20, N'28-mot-chuyen-du-hanh.txt', N'mot-chuyen-du-hanh-Nam-Ha.jpg', N'28-mot-chuyen-du-hanh-den-xu-nam-ha.docx', 26, 4, 4, 1,N'1-khong-gia-dinh.pdf')

INSERT [dbo].[Book] ([id], [title], [price], [qty], [introduction], [picturePath], [contentPath], [authorId], [categoryId], [publisherId], [isActive], [pdfPath]) VALUES (33, N'Đại Việt Sử Ký', 219000, 20, N'29-dai-viet-su-ky.txt', N'dai-viet-su-ki-toan-thu.jpg', N'29-dai-viet-su-ky.docx', 27, 4, 5, 1,N'1-khong-gia-dinh.pdf')

INSERT [dbo].[Book] ([id], [title], [price], [qty], [introduction], [picturePath], [contentPath], [authorId], [categoryId], [publisherId], [isActive], [pdfPath]) VALUES (34, N'Lược Sử Về Loài Người', 229000, 20, N'30-luoc-su-ve-loai-nguoi.txt', N'luoc-su-ve-loai-nguoi.jpg', N'30-luoc-su-ve-loai-nguoi.docx', 28, 4, 6, 1,N'1-khong-gia-dinh.pdf')

INSERT [dbo].[Book] ([id], [title], [price], [qty], [introduction], [picturePath], [contentPath], [authorId], [categoryId], [publisherId], [isActive], [pdfPath]) VALUES (35, N'Hoàng Kim Bản Harachi', 249000, 20, N'31-hoang-kim-ban-harari.txt', N'hoang-kim-ban.jpg', N'31-hoang-kim-ban-harachi.docx', 29, 4, 1, 1,N'1-khong-gia-dinh.pdf')

INSERT [dbo].[Book] ([id], [title], [price], [qty], [introduction], [picturePath], [contentPath], [authorId], [categoryId], [publisherId], [isActive], [pdfPath]) VALUES (36, N'Baot Táp Triều Trần', 279000, 20, N'32-bao-tap-trieu-tran.txt', N'bao-tap-trieu-tran-bao-tap-cung-dinh.jpg', N'32-bao-tap-trieu-tran.docx', 30, 4, 2, 1,N'1-khong-gia-dinh.pdf')

INSERT [dbo].[Book] ([id], [title], [price], [qty], [introduction], [picturePath], [contentPath], [authorId], [categoryId], [publisherId], [isActive], [pdfPath]) VALUES (37, N'DeMO', 199999, 3, N'demo.txt', N'42202483_1082348255257091_5084494173197828096_n.jpg', N'1001.docx', 19, 1, 1, 0,N'1-khong-gia-dinh.pdf')

INSERT [dbo].[Book] ([id], [title], [price], [qty], [introduction], [picturePath], [contentPath], [authorId], [categoryId], [publisherId], [isActive], [pdfPath]) VALUES (38, N'Giải Trình Thuật Toán', 279000, 20, N'33-giai-trinh-thuat-toan.txt', N'giai-trinh-thuat-toan.jpg', N'33-giai-trinh-thuat-toan.docx', 31, 4, 2, 1,N'33-giai-trinh-thuat-toan.pdf')

INSERT [dbo].[Book] ([id], [title], [price], [qty], [introduction], [picturePath], [contentPath], [authorId], [categoryId], [publisherId], [isActive], [pdfPath]) VALUES (39, N'Công Nghệ BlockChain', 279000, 20, N'34-cong-nghe-blockchain.txt', N'cong-nghe-blockchain.jpg', N'34-cong-nghe-blockchain.docx', 32, 4, 2, 1,N'34-cong-nghe-blockchain.pdf')

INSERT [dbo].[Book] ([id], [title], [price], [qty], [introduction], [picturePath], [contentPath], [authorId], [categoryId], [publisherId], [isActive], [pdfPath]) VALUES (40, N'Beginnning programming with Java for Dummies', 279000, 20, N'35-Beginning-Programming-with-Java-For-Dummies.txt', N'Beginning-Programming-with-Java-For-Dummies.jpg', N'35-Beginning-Programming-with-Java-For-Dummies.docx', 33, 4, 2, 1,N'35-Beginning-Programming-with-Java-For-Dummies.pdf')

SET IDENTITY_INSERT [dbo].[Book] OFF

GO

SET IDENTITY_INSERT [dbo].[BooksOfAccount] ON 



INSERT [dbo].[BooksOfAccount] ([id], [accountID], [bookID], [isActive]) VALUES (1, 3, 2, 1)

INSERT [dbo].[BooksOfAccount] ([id], [accountID], [bookID], [isActive]) VALUES (2, 3, 13, 1)

INSERT [dbo].[BooksOfAccount] ([id], [accountID], [bookID], [isActive]) VALUES (4, 3, 21, 1)

INSERT [dbo].[BooksOfAccount] ([id], [accountID], [bookID], [isActive]) VALUES (5, 3, 29, 1)

INSERT [dbo].[BooksOfAccount] ([id], [accountID], [bookID], [isActive]) VALUES (6, 4, 12, 1)

INSERT [dbo].[BooksOfAccount] ([id], [accountID], [bookID], [isActive]) VALUES (7, 4, 20, 1)

INSERT [dbo].[BooksOfAccount] ([id], [accountID], [bookID], [isActive]) VALUES (8, 4, 28, 1)

INSERT [dbo].[BooksOfAccount] ([id], [accountID], [bookID], [isActive]) VALUES (9, 4, 36, 1)

INSERT [dbo].[BooksOfAccount] ([id], [accountID], [bookID], [isActive]) VALUES (10, 4, 38, 1)

INSERT [dbo].[BooksOfAccount] ([id], [accountID], [bookID], [isActive]) VALUES (11, 4, 39, 1)

INSERT [dbo].[BooksOfAccount] ([id], [accountID], [bookID], [isActive]) VALUES (12, 4, 40, 1)

SET IDENTITY_INSERT [dbo].[BooksOfAccount] OFF

GO

SET IDENTITY_INSERT [dbo].[Category] ON 



INSERT [dbo].[Category] ([id], [name], [isActive]) VALUES (1, N'tiểu Thuyết', 1)

INSERT [dbo].[Category] ([id], [name], [isActive]) VALUES (2, N'Tâm Linh, Tôn Giáo', 1)

INSERT [dbo].[Category] ([id], [name], [isActive]) VALUES (3, N'Văn Học-Nghệ Thuật', 1)

INSERT [dbo].[Category] ([id], [name], [isActive]) VALUES (4, N'Văn Học-Xã Hội-Lịch Sử', 1)

SET IDENTITY_INSERT [dbo].[Category] OFF

GO

SET IDENTITY_INSERT [dbo].[OrderDetail] ON 



INSERT [dbo].[OrderDetail] ([id], [orderID], [bookID], [price], [isActive], [qty]) VALUES (1, 1, 12, 199000, 1, 1)

INSERT [dbo].[OrderDetail] ([id], [orderID], [bookID], [price], [isActive], [qty]) VALUES (3, 1, 20, 319000, 1, 1)

INSERT [dbo].[OrderDetail] ([id], [orderID], [bookID], [price], [isActive], [qty]) VALUES (4, 1, 28, 189000, 1, 1)

INSERT [dbo].[OrderDetail] ([id], [orderID], [bookID], [price], [isActive], [qty]) VALUES (5, 1, 36, 279000, 1, 1)

INSERT [dbo].[OrderDetail] ([id], [orderID], [bookID], [price], [isActive], [qty]) VALUES (7, 4, 2, 109000, 1, 1)

INSERT [dbo].[OrderDetail] ([id], [orderID], [bookID], [price], [isActive], [qty]) VALUES (8, 4, 13, 319000, 1, 1)

INSERT [dbo].[OrderDetail] ([id], [orderID], [bookID], [price], [isActive], [qty]) VALUES (9, 4, 21, 309000, 1, 1)

INSERT [dbo].[OrderDetail] ([id], [orderID], [bookID], [price], [isActive], [qty]) VALUES (10, 4, 29, 89000, 1, 1)

INSERT [dbo].[OrderDetail] ([id], [orderID], [bookID], [price], [isActive], [qty]) VALUES (11, 5, 2, 109000, 1, 1)

INSERT [dbo].[OrderDetail] ([id], [orderID], [bookID], [price], [isActive], [qty]) VALUES (12, 5, 9, 179000, 1, 1)

SET IDENTITY_INSERT [dbo].[OrderDetail] OFF

GO

SET IDENTITY_INSERT [dbo].[Orders] ON 



INSERT [dbo].[Orders] ([id], [orderDate], [phone], [accountID], [isActive]) VALUES (1, CAST(N'2023-10-12' AS Date), N'0213546879', 4, 1)

INSERT [dbo].[Orders] ([id], [orderDate], [phone], [accountID], [isActive]) VALUES (4, CAST(N'2023-10-12' AS Date), N'0325486579', 3, 1)

INSERT [dbo].[Orders] ([id], [orderDate], [phone], [accountID], [isActive]) VALUES (5, CAST(N'2023-10-19' AS Date), N'0703032483', 1, 1)

SET IDENTITY_INSERT [dbo].[Orders] OFF

GO

SET IDENTITY_INSERT [dbo].[Publisher] ON 



INSERT [dbo].[Publisher] ([id], [name], [isActive]) VALUES (1, N'Hội Nhà văn', 1)

INSERT [dbo].[Publisher] ([id], [name], [isActive]) VALUES (2, N'Kim Đồng', 1)

INSERT [dbo].[Publisher] ([id], [name], [isActive]) VALUES (3, N'Phù Đổng', 1)

INSERT [dbo].[Publisher] ([id], [name], [isActive]) VALUES (4, N'Skybook', 1)

INSERT [dbo].[Publisher] ([id], [name], [isActive]) VALUES (5, N'Giáo Dục', 1)

INSERT [dbo].[Publisher] ([id], [name], [isActive]) VALUES (6, N'Truyện', 1)

SET IDENTITY_INSERT [dbo].[Publisher] OFF

GO

SET ANSI_PADDING ON

GO

/****** Object:  Index [UQ__Account__AB6E6164A91197DD]    Script Date: 10/19/2023 4:06:00 AM ******/

ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 

(

	[email] ASC

)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

GO

SET ANSI_PADDING ON

GO

/****** Object:  Index [UQ__Admin__11A6906A6AFD41C0]    Script Date: 10/19/2023 4:06:00 AM ******/

ALTER TABLE [dbo].[Admin] ADD UNIQUE NONCLUSTERED 

(

	[identityNumber] ASC

)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

GO

SET ANSI_PADDING ON

GO

/****** Object:  Index [UQ__Admin__AB6E61647DABC231]    Script Date: 10/19/2023 4:06:00 AM ******/

ALTER TABLE [dbo].[Admin] ADD UNIQUE NONCLUSTERED 

(

	[email] ASC

)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

GO

SET ANSI_PADDING ON

GO

/****** Object:  Index [UQ__Admin__F3DBC572DC4740B0]    Script Date: 10/19/2023 4:06:00 AM ******/

ALTER TABLE [dbo].[Admin] ADD UNIQUE NONCLUSTERED 

(

	[username] ASC

)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_isActive]  DEFAULT ((1)) FOR [isActive]

GO

ALTER TABLE [dbo].[Admin] ADD  CONSTRAINT [DF_Admin_isActive]  DEFAULT ((1)) FOR [isActive]

GO

ALTER TABLE [dbo].[Author] ADD  CONSTRAINT [DF_Author_isActive]  DEFAULT ((1)) FOR [isActive]

GO

ALTER TABLE [dbo].[Book] ADD  CONSTRAINT [DF_Book_isActive]  DEFAULT ((1)) FOR [isActive]

GO

ALTER TABLE [dbo].[BooksOfAccount] ADD  CONSTRAINT [DF_BooksOfAccount_isActive]  DEFAULT ((1)) FOR [isActive]

GO

ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_isActive]  DEFAULT ((1)) FOR [isActive]

GO

ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_isActive]  DEFAULT ((1)) FOR [isActive]

GO

ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_qty]  DEFAULT ((1)) FOR [qty]

GO

ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [orderDate]

GO

ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_isActive]  DEFAULT ((1)) FOR [isActive]

GO

ALTER TABLE [dbo].[Publisher] ADD  CONSTRAINT [DF_Publisher_isActive]  DEFAULT ((1)) FOR [isActive]

GO

ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [fk_authorId_book] FOREIGN KEY([authorId])

REFERENCES [dbo].[Author] ([id])

GO

ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [fk_authorId_book]

GO

ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [fk_categoryId_book] FOREIGN KEY([categoryId])

REFERENCES [dbo].[Category] ([id])

GO

ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [fk_categoryId_book]

GO

ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [fk_publisherId_book] FOREIGN KEY([publisherId])

REFERENCES [dbo].[Publisher] ([id])

GO

ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [fk_publisherId_book]

GO

ALTER TABLE [dbo].[BooksOfAccount]  WITH CHECK ADD  CONSTRAINT [FK_BooksOfAccount_Account] FOREIGN KEY([accountID])

REFERENCES [dbo].[Account] ([id])

GO

ALTER TABLE [dbo].[BooksOfAccount] CHECK CONSTRAINT [FK_BooksOfAccount_Account]

GO

ALTER TABLE [dbo].[BooksOfAccount]  WITH CHECK ADD  CONSTRAINT [FK_BooksOfAccount_Book] FOREIGN KEY([bookID])

REFERENCES [dbo].[Book] ([id])

GO

ALTER TABLE [dbo].[BooksOfAccount] CHECK CONSTRAINT [FK_BooksOfAccount_Book]

GO

ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Book] FOREIGN KEY([bookID])

REFERENCES [dbo].[Book] ([id])

GO

ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Book]

GO

ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Orders] FOREIGN KEY([orderID])

REFERENCES [dbo].[Orders] ([id])

GO

ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Orders]

GO

ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Account] FOREIGN KEY([accountID])

REFERENCES [dbo].[Account] ([id])

GO

ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Account]

GO

/****** Object:  StoredProcedure [dbo].[CalculateOrderTotal]    Script Date: 10/19/2023 4:06:00 AM ******/

SET ANSI_NULLS ON

GO

SET QUOTED_IDENTIFIER ON

GO

CREATE PROCEDURE [dbo].[CalculateOrderTotal]  

@orderId INT

AS

BEGIN

  DECLARE @total DECIMAL(10,2)



  SELECT @total = SUM(price * qty) 

  FROM [dbo].[Orders] o

  join [dbo].[OrderDetail] od

  on o.id = od.id;



  SELECT @total

END

GO

ALTER DATABASE [java5] SET  READ_WRITE 

GO

