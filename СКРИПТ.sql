/*    ==Параметры сценариев==

    Версия исходного сервера : SQL Server 2017 (14.0.1000)
    Выпуск исходного ядра СУБД : Выпуск Microsoft SQL Server Express Edition
    Тип исходного ядра СУБД : Изолированный SQL Server

    Версия целевого сервера : SQL Server 2017
    Выпуск целевого ядра СУБД : Выпуск Microsoft SQL Server Standard Edition
    Тип целевого ядра СУБД : Изолированный SQL Server
*/
USE [master]
GO
/****** Object:  Database [ShootingClubDB]    Script Date: 21.06.2023 16:51:00 ******/
CREATE DATABASE [ShootingClubDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShootingClubDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ShootingClubDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShootingClubDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ShootingClubDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ShootingClubDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShootingClubDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShootingClubDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShootingClubDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShootingClubDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShootingClubDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShootingClubDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShootingClubDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ShootingClubDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShootingClubDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShootingClubDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShootingClubDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShootingClubDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShootingClubDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShootingClubDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShootingClubDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShootingClubDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShootingClubDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShootingClubDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShootingClubDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShootingClubDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShootingClubDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShootingClubDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShootingClubDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShootingClubDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShootingClubDB] SET  MULTI_USER 
GO
ALTER DATABASE [ShootingClubDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShootingClubDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShootingClubDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShootingClubDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShootingClubDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShootingClubDB] SET QUERY_STORE = OFF
GO
USE [ShootingClubDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [ShootingClubDB]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 21.06.2023 16:51:00 ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 21.06.2023 16:51:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
	[DateOrder] [datetime] NOT NULL,
	[Total] [int] NOT NULL,
	[Paid] [bit] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderService]    Script Date: 21.06.2023 16:51:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderService](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[PriceListId] [int] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_OrderService] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pricelist]    Script Date: 21.06.2023 16:51:00 ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 21.06.2023 16:51:00 ******/
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
/****** Object:  Table [dbo].[Service]    Script Date: 21.06.2023 16:51:00 ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 21.06.2023 16:51:00 ******/
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
/****** Object:  Table [dbo].[Weapon]    Script Date: 21.06.2023 16:51:00 ******/
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
INSERT [dbo].[Order] ([Id], [Username], [DateOrder], [Total], [Paid]) VALUES (2, N'user', CAST(N'2023-06-21T00:11:00.000' AS DateTime), 3980, 0)
INSERT [dbo].[Order] ([Id], [Username], [DateOrder], [Total], [Paid]) VALUES (3, N'user', CAST(N'2023-06-24T00:15:30.000' AS DateTime), 8250, 1)
INSERT [dbo].[Order] ([Id], [Username], [DateOrder], [Total], [Paid]) VALUES (4, N'user', CAST(N'2023-06-24T00:12:00.000' AS DateTime), 3300, 0)
INSERT [dbo].[Order] ([Id], [Username], [DateOrder], [Total], [Paid]) VALUES (5, N'user', CAST(N'2023-06-23T00:23:00.000' AS DateTime), 4100, 1)
INSERT [dbo].[Order] ([Id], [Username], [DateOrder], [Total], [Paid]) VALUES (6, N'user', CAST(N'2023-06-23T00:16:00.000' AS DateTime), 2360, 0)
INSERT [dbo].[Order] ([Id], [Username], [DateOrder], [Total], [Paid]) VALUES (7, N'user', CAST(N'2023-06-21T00:17:00.000' AS DateTime), 2400, 0)
INSERT [dbo].[Order] ([Id], [Username], [DateOrder], [Total], [Paid]) VALUES (8, N'max', CAST(N'2023-06-23T17:30:00.000' AS DateTime), 6090, 0)
SET IDENTITY_INSERT [dbo].[OrderService] ON 

