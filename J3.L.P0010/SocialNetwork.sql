USE [master]
GO
/****** Object:  Database [SocialNetwork]    Script Date: 9/30/2020 2:40:39 PM ******/
CREATE DATABASE [SocialNetwork]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SocialNetwork', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SocialNetwork.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SocialNetwork_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SocialNetwork_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SocialNetwork] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SocialNetwork].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SocialNetwork] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SocialNetwork] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SocialNetwork] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SocialNetwork] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SocialNetwork] SET ARITHABORT OFF 
GO
ALTER DATABASE [SocialNetwork] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SocialNetwork] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SocialNetwork] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SocialNetwork] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SocialNetwork] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SocialNetwork] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SocialNetwork] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SocialNetwork] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SocialNetwork] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SocialNetwork] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SocialNetwork] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SocialNetwork] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SocialNetwork] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SocialNetwork] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SocialNetwork] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SocialNetwork] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SocialNetwork] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SocialNetwork] SET RECOVERY FULL 
GO
ALTER DATABASE [SocialNetwork] SET  MULTI_USER 
GO
ALTER DATABASE [SocialNetwork] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SocialNetwork] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SocialNetwork] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SocialNetwork] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SocialNetwork] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SocialNetwork', N'ON'
GO
USE [SocialNetwork]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 9/30/2020 2:40:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comment](
	[comment_id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](100) NULL,
	[post_id] [int] NULL,
	[content] [nvarchar](200) NOT NULL,
	[comment_status] [varchar](10) NULL DEFAULT ('Active'),
	[date_created] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Emotion]    Script Date: 9/30/2020 2:40:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Emotion](
	[email] [varchar](100) NOT NULL,
	[post_id] [int] NOT NULL,
	[isLike] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[email] ASC,
	[post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 9/30/2020 2:40:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Notification](
	[notification_id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](100) NULL,
	[post_id] [int] NULL,
	[date_created] [datetime] NOT NULL,
	[type] [varchar](20) NOT NULL,
	[isNew] [bit] NULL DEFAULT ((1)),
	[comment_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[notification_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Post]    Script Date: 9/30/2020 2:40:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Post](
	[post_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](200) NOT NULL,
	[content] [nvarchar](2000) NOT NULL,
	[image] [varchar](200) NULL,
	[date_created] [datetime] NOT NULL,
	[date_updated] [datetime] NULL,
	[post_status] [varchar](10) NULL DEFAULT ('Active'),
	[email] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserInfor]    Script Date: 9/30/2020 2:40:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserInfor](
	[email] [varchar](100) NOT NULL,
	[password] [varchar](200) NOT NULL,
	[full_name] [nvarchar](100) NOT NULL,
	[user_role] [varchar](20) NULL DEFAULT ('Member'),
	[user_status] [varchar](20) NULL DEFAULT ('New'),
PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([comment_id], [email], [post_id], [content], [comment_status], [date_created]) VALUES (2, N'nhannt@gmail.com', 1, N'a', N'Active', CAST(N'2020-09-26 19:30:00.550' AS DateTime))
INSERT [dbo].[Comment] ([comment_id], [email], [post_id], [content], [comment_status], [date_created]) VALUES (3, N'nhannt@gmail.com', 1, N'b', N'Active', CAST(N'2020-09-26 19:32:11.067' AS DateTime))
INSERT [dbo].[Comment] ([comment_id], [email], [post_id], [content], [comment_status], [date_created]) VALUES (4, N'nhannt@gmail.com', 1, N'anh yeu em', N'Active', CAST(N'2020-09-26 19:32:29.940' AS DateTime))
INSERT [dbo].[Comment] ([comment_id], [email], [post_id], [content], [comment_status], [date_created]) VALUES (5, N'nhannt@gmail.com', 3, N'a', N'Deleted', CAST(N'2020-09-27 15:18:15.703' AS DateTime))
INSERT [dbo].[Comment] ([comment_id], [email], [post_id], [content], [comment_status], [date_created]) VALUES (6, N'nhannt@gmail.com', 3, N'b', N'Deleted', CAST(N'2020-09-27 15:18:18.277' AS DateTime))
INSERT [dbo].[Comment] ([comment_id], [email], [post_id], [content], [comment_status], [date_created]) VALUES (7, N'nhannt@gmail.com', 3, N'a', N'Active', CAST(N'2020-09-27 15:26:06.743' AS DateTime))
INSERT [dbo].[Comment] ([comment_id], [email], [post_id], [content], [comment_status], [date_created]) VALUES (8, N'nhannt@gmail.com', 6, N'test notify', N'Active', CAST(N'2020-09-28 10:25:39.843' AS DateTime))
INSERT [dbo].[Comment] ([comment_id], [email], [post_id], [content], [comment_status], [date_created]) VALUES (9, N'nhannt@gmail.com', 10, N'a', N'Deleted', CAST(N'2020-09-28 13:47:08.133' AS DateTime))
INSERT [dbo].[Comment] ([comment_id], [email], [post_id], [content], [comment_status], [date_created]) VALUES (10, N'nhannt1@gmail.com', 9, N'a', N'Active', CAST(N'2020-09-28 23:40:43.643' AS DateTime))
INSERT [dbo].[Comment] ([comment_id], [email], [post_id], [content], [comment_status], [date_created]) VALUES (11, N'nhannt1@gmail.com', 10, N'a', N'Active', CAST(N'2020-09-28 23:47:18.753' AS DateTime))
INSERT [dbo].[Comment] ([comment_id], [email], [post_id], [content], [comment_status], [date_created]) VALUES (12, N'nhannt1@gmail.com', 10, N'test', N'Active', CAST(N'2020-09-29 00:00:07.387' AS DateTime))
INSERT [dbo].[Comment] ([comment_id], [email], [post_id], [content], [comment_status], [date_created]) VALUES (13, N'nhannt1@gmail.com', 10, N'a', N'Active', CAST(N'2020-09-29 00:00:13.713' AS DateTime))
INSERT [dbo].[Comment] ([comment_id], [email], [post_id], [content], [comment_status], [date_created]) VALUES (14, N'nhannt@gmail.com', 10, N'test comment', N'Active', CAST(N'2020-09-30 01:22:04.587' AS DateTime))
SET IDENTITY_INSERT [dbo].[Comment] OFF
INSERT [dbo].[Emotion] ([email], [post_id], [isLike]) VALUES (N'nhannt@gmail.com', 1, 0)
INSERT [dbo].[Emotion] ([email], [post_id], [isLike]) VALUES (N'nhannt@gmail.com', 3, 0)
INSERT [dbo].[Emotion] ([email], [post_id], [isLike]) VALUES (N'nhannt@gmail.com', 4, 1)
INSERT [dbo].[Emotion] ([email], [post_id], [isLike]) VALUES (N'nhannt@gmail.com', 6, 0)
INSERT [dbo].[Emotion] ([email], [post_id], [isLike]) VALUES (N'nhannt@gmail.com', 10, 0)
INSERT [dbo].[Emotion] ([email], [post_id], [isLike]) VALUES (N'nhannt1@gmail.com', 9, 1)
INSERT [dbo].[Emotion] ([email], [post_id], [isLike]) VALUES (N'nhannt1@gmail.com', 10, 1)
SET IDENTITY_INSERT [dbo].[Notification] ON 

INSERT [dbo].[Notification] ([notification_id], [email], [post_id], [date_created], [type], [isNew], [comment_id]) VALUES (1, N'nhannt1@gmail.com', 9, CAST(N'2020-09-28 23:40:41.010' AS DateTime), N'Like', 0, NULL)
INSERT [dbo].[Notification] ([notification_id], [email], [post_id], [date_created], [type], [isNew], [comment_id]) VALUES (2, N'nhannt1@gmail.com', 10, CAST(N'2020-09-29 00:00:07.397' AS DateTime), N'Comment', 0, 12)
INSERT [dbo].[Notification] ([notification_id], [email], [post_id], [date_created], [type], [isNew], [comment_id]) VALUES (3, N'nhannt1@gmail.com', 10, CAST(N'2020-09-29 00:00:13.717' AS DateTime), N'Comment', 0, 13)
INSERT [dbo].[Notification] ([notification_id], [email], [post_id], [date_created], [type], [isNew], [comment_id]) VALUES (6, N'nhannt@gmail.com', 4, CAST(N'2020-09-29 09:09:01.837' AS DateTime), N'Dislike', 1, NULL)
INSERT [dbo].[Notification] ([notification_id], [email], [post_id], [date_created], [type], [isNew], [comment_id]) VALUES (7, N'nhannt@gmail.com', 4, CAST(N'2020-09-29 09:09:04.277' AS DateTime), N'Like', 1, NULL)
INSERT [dbo].[Notification] ([notification_id], [email], [post_id], [date_created], [type], [isNew], [comment_id]) VALUES (8, N'nhannt1@gmail.com', 10, CAST(N'2020-09-30 01:14:17.823' AS DateTime), N'Like', 0, NULL)
INSERT [dbo].[Notification] ([notification_id], [email], [post_id], [date_created], [type], [isNew], [comment_id]) VALUES (9, N'nhannt@gmail.com', 10, CAST(N'2020-09-30 01:22:04.600' AS DateTime), N'Comment', 1, 14)
SET IDENTITY_INSERT [dbo].[Notification] OFF
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([post_id], [title], [content], [image], [date_created], [date_updated], [post_status], [email]) VALUES (1, N'a', N'abc', N'', CAST(N'2020-09-24 12:41:50.617' AS DateTime), NULL, N'Deleted', N'nhannt@gmail.com')
INSERT [dbo].[Post] ([post_id], [title], [content], [image], [date_created], [date_updated], [post_status], [email]) VALUES (2, N'b', N'abcd', N'', CAST(N'2020-09-24 12:47:26.770' AS DateTime), NULL, N'Deleted', N'nhannt@gmail.com')
INSERT [dbo].[Post] ([post_id], [title], [content], [image], [date_created], [date_updated], [post_status], [email]) VALUES (3, N'Nhannnnnnn', N'anh ansh hsj nnahs nhaks', N'', CAST(N'2020-09-25 12:56:50.543' AS DateTime), NULL, N'Active', N'nhannt@gmail.com')
INSERT [dbo].[Post] ([post_id], [title], [content], [image], [date_created], [date_updated], [post_status], [email]) VALUES (4, N'hinh anh', N'hinh anh', N'', CAST(N'2020-09-25 12:59:21.620' AS DateTime), NULL, N'Active', N'nhannt@gmail.com')
INSERT [dbo].[Post] ([post_id], [title], [content], [image], [date_created], [date_updated], [post_status], [email]) VALUES (5, N'test post', N'anh', N'', CAST(N'2020-09-27 20:28:02.363' AS DateTime), NULL, N'Active', N'nhannt@gmail.com')
INSERT [dbo].[Post] ([post_id], [title], [content], [image], [date_created], [date_updated], [post_status], [email]) VALUES (6, N'', N'a', N'', CAST(N'2020-09-27 20:28:37.030' AS DateTime), NULL, N'Active', N'nhannt@gmail.com')
INSERT [dbo].[Post] ([post_id], [title], [content], [image], [date_created], [date_updated], [post_status], [email]) VALUES (7, N'', N'anhann
bs
c', N'', CAST(N'2020-09-27 20:33:56.783' AS DateTime), NULL, N'Active', N'nhannt@gmail.com')
INSERT [dbo].[Post] ([post_id], [title], [content], [image], [date_created], [date_updated], [post_status], [email]) VALUES (8, N'a', N'b', N'', CAST(N'2020-09-27 21:18:32.647' AS DateTime), NULL, N'Active', N'nhannt@gmail.com')
INSERT [dbo].[Post] ([post_id], [title], [content], [image], [date_created], [date_updated], [post_status], [email]) VALUES (9, N'test post page', N'test content
', N'', CAST(N'2020-09-27 21:22:09.817' AS DateTime), NULL, N'Active', N'nhannt@gmail.com')
INSERT [dbo].[Post] ([post_id], [title], [content], [image], [date_created], [date_updated], [post_status], [email]) VALUES (10, N'test Image', N'Test image', N'', CAST(N'2020-09-28 11:29:32.767' AS DateTime), NULL, N'Active', N'nhannt@gmail.com')
INSERT [dbo].[Post] ([post_id], [title], [content], [image], [date_created], [date_updated], [post_status], [email]) VALUES (11, N'test ', N'Test Image', N'https://www.google.com/imgres?imgurl=https%3A%2F%2Fhoanghamobile.com%2Ftin-tuc%2Fwp-content%2Fupload', CAST(N'2020-09-29 00:27:23.433' AS DateTime), NULL, N'Active', N'nhannt1@gmail.com')
INSERT [dbo].[Post] ([post_id], [title], [content], [image], [date_created], [date_updated], [post_status], [email]) VALUES (12, N'Test image1', N'Test image 1', N'', CAST(N'2020-09-29 00:32:27.953' AS DateTime), NULL, N'Active', N'nhannt1@gmail.com')
INSERT [dbo].[Post] ([post_id], [title], [content], [image], [date_created], [date_updated], [post_status], [email]) VALUES (13, N'test iamge 2', N'test image 2', N'https://banner2.cleanpng.com/20180704/xxa/kisspng-jerry-mouse-tom-cat-tom-and-jerry-cartoon-clip-art-tom-cartoon-5b3cdb5f7e1601.4644385715307149755165.jpg', CAST(N'2020-09-29 00:39:05.480' AS DateTime), NULL, N'Active', N'nhannt1@gmail.com')
INSERT [dbo].[Post] ([post_id], [title], [content], [image], [date_created], [date_updated], [post_status], [email]) VALUES (14, N'test image 3', N'test image short cut link', N'http://gg.gg/mf17v', CAST(N'2020-09-29 00:40:30.783' AS DateTime), NULL, N'Active', N'nhannt1@gmail.com')
INSERT [dbo].[Post] ([post_id], [title], [content], [image], [date_created], [date_updated], [post_status], [email]) VALUES (15, N'test 1', N'test 1', N'', CAST(N'2020-09-29 00:44:01.403' AS DateTime), NULL, N'Active', N'nhannt1@gmail.com')
INSERT [dbo].[Post] ([post_id], [title], [content], [image], [date_created], [date_updated], [post_status], [email]) VALUES (16, N'test 2', N'test 2', N'', CAST(N'2020-09-29 00:44:09.480' AS DateTime), NULL, N'Active', N'nhannt1@gmail.com')
INSERT [dbo].[Post] ([post_id], [title], [content], [image], [date_created], [date_updated], [post_status], [email]) VALUES (17, N'test 3', N'test 3', N'', CAST(N'2020-09-29 00:44:20.673' AS DateTime), NULL, N'Active', N'nhannt1@gmail.com')
INSERT [dbo].[Post] ([post_id], [title], [content], [image], [date_created], [date_updated], [post_status], [email]) VALUES (18, N'test 4', N'test 4', N'', CAST(N'2020-09-29 00:44:29.613' AS DateTime), NULL, N'Active', N'nhannt1@gmail.com')
INSERT [dbo].[Post] ([post_id], [title], [content], [image], [date_created], [date_updated], [post_status], [email]) VALUES (19, N'test 5', N'test 5', N'', CAST(N'2020-09-29 00:44:36.797' AS DateTime), NULL, N'Active', N'nhannt1@gmail.com')
INSERT [dbo].[Post] ([post_id], [title], [content], [image], [date_created], [date_updated], [post_status], [email]) VALUES (20, N'test 6', N'test 6', N'', CAST(N'2020-09-29 00:44:44.883' AS DateTime), NULL, N'Active', N'nhannt1@gmail.com')
INSERT [dbo].[Post] ([post_id], [title], [content], [image], [date_created], [date_updated], [post_status], [email]) VALUES (21, N'test 7', N'test 7', N'', CAST(N'2020-09-29 00:44:53.263' AS DateTime), NULL, N'Active', N'nhannt1@gmail.com')
INSERT [dbo].[Post] ([post_id], [title], [content], [image], [date_created], [date_updated], [post_status], [email]) VALUES (22, N'test 8', N'test 8', N'', CAST(N'2020-09-29 00:45:10.337' AS DateTime), NULL, N'Active', N'nhannt1@gmail.com')
INSERT [dbo].[Post] ([post_id], [title], [content], [image], [date_created], [date_updated], [post_status], [email]) VALUES (23, N'test 9', N'test 9', N'', CAST(N'2020-09-29 00:45:17.087' AS DateTime), NULL, N'Active', N'nhannt1@gmail.com')
INSERT [dbo].[Post] ([post_id], [title], [content], [image], [date_created], [date_updated], [post_status], [email]) VALUES (24, N'test 10', N'test 10', N'', CAST(N'2020-09-29 00:45:24.487' AS DateTime), NULL, N'Active', N'nhannt1@gmail.com')
INSERT [dbo].[Post] ([post_id], [title], [content], [image], [date_created], [date_updated], [post_status], [email]) VALUES (25, N'test 11', N'test 11', N'', CAST(N'2020-09-29 00:45:31.943' AS DateTime), NULL, N'Active', N'nhannt1@gmail.com')
INSERT [dbo].[Post] ([post_id], [title], [content], [image], [date_created], [date_updated], [post_status], [email]) VALUES (26, N'test 12', N'test 12', N'', CAST(N'2020-09-29 00:45:39.320' AS DateTime), NULL, N'Active', N'nhannt1@gmail.com')
INSERT [dbo].[Post] ([post_id], [title], [content], [image], [date_created], [date_updated], [post_status], [email]) VALUES (27, N'test 13', N'test 13', N'', CAST(N'2020-09-29 00:45:49.290' AS DateTime), NULL, N'Active', N'nhannt1@gmail.com')
INSERT [dbo].[Post] ([post_id], [title], [content], [image], [date_created], [date_updated], [post_status], [email]) VALUES (28, N'test 14', N'test 14', N'', CAST(N'2020-09-29 00:46:00.503' AS DateTime), NULL, N'Active', N'nhannt1@gmail.com')
SET IDENTITY_INSERT [dbo].[Post] OFF
INSERT [dbo].[UserInfor] ([email], [password], [full_name], [user_role], [user_status]) VALUES (N'nhannt@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'nhannt', N'Member', N'Active')
INSERT [dbo].[UserInfor] ([email], [password], [full_name], [user_role], [user_status]) VALUES (N'nhannt1@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'Nguyen Thanh Nhan', N'Member', N'Active')
INSERT [dbo].[UserInfor] ([email], [password], [full_name], [user_role], [user_status]) VALUES (N'nhannt2@gmail.com', N'6d036232c409dd5d717c895d8d695d9e1750d9062a13788bb2dda8dad603a5c5', N'Thanh Nhan', N'Member', N'New')
INSERT [dbo].[UserInfor] ([email], [password], [full_name], [user_role], [user_status]) VALUES (N'thanhnhan1234512@gmail.com', N'6d036232c409dd5d717c895d8d695d9e1750d9062a13788bb2dda8dad603a5c5', N'Thanh Nhan', N'Member', N'Active')
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([email])
REFERENCES [dbo].[UserInfor] ([email])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([post_id])
REFERENCES [dbo].[Post] ([post_id])
GO
ALTER TABLE [dbo].[Emotion]  WITH CHECK ADD FOREIGN KEY([email])
REFERENCES [dbo].[UserInfor] ([email])
GO
ALTER TABLE [dbo].[Emotion]  WITH CHECK ADD FOREIGN KEY([post_id])
REFERENCES [dbo].[Post] ([post_id])
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD FOREIGN KEY([email])
REFERENCES [dbo].[UserInfor] ([email])
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD FOREIGN KEY([post_id])
REFERENCES [dbo].[Post] ([post_id])
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD FOREIGN KEY([email])
REFERENCES [dbo].[UserInfor] ([email])
GO
USE [master]
GO
ALTER DATABASE [SocialNetwork] SET  READ_WRITE 
GO
