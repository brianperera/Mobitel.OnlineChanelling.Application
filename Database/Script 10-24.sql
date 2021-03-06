USE [master]
GO
/****** Object:  Database [mChanelling]    Script Date: 10/24/2014 12:23:31 AM ******/
CREATE DATABASE [mChanelling]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mChanelling', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\mChanelling.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'mChanelling_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\mChanelling_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [mChanelling] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mChanelling].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mChanelling] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mChanelling] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mChanelling] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mChanelling] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mChanelling] SET ARITHABORT OFF 
GO
ALTER DATABASE [mChanelling] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mChanelling] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [mChanelling] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mChanelling] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mChanelling] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mChanelling] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mChanelling] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mChanelling] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mChanelling] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mChanelling] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mChanelling] SET  DISABLE_BROKER 
GO
ALTER DATABASE [mChanelling] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mChanelling] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mChanelling] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mChanelling] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mChanelling] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mChanelling] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mChanelling] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mChanelling] SET RECOVERY FULL 
GO
ALTER DATABASE [mChanelling] SET  MULTI_USER 
GO
ALTER DATABASE [mChanelling] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mChanelling] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mChanelling] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mChanelling] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'mChanelling', N'ON'
GO
USE [mChanelling]
GO
/****** Object:  StoredProcedure [dbo].[GetAllHospitals]    Script Date: 10/24/2014 12:23:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Sampath>
-- Create date: <Create Date,,2014/10/23>
-- Description:	<Description,,GetAllHospitals>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllHospitals]
AS
BEGIN
SELECT [Id]
      ,[Name]
      ,[Address1]
      ,[Address2]
      ,[TP]
  FROM [dbo].[Hospital]
END

GO
/****** Object:  StoredProcedure [dbo].[GetAllSpeciality]    Script Date: 10/24/2014 12:23:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Sampath>
-- Create date: <Create Date,,2014/10/23>
-- Description:	<Description,,GetAllSpeciality>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllSpeciality]
AS
BEGIN
SELECT [Id]
      ,[SpecialityName]
  FROM [dbo].[Speciality]
END

GO
/****** Object:  StoredProcedure [dbo].[GetDoctorsByHospitalAndSpeciality]    Script Date: 10/24/2014 12:23:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Sampath>
-- Create date: <Create Date,,2014/10/23>
-- Description:	<Description,,GetDoctorsByHospitalAndSpeciality>
-- =============================================
Create PROCEDURE [dbo].[GetDoctorsByHospitalAndSpeciality] 
@HospitalId int,
@SpecialityId int
AS
BEGIN
	SELECT doc.FirstName , doc.LastName ,s.SpecialityName AS Speciality,h.Name AS HospitalName
	FROM [dbo].[DoctorRegistrations] docReg INNER JOIN [dbo].[Doctor] doc ON (docReg.DoctorId = doc.Id)
		INNER JOIN [dbo].[Hospital] h ON (docReg.HospitalId = h.Id)
		INNER JOIN [dbo].[Speciality] s ON (doc.Speciality = s.Id)
	WHERE docReg.HospitalId = @HospitalId AND
		doc.Speciality = @SpecialityId
END

GO
/****** Object:  StoredProcedure [dbo].[GetDoctorsByHospitalID]    Script Date: 10/24/2014 12:23:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Sampath>
-- Create date: <Create Date,,2014/10/22>
-- Description:	<Description,,GetDoctorsByHospital>
-- =============================================
CREATE PROCEDURE [dbo].[GetDoctorsByHospitalID] 
@HospitalId int
AS
BEGIN
	SELECT doc.FirstName , doc.LastName ,s.SpecialityName AS Speciality,h.Name AS HospitalName
	FROM [dbo].[DoctorRegistrations] docReg INNER JOIN [dbo].[Doctor] doc ON (docReg.DoctorId = doc.Id)
		INNER JOIN [dbo].[Hospital] h ON (docReg.HospitalId = h.Id)
		INNER JOIN [dbo].[Speciality] s ON (doc.Speciality = s.Id)
	WHERE docReg.HospitalId = @HospitalId
END

GO
/****** Object:  StoredProcedure [dbo].[GetDoctorsBySpecialityId]    Script Date: 10/24/2014 12:23:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Sampath>
-- Create date: <Create Date,,2014/10/22>
-- Description:	<Description,,GetDoctorsBySpeciality>
-- =============================================
CREATE PROCEDURE [dbo].[GetDoctorsBySpecialityId]
@SpecialityId int
AS
BEGIN
	SELECT doc.FirstName, doc.LastName , s.SpecialityName AS Speciality,h.Name AS HospitalName
	FROM [dbo].[DoctorRegistrations] docReg INNER JOIN [dbo].[Doctor] doc ON (docReg.DoctorId = doc.Id)
		INNER JOIN [dbo].[Hospital] h ON (docReg.HospitalId = h.Id)
		INNER JOIN [dbo].[Speciality] s ON (doc.Speciality = s.Id)
	WHERE doc.Speciality = @SpecialityId
END

GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 10/24/2014 12:23:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[DoctorID] [int] NOT NULL,
	[HospitalId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[SlotNo] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChannelingHours]    Script Date: 10/24/2014 12:23:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChannelingHours](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DocRegId] [int] NOT NULL,
	[NoOfSlots] [int] NOT NULL,
	[StartTime] [time](7) NULL,
	[EndTime] [time](7) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 10/24/2014 12:23:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Doctor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Speciality] [int] NULL,
	[Mobile] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DoctorRegistrations]    Script Date: 10/24/2014 12:23:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorRegistrations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HospitalId] [int] NOT NULL,
	[DoctorId] [int] NOT NULL,
	[Charge] [decimal](18, 0) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hospital]    Script Date: 10/24/2014 12:23:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Hospital](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Address1] [varchar](100) NULL,
	[Address2] [varchar](100) NULL,
	[TP] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 10/24/2014 12:23:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Patient](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Mobile] [varchar](50) NOT NULL,
	[NIC] [varchar](10) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Speciality]    Script Date: 10/24/2014 12:23:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Speciality](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SpecialityName] [varchar](100) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Doctor] ON 

INSERT [dbo].[Doctor] ([Id], [FirstName], [LastName], [Speciality], [Mobile]) VALUES (1, N'AJITH', N'FERNANDO', 1, N'0123456789')
INSERT [dbo].[Doctor] ([Id], [FirstName], [LastName], [Speciality], [Mobile]) VALUES (2, N'AJITH', N'RAJAPAKSHA', 2, N'0123456789')
INSERT [dbo].[Doctor] ([Id], [FirstName], [LastName], [Speciality], [Mobile]) VALUES (3, N'ASELA', N'AMARASIRI', 1, N'0123456789')
INSERT [dbo].[Doctor] ([Id], [FirstName], [LastName], [Speciality], [Mobile]) VALUES (4, N'ASHMORE', N'ATAPATTU', 3, N'0147852369')
INSERT [dbo].[Doctor] ([Id], [FirstName], [LastName], [Speciality], [Mobile]) VALUES (5, N'BERNARD', N'PERERA', 1, N'0321456789')
INSERT [dbo].[Doctor] ([Id], [FirstName], [LastName], [Speciality], [Mobile]) VALUES (6, N'CHANDANA', N'HEWAGE', 2, N'0321654987')
INSERT [dbo].[Doctor] ([Id], [FirstName], [LastName], [Speciality], [Mobile]) VALUES (7, N'CHANDRA', N'PEIRIS', 2, N'0369852147')
INSERT [dbo].[Doctor] ([Id], [FirstName], [LastName], [Speciality], [Mobile]) VALUES (8, N'D. S. J.', N'JAYASINGHE', 4, N'01231231232')
INSERT [dbo].[Doctor] ([Id], [FirstName], [LastName], [Speciality], [Mobile]) VALUES (9, N'D.C.J.', N'WICKRAMARACHCHI', 3, N'0147852147')
INSERT [dbo].[Doctor] ([Id], [FirstName], [LastName], [Speciality], [Mobile]) VALUES (10, N'D.S', N'RAJAPAKSHA', 4, N'0258963147')
INSERT [dbo].[Doctor] ([Id], [FirstName], [LastName], [Speciality], [Mobile]) VALUES (11, N'Saman', N'RAJAPAKSHA', 1, N'0456123789')
INSERT [dbo].[Doctor] ([Id], [FirstName], [LastName], [Speciality], [Mobile]) VALUES (12, N'DAMMIKE', N'SILVA', 2, N'0236598741')
INSERT [dbo].[Doctor] ([Id], [FirstName], [LastName], [Speciality], [Mobile]) VALUES (13, N'KANISHKA', N'KARUNARATNE', 4, N'0123456987')
INSERT [dbo].[Doctor] ([Id], [FirstName], [LastName], [Speciality], [Mobile]) VALUES (14, N'L.A.W.', N'SIRISENA', 3, N'0147852369')
INSERT [dbo].[Doctor] ([Id], [FirstName], [LastName], [Speciality], [Mobile]) VALUES (15, N'M.D.P.', N'GUNARATNE', 2, N'0987456321')
INSERT [dbo].[Doctor] ([Id], [FirstName], [LastName], [Speciality], [Mobile]) VALUES (16, N'MADHAVA', N'KARUNARATHNA', 4, N'0258963147')
INSERT [dbo].[Doctor] ([Id], [FirstName], [LastName], [Speciality], [Mobile]) VALUES (18, N'GAMINI', N'PERERA', 5, N'0369258147')
SET IDENTITY_INSERT [dbo].[Doctor] OFF
SET IDENTITY_INSERT [dbo].[DoctorRegistrations] ON 

INSERT [dbo].[DoctorRegistrations] ([Id], [HospitalId], [DoctorId], [Charge]) VALUES (1, 2, 1, CAST(800 AS Decimal(18, 0)))
INSERT [dbo].[DoctorRegistrations] ([Id], [HospitalId], [DoctorId], [Charge]) VALUES (2, 2, 5, CAST(1000 AS Decimal(18, 0)))
INSERT [dbo].[DoctorRegistrations] ([Id], [HospitalId], [DoctorId], [Charge]) VALUES (3, 3, 1, CAST(700 AS Decimal(18, 0)))
INSERT [dbo].[DoctorRegistrations] ([Id], [HospitalId], [DoctorId], [Charge]) VALUES (4, 4, 5, CAST(750 AS Decimal(18, 0)))
INSERT [dbo].[DoctorRegistrations] ([Id], [HospitalId], [DoctorId], [Charge]) VALUES (5, 4, 1, CAST(700 AS Decimal(18, 0)))
INSERT [dbo].[DoctorRegistrations] ([Id], [HospitalId], [DoctorId], [Charge]) VALUES (6, 3, 5, CAST(900 AS Decimal(18, 0)))
INSERT [dbo].[DoctorRegistrations] ([Id], [HospitalId], [DoctorId], [Charge]) VALUES (7, 2, 2, CAST(500 AS Decimal(18, 0)))
INSERT [dbo].[DoctorRegistrations] ([Id], [HospitalId], [DoctorId], [Charge]) VALUES (8, 3, 2, CAST(600 AS Decimal(18, 0)))
INSERT [dbo].[DoctorRegistrations] ([Id], [HospitalId], [DoctorId], [Charge]) VALUES (9, 4, 2, CAST(500 AS Decimal(18, 0)))
INSERT [dbo].[DoctorRegistrations] ([Id], [HospitalId], [DoctorId], [Charge]) VALUES (10, 2, 3, CAST(600 AS Decimal(18, 0)))
INSERT [dbo].[DoctorRegistrations] ([Id], [HospitalId], [DoctorId], [Charge]) VALUES (11, 3, 4, CAST(600 AS Decimal(18, 0)))
INSERT [dbo].[DoctorRegistrations] ([Id], [HospitalId], [DoctorId], [Charge]) VALUES (12, 4, 4, CAST(700 AS Decimal(18, 0)))
INSERT [dbo].[DoctorRegistrations] ([Id], [HospitalId], [DoctorId], [Charge]) VALUES (13, 5, 4, CAST(600 AS Decimal(18, 0)))
INSERT [dbo].[DoctorRegistrations] ([Id], [HospitalId], [DoctorId], [Charge]) VALUES (14, 2, 6, CAST(500 AS Decimal(18, 0)))
INSERT [dbo].[DoctorRegistrations] ([Id], [HospitalId], [DoctorId], [Charge]) VALUES (15, 3, 6, CAST(700 AS Decimal(18, 0)))
INSERT [dbo].[DoctorRegistrations] ([Id], [HospitalId], [DoctorId], [Charge]) VALUES (16, 4, 6, CAST(1000 AS Decimal(18, 0)))
INSERT [dbo].[DoctorRegistrations] ([Id], [HospitalId], [DoctorId], [Charge]) VALUES (17, 5, 6, CAST(500 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[DoctorRegistrations] OFF
SET IDENTITY_INSERT [dbo].[Hospital] ON 

INSERT [dbo].[Hospital] ([Id], [Name], [Address1], [Address2], [TP]) VALUES (2, N'Nawaloka Hospital', NULL, NULL, N'01123456789')
INSERT [dbo].[Hospital] ([Id], [Name], [Address1], [Address2], [TP]) VALUES (3, N'Durdans Hospital', NULL, NULL, N'01124563987')
INSERT [dbo].[Hospital] ([Id], [Name], [Address1], [Address2], [TP]) VALUES (4, N'Asiri Hospital', NULL, NULL, N'01142536987')
INSERT [dbo].[Hospital] ([Id], [Name], [Address1], [Address2], [TP]) VALUES (5, N'Oasis Hospital', NULL, NULL, N'01152436987')
SET IDENTITY_INSERT [dbo].[Hospital] OFF
SET IDENTITY_INSERT [dbo].[Speciality] ON 

INSERT [dbo].[Speciality] ([Id], [SpecialityName]) VALUES (1, N'GYNAECOLOGIST')
INSERT [dbo].[Speciality] ([Id], [SpecialityName]) VALUES (2, N'CARDIOLOGIST ')
INSERT [dbo].[Speciality] ([Id], [SpecialityName]) VALUES (3, N'DERMATOLOGIST ')
INSERT [dbo].[Speciality] ([Id], [SpecialityName]) VALUES (4, N'NEUROLOGIST')
INSERT [dbo].[Speciality] ([Id], [SpecialityName]) VALUES (5, N'PAEDIATRICIAN')
SET IDENTITY_INSERT [dbo].[Speciality] OFF
USE [master]
GO
ALTER DATABASE [mChanelling] SET  READ_WRITE 
GO
