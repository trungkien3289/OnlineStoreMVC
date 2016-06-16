USE [master]
GO
/****** Object:  Database [OnlineStoreMVC]    Script Date: 6/15/2016 11:38:31 PM ******/
CREATE DATABASE [OnlineStoreMVC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineStoreMVC', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\OnlineStoreMVC.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'OnlineStoreMVC_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\OnlineStoreMVC_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
ALTER DATABASE [OnlineStoreMVC] SET  DISABLE_BROKER 
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
ALTER DATABASE [OnlineStoreMVC] SET RECOVERY SIMPLE 
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
USE [OnlineStoreMVC]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 6/15/2016 11:38:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 6/15/2016 11:38:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 6/15/2016 11:38:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 6/15/2016 11:38:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[AspNetRoles_Id] [nvarchar](128) NOT NULL,
	[AspNetUsers_Id] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[AspNetRoles_Id] ASC,
	[AspNetUsers_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 6/15/2016 11:38:31 PM ******/
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
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Brands]    Script Date: 6/15/2016 11:38:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](50) NOT NULL,
	[GUID] [uniqueidentifier] NOT NULL,
	[Status] [bit] NOT NULL,
	[SortOrder] [int] NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/15/2016 11:38:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](50) NOT NULL,
	[GUID] [uniqueidentifier] NOT NULL,
	[ParentID] [uniqueidentifier] NULL,
	[Description] [nvarchar](500) NULL,
	[Url] [nvarchar](200) NULL,
	[SortOrder] [int] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories_Brands]    Script Date: 6/15/2016 11:38:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories_Brands](
	[Brands_Id] [int] NOT NULL,
	[Categories_Brands_Brand_Id] [int] NOT NULL,
 CONSTRAINT [PK_Categories_Brands] PRIMARY KEY CLUSTERED 
(
	[Brands_Id] ASC,
	[Categories_Brands_Brand_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cms_Categories]    Script Date: 6/15/2016 11:38:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cms_Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GUID] [uniqueidentifier] NOT NULL,
	[ParentID] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](300) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Url] [nvarchar](200) NULL,
	[SortOrder] [int] NULL,
	[Status] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_cms_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cms_News]    Script Date: 6/15/2016 11:38:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cms_News](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GUID] [uniqueidentifier] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[SubTitle] [nvarchar](200) NOT NULL,
	[ContentNews] [nvarchar](max) NOT NULL,
	[Authors] [nvarchar](200) NULL,
	[Tags] [nvarchar](200) NULL,
	[TotalView] [int] NULL,
	[Status] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_cms_News] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Colors]    Script Date: 6/15/2016 11:38:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[product_OrderDetails]    Script Date: 6/15/2016 11:38:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_OrderDetails](
	[Id] [int] NOT NULL,
	[GUID] [uniqueidentifier] NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[PriceOfUnit] [decimal](19, 4) NOT NULL,
	[TotalDiscount] [decimal](19, 4) NULL,
	[TotalOrder] [decimal](19, 4) NOT NULL,
	[Status] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_product_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[product_Orders]    Script Date: 6/15/2016 11:38:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_Orders](
	[Id] [int] NOT NULL,
	[GUID] [uniqueidentifier] NOT NULL,
	[UserID] [nvarchar](128) NULL,
	[OrderCode] [nchar](100) NOT NULL,
	[TotalPrice] [decimal](19, 4) NOT NULL,
	[FeeShip] [decimal](19, 4) NOT NULL,
	[TotalOrder] [decimal](19, 4) NOT NULL,
	[OrderStatus] [int] NOT NULL,
	[OrderNote] [nvarchar](500) NULL,
	[NameOfRecipient] [nchar](200) NULL,
	[PhoneOfRecipient] [nvarchar](100) NOT NULL,
	[AddressOfRecipient] [nvarchar](500) NOT NULL,
	[Status] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_product_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/15/2016 11:38:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SizeId] [int] NOT NULL,
	[ProductTitleId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products_Images]    Script Date: 6/15/2016 11:38:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products_Images](
	[ProductTitles_Id] [int] NOT NULL,
	[share_Images_Id] [int] NOT NULL,
 CONSTRAINT [PK_Products_Images] PRIMARY KEY CLUSTERED 
(
	[ProductTitles_Id] ASC,
	[share_Images_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductTitles]    Script Date: 6/15/2016 11:38:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTitles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GUID] [uniqueidentifier] NOT NULL,
	[ProductCode] [nvarchar](100) NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ColorId] [int] NOT NULL,
	[BrandId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NULL,
	[Unit] [int] NULL,
	[CoverImageID] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[Description2] [nvarchar](max) NULL,
	[TotalView] [int] NULL,
	[TotalBuy] [int] NULL,
	[Tags] [nvarchar](200) NULL,
	[IsNewProduct] [bit] NOT NULL,
	[IsBestSellProduct] [bit] NOT NULL,
	[SortOrder] [int] NULL,
	[Status] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_ProductTitles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[share_Images]    Script Date: 6/15/2016 11:38:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[share_Images](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GUID] [uniqueidentifier] NOT NULL,
	[ImageName] [nvarchar](300) NOT NULL,
	[ImagePath] [nvarchar](700) NOT NULL,
	[Status] [int] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_share_Images] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sizes]    Script Date: 6/15/2016 11:38:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sizes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Sizes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]    Script Date: 6/15/2016 11:38:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]    Script Date: 6/15/2016 11:38:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_FK_AspNetUserRoles_AspNetUsers]    Script Date: 6/15/2016 11:38:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_AspNetUserRoles_AspNetUsers] ON [dbo].[AspNetUserRoles]
