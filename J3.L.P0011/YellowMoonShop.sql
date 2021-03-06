USE [master]
GO
/****** Object:  Database [YelowMoonShop]    Script Date: 10/18/2020 1:41:02 PM ******/
CREATE DATABASE [YelowMoonShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'YelowMoonShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\YelowMoonShop.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'YelowMoonShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\YelowMoonShop_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [YelowMoonShop] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [YelowMoonShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [YelowMoonShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [YelowMoonShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [YelowMoonShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [YelowMoonShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [YelowMoonShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [YelowMoonShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [YelowMoonShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [YelowMoonShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [YelowMoonShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [YelowMoonShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [YelowMoonShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [YelowMoonShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [YelowMoonShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [YelowMoonShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [YelowMoonShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [YelowMoonShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [YelowMoonShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [YelowMoonShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [YelowMoonShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [YelowMoonShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [YelowMoonShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [YelowMoonShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [YelowMoonShop] SET RECOVERY FULL 
GO
ALTER DATABASE [YelowMoonShop] SET  MULTI_USER 
GO
ALTER DATABASE [YelowMoonShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [YelowMoonShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [YelowMoonShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [YelowMoonShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [YelowMoonShop] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'YelowMoonShop', N'ON'
GO
USE [YelowMoonShop]
GO
/****** Object:  Table [dbo].[Cake]    Script Date: 10/18/2020 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cake](
	[cake_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[image] [varchar](200) NULL,
	[description] [nvarchar](500) NULL,
	[price] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[create_date] [datetime] NOT NULL,
	[expiration_date] [datetime] NOT NULL,
	[category_id] [int] NOT NULL,
	[cake_status] [varchar](20) NOT NULL DEFAULT ('Active'),
PRIMARY KEY CLUSTERED 
(
	[cake_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/18/2020 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderCake]    Script Date: 10/18/2020 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderCake](
	[order_id] [varchar](25) NOT NULL,
	[username] [varchar](200) NOT NULL,
	[full_name] [nvarchar](100) NOT NULL,
	[phone] [varchar](20) NOT NULL,
	[address] [nvarchar](200) NOT NULL,
	[total] [int] NOT NULL,
	[order_date] [datetime] NOT NULL,
	[order_status] [varchar](20) NULL DEFAULT ('Confirmed'),
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 10/18/2020 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[order_id] [varchar](25) NOT NULL,
	[cake_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[cake_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RecordUpdate]    Script Date: 10/18/2020 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecordUpdate](
	[record_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](200) NOT NULL,
	[cake_id] [int] NOT NULL,
	[update_time] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[record_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 10/18/2020 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[role_id] [varchar](10) NOT NULL,
	[role_name] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserInfor]    Script Date: 10/18/2020 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserInfor](
	[username] [varchar](200) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[full_name] [nvarchar](100) NOT NULL,
	[phone] [varchar](15) NULL,
	[address] [nvarchar](200) NULL,
	[role_id] [varchar](10) NOT NULL,
	[user_status] [varchar](20) NOT NULL DEFAULT ('Active'),
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Cake] ON 

INSERT [dbo].[Cake] ([cake_id], [name], [image], [description], [price], [quantity], [create_date], [expiration_date], [category_id], [cake_status]) VALUES (1, N'Banh 1', N'images\banh 1.jpg', N'Banh Ngon', 30000, 16, CAST(N'2020-10-12 16:50:38.817' AS DateTime), CAST(N'2020-10-24 00:00:00.000' AS DateTime), 1, N'Active')
INSERT [dbo].[Cake] ([cake_id], [name], [image], [description], [price], [quantity], [create_date], [expiration_date], [category_id], [cake_status]) VALUES (2, N'Banh 2', N'images\banh 2.jpg', N'Banh rat ngon', 50000, 15, CAST(N'2020-10-12 16:51:15.200' AS DateTime), CAST(N'2020-10-24 00:00:00.000' AS DateTime), 2, N'Active')
INSERT [dbo].[Cake] ([cake_id], [name], [image], [description], [price], [quantity], [create_date], [expiration_date], [category_id], [cake_status]) VALUES (3, N'Banh 3', N'images\banh 3.jpg', N'Banh ngon oi la ngon.', 20000, 19, CAST(N'2020-10-13 09:16:10.557' AS DateTime), CAST(N'2020-10-24 00:00:00.000' AS DateTime), 2, N'Active')
INSERT [dbo].[Cake] ([cake_id], [name], [image], [description], [price], [quantity], [create_date], [expiration_date], [category_id], [cake_status]) VALUES (4, N'Banh 4', N'images\banh 3.jpg', N'Banh ngon hon nguoi yeu cu cua ban', 40000, 28, CAST(N'2020-10-13 09:38:20.113' AS DateTime), CAST(N'2020-10-16 00:00:00.000' AS DateTime), 3, N'Active')
INSERT [dbo].[Cake] ([cake_id], [name], [image], [description], [price], [quantity], [create_date], [expiration_date], [category_id], [cake_status]) VALUES (5, N'Banh 5', N'images\banh 4.jpg', N'Banh nay khong ngon dau', 10000, 18, CAST(N'2020-10-13 09:41:26.433' AS DateTime), CAST(N'2020-10-21 00:00:00.000' AS DateTime), 1, N'Active')
INSERT [dbo].[Cake] ([cake_id], [name], [image], [description], [price], [quantity], [create_date], [expiration_date], [category_id], [cake_status]) VALUES (6, N'Banh 6', N'images\banh 4.jpg', N'Banh nay do et', 30000, 15, CAST(N'2020-10-13 09:55:03.327' AS DateTime), CAST(N'2020-10-20 00:00:00.000' AS DateTime), 3, N'Active')
INSERT [dbo].[Cake] ([cake_id], [name], [image], [description], [price], [quantity], [create_date], [expiration_date], [category_id], [cake_status]) VALUES (7, N'Banh 9', N'images\banh 2.jpg', N'Banh nay ngon lam', 20000, 25, CAST(N'2020-10-17 17:29:03.257' AS DateTime), CAST(N'2020-10-31 00:00:00.000' AS DateTime), 2, N'Active')
SET IDENTITY_INSERT [dbo].[Cake] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (1, N'Bánh Nướng')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (2, N'Bánh Dẻo')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (3, N'Bánh Cao Cấp')
SET IDENTITY_INSERT [dbo].[Category] OFF
INSERT [dbo].[OrderCake] ([order_id], [username], [full_name], [phone], [address], [total], [order_date], [order_status]) VALUES (N'YMS32912651', N'nhanntse140587@fpt.edu.vn', N'Nguyen Thanh Nhan (K14 HCM)', N'0329272250', N'quan 9', 80000, CAST(N'2020-10-18 12:24:06.807' AS DateTime), N'Confirmed')
INSERT [dbo].[OrderCake] ([order_id], [username], [full_name], [phone], [address], [total], [order_date], [order_status]) VALUES (N'YMS43165271', N'guest', N'Nhan', N'0329272267', N'HCM', 30000, CAST(N'2020-10-18 13:19:12.757' AS DateTime), N'Confirmed')
INSERT [dbo].[OrderCake] ([order_id], [username], [full_name], [phone], [address], [total], [order_date], [order_status]) VALUES (N'YMS46133951', N'nhannt1', N'Nguyen Thanh Nhan', N'0329272250', N'quan 9', 90000, CAST(N'2020-10-18 13:39:18.217' AS DateTime), N'Confirmed')
INSERT [dbo].[OrderDetail] ([order_id], [cake_id], [quantity], [price]) VALUES (N'YMS32912651', 1, 1, 30000)
INSERT [dbo].[OrderDetail] ([order_id], [cake_id], [quantity], [price]) VALUES (N'YMS32912651', 2, 1, 50000)
INSERT [dbo].[OrderDetail] ([order_id], [cake_id], [quantity], [price]) VALUES (N'YMS43165271', 3, 1, 20000)
INSERT [dbo].[OrderDetail] ([order_id], [cake_id], [quantity], [price]) VALUES (N'YMS43165271', 5, 1, 10000)
INSERT [dbo].[OrderDetail] ([order_id], [cake_id], [quantity], [price]) VALUES (N'YMS46133951', 1, 1, 30000)
INSERT [dbo].[OrderDetail] ([order_id], [cake_id], [quantity], [price]) VALUES (N'YMS46133951', 2, 1, 50000)
INSERT [dbo].[OrderDetail] ([order_id], [cake_id], [quantity], [price]) VALUES (N'YMS46133951', 5, 1, 10000)
SET IDENTITY_INSERT [dbo].[RecordUpdate] ON 

INSERT [dbo].[RecordUpdate] ([record_id], [username], [cake_id], [update_time]) VALUES (1, N'nhannt', 3, CAST(N'2020-10-18 13:17:43.583' AS DateTime))
SET IDENTITY_INSERT [dbo].[RecordUpdate] OFF
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (N'Ad', N'Admin')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (N'Cus', N'Customer')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (N'Gu', N'Guest')
INSERT [dbo].[UserInfor] ([username], [password], [full_name], [phone], [address], [role_id], [user_status]) VALUES (N'guest', N'123456', N'Guest', NULL, NULL, N'Cus', N'Active')
INSERT [dbo].[UserInfor] ([username], [password], [full_name], [phone], [address], [role_id], [user_status]) VALUES (N'nhannt', N'123456', N'Nguyen Thanh Nhan', N'0329272250', N'quan 9', N'Ad', N'Active')
INSERT [dbo].[UserInfor] ([username], [password], [full_name], [phone], [address], [role_id], [user_status]) VALUES (N'nhannt1', N'123456', N'Nguyen Thanh Nhan', N'0329272250', N'quan 9', N'Cus', N'Active')
INSERT [dbo].[UserInfor] ([username], [password], [full_name], [phone], [address], [role_id], [user_status]) VALUES (N'nhanntse140587@fpt.edu.vn', N'123456', N'Nguyen Thanh Nhan (K14 HCM)', NULL, NULL, N'Cus', N'Active')
ALTER TABLE [dbo].[Cake]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
GO
ALTER TABLE [dbo].[OrderCake]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[UserInfor] ([username])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([cake_id])
REFERENCES [dbo].[Cake] ([cake_id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[OrderCake] ([order_id])
GO
ALTER TABLE [dbo].[RecordUpdate]  WITH CHECK ADD FOREIGN KEY([cake_id])
REFERENCES [dbo].[Cake] ([cake_id])
GO
ALTER TABLE [dbo].[RecordUpdate]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[UserInfor] ([username])
GO
ALTER TABLE [dbo].[UserInfor]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
USE [master]
GO
ALTER DATABASE [YelowMoonShop] SET  READ_WRITE 
GO