INSERT [dbo].[OrderService] ([Id], [OrderId], [PriceListId], [Count]) VALUES (5, 2, 14, 6)
INSERT [dbo].[OrderService] ([Id], [OrderId], [PriceListId], [Count]) VALUES (6, 2, 13, 1)
INSERT [dbo].[OrderService] ([Id], [OrderId], [PriceListId], [Count]) VALUES (7, 2, 12, 1)
INSERT [dbo].[OrderService] ([Id], [OrderId], [PriceListId], [Count]) VALUES (8, 3, 8, 10)
INSERT [dbo].[OrderService] ([Id], [OrderId], [PriceListId], [Count]) VALUES (9, 3, 9, 2)
INSERT [dbo].[OrderService] ([Id], [OrderId], [PriceListId], [Count]) VALUES (10, 3, 12, 2)
INSERT [dbo].[OrderService] ([Id], [OrderId], [PriceListId], [Count]) VALUES (11, 4, 14, 10)
INSERT [dbo].[OrderService] ([Id], [OrderId], [PriceListId], [Count]) VALUES (12, 4, 18, 1)
INSERT [dbo].[OrderService] ([Id], [OrderId], [PriceListId], [Count]) VALUES (13, 4, 19, 1)
INSERT [dbo].[OrderService] ([Id], [OrderId], [PriceListId], [Count]) VALUES (14, 5, 9, 1)
INSERT [dbo].[OrderService] ([Id], [OrderId], [PriceListId], [Count]) VALUES (15, 5, 13, 1)
INSERT [dbo].[OrderService] ([Id], [OrderId], [PriceListId], [Count]) VALUES (16, 5, 16, 1)
INSERT [dbo].[OrderService] ([Id], [OrderId], [PriceListId], [Count]) VALUES (17, 5, 3, 1)
INSERT [dbo].[OrderService] ([Id], [OrderId], [PriceListId], [Count]) VALUES (18, 5, 20, 1)
INSERT [dbo].[OrderService] ([Id], [OrderId], [PriceListId], [Count]) VALUES (19, 5, 23, 1)
INSERT [dbo].[OrderService] ([Id], [OrderId], [PriceListId], [Count]) VALUES (20, 5, 22, 1)
INSERT [dbo].[OrderService] ([Id], [OrderId], [PriceListId], [Count]) VALUES (21, 6, 8, 50)
INSERT [dbo].[OrderService] ([Id], [OrderId], [PriceListId], [Count]) VALUES (22, 6, 11, 1)
INSERT [dbo].[OrderService] ([Id], [OrderId], [PriceListId], [Count]) VALUES (23, 6, 14, 1)
INSERT [dbo].[OrderService] ([Id], [OrderId], [PriceListId], [Count]) VALUES (24, 6, 13, 1)
INSERT [dbo].[OrderService] ([Id], [OrderId], [PriceListId], [Count]) VALUES (25, 7, 30, 1)
INSERT [dbo].[OrderService] ([Id], [OrderId], [PriceListId], [Count]) VALUES (26, 7, 27, 1)
INSERT [dbo].[OrderService] ([Id], [OrderId], [PriceListId], [Count]) VALUES (27, 8, 5, 5)
INSERT [dbo].[OrderService] ([Id], [OrderId], [PriceListId], [Count]) VALUES (28, 8, 10, 1)
INSERT [dbo].[OrderService] ([Id], [OrderId], [PriceListId], [Count]) VALUES (29, 8, 11, 3)
SET IDENTITY_INSERT [dbo].[OrderService] OFF
SET IDENTITY_INSERT [dbo].[Pricelist] ON 

