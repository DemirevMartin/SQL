USE [master]
GO
/****** Object:  Database [Minions]    Script Date: 28.9.2021 г. 16:02:33 ******/
CREATE DATABASE [Minions]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IntroductoryExcercise', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\IntroductoryExcercise.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IntroductoryExcercise_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\IntroductoryExcercise_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Minions] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Minions].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Minions] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Minions] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Minions] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Minions] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Minions] SET ARITHABORT OFF 
GO
ALTER DATABASE [Minions] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Minions] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Minions] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Minions] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Minions] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Minions] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Minions] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Minions] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Minions] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Minions] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Minions] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Minions] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Minions] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Minions] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Minions] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Minions] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Minions] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Minions] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Minions] SET  MULTI_USER 
GO
ALTER DATABASE [Minions] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Minions] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Minions] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Minions] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Minions] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Minions] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Minions] SET QUERY_STORE = OFF
GO
USE [Minions]
GO
/****** Object:  Table [dbo].[2.0PersonalData]    Script Date: 28.9.2021 г. 16:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[2.0PersonalData](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Age] [int] NULL,
	[TownID] [int] NULL,
 CONSTRAINT [PK_2.0PersonalData] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonalData]    Script Date: 28.9.2021 г. 16:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonalData](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Age] [int] NULL,
 CONSTRAINT [PK_dbo.Minions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Towns]    Script Date: 28.9.2021 г. 16:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Towns](
	[ID] [int] NOT NULL,
	[Name] [text] NOT NULL,
 CONSTRAINT [PK_Towns] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[2.0PersonalData] ([ID], [Name], [Age], [TownID]) VALUES (1, N'Kevin', 15, 1000)
INSERT [dbo].[2.0PersonalData] ([ID], [Name], [Age], [TownID]) VALUES (3, N'Stuart', 10, 9000)
GO
INSERT [dbo].[PersonalData] ([ID], [Name], [Age]) VALUES (1, N'Kevin', 15)
INSERT [dbo].[PersonalData] ([ID], [Name], [Age]) VALUES (3, N'Stuart', 10)
GO
INSERT [dbo].[Towns] ([ID], [Name]) VALUES (1000, N'Sofia')
INSERT [dbo].[Towns] ([ID], [Name]) VALUES (9000, N'Varna')
GO
ALTER TABLE [dbo].[2.0PersonalData]  WITH CHECK ADD  CONSTRAINT [FK_2.0PersonalData_Towns] FOREIGN KEY([TownID])
REFERENCES [dbo].[Towns] ([ID])
GO
ALTER TABLE [dbo].[2.0PersonalData] CHECK CONSTRAINT [FK_2.0PersonalData_Towns]
GO
USE [master]
GO
ALTER DATABASE [Minions] SET  READ_WRITE 
GO
