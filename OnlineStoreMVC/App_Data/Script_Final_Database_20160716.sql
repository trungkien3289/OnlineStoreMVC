USE [master]
GO
/****** Object:  Database [OnlineStoreMVC]    Script Date: 7/16/2016 11:03:16 PM ******/
CREATE DATABASE [OnlineStoreMVC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineStoreMVC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\OnlineStoreMVC.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'OnlineStoreMVC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\OnlineStoreMVC_log.ldf' , SIZE = 1344KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [OnlineStoreMVC] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineStoreMVC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineStoreMVC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineStoreMVC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineStoreMVC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineStoreMVC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineStoreMVC] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineStoreMVC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineStoreMVC] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineStoreMVC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineStoreMVC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineStoreMVC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineStoreMVC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineStoreMVC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineStoreMVC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineStoreMVC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineStoreMVC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineStoreMVC] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OnlineStoreMVC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineStoreMVC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineStoreMVC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineStoreMVC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineStoreMVC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineStoreMVC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineStoreMVC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineStoreMVC] SET RECOVERY FULL 
GO
ALTER DATABASE [OnlineStoreMVC] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineStoreMVC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineStoreMVC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineStoreMVC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineStoreMVC] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'OnlineStoreMVC', N'ON'
GO
USE [OnlineStoreMVC]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 7/16/2016 11:03:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 7/16/2016 11:03:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 7/16/2016 11:03:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 7/16/2016 11:03:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 7/16/2016 11:03:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 7/16/2016 11:03:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cms_Categories]    Script Date: 7/16/2016 11:03:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cms_Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NULL,
	[Title] [nvarchar](300) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Url] [nvarchar](200) NULL,
	[SortOrder] [int] NULL,
	[Status] [int] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_cms_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cms_News]    Script Date: 7/16/2016 11:03:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cms_News](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CoverImageId] [int] NULL,
	[Title] [nvarchar](200) NOT NULL,
	[SubTitle] [nvarchar](200) NOT NULL,
	[ContentNews] [nvarchar](max) NOT NULL,
	[Authors] [nvarchar](200) NULL,
	[Tags] [nvarchar](200) NULL,
	[TotalView] [int] NULL,
	[SortOrder] [int] NULL,
	[Status] [int] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_cms_News] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ecom_Brands]    Script Date: 7/16/2016 11:03:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ecom_Brands](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_ecom_Brands] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ecom_Categories]    Script Date: 7/16/2016 11:03:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ecom_Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](250) NOT NULL,
	[ParentId] [int] NULL,
	[Description] [nvarchar](500) NULL,
	[Url] [nvarchar](200) NULL,
	[SortOrder] [int] NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ecom_OrderDetails]    Script Date: 7/16/2016 11:03:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ecom_OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[PriceOfUnit] [money] NOT NULL,
	[TotalDiscount] [money] NULL,
	[TotalOrder] [money] NOT NULL,
	[Status] [int] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_product_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ecom_Orders]    Script Date: 7/16/2016 11:03:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ecom_Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderCode] [nchar](100) NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[TotalPrice] [decimal](19, 4) NOT NULL,
	[FeeShip] [decimal](19, 4) NOT NULL,
	[TotalOrder] [decimal](19, 4) NOT NULL,
	[OrderStatus] [int] NOT NULL,
	[OrderNote] [nvarchar](500) NULL,
	[NameOfRecipient] [nchar](200) NULL,
	[PhoneOfRecipient] [nvarchar](100) NOT NULL,
	[AddressOfRecipient] [nvarchar](500) NOT NULL,
	[Status] [int] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_product_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ecom_Products]    Script Date: 7/16/2016 11:03:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ecom_Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductCode] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Price] [money] NOT NULL,
	[Quantity] [int] NULL,
	[Unit] [int] NULL,
	[BrandId] [int] NULL,
	[CoverImageId] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[Description2] [nvarchar](max) NULL,
	[TotalView] [int] NULL,
	[TotalBuy] [int] NULL,
	[Tags] [nvarchar](200) NULL,
	[IsNewProduct] [bit] NOT NULL,
	[IsBestSellProduct] [bit] NOT NULL,
	[SortOrder] [int] NULL,
	[Status] [int] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_ecom_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ecom_Products_Categories]    Script Date: 7/16/2016 11:03:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ecom_Products_Categories](
	[ProductId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_ecom_Products_Categories] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ecom_Products_Images]    Script Date: 7/16/2016 11:03:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ecom_Products_Images](
	[ProductId] [int] NOT NULL,
	[ImageId] [int] NOT NULL,
 CONSTRAINT [PK_ecom_Products_Images] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[share_Categories]    Script Date: 7/16/2016 11:03:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[share_Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[ParentId] [int] NULL,
	[SortOrder] [int] NULL,
	[Type] [int] NULL,
	[Status] [int] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_share_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[share_Images]    Script Date: 7/16/2016 11:03:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[share_Images](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageName] [nvarchar](300) NOT NULL,
	[ImagePath] [nvarchar](700) NOT NULL,
	[Status] [int] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_share_Images] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[system_Banners]    Script Date: 7/16/2016 11:03:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[system_Banners](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageId] [int] NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Type] [int] NULL,
	[SortOrder] [int] NULL,
	[Status] [int] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_system_Banners] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[system_Config]    Script Date: 7/16/2016 11:03:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[system_Config](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Value] [nvarchar](500) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_system_tracking] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[system_Menu]    Script Date: 7/16/2016 11:03:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[system_Menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Url] [nvarchar](500) NULL,
	[SortOrder] [int] NULL,
	[Target] [nvarchar](50) NULL,
	[Type] [int] NULL,
	[Icon] [nvarchar](250) NULL,
	[Status] [int] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_system_Menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[system_Profiles]    Script Date: 7/16/2016 11:03:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[system_Profiles](
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](200) NULL,
	[Emaill] [nvarchar](200) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
	[Phone] [nvarchar](200) NULL,
	[Address] [nvarchar](500) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_system_profiles_1] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'admin', N'Administrator')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'user', N'User')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'admin')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'admin@admin.com', 0, N'ALTLD2XQj20rF1Dv707/hCYZsfjBC3sJeg9b44xGovSfBU7nTcjh/G4ZiYApydqCzQ==', N'26696055-fdf6-4204-a4a5-12ac33f5c991', NULL, 0, 0, NULL, 1, 0, N'admin@admin.com')
SET IDENTITY_INSERT [dbo].[cms_Categories] ON 

