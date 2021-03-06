USE [master]
GO
/****** Object:  Database [HotelBooking]    Script Date: 11/6/2020 11:58:12 PM ******/
CREATE DATABASE [HotelBooking]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HotelBooking', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HotelBooking.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HotelBooking_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HotelBooking_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HotelBooking] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HotelBooking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HotelBooking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HotelBooking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HotelBooking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HotelBooking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HotelBooking] SET ARITHABORT OFF 
GO
ALTER DATABASE [HotelBooking] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HotelBooking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HotelBooking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HotelBooking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HotelBooking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HotelBooking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HotelBooking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HotelBooking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HotelBooking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HotelBooking] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HotelBooking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HotelBooking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HotelBooking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HotelBooking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HotelBooking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HotelBooking] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HotelBooking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HotelBooking] SET RECOVERY FULL 
GO
ALTER DATABASE [HotelBooking] SET  MULTI_USER 
GO
ALTER DATABASE [HotelBooking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HotelBooking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HotelBooking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HotelBooking] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HotelBooking] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HotelBooking', N'ON'
GO
USE [HotelBooking]
GO
/****** Object:  Table [dbo].[Areas]    Script Date: 11/6/2020 11:58:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Areas](
	[areaCode] [nvarchar](8) NOT NULL,
	[areaName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[areaCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Booking]    Script Date: 11/6/2020 11:58:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Booking](
	[bookID] [varchar](20) NOT NULL,
	[username] [varchar](200) NOT NULL,
	[bookDate] [datetime] NOT NULL,
	[discountCode] [varchar](10) NULL,
	[discountValue] [float] NULL,
	[bookingStatus] [varchar](20) NULL DEFAULT ('Not confirm'),
PRIMARY KEY CLUSTERED 
(
	[bookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingDetails]    Script Date: 11/6/2020 11:58:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingDetails](
	[bookID] [varchar](20) NOT NULL,
	[roomID] [nvarchar](8) NOT NULL,
	[checkInDate] [date] NOT NULL,
	[checkOutDate] [date] NOT NULL,
	[price] [float] NOT NULL,
	[bookingDetailStatus] [varchar](20) NOT NULL DEFAULT ('Not Confirm'),
PRIMARY KEY CLUSTERED 
(
	[bookID] ASC,
	[roomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Discounts]    Script Date: 11/6/2020 11:58:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Discounts](
	[discountCode] [varchar](10) NOT NULL,
	[discountName] [varchar](50) NOT NULL,
	[discountValue] [float] NULL,
	[expiredDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[discountCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Hotels]    Script Date: 11/6/2020 11:58:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Hotels](
	[hotelID] [nvarchar](8) NOT NULL,
	[hotelName] [nvarchar](50) NOT NULL,
	[areaCode] [nvarchar](8) NOT NULL,
	[hotelAddress] [nvarchar](100) NOT NULL,
	[description] [nvarchar](300) NOT NULL,
	[hotelEmail] [nvarchar](150) NOT NULL,
	[hotline] [nvarchar](10) NOT NULL,
	[hotelStatus] [varchar](20) NULL DEFAULT ('Active'),
PRIMARY KEY CLUSTERED 
(
	[hotelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/6/2020 11:58:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 11/6/2020 11:58:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rooms](
	[roomID] [nvarchar](8) NOT NULL,
	[roomName] [nvarchar](50) NOT NULL,
	[typeID] [nvarchar](8) NOT NULL,
	[hotelID] [nvarchar](8) NOT NULL,
	[roomStatus] [varchar](20) NULL DEFAULT ('Active'),
PRIMARY KEY CLUSTERED 
(
	[roomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RoomType]    Script Date: 11/6/2020 11:58:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomType](
	[typeID] [nvarchar](8) NOT NULL,
	[typeName] [nvarchar](50) NOT NULL,
	[description] [nvarchar](300) NOT NULL,
	[price] [float] NOT NULL,
	[hotelID] [nvarchar](8) NOT NULL,
	[amount] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[typeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserInfor]    Script Date: 11/6/2020 11:58:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserInfor](
	[username] [varchar](200) NOT NULL,
	[password] [varchar](300) NOT NULL,
	[fullName] [varchar](200) NOT NULL,
	[roleId] [int] NOT NULL,
	[phone] [varchar](20) NOT NULL,
	[userStatus] [varchar](20) NOT NULL DEFAULT ('Active'),
	[email] [varchar](200) NOT NULL,
	[newPassword] [varchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Areas] ([areaCode], [areaName]) VALUES (N'CT', N'Can Tho')
INSERT [dbo].[Areas] ([areaCode], [areaName]) VALUES (N'DN', N'Da Nang')
INSERT [dbo].[Areas] ([areaCode], [areaName]) VALUES (N'HCM', N'Ho Chi Minh')
INSERT [dbo].[Areas] ([areaCode], [areaName]) VALUES (N'HN', N'Ha Noi')
INSERT [dbo].[Booking] ([bookID], [username], [bookDate], [discountCode], [discountValue], [bookingStatus]) VALUES (N'NTN18814320', N'nhannt', CAST(N'2020-11-06 23:01:51.017' AS DateTime), NULL, 0, N'Not confirm')
INSERT [dbo].[BookingDetails] ([bookID], [roomID], [checkInDate], [checkOutDate], [price], [bookingDetailStatus]) VALUES (N'NTN18814320', N'R36', CAST(N'2020-11-07' AS Date), CAST(N'2020-11-11' AS Date), 200000, N'Not Confirm')
INSERT [dbo].[Discounts] ([discountCode], [discountName], [discountValue], [expiredDate]) VALUES (N'NHAN25', N'NhanNT', 0.25, CAST(N'2020-11-07' AS Date))
INSERT [dbo].[Discounts] ([discountCode], [discountName], [discountValue], [expiredDate]) VALUES (N'NHAN50', N'NHANNT', 0.5, CAST(N'2020-12-07' AS Date))
INSERT [dbo].[Hotels] ([hotelID], [hotelName], [areaCode], [hotelAddress], [description], [hotelEmail], [hotline], [hotelStatus]) VALUES (N'NQ', N'Nhat Quang', N'CT', N'FPTU', N'Good Hotel', N'quang@gmail.com', N'0987836829', N'Active')
INSERT [dbo].[Hotels] ([hotelID], [hotelName], [areaCode], [hotelAddress], [description], [hotelEmail], [hotline], [hotelStatus]) VALUES (N'TK', N'Trung Kien', N'HN', N'FPTU', N'Good Hotel', N'kien@gmail.com', N'0938479230', N'Active')
INSERT [dbo].[Hotels] ([hotelID], [hotelName], [areaCode], [hotelAddress], [description], [hotelEmail], [hotline], [hotelStatus]) VALUES (N'TN', N'Thanh Nhan', N'HCM', N'FPTU', N'Good Hotel', N'nhan@gmail.comm', N'0983288773', N'Active')
INSERT [dbo].[Hotels] ([hotelID], [hotelName], [areaCode], [hotelAddress], [description], [hotelEmail], [hotline], [hotelStatus]) VALUES (N'VH', N'Van Hung', N'DN', N'FPTU', N'Good Hotel', N'hung@gmail.com', N'0927399288', N'Active')
INSERT [dbo].[Hotels] ([hotelID], [hotelName], [areaCode], [hotelAddress], [description], [hotelEmail], [hotline], [hotelStatus]) VALUES (N'VT', N'Van Tien', N'HCM', N'FPTU', N'Bad Hotel', N'tien@gmail.com', N'0973682683', N'Active')
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (2, N'Member')
SET IDENTITY_INSERT [dbo].[Role] OFF
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R1', N'Room1', N'S1', N'TN', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R10', N'Room10', N'S2', N'VT', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R11', N'Room11', N'S3', N'TK', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R12', N'Room12', N'S3', N'TK', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R13', N'Room13', N'S3', N'TK', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R14', N'Room14', N'S3', N'TK', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R15', N'Room15', N'S3', N'TK', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R16', N'Room16', N'S4', N'VH', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R17', N'Room17', N'S4', N'VH', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R18', N'Room18', N'S4', N'VH', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R19', N'Room19', N'S4', N'VH', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R2', N'Room2', N'S1', N'TN', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R20', N'Room20', N'S4', N'VH', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R21', N'Room21', N'S5', N'NQ', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R22', N'Room22', N'S5', N'NQ', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R23', N'Room23', N'S5', N'NQ', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R24', N'Room24', N'S5', N'NQ', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R25', N'Room25', N'S5', N'NQ', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R26', N'Room26', N'D1', N'TN', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R27', N'Room27', N'D1', N'TN', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R28', N'Room28', N'D1', N'TN', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R29', N'Room29', N'D1', N'TN', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R3', N'Room3', N'S1', N'TN', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R30', N'Room30', N'D1', N'TN', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R31', N'Room31', N'D2', N'VT', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R32', N'Room32', N'D2', N'VT', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R33', N'Room33', N'D2', N'VT', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R34', N'Room34', N'D2', N'VT', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R35', N'Room35', N'D2', N'VT', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R36', N'Room36', N'D3', N'TK', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R37', N'Room37', N'D3', N'TK', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R38', N'Room38', N'D3', N'TK', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R39', N'Room39', N'D3', N'TK', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R4', N'Room4', N'S1', N'TN', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R40', N'Room40', N'D3', N'TK', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R41', N'Room41', N'D4', N'VH', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R42', N'Room32', N'D4', N'VH', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R43', N'Room43', N'D4', N'VH', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R44', N'Room44', N'D4', N'VH', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R45', N'Room45', N'D4', N'VH', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R46', N'Room46', N'D5', N'NQ', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R47', N'Room47', N'D5', N'NQ', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R48', N'Room48', N'D5', N'NQ', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R49', N'Room49', N'D5', N'NQ', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R5', N'Room5', N'S1', N'TN', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R50', N'Room50', N'D5', N'NQ', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R51', N'Room51', N'F1', N'TN', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R52', N'Room52', N'F1', N'TN', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R53', N'Room53', N'F1', N'TN', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R54', N'Room54', N'F1', N'TN', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R55', N'Room55', N'F1', N'TN', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R56', N'Room56', N'F2', N'VT', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R57', N'Room57', N'F2', N'VT', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R58', N'Room58', N'F2', N'VT', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R59', N'Room59', N'F2', N'VT', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R6', N'Room6', N'S2', N'VT', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R60', N'Room60', N'F2', N'VT', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R61', N'Room61', N'F3', N'TK', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R62', N'Room62', N'F3', N'TK', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R63', N'Room63', N'F3', N'TK', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R64', N'Room64', N'F3', N'TK', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R65', N'Room65', N'F3', N'TK', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R66', N'Room66', N'F4', N'VH', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R67', N'Room67', N'F4', N'VH', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R68', N'Room68', N'F4', N'VH', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R69', N'Room69', N'F4', N'VH', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R7', N'Room7', N'S2', N'VT', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R70', N'Room70', N'F4', N'VH', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R71', N'Room71', N'F5', N'NQ', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R72', N'Room72', N'F5', N'NQ', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R73', N'Room73', N'F5', N'NQ', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R74', N'Room74', N'F5', N'NQ', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R75', N'Room75', N'F5', N'NQ', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R8', N'Room8', N'S2', N'VT', N'Active')
INSERT [dbo].[Rooms] ([roomID], [roomName], [typeID], [hotelID], [roomStatus]) VALUES (N'R9', N'Room9', N'S2', N'VT', N'Active')
INSERT [dbo].[RoomType] ([typeID], [typeName], [description], [price], [hotelID], [amount]) VALUES (N'D1', N'Double', N'good', 200000, N'TN', 5)
INSERT [dbo].[RoomType] ([typeID], [typeName], [description], [price], [hotelID], [amount]) VALUES (N'D2', N'Double', N'good', 200000, N'VT', 5)
INSERT [dbo].[RoomType] ([typeID], [typeName], [description], [price], [hotelID], [amount]) VALUES (N'D3', N'Double', N'good', 200000, N'TK', 5)
INSERT [dbo].[RoomType] ([typeID], [typeName], [description], [price], [hotelID], [amount]) VALUES (N'D4', N'Double', N'good', 150000, N'VH', 5)
INSERT [dbo].[RoomType] ([typeID], [typeName], [description], [price], [hotelID], [amount]) VALUES (N'D5', N'Double', N'good', 200000, N'NQ', 5)
INSERT [dbo].[RoomType] ([typeID], [typeName], [description], [price], [hotelID], [amount]) VALUES (N'F1', N'Family', N'good', 200000, N'TN', 5)
INSERT [dbo].[RoomType] ([typeID], [typeName], [description], [price], [hotelID], [amount]) VALUES (N'F2', N'Family', N'good', 150000, N'VT', 5)
INSERT [dbo].[RoomType] ([typeID], [typeName], [description], [price], [hotelID], [amount]) VALUES (N'F3', N'Family', N'good', 200000, N'TK', 5)
INSERT [dbo].[RoomType] ([typeID], [typeName], [description], [price], [hotelID], [amount]) VALUES (N'F4', N'Family', N'good', 150000, N'VH', 5)
INSERT [dbo].[RoomType] ([typeID], [typeName], [description], [price], [hotelID], [amount]) VALUES (N'F5', N'Family', N'good', 200000, N'NQ', 5)
INSERT [dbo].[RoomType] ([typeID], [typeName], [description], [price], [hotelID], [amount]) VALUES (N'S1', N'Single', N'good', 200000, N'TN', 5)
INSERT [dbo].[RoomType] ([typeID], [typeName], [description], [price], [hotelID], [amount]) VALUES (N'S2', N'Single', N'good', 150000, N'VT', 5)
INSERT [dbo].[RoomType] ([typeID], [typeName], [description], [price], [hotelID], [amount]) VALUES (N'S3', N'Single', N'good', 100000, N'TK', 5)
INSERT [dbo].[RoomType] ([typeID], [typeName], [description], [price], [hotelID], [amount]) VALUES (N'S4', N'Single', N'good', 150000, N'VH', 5)
INSERT [dbo].[RoomType] ([typeID], [typeName], [description], [price], [hotelID], [amount]) VALUES (N'S5', N'Single', N'good', 120000, N'NQ', 5)
INSERT [dbo].[UserInfor] ([username], [password], [fullName], [roleId], [phone], [userStatus], [email], [newPassword]) VALUES (N'nhannt', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'NhanNT', 2, N'0329272250', N'Active', N'thanhnhan1234512@gmail.com', NULL)
INSERT [dbo].[UserInfor] ([username], [password], [fullName], [roleId], [phone], [userStatus], [email], [newPassword]) VALUES (N'nhanntAd', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'NhanNT', 1, N'0329272250', N'Active', N'thanhnhan1234512@gmail.com', NULL)
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Discount] FOREIGN KEY([discountCode])
REFERENCES [dbo].[Discounts] ([discountCode])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Discount]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_UserInfor] FOREIGN KEY([username])
REFERENCES [dbo].[UserInfor] ([username])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_UserInfor]
GO
ALTER TABLE [dbo].[BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Details] FOREIGN KEY([bookID])
REFERENCES [dbo].[Booking] ([bookID])
GO
ALTER TABLE [dbo].[BookingDetails] CHECK CONSTRAINT [FK_Booking_Details]
GO
ALTER TABLE [dbo].[BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_Details_Rooms] FOREIGN KEY([roomID])
REFERENCES [dbo].[Rooms] ([roomID])
GO
ALTER TABLE [dbo].[BookingDetails] CHECK CONSTRAINT [FK_Details_Rooms]
GO
ALTER TABLE [dbo].[Hotels]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Areas] FOREIGN KEY([areaCode])
REFERENCES [dbo].[Areas] ([areaCode])
GO
ALTER TABLE [dbo].[Hotels] CHECK CONSTRAINT [FK_Hotel_Areas]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Room_Hotels] FOREIGN KEY([hotelID])
REFERENCES [dbo].[Hotels] ([hotelID])
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Room_Hotels]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Room_Type] FOREIGN KEY([typeID])
REFERENCES [dbo].[RoomType] ([typeID])
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Room_Type]
GO
ALTER TABLE [dbo].[RoomType]  WITH CHECK ADD  CONSTRAINT [FK_Room_Hotel] FOREIGN KEY([hotelID])
REFERENCES [dbo].[Hotels] ([hotelID])
GO
ALTER TABLE [dbo].[RoomType] CHECK CONSTRAINT [FK_Room_Hotel]
GO
ALTER TABLE [dbo].[UserInfor]  WITH CHECK ADD FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([roleId])
GO
ALTER TABLE [dbo].[Discounts]  WITH CHECK ADD CHECK  (([discountValue]>(0) AND [discountValue]<(1)))
GO
USE [master]
GO
ALTER DATABASE [HotelBooking] SET  READ_WRITE 
GO
