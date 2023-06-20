USE [master]
GO
/****** Object:  Database [ShootingClubBD]    Script Date: 21.06.2023 0:47:59 ******/
CREATE DATABASE [ShootingClubBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShootingClubBD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ShootingClubBD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShootingClubBD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ShootingClubBD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ShootingClubBD] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShootingClubBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShootingClubBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShootingClubBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShootingClubBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShootingClubBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShootingClubBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShootingClubBD] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ShootingClubBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShootingClubBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShootingClubBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShootingClubBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShootingClubBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShootingClubBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShootingClubBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShootingClubBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShootingClubBD] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShootingClubBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShootingClubBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShootingClubBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShootingClubBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShootingClubBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShootingClubBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShootingClubBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShootingClubBD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShootingClubBD] SET  MULTI_USER 
GO
ALTER DATABASE [ShootingClubBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShootingClubBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShootingClubBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShootingClubBD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShootingClubBD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShootingClubBD] SET QUERY_STORE = OFF
GO
USE [ShootingClubBD]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 21.06.2023 0:48:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 21.06.2023 0:48:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
	[DateOrder] [date] NOT NULL,
	[Total] [int] NOT NULL,
	[Paid] [bit] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderService]    Script Date: 21.06.2023 0:48:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderService](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[PriceListId] [int] NOT NULL,
 CONSTRAINT [PK_OrderService] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pricelist]    Script Date: 21.06.2023 0:48:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pricelist](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ServiceId] [int] NOT NULL,
	[WeaponId] [int] NOT NULL,
	[Price] [int] NOT NULL,
 CONSTRAINT [PK_Pricelist] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 21.06.2023 0:48:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 21.06.2023 0:48:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 21.06.2023 0:48:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Username] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[RoleId] [int] NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Weapon]    Script Date: 21.06.2023 0:48:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Weapon](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Photo] [nvarchar](100) NULL,
	[Weight] [int] NOT NULL,
	[Сaliber] [nvarchar](60) NULL,
	[MagazineSize] [int] NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Weapon] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Title]) VALUES (1, N'Метательные виды')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (2, N'Карабины')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (3, N'Пистолеты')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (4, N'Пневматическое оружие')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Title]) VALUES (1, N'клиент')
INSERT [dbo].[Role] ([Id], [Title]) VALUES (2, N'администратор')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([Username])
REFERENCES [dbo].[User] ([Username])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderService]  WITH CHECK ADD  CONSTRAINT [FK_OrderService_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderService] CHECK CONSTRAINT [FK_OrderService_Order]
GO
ALTER TABLE [dbo].[OrderService]  WITH CHECK ADD  CONSTRAINT [FK_OrderService_Pricelist] FOREIGN KEY([PriceListId])
REFERENCES [dbo].[Pricelist] ([Id])
GO
ALTER TABLE [dbo].[OrderService] CHECK CONSTRAINT [FK_OrderService_Pricelist]
GO
ALTER TABLE [dbo].[Pricelist]  WITH CHECK ADD  CONSTRAINT [FK_Pricelist_Service] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Service] ([Id])
GO
ALTER TABLE [dbo].[Pricelist] CHECK CONSTRAINT [FK_Pricelist_Service]
GO
ALTER TABLE [dbo].[Pricelist]  WITH CHECK ADD  CONSTRAINT [FK_Pricelist_Weapon] FOREIGN KEY([WeaponId])
REFERENCES [dbo].[Weapon] ([Id])
GO
ALTER TABLE [dbo].[Pricelist] CHECK CONSTRAINT [FK_Pricelist_Weapon]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[Weapon]  WITH CHECK ADD  CONSTRAINT [FK_Weapon_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Weapon] CHECK CONSTRAINT [FK_Weapon_Category]
GO
USE [master]
GO
ALTER DATABASE [ShootingClubBD] SET  READ_WRITE 
GO