INSERT [dbo].[cms_Categories] ([Id], [ParentId], [Title], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, NULL, N'Test', N'test', N'tétt', 1, 1, NULL, CAST(0x0000A631015E8660 AS DateTime), NULL, CAST(0x0000A6370170B6F8 AS DateTime))
INSERT [dbo].[cms_Categories] ([Id], [ParentId], [Title], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2, 1, N'test1', N'11', N'1', 1, 1, NULL, CAST(0x0000A6330167D922 AS DateTime), NULL, CAST(0x0000A6330167D922 AS DateTime))
INSERT [dbo].[cms_Categories] ([Id], [ParentId], [Title], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (3, 4, N'test2', N'1', N'1', NULL, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[cms_Categories] ([Id], [ParentId], [Title], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (4, 1, N'test3', NULL, NULL, NULL, 1, NULL, CAST(0x0000A63301688862 AS DateTime), NULL, CAST(0x0000A63301688862 AS DateTime))
INSERT [dbo].[cms_Categories] ([Id], [ParentId], [Title], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (5, NULL, N'ABC', N'1', NULL, 1, 1, NULL, CAST(0x0000A6330168924C AS DateTime), NULL, CAST(0x0000A6330174BB61 AS DateTime))
INSERT [dbo].[cms_Categories] ([Id], [ParentId], [Title], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (6, 5, N'ABC 1', NULL, NULL, NULL, 1, NULL, CAST(0x0000A6330170F3D1 AS DateTime), NULL, CAST(0x0000A6330170F3D1 AS DateTime))
SET IDENTITY_INSERT [dbo].[cms_Categories] OFF
SET IDENTITY_INSERT [dbo].[cms_News] ON 

INSERT [dbo].[cms_News] ([Id], [CategoryId], [CoverImageId], [Title], [SubTitle], [ContentNews], [Authors], [Tags], [TotalView], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (8, 1, 51, N'test', N'test', N'<p>test</p>
', N'test', N'test', 1, NULL, 1, NULL, CAST(0x0000A645017B1245 AS DateTime), NULL, CAST(0x0000A645017B1245 AS DateTime))
SET IDENTITY_INSERT [dbo].[cms_News] OFF
SET IDENTITY_INSERT [dbo].[ecom_Brands] ON 

INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (3, N'Ashley 2', N' thương hiệu nội thất hàng đầu nước Mỹ đến VN', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (6, N'czxczx', N'zxczxczxc', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (7, N'zxczxc', N'zxczxc', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (8, N'zxczxc', N'zxczxc', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (9, N'zxczxc', N'xczxczxc', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (10, N'ádasd', N'dsasd', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (11, N'ádasd', N'ádasd', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (12, N'ádasd', N'ádasd', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (13, N'ádasd', N'ádasd', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (14, N'xcvxcv', N'xcvxcv', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (15, N'xcvxcv', N'xcvxcv', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (16, N'kaka', N'áddsas', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (17, N'Samsung', N'Samsung', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (18, N'Nike', N'Nike', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (19, N'Adidas', N'Adidas', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (20, N'BQ', N'BQ', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (21, N'jjj', N'kkk', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (22, N'hhhh', N'hhhh', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (23, N'gggg', N'ggg', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (24, N'Ashley', N'Thương hiệu nội thất từ mỹ', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[ecom_Brands] ([Id], [Name], [Description], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (25, N'Nella Vetrina', N'Thương hiệu nội thất ý', 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ecom_Brands] OFF
SET IDENTITY_INSERT [dbo].[ecom_Categories] ON 

INSERT [dbo].[ecom_Categories] ([Id], [Name], [ParentId], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2, N'Giường                                                                                                                                                                                                                                                   ', 4, N'Giường gỗ chất lượng cao nhập khẩu từ EU', N'Giuong', 2, 0, NULL, CAST(0x0000A63500757E7B AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_Categories] ([Id], [Name], [ParentId], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (3, N'Sàn gỗ cao cấp                                                                                                                                                                                                                                         ', NULL, N'Chuyên cung cấp các loại sàn gỗ các loại ', N'SanGoCaoCap', 3, 1, NULL, CAST(0x0000A635007611F4 AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_Categories] ([Id], [Name], [ParentId], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (4, N'Đèn trang trí                                                                                                                                                                                                                                           ', 3, N'Đèn trang trí phòng khách, phòng ngủ, sân vường theo phong cách châu âu', N'DenTrangTri', 4, 1, NULL, CAST(0x0000A63500766D13 AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_Categories] ([Id], [Name], [ParentId], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (5, N'Noi that nha bep                                                                                                                                                                                                                                          ', NULL, N'aaa', N'NoiThatNhaBep', 1, 1, NULL, CAST(0x0000A635017000EB AS DateTime), NULL, NULL)
INSERT [dbo].[ecom_Categories] ([Id], [Name], [ParentId], [Description], [Url], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (7, N'Nội thất nhà tắm                                                                                                                                                                                                                                          ', NULL, N'Cung cấp các loại vòi hoa sen, vòi chia nóng lạnh, bồn tắm thông minh', N'category/voi-thong-minh', 1, 1, NULL, CAST(0x0000A63E01014892 AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[ecom_Categories] OFF
SET IDENTITY_INSERT [dbo].[share_Categories] ON 

INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'An Giang', NULL, 6, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2, N'Bà Rịa - Vũng Tàu', NULL, 7, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (3, N'Bắc Giang', NULL, 8, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (4, N'Bắc Cạn', NULL, 9, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (5, N'Bạc Liêu', NULL, 10, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (6, N'Bắc Ninh', NULL, 11, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (7, N'Bến Tre', NULL, 12, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (8, N'Bình Định', NULL, 13, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (9, N'Bình Dương', NULL, 14, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (10, N'Bình Phước', NULL, 15, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (11, N'Bình Thuận', NULL, 16, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (12, N'Cà Mau', NULL, 17, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (13, N'Cao Bằng', NULL, 18, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (14, N'Đắc Lắc', NULL, 19, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (15, N'Đắk Nông', NULL, 20, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (16, N'Điện Biên', NULL, 21, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (17, N'Đồng Nai', NULL, 22, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (18, N'Đồng Tháp', NULL, 23, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (19, N'Gia Lai', NULL, 24, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (20, N'Hà Giang', NULL, 25, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (21, N'Hà Nam', NULL, 26, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (22, N'Hà Tĩnh', NULL, 27, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (23, N'Hải Dương', NULL, 28, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (24, N'Hậu Giang', NULL, 29, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (25, N'Hòa Bình', NULL, 30, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (26, N'Hưng Yên', NULL, 31, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (27, N'Khánh Hòa', NULL, 32, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (28, N'Kiên Giang', NULL, 33, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (29, N'Kon Tum', NULL, 34, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (30, N'Lai Châu', NULL, 35, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (31, N'Lâm Đồng', NULL, 36, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (32, N'Lạng Sơn', NULL, 37, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (33, N'Lào Cai', NULL, 38, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (34, N'Long An', NULL, 39, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (35, N'Nam Định', NULL, 40, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (36, N'Nghệ An', NULL, 41, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (37, N'Ninh Bình', NULL, 42, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (38, N'Ninh Thuận', NULL, 43, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (39, N'Phú Thọ', NULL, 44, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (40, N'Quảng Bình', NULL, 45, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (41, N'Quảng Nam', NULL, 46, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (42, N'Quảng Ngãi', NULL, 47, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (43, N'Quảng Ninh', NULL, 48, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (44, N'Quảng Trị', NULL, 49, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (45, N'Sóc Trăng', NULL, 50, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (46, N'Sơn La', NULL, 51, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (47, N'Tây Ninh', NULL, 52, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (48, N'Thái Bình', NULL, 53, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (49, N'Thái Nguyên', NULL, 54, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (50, N'Thanh Hóa', NULL, 55, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (51, N'Thừa Thiên Huế', NULL, 56, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (52, N'Tiền Giang', NULL, 57, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (53, N'Trà Vinh', NULL, 58, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (54, N'Tuyên Quang', NULL, 59, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (55, N'Vĩnh Long', NULL, 60, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (56, N'Vĩnh Phúc', NULL, 61, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (57, N'Yên Bái', NULL, 62, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (58, N'Phú Yên', NULL, 63, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (59, N'Cần Thơ', NULL, 3, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (60, N'Đà Nẵng', NULL, 4, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (61, N'Hải Phòng', NULL, 5, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (62, N'Hà Nội', NULL, 2, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (63, N'Hồ Chí Minh', NULL, 1, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (64, N'Quận Ba Đình', 62, 1, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (65, N'Quận Hoàn Kiếm', 62, 2, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (66, N'Quận Hai Bà Trưng', 62, 3, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (67, N'Quận Đống Đa', 62, 4, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (68, N'Quận Tây Hồ', 62, 5, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (69, N'Quận Cầu Giấy', 62, 6, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (70, N'Quận Thanh Xuân', 62, 7, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (71, N'Quận Hoàng Mai', 62, 8, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (72, N'Quận Long Biên', 62, 9, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (73, N'Huyện Từ Liêm', 62, 10, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (74, N'Huyện Thanh Trì', 62, 11, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (75, N'Huyện Gia Lâm', 62, 12, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (76, N'Huyện Đông Anh', 62, 13, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (77, N'Huyện Sóc Sơn', 62, 14, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (78, N'TP Hà Đông', 62, 15, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (79, N'TP Sơn Tây', 62, 16, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (80, N'Huyện Ba Vì', 62, 17, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (81, N'Huyện Phúc Thọ', 62, 18, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (82, N'Huyện Thạch Thất', 62, 19, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (83, N'Huyện Quốc Oai', 62, 20, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (84, N'Huyện Chương Mỹ', 62, 21, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (85, N'Huyện Đan Phượng', 62, 22, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (86, N'Huyện Hoài Đức', 62, 23, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (87, N'Huyện Thanh Oai', 62, 24, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (88, N'Huyện Mỹ Đức', 62, 25, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (89, N'Huyện Ứng Hoà', 62, 26, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (90, N'Huyện Thường Tín', 62, 27, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (91, N'Huyện Phú Xuyên', 62, 28, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (92, N'Huyện Mê Linh', 62, 29, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (93, N'Quận Một', 63, 30, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (94, N'Quận Hai', 63, 31, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (95, N'Quận Ba  ', 63, 32, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (96, N'Quận Bốn', 63, 33, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (97, N'Quận Năm', 63, 34, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (98, N'Quận Sáu', 63, 35, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (99, N'Quận Bảy', 63, 36, 2, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (100, N'Quận Tám', 63, 37, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (101, N'Quận Chín', 63, 38, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (102, N'Quận Mười', 63, 39, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (103, N'Quận Mười một', 63, 40, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (104, N'Quận Mười hai', 63, 41, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (105, N'Quận Gò Vấp', 63, 42, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (106, N'Quận Tân Bình', 63, 43, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (107, N'Quận Tân Phú', 63, 44, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (108, N'Quận Bình Thạnh', 63, 45, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (109, N'Quận Phú Nhuận', 63, 46, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (110, N'Quận Thủ Đức', 63, 47, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (111, N'Quận Bình Tân', 63, 48, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (112, N'Huyện Bình Chánh', 63, 49, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (113, N'Huyện Củ Chi', 63, 50, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (114, N'Huyện Hóc Môn', 63, 51, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (115, N'Huyện Nhà Bè', 63, 52, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (116, N'Huyện Cần Giờ', 63, 53, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (117, N'Quận Hồng Bàng', 61, 54, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (118, N'Quận Lê Chân', 61, 55, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (119, N'Quận Ngô Quyền', 61, 56, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (120, N'Quận Kiến An', 61, 57, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (121, N'Quận Hải An  ', 61, 58, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (122, N'Quận Đồ Sơn', 61, 59, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (123, N'Huyện An Lão', 61, 60, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (124, N'Huyện Kiến Thụy', 61, 61, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (125, N'Huyện Thủy Nguyên', 61, 62, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (126, N'Huyện An Dương', 61, 63, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (127, N'Huyện Tiên Lãng', 61, 64, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (128, N'Huyện Vĩnh Bảo', 61, 65, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (129, N'Huyện Cát Hải', 61, 66, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (130, N'Huyện Bạch Long Vĩ', 61, 67, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (131, N'Quận Dương Kinh', 61, 68, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (132, N'Quận Hải Châu', 60, 69, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (133, N'Quận Thanh Khê', 60, 70, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (134, N'Quận Sơn Trà', 60, 71, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (135, N'Quận Ngũ Hành Sơn', 60, 72, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (136, N'Quận Liên Chiểu', 60, 73, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (137, N'Huyện Hoà Vang', 60, 74, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (138, N'Quận Cẩm Lệ', 60, 75, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (139, N'Thị xã Hà Giang', 20, 76, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (140, N'Huyện Đồng Văn', 20, 77, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (141, N'Huyện Mèo Vạc', 20, 78, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (142, N'Huyện Yên Minh', 20, 79, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (143, N'Huyện Quản Bạ', 20, 80, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (144, N'Huyện Vị Xuyên', 20, 81, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (145, N'Huyện Bắc Mê', 20, 82, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (146, N'Huyện Hoàng Su Phì', 20, 83, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (147, N'Huyện Xín Mần', 20, 84, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (148, N'Huyện Bắc Quang', 20, 85, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (149, N'Huyện Quang Bình', 20, 86, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (150, N'Thị xã Cao Bằng', 13, 87, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (151, N'Huyện Bảo Lạc', 13, 88, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (152, N'Huyện Thông Nông', 13, 89, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (153, N'Huyện Hà Quảng', 13, 90, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (154, N'Huyện Trà Lĩnh', 13, 91, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (155, N'Huyện Trùng Khánh', 13, 92, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (156, N'Huyện Nguyên Bình', 13, 93, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (157, N'Huyện Hòa An', 13, 94, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (158, N'Huyện Quảng Uyên', 13, 95, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (159, N'Huyện Thạch An', 13, 96, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (160, N'Huyện Hạ Lang', 13, 97, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (161, N'Huyện Bảo Lâm', 13, 98, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (162, N'Huyện Phục Hòa', 13, 99, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (163, N'Thị xã Lai Châu', 30, 100, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (164, N'Huyện Tam Đường', 30, 101, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (165, N'Huyện Phong Thổ', 30, 102, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (166, N'Huyện Sìn Hồ', 30, 103, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (167, N'Huyện Mường Tè', 30, 104, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (168, N'Huyện Than Uyên', 30, 105, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (169, N'Huyện Tân Uyên', 30, 106, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (170, N'TP Lào Cai', 33, 107, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (171, N' Huyện Xi Ma Cai', 33, 108, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (172, N'Huyện Bát Xát', 33, 109, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (173, N'Huyện Bảo Thắng', 33, 110, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (174, N'Huyện Sa Pa', 33, 111, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (175, N'Huyện Văn Bàn', 33, 112, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (176, N'Huyện Bảo Yên', 33, 113, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (177, N'Huyện Bắc Hà', 33, 114, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (178, N'Huyện Mường Khương', 33, 115, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (179, N'Thị xã Tuyên Quang', 54, 116, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (180, N'Huyện Na Hang', 54, 117, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (181, N'Huyện Chiêm Hóa', 54, 118, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (182, N'Huyện  Hàm Yên', 54, 119, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (183, N'Huyện Yên Sơn  ', 54, 120, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (184, N'Huyện Sơn Dương', 54, 121, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (185, N'TP Lạng Sơn', 32, 122, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (186, N'Huyện  Tràng Định', 32, 123, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (187, N'Huyện Bình Gia', 32, 124, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (188, N'Huyện  Văn Lãng', 32, 125, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (189, N'Huyện Bắc Sơn', 32, 126, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (190, N'Huyện Văn Quan', 32, 127, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (191, N'Huyện Cao Lộc', 32, 128, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (192, N'Huyện Lộc Bình', 32, 129, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (193, N'Huyện Chi Lăng', 32, 130, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (194, N'Huyện  Đình Lập', 32, 131, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (195, N'Huyện Hữu Lũng', 32, 132, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (196, N'Thị xã Bắc Kạn', 4, 133, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (197, N'Huyện Chợ Đồn', 4, 134, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (198, N'Huyện Bạch Thông', 4, 135, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (199, N'Huyện Na Rì', 4, 136, 2, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (200, N'Huyện Ngân Sơn', 4, 137, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (201, N'Huyện Ba Bể', 4, 138, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (202, N'Huyện Chợ Mới', 4, 139, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (203, N'Huyện Pác Nặm', 4, 140, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (204, N'TP Thái Nguyên', 49, 141, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (205, N'Thị xã Sông Công', 49, 142, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (206, N'Huyện Định Hóa', 49, 143, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (207, N'Huyện Phú Lương', 49, 144, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (208, N'Huyện Võ Nhai', 49, 145, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (209, N'Huyện Đại Từ', 49, 146, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (210, N'Huyện Đồng Hỷ', 49, 147, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (211, N'Huyện Phú Bình', 49, 148, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (212, N'Huyện Phổ Yên', 49, 149, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (213, N'TP Yên Bái', 57, 150, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (214, N'Thị xã Nghĩa Lộ', 57, 151, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (215, N'Huyện Văn Yên', 57, 152, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (216, N'Huyện Yên Bình', 57, 153, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (217, N'Huyện Mù Cang Chải', 57, 154, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (218, N'Huyện Văn Chấn', 57, 155, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (219, N'Huyện Trấn Yên', 57, 156, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (220, N'Huyện Trạm Tấu', 57, 157, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (221, N'Huyện Lục Yên', 57, 158, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (222, N'Thị xã Sơn La', 46, 159, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (223, N'Huyện Quỳnh Nhai', 46, 160, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (224, N'Huyện Mường La', 46, 161, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (225, N'Huyện Thuận Châu', 46, 162, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (226, N'Huyện Bắc Yên', 46, 163, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (227, N'Huyện Phù Yên', 46, 164, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (228, N'Huyện Mai Sơn', 46, 165, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (229, N'Huyện Yên Châu', 46, 166, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (230, N'Huyện Sông Mã', 46, 167, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (231, N'Huyện Mộc Châu', 46, 168, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (232, N'Huyện Sốp Cộp', 46, 169, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (233, N'TP Việt Trì', 39, 170, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (234, N'Thị xã Phú Thọ', 39, 171, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (235, N'Huyện Đoan Hùng', 39, 172, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (236, N'Huyện Thanh Ba', 39, 173, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (237, N'Huyện Hạ Hòa', 39, 174, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (238, N'Huyện Cẩm Khê', 39, 175, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (239, N'Huyện Yên Lập', 39, 176, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (240, N'Huyện Thanh Sơn', 39, 177, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (241, N'Huyện Phù Ninh', 39, 178, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (242, N'Huyện Lâm Thao', 39, 179, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (243, N'Huyện Tam Nông', 39, 180, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (244, N'Huyện Thanh Thủy', 39, 181, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (245, N'Huyện Tân Sơn', 39, 182, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (246, N'TP Vĩnh Yên', 56, 183, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (247, N'Huyện Tam Dương', 56, 184, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (248, N'Huyện Lập Thạch', 56, 185, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (249, N'Huyện Vĩnh Tường', 56, 186, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (250, N'Huyện Yên Lạc', 56, 187, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (251, N'Huyện Bình Xuyên', 56, 188, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (252, N'Thị xã Phúc Yên', 56, 189, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (253, N'Huyện Tam Đảo', 56, 190, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (254, N'TP Hạ Long', 43, 191, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (255, N'Thị xã Cẩm Phả', 43, 192, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (256, N'Thị xã Uông Bí', 43, 193, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (257, N'TP Móng Cái', 43, 194, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (258, N'Huyện Bình Liêu', 43, 195, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (259, N'Huyện Đầm Hà', 43, 196, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (260, N'Huyện Hải Hà', 43, 197, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (261, N'Huyện Tiên Yên', 43, 198, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (262, N'Huyện Ba Chẽ', 43, 199, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (263, N'Huyện Đông Triều', 43, 200, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (264, N'Huyện Yên Hưng', 43, 201, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (265, N'Huyện Hoành Bồ', 43, 202, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (266, N'Huyện Vân Đồn', 43, 203, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (267, N'Huyện Cô Tô', 43, 204, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (268, N'TP Bắc Giang  ', 3, 205, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (269, N'Huyện Yên Thế', 3, 206, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (270, N'Huyện Lục Ngạn', 3, 207, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (271, N'Huyện Sơn Động  ', 3, 208, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (272, N'Huyện Lục Nam', 3, 209, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (273, N'Huyện Tân Yên', 3, 210, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (274, N'Huyện Hiệp Hoà', 3, 211, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (275, N'Huyện Lạng Giang', 3, 212, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (276, N'Huyện Việt Yên', 3, 213, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (277, N'Huyện Yên Dũng', 3, 214, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (278, N'TP Bắc Ninh                               ', 3, 215, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (279, N'Huyện Yên Phong', 3, 216, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (280, N'Huyện Quế Võ.', 3, 217, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (281, N'Huyện Tiên Du', 3, 218, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (282, N'Huyện Từ  Sơn', 3, 219, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (283, N'Huyện Thuận Thành', 3, 220, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (284, N'Huyện Gia Bình        ', 3, 221, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (285, N'Huyện Lương Tài', 3, 222, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (286, N'TP Hải Dương', 23, 223, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (287, N'Huyện Chí Linh', 23, 224, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (288, N'Huyện Nam Sách', 23, 225, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (289, N'Huyện Kinh Môn', 23, 226, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (290, N'Huyện Gia Lộc', 23, 227, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (291, N'Huyện Tứ Kỳ', 23, 228, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (292, N'Huyện Thanh Miện', 23, 229, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (293, N'Huyện Ninh Giang', 23, 230, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (294, N'Huyện Cẩm Giàng', 23, 231, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (295, N'Huyện Thanh Hà', 23, 232, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (296, N'Huyện Kim Thành', 23, 233, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (297, N'Huyện Bình Giang', 23, 234, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (298, N'Thị xã Hưng Yên', 26, 235, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (299, N'Huyện Kim Động', 26, 236, 2, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (300, N'Huyện Ân Thi', 26, 237, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (301, N'Huyện Khoái Châu', 26, 238, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (302, N'Huyện Yên Mỹ', 26, 239, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (303, N'Huyện Tiên Lữ', 26, 240, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (304, N'Huyện Phù Cừ', 26, 241, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (305, N'Huyện Mỹ Hào', 26, 242, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (306, N'Huyện Văn Lâm', 26, 243, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (307, N'Huyện Văn Giang', 26, 244, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (308, N'TP Hòa Bình', 25, 245, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (309, N'Huyện Đà Bắc', 25, 246, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (310, N'Huyện Mai Châu', 25, 247, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (311, N'Huyện Tân Lạc', 25, 248, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (312, N'Huyện Lạc Sơn', 25, 249, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (313, N'Huyện Kỳ Sơn', 25, 250, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (314, N'Huyện Lư¬ơng Sơn', 25, 251, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (315, N'Huyện Kim Bôi', 25, 252, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (316, N'Huyện Lạc Thủy', 25, 253, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (317, N'Huyện Yên Thủy', 25, 254, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (318, N'Huyện Cao Phong', 25, 255, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (319, N'TP Phủ Lý', 21, 256, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (320, N'Huyện Duy Tiên', 21, 257, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (321, N'Huyện Kim Bảng', 21, 258, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (322, N'Huyện Lý Nhân', 21, 259, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (323, N'Huỵện Thanh Liêm', 21, 260, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (324, N'Huyện Bình Lục', 21, 261, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (325, N'TP Nam Định', 35, 262, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (326, N'Huyện Mỹ Lộc', 35, 263, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (327, N'Huyện Xuân Trường', 35, 264, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (328, N'Huyện Giao Thủy', 35, 265, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (329, N'Huyện Ý Yên', 35, 266, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (330, N'Huyện Vụ Bản', 35, 267, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (331, N'Huyện Nam Trực', 35, 268, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (332, N'Huyện Trực Ninh', 35, 269, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (333, N'Huyện Nghĩa Hưng', 35, 270, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (334, N'Huyện Hải Hậu', 35, 271, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (335, N'TP Thái Bình', 48, 272, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (336, N'Huyện Quỳnh Phụ', 48, 273, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (337, N'Huyện Hưng Hà', 48, 274, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (338, N'Huyện Đông Hưng', 48, 275, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (339, N'Huyện Vũ Thư', 48, 276, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (340, N'Huyện Kiến Xương', 48, 277, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (341, N'Huyện Tiền Hải', 48, 278, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (342, N'Huyện Thái Thuỵ', 48, 279, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (343, N'TP Ninh Bình', 37, 280, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (344, N'Thị xã Tam Điệp', 37, 281, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (345, N'Huyện Nho Quan', 37, 282, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (346, N'Huyện Gia Viễn', 37, 283, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (347, N'Huyện Hoa Lư', 37, 284, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (348, N'Huyện Yên Mô', 37, 285, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (349, N'Huyện Kim Sơn', 37, 286, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (350, N'Huyện Yên Khánh', 37, 287, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (351, N'TP Thanh Hóa', 50, 288, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (352, N'Thị xã Bỉm Sơn', 50, 289, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (353, N'Thị xã Sầm Sơn', 50, 290, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (354, N'Huyện Quan Hóa', 50, 291, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (355, N'Huyện Quan Sơn', 50, 292, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (356, N'Huyện Mường Lát', 50, 293, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (357, N'Huyện Bá Thước', 50, 294, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (358, N'Huyện Thường Xuân', 50, 295, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (359, N'Huyện Như Xuân', 50, 296, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (360, N'Huyện Như Thanh', 50, 297, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (361, N'Huyện Lang Chánh', 50, 298, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (362, N'Huyện Ngọc Lặc', 50, 299, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (363, N'Huyện Thạch Thành', 50, 300, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (364, N'Huyện Cẩm Thủy', 50, 301, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (365, N'Huyện Thọ Xuân', 50, 302, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (366, N'Huyện Vĩnh Lộc', 50, 303, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (367, N'Huyện Thiệu Hóa', 50, 304, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (368, N'Huyện Triệu Sơn', 50, 305, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (369, N'Huyện Nông Cống', 50, 306, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (370, N'Huyện Đông Sơn  ', 50, 307, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (371, N'Huyện Hà Trung', 50, 308, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (372, N'Huyện Hoằng Hóa', 50, 309, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (373, N'Huyện Nga Sơn', 50, 310, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (374, N'Huyện Hậu Lộc', 50, 311, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (375, N'Huyện Quảng Xương', 50, 312, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (376, N'Huyện Tĩnh Gia', 50, 313, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (377, N'Huyện Yên Định', 50, 314, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (378, N'TP Vinh', 36, 315, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (379, N'Thị xã Cửa Lò', 36, 316, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (380, N'Huyện Quỳ Châu', 36, 317, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (381, N'Huyện Quỳ Hợp', 36, 318, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (382, N'Huyện Nghĩa Đàn  ', 36, 319, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (383, N'Huyện Quỳnh Lưu', 36, 320, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (384, N'Huyện Kỳ Sơn', 36, 321, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (385, N'Huyện Tương Dương', 36, 322, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (386, N'Huyện Con Cuông', 36, 323, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (387, N'Huyện Tân Kỳ', 36, 324, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (388, N'Huyện Yên Thành  ', 36, 325, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (389, N'Huyện Diễn Châu', 36, 326, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (390, N'Huyện Anh Sơn', 36, 327, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (391, N'Huyện Đô Lương  ', 36, 328, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (392, N'Huyện Thanh Chương', 36, 329, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (393, N'Huyện Nghi Lộc', 36, 330, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (394, N'Huyện Nam Đàn', 36, 331, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (395, N'Huyện Hưng Nguyên', 36, 332, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (396, N'Huyện Quế Phong', 36, 333, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (397, N'TP Hà Tĩnh', 22, 334, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (398, N'Thị xã Hồng Lĩnh', 22, 335, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (399, N'Huyện Hương Sơn', 22, 336, 2, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (400, N'Huyện Đức Thọ', 22, 337, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (401, N'Huyện Nghi Xuân', 22, 338, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (402, N'Huyện Can Lộc', 22, 339, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (403, N'Huyện Hương Khê', 22, 340, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (404, N'Huyện Thạch Hà', 22, 341, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (405, N'Huyện Cẩm Xuyên', 22, 342, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (406, N'Huyện Kỳ Anh', 22, 343, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (407, N'Huyện Vũ Quang', 22, 344, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (408, N'Huyện Lộc Hà', 22, 345, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (409, N'TP Đồng Hới', 40, 346, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (410, N'Huyện Tuyên Hóa', 40, 347, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (411, N'Huyện Minh Hóa', 40, 348, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (412, N'Huyện Quảng Trạch  ', 40, 349, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (413, N'Huyện Bố Trạch', 40, 350, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (414, N'Huyện Quảng Ninh', 40, 351, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (415, N'Huyện Lệ Thủy', 40, 352, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (416, N'Thị xã Đông Hà', 44, 353, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (417, N'Thị xã Quảng Trị', 44, 354, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (418, N'Huyện Vĩnh Linh', 44, 355, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (419, N'Huyện Gio Linh', 44, 356, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (420, N'Huyện Cam Lộ', 44, 357, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (421, N'Huyện Triệu Phong', 44, 358, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (422, N'Huyện Hải Lăng', 44, 359, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (423, N'Huyện Hướng Hóa', 44, 360, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (424, N'Huyện Đăk Rông', 44, 361, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (425, N'Huyện đảo Cồn Cỏ', 44, 362, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (426, N'TP Huế', 51, 363, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (427, N'Huyện Phong Điền', 51, 364, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (428, N'Huyện Quảng Điền', 51, 365, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (429, N'Huyện Hương Trà', 51, 366, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (430, N'Huyện Phú Vang  ', 51, 367, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (431, N'Huyện Hương Thuỷ', 51, 368, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (432, N'Huyện Phú Lộc', 51, 369, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (433, N'Huyện Nam Đông', 51, 370, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (434, N'Huyện A Lưới', 51, 371, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (435, N'TP Tam Kỳ', 41, 372, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (436, N'TP Hội An', 41, 373, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (437, N'Huyện Duy Xuyên', 41, 374, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (438, N'Huyện Điện Bàn', 41, 375, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (439, N'Huyện Đại Lộc', 41, 376, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (440, N'Huyện Quế Sơn', 41, 377, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (441, N'Huyện Hiệp Đức', 41, 378, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (442, N'Huyện Thăng Bình', 41, 379, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (443, N'Huyện Núi Thành', 41, 380, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (444, N'Huyện Tiên Phước', 41, 381, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (445, N'Huyện Bắc Trà My', 41, 382, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (446, N'Huyện Đông Giang', 41, 383, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (447, N'Huyện Nam Giang', 41, 384, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (448, N'Huyện Phước Sơn', 41, 385, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (449, N'Huyện Nam Trà My', 41, 386, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (450, N'Huyện Tây Giang', 41, 387, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (451, N'Huyện Phú Ninh', 41, 388, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (452, N'Huyện Nông Sơn', 41, 389, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (453, N'TP Quảng Ngãi', 42, 390, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (454, N'Huyện Lý Sơn  ', 42, 391, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (455, N'Huyện Bình Sơn', 42, 392, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (456, N'Huyện Trà Bồng', 42, 393, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (457, N'Huyện Sơn Tịnh  ', 42, 394, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (458, N'Huyện Sơn Hà', 42, 395, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (459, N'Huyện Tư Nghĩa', 42, 396, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (460, N'Huyện Nghĩa Hành', 42, 397, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (461, N'Huyện Minh Long', 42, 398, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (462, N'Huyện Mộ Đức', 42, 399, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (463, N'Huyện Đức Phổ', 42, 400, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (464, N'Huyện Ba Tơ', 42, 401, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (465, N'Huyện Sơn Tây', 42, 402, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (466, N'Huyện Tây Trà', 42, 403, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (467, N'Thị xã KonTum', 29, 404, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (468, N'Huyện Đắk Glei', 29, 405, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (469, N'Huyện Ngọc Hồi', 29, 406, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (470, N'Huyện Đắk Tô', 29, 407, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (471, N'Huyện Sa Thầy', 29, 408, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (472, N'Huyện Kon Plong', 29, 409, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (473, N'Huyện Đắk Hà', 29, 410, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (474, N'Huyện Kon Rẫy', 29, 411, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (475, N'Huyện Tu Mơ Rông', 29, 412, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (476, N'TP Quy Nhơn', 8, 413, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (477, N'Huyện An Lão  ', 8, 414, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (478, N'Huyện Hoài Ân', 8, 415, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (479, N'Huyện Hoài Nhơn', 8, 416, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (480, N'Huyện Phù Mỹ', 8, 417, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (481, N'Huyện Phù Cát', 8, 418, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (482, N'Huyện Vĩnh Thạnh', 8, 419, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (483, N'Huyện Tây Sơn', 8, 420, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (484, N'Huyện Vân Canh', 8, 421, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (485, N'Huyện An Nhơn', 8, 422, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (486, N'Huyện Tuy Phước', 8, 423, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (487, N'TP Pleiku', 19, 424, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (488, N'Huyện Chư Păh', 19, 425, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (489, N'Huyện Mang Yang', 19, 426, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (490, N'Huyện Kbang', 19, 427, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (491, N'Thị xã An Khê  ', 19, 428, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (492, N'Huyện Kông Chro', 19, 429, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (493, N'Huyện Đức Cơ', 19, 430, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (494, N'Huyện Chưprông', 19, 431, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (495, N'Huyện Chư Sê', 19, 432, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (496, N'Huyện Ayunpa', 19, 433, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (497, N'Huyện Krông Pa', 19, 434, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (498, N'Huyện Ia Grai', 19, 435, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (499, N'Huyện Đăk Đoa', 19, 436, 2, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (500, N'Huyện Ia Pa', 19, 437, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (501, N'Huyện Đăk Pơ', 19, 438, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (502, N'Huyện Phú Thiện', 19, 439, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (503, N'TP Tuy Hòa', 58, 440, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (504, N'Huyện Đồng Xuân', 58, 441, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (505, N'Huyện Sông Cầu', 58, 442, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (506, N'Huyện Tuy An', 58, 443, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (507, N'Huyện Sơn Hòa', 58, 444, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (508, N'Huyện Sông Hinh', 58, 445, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (509, N'Huyện Đông Hòa', 58, 446, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (510, N'Huyện Phú Hoà', 58, 447, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (511, N'Huyện Tây Hòa', 58, 448, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (512, N'TP Buôn Ma Thuột', 14, 449, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (513, N'Huyện Ea H Leo', 14, 450, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (514, N'Huyện Krông Buk', 14, 451, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (515, N'Huyện Krông Năng', 14, 452, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (516, N'Huyện Ea Súp', 14, 453, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (517, N'Huyện Cư M gar', 14, 454, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (518, N'Huyện Krông Pắc', 14, 455, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (519, N'Huyện Ea Kar', 14, 456, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (520, N'Huyện M''Đrăk', 14, 457, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (521, N'Huyện Krông Ana', 14, 458, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (522, N'Huyện Krông Bông', 14, 459, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (523, N'Huyện Lăk', 14, 460, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (524, N'Huyện Buôn Đôn', 14, 461, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (525, N'Huyện Cư Kuin', 14, 462, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (526, N'TP Nha Trang', 27, 463, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (527, N'Huyện Vạn Ninh', 27, 464, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (528, N'Huyện Ninh Hòa', 27, 465, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (529, N'Huyện Diên Khánh', 27, 466, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (530, N'Huyện Khánh Vĩnh', 27, 467, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (531, N'Thị xã Cam Ranh', 27, 468, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (532, N'Huyện Khánh Sơn', 27, 469, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (533, N'Huyện Trường Sa', 27, 470, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (534, N'Huyện Cam Lâm', 27, 471, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (535, N'TP Đà Lạt', 31, 472, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (536, N'Thị xã Bảo Lộc', 31, 473, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (537, N'Huyện Đức Trọng', 31, 474, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (538, N'Huyện Di Linh', 31, 475, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (539, N'Huyện Đơn Dương', 31, 476, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (540, N'Huyện Lạc Dương', 31, 477, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (541, N'Huyện Đạ Huoai', 31, 478, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (542, N'Huyện Đạ Tẻh', 31, 479, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (543, N'Huyện Cát Tiên', 31, 480, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (544, N'Huyện Lâm Hà', 31, 481, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (545, N'Huyện Bảo Lâm', 31, 482, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (546, N'Huyện Đam Rông', 31, 483, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (547, N'Thị xã Đồng Xoài', 10, 484, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (548, N'Huyện Đồng Phú', 10, 485, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (549, N'Huyện Chơn Thành', 10, 486, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (550, N'Huyện Bình Long', 10, 487, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (551, N'Huyện Lộc Ninh', 10, 488, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (552, N'Huyện Bù Đốp', 10, 489, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (553, N'Huyện Phước Long', 10, 490, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (554, N'Huyện Bù Đăng', 10, 491, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (555, N'Thị xã Thủ Dầu Một', 9, 492, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (556, N'Huyện Bến Cát', 9, 493, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (557, N'Huyện Tân Uyên', 9, 494, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (558, N'Huyện Thuận An', 9, 495, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (559, N'Huyện Dĩ An', 9, 496, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (560, N'Huyện Phú Giáo', 9, 497, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (561, N'Huyện Dầu Tiếng', 9, 498, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (562, N'TP Phan Rang - Tháp Chàm', 38, 499, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (563, N'Huyện Ninh Sơn', 38, 500, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (564, N'Huyện Ninh Hải', 38, 501, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (565, N'Huyện Ninh Phước', 38, 502, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (566, N'Huyện Bác Ái', 38, 503, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (567, N'Huyện Thuận Bắc', 38, 504, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (568, N'Thị xã Tây Ninh', 47, 505, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (569, N'Huyện Tân Biên', 47, 506, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (570, N'Huyện Tân Châu', 47, 507, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (571, N'Huyện Dương Minh Châu', 47, 508, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (572, N'Huyện Châu Thành', 47, 509, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (573, N'Huyện Hoà Thành', 47, 510, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (574, N'Huyện Bến Cầu', 47, 511, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (575, N'Huyện Gò Dầu', 47, 512, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (576, N'Huyện Trảng Bàng', 47, 513, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (577, N'TP Phan Thiết', 11, 514, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (578, N'Huyện Tuy Phong', 11, 515, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (579, N'Huyện Bắc Bình', 11, 516, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (580, N'Huyện Hàm Thuận Bắc', 11, 517, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (581, N'Huyện Hàm Thuận Nam', 11, 518, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (582, N'Huyện Hàm Tân', 11, 519, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (583, N'Huyện Đức Linh', 11, 520, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (584, N'Huyện Tánh Linh', 11, 521, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (585, N'Huyện đảo Phú Quý', 11, 522, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (586, N'Thị xã LaGi', 11, 523, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (587, N'TP Biên Hòa', 17, 524, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (588, N'Huyện Vĩnh Cửu  ', 17, 525, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (589, N'Huyện Tân Phú', 17, 526, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (590, N'Huyện Định Quán', 17, 527, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (591, N'Huyện Thống Nhất', 17, 528, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (592, N'Thị xã Long Khánh', 17, 529, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (593, N'Huyện Xuân Lộc', 17, 530, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (594, N'Huyện Long Thành', 17, 531, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (595, N'Huyện Nhơn Trạch', 17, 532, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (596, N'Huyện Trảng Bom', 17, 533, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (597, N'Huyện Cẩm Mỹ', 17, 534, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (598, N'Thị xã Tân An', 34, 535, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (599, N'Huyện Vĩnh Hưng', 34, 536, 2, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (600, N'Huyện Mộc Hoá', 34, 537, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (601, N'Huyện Tân Thạnh', 34, 538, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (602, N'Huyện Thạnh Hoá', 34, 539, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (603, N'Huyện Đức Huệ', 34, 540, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (604, N'Huyện Đức Hoà', 34, 541, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (605, N'Huyện Bến Lức', 34, 542, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (606, N'Huyện Thủ Thừa', 34, 543, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (607, N'Huyện Châu Thành', 34, 544, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (608, N'Huyện Tân Trụ', 34, 545, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (609, N'Huyện Cần Đước', 34, 546, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (610, N'Huyện Cần Giuộc', 34, 547, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (611, N'Huyện Tân Hưng', 34, 548, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (612, N'TP Cao Lãnh', 18, 549, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (613, N'Thị xã Sa Đéc', 18, 550, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (614, N'Huyện Tân Hồng', 18, 551, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (615, N'Huyện Hồng Ngự', 18, 552, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (616, N'Huyện Tam Nông', 18, 553, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (617, N'Huyện Thanh Bình', 18, 554, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (618, N'Huyện Cao Lãnh', 18, 555, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (619, N'Huyện Lấp Vò', 18, 556, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (620, N'Huyện Tháp Mười', 18, 557, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (621, N'Huyện Lai Vung', 18, 558, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (622, N'Huyện Châu Thành', 18, 559, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (623, N'TP Long Xuyên', 1, 560, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (624, N'Thị xã Châu Đốc', 1, 561, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (625, N'Huyện An Phú', 1, 562, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (626, N'Huyện Tân Châu', 1, 563, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (627, N'Huyện Phú Tân', 1, 564, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (628, N'Huyện Tịnh Biên', 1, 565, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (629, N'Huyện Tri Tôn', 1, 566, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (630, N'Huyện Châu Phú', 1, 567, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (631, N'Huyện Chợ Mới', 1, 568, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (632, N'Huyện Châu Thành', 1, 569, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (633, N'Huyện Thoại Sơn', 1, 570, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (634, N'TP Vũng Tàu', 2, 571, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (635, N'Thị xã Bà Rịa', 2, 572, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (636, N'Huyện Xuyên Mộc', 2, 573, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (637, N'Huyện Long Điền', 2, 574, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (638, N'Huyện Côn Đảo', 2, 575, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (639, N'Huyện Tân Thành', 2, 576, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (640, N'Huyện Châu Đức', 2, 577, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (641, N'Huyện Đất Đỏ', 2, 578, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (642, N'TP Mỹ Tho', 52, 579, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (643, N'Thị xã Gò Công', 52, 580, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (644, N'Huyện Cái Bè', 52, 581, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (645, N'Huyện Cai Lậy', 52, 582, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (646, N'Huyện Châu Thành', 52, 583, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (647, N'Huyện Chợ Gạo', 52, 584, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (648, N'Huyện Gò Công Tây', 52, 585, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (649, N'Huyện Gò Công Đông', 52, 586, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (650, N'Huyện Tân Phước', 52, 587, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (651, N'Huyện Tân Phú Đông', 52, 588, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (652, N'TP Rạch Giá', 28, 589, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (653, N'Thị xã Hà Tiên', 28, 590, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (654, N'Huyện Kiên Lương', 28, 591, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (655, N'Huyện Hòn Đất', 28, 592, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (656, N'Huyện Tân Hiệp', 28, 593, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (657, N'Huyện Châu Thành', 28, 594, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (658, N'Huyện Giồng Riềng', 28, 595, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (659, N'Huyện Gò Quao', 28, 596, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (660, N'Huyện An Biên', 28, 597, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (661, N'Huyện An Minh', 28, 598, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (662, N'Huyện Vĩnh Thuận', 28, 599, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (663, N'Huyện Phú Quốc', 28, 600, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (664, N'Huyện Kiên Hải', 28, 601, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (665, N'Huyện U Minh Thượng', 28, 602, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (666, N'Quận Ninh Kiều', 59, 603, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (667, N'Quận Bình Thủy', 59, 604, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (668, N'Quận Cái Răng', 59, 605, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (669, N'Quận Ô Môn', 59, 606, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (670, N'Huyện Phong Điền', 59, 607, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (671, N'Huyện Cờ Đỏ', 59, 608, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (672, N'Huyện Vĩnh Thạnh', 59, 609, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (673, N'Huỵện Thốt Nốt', 59, 610, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (674, N'Thị xã Bến Tre', 7, 611, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (675, N'Huyện Châu Thành', 7, 612, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (676, N'Huyện Chợ Lách', 7, 613, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (677, N'Huyện Mỏ Cày', 7, 614, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (678, N'Huyện Giồng Trôm', 7, 615, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (679, N'Huyện Bình Đại', 7, 616, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (680, N'Huyện Ba Tri', 7, 617, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (681, N'Huyện Thạnh Phú', 7, 618, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (682, N'Thị xã Vĩnh Long', 55, 619, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (683, N'Huyện Long Hồ', 55, 620, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (684, N'Huyện Mang Thít', 55, 621, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (685, N'Huyện Bình Minh', 55, 622, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (686, N'Huyện Tam Bình', 55, 623, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (687, N'Huyện Trà Ôn', 55, 624, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (688, N'Huyện Vũng Liêm', 55, 625, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (689, N' huyện Bình Tân', 55, 626, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (690, N'Thị xã Trà Vinh', 53, 627, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (691, N'Huyện Càng Long', 53, 628, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (692, N'Huyện Cầu Kè', 53, 629, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (693, N'Huyện Tiểu Cần', 53, 630, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (694, N'Huyện Châu Thành', 53, 631, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (695, N'Huyện Trà Cú', 53, 632, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (696, N'Huyện Cầu Ngang', 53, 633, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (697, N'Huyện Duyên Hải', 53, 634, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (698, N'TP Sóc Trăng', 45, 635, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (699, N'Huyện Kế Sách', 45, 636, 2, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (700, N'Huyện Mỹ Tú', 45, 637, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (701, N'Huyện Mỹ Xuyên', 45, 638, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (702, N'Huyện Thạnh Trị', 45, 639, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (703, N'Huyện Long Phú', 45, 640, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (704, N'Huyện Vĩnh Châu', 45, 641, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (705, N'Huyện Cù Lao Dung', 45, 642, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (706, N'Huyện Ngã Năm', 45, 643, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (707, N'Huyện Châu Thành', 45, 644, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (708, N'Thị xã Bạc Liêu', 5, 645, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (709, N'Huyện Vĩnh Lợi', 5, 646, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (710, N'Huyện Hồng Dân', 5, 647, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (711, N'Huyện Giá Rai', 5, 648, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (712, N'Huyện Phước Long', 5, 649, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (713, N'Huyện Đông Hải', 5, 650, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (714, N'Huyện Hoà Bình', 5, 651, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (715, N'TP Cà Mau', 12, 652, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (716, N'Huyện Thới Bình', 12, 653, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (717, N'Huyện U Minh', 12, 654, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (718, N'Huyện Trần Văn Thời', 12, 655, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (719, N'Huyện Cái Nước', 12, 656, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (720, N'Huyện Đầm Dơi', 12, 657, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (721, N'Huyện Ngọc Hiển', 12, 658, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (722, N'Huyện Năm Căn', 12, 659, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (723, N'Huyện Phú Tân', 12, 660, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (724, N'TP Điện Biên Phủ', 16, 661, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (725, N'Thị xã Mường Lay', 16, 662, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (726, N'Huyện Điện Biên', 16, 663, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (727, N'Huyện Tuần Giáo', 16, 664, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (728, N'Huyện Mường Chà', 16, 665, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (729, N'Huyện Tủa Chùa', 16, 666, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (730, N'Huyện Điện Biên Đông', 16, 667, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (731, N'Huyện Mường Nhé', 16, 668, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (732, N'Huyện Mường Ảng', 16, 669, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (733, N'Thị xã Gia Nghĩa', 15, 670, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (734, N'Huyện Đắk RLấp', 15, 671, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (735, N'Huyện Đắk Mil', 15, 672, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (736, N'Huyện Cư Jút', 15, 673, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (737, N'Huyện Đắk Song', 15, 674, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (738, N'Huyện Krông Nô', 15, 675, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (739, N'Huyện Đắk GLong', 15, 676, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (740, N'Huyện Tuy Đức', 15, 677, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (741, N'Thị xã Vị Thanh', 24, 678, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (742, N'Huyện Vị Thủy', 24, 679, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (743, N'Huyện Long Mỹ', 24, 680, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (744, N'Huyện Phụng Hiệp', 24, 681, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (745, N'Huyện Châu Thành', 24, 682, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (746, N'Huyện Châu Thành A', 24, 683, 2, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Categories] ([Id], [Name], [ParentId], [SortOrder], [Type], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (747, N'Thị xã Ngã Bảy', 24, 684, 2, 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[share_Categories] OFF
SET IDENTITY_INSERT [dbo].[share_Images] ON 

INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'item_0_12498936_1314525765231206_1003116832_n.jpg', N'/Content/Images/ProductImages/item_0_12498936_1314525765231206_1003116832_n.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2, N'item_0_1923438_1076987935675700_3881400683525361030_n.jpg', N'/Content/Images/ProductImages/item_0_1923438_1076987935675700_3881400683525361030_n.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (3, N'item_0_1914579_1076987939009033_2316772552331261161_n.jpg', N'/Content/Images/ProductImages/item_0_1914579_1076987939009033_2316772552331261161_n.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (4, N'item_1_12498936_1314525765231206_1003116832_n.jpg', N'/Content/Images/ProductImages/item_1_12498936_1314525765231206_1003116832_n.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (23, N'item_0_7-1415000289_660x0.jpg', N'/Content/Images/ProductImages/item_0_7-1415000289_660x0.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (26, N'item_0_3-1415000287_660x0.jpg', N'/Content/Images/ProductImages/item_0_3-1415000287_660x0.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (27, N'item_0_5-1464573363_660x0.jpg', N'/Content/Images/ProductImages/item_0_5-1464573363_660x0.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (28, N'item_0_anh7-1463628200755.jpg', N'/Content/Images/ProductImages/item_0_anh7-1463628200755.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (29, N'item_0_anh7-1463628200755.jpg', N'/Content/Images/ProductImages/item_0_anh7-1463628200755.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (30, N'item_0_2a-1415000287_660x0.jpg', N'/Content/Images/ProductImages/item_0_2a-1415000287_660x0.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (31, N'item_0_anh2-1463628200573.jpg', N'/Content/Images/ProductImages/item_0_anh2-1463628200573.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (32, N'item_0_NTO1_209.jpg', N'/Content/Images/ProductImages/item_0_NTO1_209.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (33, N'item_0_NTO1_209.jpg', N'/Content/Images/ProductImages/item_0_NTO1_209.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (35, N'item_0_4-1464573362_660x0.jpg', N'/Content/Images/ProductImages/item_0_4-1464573362_660x0.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (36, N'item_1_3-1415000287_660x0.jpg', N'/Content/Images/ProductImages/item_1_3-1415000287_660x0.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (37, N'item_2_3-1415000287_660x0.jpg', N'/Content/Images/ProductImages/item_2_3-1415000287_660x0.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (38, N'item_0_3a5665a553a21342177dc39236c79ab1338d49f6_slide1.jpg', N'/Content/Images/ProductImages/item_0_3a5665a553a21342177dc39236c79ab1338d49f6_slide1.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (39, N'item_0_5bd3cda4c18514373015cd9a3ac73fef8ec938eb_slide4.jpg', N'/Content/Images/ProductImages/item_0_5bd3cda4c18514373015cd9a3ac73fef8ec938eb_slide4.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (40, N'item_1_3a5665a553a21342177dc39236c79ab1338d49f6_slide1.jpg', N'/Content/Images/ProductImages/item_1_3a5665a553a21342177dc39236c79ab1338d49f6_slide1.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (41, N'item_0_bea785a5af97581f4004230d1c05cb97f8c7b61b_slide2.jpg', N'/Content/Images/ProductImages/item_0_bea785a5af97581f4004230d1c05cb97f8c7b61b_slide2.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (42, N'item_0_20310f766be96a80b0b5cbe6c22e0b99881d361d_slide3.jpg', N'/Content/Images/ProductImages/item_0_20310f766be96a80b0b5cbe6c22e0b99881d361d_slide3.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (43, N'item_1_5bd3cda4c18514373015cd9a3ac73fef8ec938eb_slide4.jpg', N'/Content/Images/ProductImages/item_1_5bd3cda4c18514373015cd9a3ac73fef8ec938eb_slide4.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (44, N'item_0_4-home-default.jpg', N'/Content/Images/CMSNewsImages/item_0_4-home-default.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (45, N'item_0_3b15d3f64781545cb89242b3d5bd370a4fb47f84_menu-baner4.jpg', N'/Content/Images/CMSNewsImages/item_0_3b15d3f64781545cb89242b3d5bd370a4fb47f84_menu-baner4.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (46, N'item_1_24-cart_default.jpg', N'/Content/Images/CMSNewsImages/item_1_24-cart_default.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (47, N'item_1_4-home-default.jpg', N'~/Content/Images/CMSNewsImages/item_1_4-home-default.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (48, N'item_0_new-store-logo-1446798318.jpg', N'~/Content/Images/CMSNewsImages/item_0_new-store-logo-1446798318.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (49, N'item_0_60-cart_default.jpg', N'/Content/Images/CMSNewsImages/item_0_60-cart_default.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (50, N'item_0_44-cart_default.jpg', N'/Content/Images/CMSNewsImages/item_0_44-cart_default.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (51, N'item_0_3-home-default.jpg', N'/Content/Images/CMSNewsImages/item_0_3-home-default.jpg', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[share_Images] ([Id], [ImageName], [ImagePath], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (52, N'item_0_3a5665a553a21342177dc39236c79ab1338d49f6_slide1.jpg', N'/Content/Images/Banners/item_0_3a5665a553a21342177dc39236c79ab1338d49f6_slide1.jpg', 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[share_Images] OFF
SET IDENTITY_INSERT [dbo].[system_Banners] ON 

INSERT [dbo].[system_Banners] ([Id], [ImageId], [Name], [Type], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, 40, N'Summer 1', 2, 1, 1, NULL, CAST(0x0000A645011DA9AE AS DateTime), NULL, CAST(0x0000A64501264273 AS DateTime))
INSERT [dbo].[system_Banners] ([Id], [ImageId], [Name], [Type], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2, 41, N'Summer 2', 2, 2, 1, NULL, CAST(0x0000A645011F1BBE AS DateTime), NULL, CAST(0x0000A64501257FB3 AS DateTime))
INSERT [dbo].[system_Banners] ([Id], [ImageId], [Name], [Type], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (3, 42, N'Summer 3', 2, 3, 1, NULL, CAST(0x0000A6450125B094 AS DateTime), NULL, NULL)
INSERT [dbo].[system_Banners] ([Id], [ImageId], [Name], [Type], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (4, 43, N'Summer 4', 2, 4, 1, NULL, CAST(0x0000A6450125CBFA AS DateTime), NULL, NULL)
INSERT [dbo].[system_Banners] ([Id], [ImageId], [Name], [Type], [SortOrder], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (5, 52, N'1', 1, 1, 2, NULL, CAST(0x0000A645017B2950 AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[system_Banners] OFF
SET IDENTITY_INSERT [dbo].[system_Menu] ON 

INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'QUẢN TRỊ', N'/admin', 1, NULL, 1, N'fa-dashboard', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2, N'THÀNH VIÊN', N'/admin/nguoi-dung', 2, NULL, 1, N'fa-user', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (3, N'SẢN PHẨM', N'/admin/san-pham', 3, NULL, 1, N'fa-barcode', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (4, N'NHÀ CUNG CẤP', N'/admin/thuong-hieu', 4, NULL, 1, N'fa-certificate', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (5, N'DANH MỤC TIN TỨC', N'/admin/danh-muc-tin-tuc', 7, NULL, 1, N'fa-server', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (7, N'DANH MỤC SẢN PHẨM', N'/admin/danh-muc-san-pham', 6, NULL, 1, N'fa-list', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (8, N'TIN TỨC', N'/admin/tin-tuc', 8, NULL, 1, N'fa-file', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (9, N'BANNER', N'/admin/banner', 9, NULL, 1, N'fa-camera', 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[system_Menu] OFF
INSERT [dbo].[system_Profiles] ([UserId], [UserName], [Emaill], [Password], [Phone], [Address], [Status]) VALUES (N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'admin@admin.com', N'admin@admin.com', N'123123', N'0909000', N'DN', NULL)
/****** Object:  Index [IX_FK_cms_News_cms_Categories]    Script Date: 7/16/2016 11:03:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_cms_News_cms_Categories] ON [dbo].[cms_News]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_product_OrderDetails_product_Orders]    Script Date: 7/16/2016 11:03:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_product_OrderDetails_product_Orders] ON [dbo].[ecom_OrderDetails]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_product_OrderDetails_Products]    Script Date: 7/16/2016 11:03:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_product_OrderDetails_Products] ON [dbo].[ecom_OrderDetails]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Products_Images_share_Images]    Script Date: 7/16/2016 11:03:16 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Products_Images_share_Images] ON [dbo].[ecom_Products_Images]
(
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[cms_News]  WITH CHECK ADD  CONSTRAINT [FK_cms_News_cms_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[cms_Categories] ([Id])
GO
ALTER TABLE [dbo].[cms_News] CHECK CONSTRAINT [FK_cms_News_cms_Categories]
GO
ALTER TABLE [dbo].[cms_News]  WITH CHECK ADD  CONSTRAINT [FK_cms_News_share_Images] FOREIGN KEY([CoverImageId])
REFERENCES [dbo].[share_Images] ([Id])
GO
ALTER TABLE [dbo].[cms_News] CHECK CONSTRAINT [FK_cms_News_share_Images]
GO
ALTER TABLE [dbo].[ecom_OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_ecom_OrderDetails_ecom_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[ecom_Products] ([Id])
GO
ALTER TABLE [dbo].[ecom_OrderDetails] CHECK CONSTRAINT [FK_ecom_OrderDetails_ecom_Products]
GO
ALTER TABLE [dbo].[ecom_OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_product_OrderDetails_product_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[ecom_Orders] ([Id])
GO
ALTER TABLE [dbo].[ecom_OrderDetails] CHECK CONSTRAINT [FK_product_OrderDetails_product_Orders]
GO
ALTER TABLE [dbo].[ecom_Products]  WITH CHECK ADD  CONSTRAINT [FK_ecom_Products_ecom_Brands] FOREIGN KEY([BrandId])
REFERENCES [dbo].[ecom_Brands] ([Id])
GO
ALTER TABLE [dbo].[ecom_Products] CHECK CONSTRAINT [FK_ecom_Products_ecom_Brands]
GO
ALTER TABLE [dbo].[ecom_Products_Categories]  WITH CHECK ADD  CONSTRAINT [FK_ecom_Products_Categories_ecom_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[ecom_Categories] ([Id])
GO
ALTER TABLE [dbo].[ecom_Products_Categories] CHECK CONSTRAINT [FK_ecom_Products_Categories_ecom_Categories]
GO
ALTER TABLE [dbo].[ecom_Products_Categories]  WITH CHECK ADD  CONSTRAINT [FK_ecom_Products_Categories_ecom_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[ecom_Products] ([Id])
GO
ALTER TABLE [dbo].[ecom_Products_Categories] CHECK CONSTRAINT [FK_ecom_Products_Categories_ecom_Products]
GO
ALTER TABLE [dbo].[ecom_Products_Images]  WITH CHECK ADD  CONSTRAINT [FK_ecom_Products_Images_ecom_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[ecom_Products] ([Id])
GO
ALTER TABLE [dbo].[ecom_Products_Images] CHECK CONSTRAINT [FK_ecom_Products_Images_ecom_Products]
GO
ALTER TABLE [dbo].[ecom_Products_Images]  WITH CHECK ADD  CONSTRAINT [FK_ecom_Products_Images_share_Images] FOREIGN KEY([ImageId])
REFERENCES [dbo].[share_Images] ([Id])
GO
ALTER TABLE [dbo].[ecom_Products_Images] CHECK CONSTRAINT [FK_ecom_Products_Images_share_Images]
GO
ALTER TABLE [dbo].[system_Banners]  WITH CHECK ADD  CONSTRAINT [FK_system_Banners_share_Images] FOREIGN KEY([ImageId])
REFERENCES [dbo].[share_Images] ([Id])
GO
ALTER TABLE [dbo].[system_Banners] CHECK CONSTRAINT [FK_system_Banners_share_Images]
GO
USE [master]
GO
ALTER DATABASE [OnlineStoreMVC] SET  READ_WRITE 
GO
