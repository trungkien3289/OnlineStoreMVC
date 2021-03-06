USE [OnlineStoreMVC]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
DROP TABLE [dbo].[cms_News]
GO
CREATE TABLE [dbo].[cms_News](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
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

ALTER TABLE [dbo].[cms_News]  WITH CHECK ADD  CONSTRAINT [FK_cms_News_cms_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[cms_Categories] ([Id])
GO

ALTER TABLE [dbo].[cms_News] CHECK CONSTRAINT [FK_cms_News_cms_Categories]
GO

USE [OnlineStoreMVC]
GO
DELETE FROM [dbo].[system_Menu]

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
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (5, N'DANH MỤC TIN TỨC', N'/admin/danh-muc-tin-tuc', 7, NULL, 1, N'fa-server', 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (6, N'ĐƠN ĐẶT HÀNG', NULL, 5, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (7, N'DANH MỤC SẢN PHẨM', NULL, 6, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (8, N'TIN TỨC', N'/admin/tin-tuc', 8, NULL, 1, N'fa-file', 1, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[system_Menu] OFF
GO