INSERT [dbo].[Pricelist] ([Id], [ServiceId], [WeaponId], [Price]) VALUES (1, 1, 1, 1000)
INSERT [dbo].[Pricelist] ([Id], [ServiceId], [WeaponId], [Price]) VALUES (2, 3, 1, 900)
INSERT [dbo].[Pricelist] ([Id], [ServiceId], [WeaponId], [Price]) VALUES (3, 4, 1, 20)
INSERT [dbo].[Pricelist] ([Id], [ServiceId], [WeaponId], [Price]) VALUES (5, 1, 2, 1000)
INSERT [dbo].[Pricelist] ([Id], [ServiceId], [WeaponId], [Price]) VALUES (6, 3, 2, 900)
INSERT [dbo].[Pricelist] ([Id], [ServiceId], [WeaponId], [Price]) VALUES (8, 4, 2, 25)
INSERT [dbo].[Pricelist] ([Id], [ServiceId], [WeaponId], [Price]) VALUES (9, 1, 3, 1500)
INSERT [dbo].[Pricelist] ([Id], [ServiceId], [WeaponId], [Price]) VALUES (10, 3, 3, 1000)
INSERT [dbo].[Pricelist] ([Id], [ServiceId], [WeaponId], [Price]) VALUES (11, 4, 3, 30)
INSERT [dbo].[Pricelist] ([Id], [ServiceId], [WeaponId], [Price]) VALUES (12, 1, 4, 2500)
INSERT [dbo].[Pricelist] ([Id], [ServiceId], [WeaponId], [Price]) VALUES (13, 3, 4, 1000)
INSERT [dbo].[Pricelist] ([Id], [ServiceId], [WeaponId], [Price]) VALUES (14, 5, 4, 80)
INSERT [dbo].[Pricelist] ([Id], [ServiceId], [WeaponId], [Price]) VALUES (15, 1, 6, 2400)
INSERT [dbo].[Pricelist] ([Id], [ServiceId], [WeaponId], [Price]) VALUES (16, 3, 6, 1000)
INSERT [dbo].[Pricelist] ([Id], [ServiceId], [WeaponId], [Price]) VALUES (17, 5, 6, 55)
INSERT [dbo].[Pricelist] ([Id], [ServiceId], [WeaponId], [Price]) VALUES (18, 1, 7, 2000)
INSERT [dbo].[Pricelist] ([Id], [ServiceId], [WeaponId], [Price]) VALUES (19, 3, 7, 500)
INSERT [dbo].[Pricelist] ([Id], [ServiceId], [WeaponId], [Price]) VALUES (20, 5, 7, 40)
INSERT [dbo].[Pricelist] ([Id], [ServiceId], [WeaponId], [Price]) VALUES (21, 1, 8, 1800)
INSERT [dbo].[Pricelist] ([Id], [ServiceId], [WeaponId], [Price]) VALUES (22, 3, 8, 500)
INSERT [dbo].[Pricelist] ([Id], [ServiceId], [WeaponId], [Price]) VALUES (23, 5, 8, 40)
INSERT [dbo].[Pricelist] ([Id], [ServiceId], [WeaponId], [Price]) VALUES (24, 1, 9, 1800)
INSERT [dbo].[Pricelist] ([Id], [ServiceId], [WeaponId], [Price]) VALUES (25, 3, 9, 500)
INSERT [dbo].[Pricelist] ([Id], [ServiceId], [WeaponId], [Price]) VALUES (26, 5, 9, 40)
INSERT [dbo].[Pricelist] ([Id], [ServiceId], [WeaponId], [Price]) VALUES (27, 1, 10, 1200)
INSERT [dbo].[Pricelist] ([Id], [ServiceId], [WeaponId], [Price]) VALUES (28, 3, 10, 500)
INSERT [dbo].[Pricelist] ([Id], [ServiceId], [WeaponId], [Price]) VALUES (29, 5, 10, 40)
INSERT [dbo].[Pricelist] ([Id], [ServiceId], [WeaponId], [Price]) VALUES (30, 1, 11, 1200)
INSERT [dbo].[Pricelist] ([Id], [ServiceId], [WeaponId], [Price]) VALUES (31, 3, 11, 500)
INSERT [dbo].[Pricelist] ([Id], [ServiceId], [WeaponId], [Price]) VALUES (32, 5, 11, 40)
INSERT [dbo].[Pricelist] ([Id], [ServiceId], [WeaponId], [Price]) VALUES (33, 1, 12, 1200)
INSERT [dbo].[Pricelist] ([Id], [ServiceId], [WeaponId], [Price]) VALUES (34, 3, 12, 500)
INSERT [dbo].[Pricelist] ([Id], [ServiceId], [WeaponId], [Price]) VALUES (35, 5, 12, 40)
INSERT [dbo].[Pricelist] ([Id], [ServiceId], [WeaponId], [Price]) VALUES (36, 1, 13, 1200)
INSERT [dbo].[Pricelist] ([Id], [ServiceId], [WeaponId], [Price]) VALUES (37, 3, 13, 500)
INSERT [dbo].[Pricelist] ([Id], [ServiceId], [WeaponId], [Price]) VALUES (38, 5, 13, 40)
INSERT [dbo].[Pricelist] ([Id], [ServiceId], [WeaponId], [Price]) VALUES (39, 1, 14, 1200)
INSERT [dbo].[Pricelist] ([Id], [ServiceId], [WeaponId], [Price]) VALUES (40, 3, 14, 500)
INSERT [dbo].[Pricelist] ([Id], [ServiceId], [WeaponId], [Price]) VALUES (41, 5, 14, 40)
SET IDENTITY_INSERT [dbo].[Pricelist] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Title]) VALUES (1, N'администратор')
INSERT [dbo].[Role] ([Id], [Title]) VALUES (2, N'клиент')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([Id], [Title]) VALUES (1, N'Аренда стрелковой галереи')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (2, N'Аренда спортивного зала')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (3, N'Индивидуальное обучение с инструктором')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (4, N'Аренда карбоновых стрел за шт.')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (5, N'Выстрел')
SET IDENTITY_INSERT [dbo].[Service] OFF
INSERT [dbo].[User] ([Username], [Password], [RoleId], [LastName], [FirstName], [MiddleName], [Phone], [Email]) VALUES (N'admin', N'1', 1, N'Хабибуллин', N'Булат', N'Айратович', NULL, NULL)
INSERT [dbo].[User] ([Username], [Password], [RoleId], [LastName], [FirstName], [MiddleName], [Phone], [Email]) VALUES (N'max', N'1', 2, N'Смирнов', N'Максим', N'', N'+7 (897) 987-98-79', N'me@mail.ru')
INSERT [dbo].[User] ([Username], [Password], [RoleId], [LastName], [FirstName], [MiddleName], [Phone], [Email]) VALUES (N'user', N'1', 2, N'Иванов', N'Иван', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Weapon] ON 

