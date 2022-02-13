USE [master]
GO

IF DB_ID('TransactionDB') IS NOT NULL DROP DATABASE TransactionDB
GO

CREATE DATABASE [TransactionDB] COLLATE CYRILLIC_GENERAL_CI_AS;
GO

USE [TransactionDB]
GO

CREATE TABLE [dbo].[Accounts](
	[AccountID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Balance] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED (	[AccountID] ASC)
) 
GO
INSERT [dbo].[Accounts] ([AccountID], [FirstName], [LastName], [Balance]) VALUES (1, N'Franciska', N'Giaomozzo', CAST(78.16 AS Decimal(18, 2)))
INSERT [dbo].[Accounts] ([AccountID], [FirstName], [LastName], [Balance]) VALUES (2, N'Harmonie', N'Bealing', CAST(191.19 AS Decimal(18, 2)))
INSERT [dbo].[Accounts] ([AccountID], [FirstName], [LastName], [Balance]) VALUES (3, N'Judas', N'Chaise', CAST(81.12 AS Decimal(18, 2)))
INSERT [dbo].[Accounts] ([AccountID], [FirstName], [LastName], [Balance]) VALUES (4, N'Cooper', N'Routham', CAST(229.53 AS Decimal(18, 2)))
INSERT [dbo].[Accounts] ([AccountID], [FirstName], [LastName], [Balance]) VALUES (5, N'Cozmo', N'Whatham', CAST(253.00 AS Decimal(18, 2)))
INSERT [dbo].[Accounts] ([AccountID], [FirstName], [LastName], [Balance]) VALUES (6, N'Lovell', N'Hubbucks', CAST(198.50 AS Decimal(18, 2)))
INSERT [dbo].[Accounts] ([AccountID], [FirstName], [LastName], [Balance]) VALUES (7, N'Giffer', N'Ekkel', CAST(221.38 AS Decimal(18, 2)))