(
	[AspNetUsers_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Categories_Brands_Category]    Script Date: 6/15/2016 11:38:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Categories_Brands_Category] ON [dbo].[Categories_Brands]
(
	[Categories_Brands_Brand_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_cms_News_cms_Categories]    Script Date: 6/15/2016 11:38:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_cms_News_cms_Categories] ON [dbo].[cms_News]
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_product_OrderDetails_product_Orders]    Script Date: 6/15/2016 11:38:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_product_OrderDetails_product_Orders] ON [dbo].[product_OrderDetails]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_product_OrderDetails_Products]    Script Date: 6/15/2016 11:38:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_product_OrderDetails_Products] ON [dbo].[product_OrderDetails]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_FK_product_Orders_AspNetUsers]    Script Date: 6/15/2016 11:38:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_product_Orders_AspNetUsers] ON [dbo].[product_Orders]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Products_ProductTitles]    Script Date: 6/15/2016 11:38:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Products_ProductTitles] ON [dbo].[Products]
(
	[ProductTitleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Products_Sizes]    Script Date: 6/15/2016 11:38:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Products_Sizes] ON [dbo].[Products]
(
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Products_Images_share_Images]    Script Date: 6/15/2016 11:38:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Products_Images_share_Images] ON [dbo].[Products_Images]
(
	[share_Images_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ProductTitles_Brands]    Script Date: 6/15/2016 11:38:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_ProductTitles_Brands] ON [dbo].[ProductTitles]
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ProductTitles_Categories]    Script Date: 6/15/2016 11:38:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_ProductTitles_Categories] ON [dbo].[ProductTitles]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ProductTitles_Colors]    Script Date: 6/15/2016 11:38:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_ProductTitles_Colors] ON [dbo].[ProductTitles]
(
	[ColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo_AspNetUserLogins_dbo_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles] FOREIGN KEY([AspNetRoles_Id])
REFERENCES [dbo].[AspNetRoles] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers] FOREIGN KEY([AspNetUsers_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers]
GO
ALTER TABLE [dbo].[Categories_Brands]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Brands_Brand] FOREIGN KEY([Brands_Id])
REFERENCES [dbo].[Brands] ([Id])
GO
ALTER TABLE [dbo].[Categories_Brands] CHECK CONSTRAINT [FK_Categories_Brands_Brand]
GO
ALTER TABLE [dbo].[Categories_Brands]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Brands_Category] FOREIGN KEY([Categories_Brands_Brand_Id])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Categories_Brands] CHECK CONSTRAINT [FK_Categories_Brands_Category]
GO
ALTER TABLE [dbo].[cms_News]  WITH CHECK ADD  CONSTRAINT [FK_cms_News_cms_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[cms_Categories] ([Id])
GO
ALTER TABLE [dbo].[cms_News] CHECK CONSTRAINT [FK_cms_News_cms_Categories]
GO
ALTER TABLE [dbo].[product_OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_product_OrderDetails_product_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[product_Orders] ([Id])
GO
ALTER TABLE [dbo].[product_OrderDetails] CHECK CONSTRAINT [FK_product_OrderDetails_product_Orders]
GO
ALTER TABLE [dbo].[product_OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_product_OrderDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[product_OrderDetails] CHECK CONSTRAINT [FK_product_OrderDetails_Products]
GO
ALTER TABLE [dbo].[product_Orders]  WITH CHECK ADD  CONSTRAINT [FK_product_Orders_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[product_Orders] CHECK CONSTRAINT [FK_product_Orders_AspNetUsers]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductTitles] FOREIGN KEY([ProductTitleId])
REFERENCES [dbo].[ProductTitles] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductTitles]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Sizes] FOREIGN KEY([SizeId])
REFERENCES [dbo].[Sizes] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Sizes]
GO
ALTER TABLE [dbo].[Products_Images]  WITH CHECK ADD  CONSTRAINT [FK_Products_Images_ProductTitles] FOREIGN KEY([ProductTitles_Id])
REFERENCES [dbo].[ProductTitles] ([Id])
GO
ALTER TABLE [dbo].[Products_Images] CHECK CONSTRAINT [FK_Products_Images_ProductTitles]
GO
ALTER TABLE [dbo].[Products_Images]  WITH CHECK ADD  CONSTRAINT [FK_Products_Images_share_Images] FOREIGN KEY([share_Images_Id])
REFERENCES [dbo].[share_Images] ([Id])
GO
ALTER TABLE [dbo].[Products_Images] CHECK CONSTRAINT [FK_Products_Images_share_Images]
GO
ALTER TABLE [dbo].[ProductTitles]  WITH CHECK ADD  CONSTRAINT [FK_ProductTitles_Brands] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([Id])
GO
ALTER TABLE [dbo].[ProductTitles] CHECK CONSTRAINT [FK_ProductTitles_Brands]
GO
ALTER TABLE [dbo].[ProductTitles]  WITH CHECK ADD  CONSTRAINT [FK_ProductTitles_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[ProductTitles] CHECK CONSTRAINT [FK_ProductTitles_Categories]
GO
ALTER TABLE [dbo].[ProductTitles]  WITH CHECK ADD  CONSTRAINT [FK_ProductTitles_Colors] FOREIGN KEY([ColorId])
REFERENCES [dbo].[Colors] ([Id])
GO
ALTER TABLE [dbo].[ProductTitles] CHECK CONSTRAINT [FK_ProductTitles_Colors]
GO
USE [master]
GO
ALTER DATABASE [OnlineStoreMVC] SET  READ_WRITE 
GO
