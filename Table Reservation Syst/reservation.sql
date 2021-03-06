USE [master]
GO
/****** Object:  Database [reservation]    Script Date: 9/30/2020 4:29:33 PM ******/
CREATE DATABASE [reservation]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'reservation', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\reservation.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'reservation_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\reservation_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [reservation] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [reservation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [reservation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [reservation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [reservation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [reservation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [reservation] SET ARITHABORT OFF 
GO
ALTER DATABASE [reservation] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [reservation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [reservation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [reservation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [reservation] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [reservation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [reservation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [reservation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [reservation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [reservation] SET  DISABLE_BROKER 
GO
ALTER DATABASE [reservation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [reservation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [reservation] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [reservation] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [reservation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [reservation] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [reservation] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [reservation] SET RECOVERY FULL 
GO
ALTER DATABASE [reservation] SET  MULTI_USER 
GO
ALTER DATABASE [reservation] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [reservation] SET DB_CHAINING OFF 
GO
ALTER DATABASE [reservation] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [reservation] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [reservation] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'reservation', N'ON'
GO
ALTER DATABASE [reservation] SET QUERY_STORE = OFF
GO
USE [reservation]
GO
/****** Object:  Table [dbo].[adjacent]    Script Date: 9/30/2020 4:29:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adjacent](
	[tableA] [int] NOT NULL,
	[tableB] [int] NOT NULL,
 CONSTRAINT [PK_adjacent] PRIMARY KEY CLUSTERED 
(
	[tableA] ASC,
	[tableB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[booking]    Script Date: 9/30/2020 4:29:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[booking](
	[bookingID] [int] IDENTITY(1,1) NOT NULL,
	[guestName] [varchar](50) NOT NULL,
	[guestMobile] [varchar](50) NOT NULL,
	[numberOfPeople] [int] NOT NULL,
	[roomID] [varchar](10) NULL,
	[startTime] [bigint] NOT NULL,
	[endTime] [bigint] NULL,
	[status] [varchar](15) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reserved]    Script Date: 9/30/2020 4:29:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reserved](
	[bookingID] [int] NOT NULL,
	[tableID] [int] NOT NULL,
	[startTime] [bigint] NOT NULL,
	[endTime] [bigint] NULL,
	[status] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[bookingID] ASC,
	[tableID] ASC,
	[status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[settings]    Script Date: 9/30/2020 4:29:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[settings](
	[parameter] [varchar](25) NOT NULL,
	[value] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[parameter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tables]    Script Date: 9/30/2020 4:29:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tables](
	[tableID] [int] NOT NULL,
	[capacity] [int] NOT NULL,
	[blocked] [tinyint] NOT NULL,
 CONSTRAINT [PK_tables] PRIMARY KEY CLUSTERED 
(
	[tableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (1, 2)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (1, 7)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (2, 1)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (2, 3)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (2, 8)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (3, 2)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (3, 4)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (3, 9)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (4, 3)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (4, 5)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (4, 10)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (5, 4)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (5, 6)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (5, 11)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (6, 5)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (6, 12)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (7, 1)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (7, 8)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (8, 2)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (8, 7)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (8, 9)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (8, 13)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (9, 3)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (9, 8)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (9, 10)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (9, 14)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (10, 4)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (10, 9)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (10, 11)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (10, 15)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (11, 5)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (11, 10)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (11, 12)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (11, 16)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (12, 6)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (12, 11)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (13, 8)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (13, 14)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (14, 9)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (14, 13)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (14, 15)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (15, 10)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (15, 14)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (15, 16)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (16, 11)
INSERT [dbo].[adjacent] ([tableA], [tableB]) VALUES (16, 15)
GO
INSERT [dbo].[settings] ([parameter], [value]) VALUES (N'bookingPerDay', N'3')
INSERT [dbo].[settings] ([parameter], [value]) VALUES (N'breakfast', N'3600')
INSERT [dbo].[settings] ([parameter], [value]) VALUES (N'bufferTime', N'77')
INSERT [dbo].[settings] ([parameter], [value]) VALUES (N'dinner', N'7200')
INSERT [dbo].[settings] ([parameter], [value]) VALUES (N'fridayEnd', N'23:00')
INSERT [dbo].[settings] ([parameter], [value]) VALUES (N'fridayStart', N'07:00')
INSERT [dbo].[settings] ([parameter], [value]) VALUES (N'lunch', N'5400')
INSERT [dbo].[settings] ([parameter], [value]) VALUES (N'mondayEnd', N'23:00')
INSERT [dbo].[settings] ([parameter], [value]) VALUES (N'mondayStart', N'07:00')
INSERT [dbo].[settings] ([parameter], [value]) VALUES (N'saturdayEnd', N'03:00')
INSERT [dbo].[settings] ([parameter], [value]) VALUES (N'saturdayStart', N'10:00')
INSERT [dbo].[settings] ([parameter], [value]) VALUES (N'sundayEnd', N'03:00')
INSERT [dbo].[settings] ([parameter], [value]) VALUES (N'sundayStart', N'10:00')
INSERT [dbo].[settings] ([parameter], [value]) VALUES (N'thursdayEnd', N'23:00')
INSERT [dbo].[settings] ([parameter], [value]) VALUES (N'thursdayStart', N'07:00')
INSERT [dbo].[settings] ([parameter], [value]) VALUES (N'tuesdayEnd', N'23:00')
INSERT [dbo].[settings] ([parameter], [value]) VALUES (N'tuesdayStart', N'07:00')
INSERT [dbo].[settings] ([parameter], [value]) VALUES (N'wednesdayEnd', N'23:00')
INSERT [dbo].[settings] ([parameter], [value]) VALUES (N'wednesdayStart', N'07:00')
GO
INSERT [dbo].[tables] ([tableID], [capacity], [blocked]) VALUES (1, 2, 0)
INSERT [dbo].[tables] ([tableID], [capacity], [blocked]) VALUES (2, 3, 0)
INSERT [dbo].[tables] ([tableID], [capacity], [blocked]) VALUES (3, 4, 0)
INSERT [dbo].[tables] ([tableID], [capacity], [blocked]) VALUES (4, 3, 0)
INSERT [dbo].[tables] ([tableID], [capacity], [blocked]) VALUES (5, 3, 0)
INSERT [dbo].[tables] ([tableID], [capacity], [blocked]) VALUES (6, 5, 0)
INSERT [dbo].[tables] ([tableID], [capacity], [blocked]) VALUES (7, 2, 0)
INSERT [dbo].[tables] ([tableID], [capacity], [blocked]) VALUES (8, 2, 0)
INSERT [dbo].[tables] ([tableID], [capacity], [blocked]) VALUES (9, 2, 0)
INSERT [dbo].[tables] ([tableID], [capacity], [blocked]) VALUES (10, 3, 0)
INSERT [dbo].[tables] ([tableID], [capacity], [blocked]) VALUES (11, 3, 0)
INSERT [dbo].[tables] ([tableID], [capacity], [blocked]) VALUES (12, 5, 0)
INSERT [dbo].[tables] ([tableID], [capacity], [blocked]) VALUES (13, 3, 0)
INSERT [dbo].[tables] ([tableID], [capacity], [blocked]) VALUES (14, 2, 0)
INSERT [dbo].[tables] ([tableID], [capacity], [blocked]) VALUES (15, 3, 0)
INSERT [dbo].[tables] ([tableID], [capacity], [blocked]) VALUES (16, 4, 0)
GO
USE [master]
GO
ALTER DATABASE [reservation] SET  READ_WRITE 
GO
