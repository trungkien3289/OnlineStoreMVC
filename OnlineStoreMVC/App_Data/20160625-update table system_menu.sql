USE [OnlineStoreMVC]
GO
/****** Object:  Table [dbo].[system_Menu]    Script Date: 6/25/2016 6:19:43 PM ******/
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
SET IDENTITY_INSERT [dbo].[system_Menu] ON 

GO
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'QUẢN TRỊ', NULL, 1, NULL, 1, N'fa-dashboard', 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2, N'THÀNH VIÊN', NULL, 2, NULL, 1, N'fa-user', 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (3, N'SẢN PHẨM', NULL, 3, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (4, N'NHÀ CUNG CẤP', NULL, 4, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (5, N'TIN TỨC', NULL, 5, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (6, N'ĐƠN ĐẶT HÀNG', NULL, 6, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (7, N'DANH MỤC SẢN PHẨM', NULL, 7, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[system_Menu] OFF
GO
