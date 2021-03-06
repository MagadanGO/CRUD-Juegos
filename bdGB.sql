USE [master]
GO
/****** Object:  Database [bdGB]    Script Date: 18/01/2022 01:13:57 a. m. ******/
CREATE DATABASE [bdGB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bdGB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\bdGB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bdGB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\bdGB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [bdGB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bdGB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bdGB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bdGB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bdGB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bdGB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bdGB] SET ARITHABORT OFF 
GO
ALTER DATABASE [bdGB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [bdGB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bdGB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bdGB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bdGB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bdGB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bdGB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bdGB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bdGB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bdGB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [bdGB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bdGB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bdGB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bdGB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bdGB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bdGB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bdGB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bdGB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [bdGB] SET  MULTI_USER 
GO
ALTER DATABASE [bdGB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bdGB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bdGB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bdGB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bdGB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [bdGB] SET QUERY_STORE = OFF
GO
USE [bdGB]
GO
/****** Object:  User [usuario]    Script Date: 18/01/2022 01:13:58 a. m. ******/
CREATE USER [usuario] FOR LOGIN [##MS_PolicyEventProcessingLogin##] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 18/01/2022 01:13:58 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](40) NOT NULL,
	[Descripción] [nvarchar](70) NOT NULL,
	[Precio] [decimal](10, 5) NOT NULL,
	[Imagen] [binary](8000) NOT NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [bdGB] SET  READ_WRITE 
GO