INSERT [dbo].[Weapon] ([Id], [Title], [Description], [Photo], [Weight], [Сaliber], [MagazineSize], [CategoryId]) VALUES (1, N'Лук рекурсивный Man Kung MK-RB001 (белый, 40lbs)', N'Конструкция лука простая, но в то же время надежная. Длина лука невелика в сравнении с другими аналогичными моделями типа Winner и составляет всего 155 см. Рукоять изготовлена из металлического сплава, в руке лежит очень удобно.', N'21.jpg', 1400, NULL, NULL, 1)
INSERT [dbo].[Weapon] ([Id], [Title], [Description], [Photo], [Weight], [Сaliber], [MagazineSize], [CategoryId]) VALUES (2, N'Арбалет пистолет МК 80 А2 алюминий', N'Арбалет быстровзводимый (рекурсивный) . Уникальный рычажный взвод позволяет взводить арбалет одним движением руки и снижает усилие взвода на 78%. Арбалет МК-80 один из самых мощных арбалетов пистолетного типа, усилие натяжения 36 килограмм, может взвести даже хрупкая девушка и ребенок.Рычаг позволяет заряжать арбалет в любых положениях , везде где обычный арбалет трудно или невозможно взвести.Стрелять из него удобно и процесс доставляет удовольствие, поскольку чувствуется, что этот арбалет не вполне игрушка. На расстоянии до 10 метров запросто пробивает плиту ДСП толщиной до 10 мм (не навылет).', N'22.jpg', 1300, NULL, NULL, 1)
INSERT [dbo].[Weapon] ([Id], [Title], [Description], [Photo], [Weight], [Сaliber], [MagazineSize], [CategoryId]) VALUES (3, N'Арбалет Ek Cobra System R9', N'Арбалет COBRA SYSTEM R9 от EK Archery (Poe Lang) это новейшая модель в нише арбалетов пистолетного типа. А самое главное, что данный арбалет позиционируется не только как арбалет-пистолет, но и как полноценный сверхкомпактный тактический стреломет.', N'33.jpg', 1300, NULL, NULL, 1)
INSERT [dbo].[Weapon] ([Id], [Title], [Description], [Photo], [Weight], [Сaliber], [MagazineSize], [CategoryId]) VALUES (4, N'«САЙГА-410 КВ»', N'Карабин разработан по принципу общей компоновки автомата Калашникова, с газоотводным механизмом и запиранием ствола поворотным затвором и ограничен только самозарядным режимом стрельбы. На ствол могут устанавливаться различные дульные насадки, повышающие надежность и точность стрельбы из оружия, обладает высокой надежностью в эксплуатации.', N'34.jpg', 3300, N'410', 10, 2)
INSERT [dbo].[Weapon] ([Id], [Title], [Description], [Photo], [Weight], [Сaliber], [MagazineSize], [CategoryId]) VALUES (6, N'«САЙГА-20»', N'Самозарядное ружьё, разработанное на Ижевском машиностроительном заводе на базе автомата Калашникова и предназначенное для промысловой и любительской охоты на мелкого, среднего зверя и птицу в районах с любыми климатическими условиями.', N'55.jpg', 3200, N'20', 8, 2)
INSERT [dbo].[Weapon] ([Id], [Title], [Description], [Photo], [Weight], [Сaliber], [MagazineSize], [CategoryId]) VALUES (7, N'МР-71', N'Служебный пистолет МР-71используется охранными и силовыми структурами.Пистолет создан на базе легендарного пистолета Макарова. Конструкция основных узлов и механизмов идентична своему прототипу и отработана за время серийного производства до высочайшего уровня надежности.', N'16.jpg', 730, N'9', 8, 3)
INSERT [dbo].[Weapon] ([Id], [Title], [Description], [Photo], [Weight], [Сaliber], [MagazineSize], [CategoryId]) VALUES (8, N'МР-79-9ТМ', N'Огнестрельное оружие ограниченного поражения, является одним из самых популярных образцов травматического оружия в России, благодаря доверию к конструкции пистолета Макарова, отличающейся надежностью в работе и простоте. К тому же травматический пистолет МР-79-9ТМ весьма удобен для скрытого ношения из-за достаточно небольших габаритов.', N'17.jpg', 630, N'9', 8, 3)
INSERT [dbo].[Weapon] ([Id], [Title], [Description], [Photo], [Weight], [Сaliber], [MagazineSize], [CategoryId]) VALUES (9, N'Пистолет спортивный С-ТТ (Тульский Токарева) калибра 7,62х25', N'Пистолет ТТ отличается простотой конструкции и в силу этого — невысокой себестоимостью производства и легкостью в обслуживании. Нетипичный для пистолетов очень мощный патрон обеспечивает необычно высокую проникающую способность и дульную энергию около 500 Дж. Пистолет имеет короткий легкий спуск и обеспечивает значительную точность стрельбы, опытный стрелок способен поразить цель на дистанциях более 50 метров. Пистолет плоский и достаточно компактный, что удобно для скрытого ношения.', N'18.jpg', 1650, N'7.62', 8, 3)
INSERT [dbo].[Weapon] ([Id], [Title], [Description], [Photo], [Weight], [Сaliber], [MagazineSize], [CategoryId]) VALUES (10, N'Пневматический пистолет Gletcher TT NBB (Токарева)', N'Это газобаллонный пневматический пистолет, который применяется для развлекательной или тренировочной стрельбы. Это достаточно точная копия легендарного пистолета ТТ. Черный корпус полностью сделан из качественного металлического сплава.', N'19.jpg', 620, N'4.5', 18, 4)
INSERT [dbo].[Weapon] ([Id], [Title], [Description], [Photo], [Weight], [Сaliber], [MagazineSize], [CategoryId]) VALUES (11, N'Пневматический пистолет МР-654К', N'Представляет собой одну из наиболее ранних газобаллонных копий пистолета Макарова. Пистолет много лет производят на Ижевском механическом заводе, на котором ранее производились боевые пистолеты Макарова (ПМ), что позволило максимально приблизить внешний вид пневматического пистолета к боевому экземпляру.', N'110.jpg', 720, N'4', 13, 4)
INSERT [dbo].[Weapon] ([Id], [Title], [Description], [Photo], [Weight], [Сaliber], [MagazineSize], [CategoryId]) VALUES (12, N'Пневматический пистолет-пулемет UZM (MiniUzi)', N'Прототипом UZM является легендарный израильский УЗИ. Так же как и огнестрельный оригинал, копия собой представляет универсальный, портативный и практичный пулемет.прекрасно подходит для спортивной или развлекательной стрельбы, сходство с оригиналом и вполне достаточная мощность выстрела дополняется очень высокой кучностью стрельбы как в обычном, так и в полноценном автоматическом режиме. Для еще большего сходства в пистолете сделана имитация откидывания затвора.', N'211.jpg', 1600, N'4.5', 24, 4)
INSERT [dbo].[Weapon] ([Id], [Title], [Description], [Photo], [Weight], [Сaliber], [MagazineSize], [CategoryId]) VALUES (13, N'Пневматическая винтовка ALFAMAX мод.12', N'Особенности модели:- нарезной стальной ствол;- ручной предохранитель, а также автоматический предохранитель при взводе винтовки;- защитный механизм, блокирующий случайное снятие предохранителя при взводе;- эргономичный и стильный приклад изготовлен из синтетического волокна;- насечки на поверхности ручки для лучшего контроля над оружием;- резиновый затыльник приклада для уменьшения отдачи;- направляющие для установки прицела, гаситель колебаний прицела при выстреле;- спусковой крючок с настраиваемым усилием спуска;- опто-волоконная (TruGlo) микрометрическая прицельная планка, настраиваемая по горизонтали и по вертикали;- опто-волоконная (TruGlo) мушка.', N'212.jpg', 2900, N'4.5', 1, 4)
INSERT [dbo].[Weapon] ([Id], [Title], [Description], [Photo], [Weight], [Сaliber], [MagazineSize], [CategoryId]) VALUES (14, N'Пневматический автомат ВПО-512 ППШ-М', N'Данное изделие собрано в конструктиве из раритета - пистолета-пулемета Шпагина ППШ-41 и имеет название ППШ-М, в жаргоне - «Папаша». Внешне изделие полностью соответствует боевому ППШ-41, используемый в Великой Отечественной войне.', N'213.jpg', 4500, N'4.5', 17, 4)
SET IDENTITY_INSERT [dbo].[Weapon] OFF
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
ALTER DATABASE [ShootingClubDB] SET  READ_WRITE 
GO
