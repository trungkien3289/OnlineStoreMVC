USE [OnlineStoreMVC]
GO

/****** Object:  Table [dbo].[system_Profiles]    Script Date: 7/15/2016 9:52:47 PM ******/
DROP TABLE [dbo].[system_Profiles]
GO

/****** Object:  Table [dbo].[system_Profiles]    Script Date: 7/15/2016 9:52:47 PM ******/
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

DELETE FROM [dbo].[system_Menu]
SET IDENTITY_INSERT [dbo].[system_Menu] ON 

INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'QUẢN TRỊ', N'/admin', 1, NULL, 1, N'fa-dashboard', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2, N'THÀNH VIÊN', N'/admin/nguoi-dung', 2, NULL, 1, N'fa-user', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (3, N'SẢN PHẨM', N'/admin/san-pham', 3, NULL, 1, N'fa-barcode', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (4, N'NHÀ CUNG CẤP', N'/admin/thuong-hieu', 4, NULL, 1, N'fa-certificate', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (5, N'DANH MỤC TIN TỨC', N'/admin/danh-muc-tin-tuc', 7, NULL, 1, N'fa-server', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (7, N'DANH MỤC SẢN PHẨM', N'/admin/danh-muc-san-pham', 6, NULL, 1, N'fa-list', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[system_Menu] ([Id], [Name], [Url], [SortOrder], [Target], [Type], [Icon], [Status], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (8, N'TIN TỨC', N'/admin/tin-tuc', 8, NULL, 1, N'fa-file', 1, NULL, NULL, NULL, NULL)

SET IDENTITY_INSERT [dbo].[system_Menu] OFF

GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'admin', N'Administrator')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'user', N'User')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'admin@admin.com', 0, N'ALTLD2XQj20rF1Dv707/hCYZsfjBC3sJeg9b44xGovSfBU7nTcjh/G4ZiYApydqCzQ==', N'26696055-fdf6-4204-a4a5-12ac33f5c991', NULL, 0, 0, NULL, 1, 0, N'admin@admin.com')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'admin')
GO
INSERT [dbo].[system_Profiles] ([UserId], [UserName], [Emaill], [Password], [Phone], [Address], [Status]) VALUES (N'109b6373-4e29-4fec-bb53-e2cbee2416e9', N'admin@admin.com', N'admin@admin.com', N'123123', N'0905999888', N'02 Quang Trung, Đà Nẵng', NULL)
GO
