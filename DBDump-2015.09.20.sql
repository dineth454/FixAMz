USE [master]
GO
/****** Object:  Database [FixAMz]    Script Date: 9/30/2015 9:48:22 AM ******/
CREATE DATABASE [FixAMz]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FixAMz', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\FixAMz.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FixAMz_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\FixAMz_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FixAMz] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FixAMz].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FixAMz] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FixAMz] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FixAMz] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FixAMz] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FixAMz] SET ARITHABORT OFF 
GO
ALTER DATABASE [FixAMz] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FixAMz] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [FixAMz] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FixAMz] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FixAMz] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FixAMz] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FixAMz] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FixAMz] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FixAMz] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FixAMz] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FixAMz] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FixAMz] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FixAMz] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FixAMz] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FixAMz] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FixAMz] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FixAMz] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FixAMz] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FixAMz] SET RECOVERY FULL 
GO
ALTER DATABASE [FixAMz] SET  MULTI_USER 
GO
ALTER DATABASE [FixAMz] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FixAMz] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FixAMz] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FixAMz] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FixAMz', N'ON'
GO
USE [FixAMz]
GO
/****** Object:  Table [dbo].[Asset]    Script Date: 9/30/2015 9:48:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Asset](
	[assetID] [char](15) NOT NULL,
	[name] [varchar](20) NOT NULL,
	[value] [int] NOT NULL,
	[category] [char](10) NOT NULL,
	[subcategory] [char](10) NOT NULL,
	[owner] [char](10) NOT NULL,
	[status] [varchar](8) NOT NULL,
	[location] [char](10) NOT NULL,
	[approvedDate] [date] NOT NULL,
	[recommend] [char](10) NOT NULL,
	[approve] [char](10) NOT NULL,
 CONSTRAINT [PK_Asset] PRIMARY KEY CLUSTERED 
(
	[assetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 9/30/2015 9:48:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[catID] [char](10) NOT NULL,
	[name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[catID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DisposeAsset]    Script Date: 9/30/2015 9:48:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DisposeAsset](
	[dispID] [char](10) NOT NULL,
	[assetID] [char](15) NOT NULL,
	[date] [date] NOT NULL,
	[description] [varchar](20) NOT NULL,
	[recommend] [char](10) NOT NULL,
	[approve] [char](10) NOT NULL,
 CONSTRAINT [PK_Dispose_Asset] PRIMARY KEY CLUSTERED 
(
	[dispID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 9/30/2015 9:48:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[empID] [char](10) NOT NULL,
	[firstName] [varchar](15) NOT NULL,
	[lastName] [varchar](15) NOT NULL,
	[contactNo] [int] NOT NULL,
	[email] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[empID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Location]    Script Date: 9/30/2015 9:48:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Location](
	[locID] [char](10) NOT NULL,
	[name] [varchar](20) NOT NULL,
	[department] [varchar](20) NOT NULL,
	[zonalOffice] [varchar](20) NOT NULL,
	[managerOffice] [varchar](20) NOT NULL,
	[branch] [varchar](20) NOT NULL,
	[address] [varchar](30) NOT NULL,
	[contactNo] [int] NOT NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[locID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 9/30/2015 9:48:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Notification](
	[notID] [char](10) NOT NULL,
	[notContent] [varchar](25) NOT NULL,
	[sendUser] [char](10) NOT NULL,
	[receiveUser] [char](10) NOT NULL,
	[date] [date] NOT NULL,
	[status] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[notID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Owner]    Script Date: 9/30/2015 9:48:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Owner](
	[empID] [char](10) NOT NULL,
	[designation] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Owner] PRIMARY KEY CLUSTERED 
(
	[empID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 9/30/2015 9:48:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SubCategory](
	[scatID] [char](10) NOT NULL,
	[catID] [char](10) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[depreciationRate] [int] NOT NULL,
	[lifetime] [int] NOT NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[scatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SystemUser]    Script Date: 9/30/2015 9:48:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SystemUser](
	[empID] [char](10) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[type] [varchar](10) NULL,
 CONSTRAINT [PK_SystemUser] PRIMARY KEY CLUSTERED 
(
	[empID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TransferAsset]    Script Date: 9/30/2015 9:48:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TransferAsset](
	[transID] [char](10) NOT NULL,
	[assetID] [char](15) NOT NULL,
	[type] [varchar](10) NOT NULL,
	[date] [date] NOT NULL,
	[location] [char](10) NOT NULL,
	[owner] [char](10) NOT NULL,
	[recommend] [char](10) NOT NULL,
	[approve] [char](10) NOT NULL,
 CONSTRAINT [PK_Transfer_Asset] PRIMARY KEY CLUSTERED 
(
	[transID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UpgradeAsset]    Script Date: 9/30/2015 9:48:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UpgradeAsset](
	[upID] [char](10) NULL,
	[assetID] [char](15) NULL,
	[value] [int] NULL,
	[date] [date] NULL,
	[description] [varchar](20) NULL,
	[recommend] [char](10) NULL,
	[approve] [char](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Asset] ([assetID], [name], [value], [category], [subcategory], [owner], [status], [location], [approvedDate], [recommend], [approve]) VALUES (N'A00001         ', N'Wooden Chair', 5000, N'C00001    ', N'SC00001   ', N'E00001    ', N'1', N'L00001    ', CAST(0xAE370B00 AS Date), N'E00001    ', N'E00001    ')
INSERT [dbo].[Category] ([catID], [name]) VALUES (N'C00001    ', N'Furniture')
INSERT [dbo].[Employee] ([empID], [firstName], [lastName], [contactNo], [email]) VALUES (N'E00001    ', N'Vihanga', N'Liyanage', 758598063, N'vihangaliyanage007@gmail.com')
INSERT [dbo].[Location] ([locID], [name], [department], [zonalOffice], [managerOffice], [branch], [address], [contactNo]) VALUES (N'L00001    ', N'IT Branch', N'It', N'Western', N'Head Office', N'Thelawala branch', N'No. 23, Thelawala Road.', 718899887)
INSERT [dbo].[Owner] ([empID], [designation]) VALUES (N'E00001    ', N'Manager')
INSERT [dbo].[SubCategory] ([scatID], [catID], [name], [depreciationRate], [lifetime]) VALUES (N'SC00001   ', N'C00001    ', N'Table', 20, 5)
INSERT [dbo].[SystemUser] ([empID], [username], [password], [type]) VALUES (N'E00001    ', N'vihanga', N'FC5C0C549DF84268B7DEDD4BD5535B89DF39271D', N'1')
ALTER TABLE [dbo].[Asset]  WITH CHECK ADD  CONSTRAINT [FK_Asset_SubCategory] FOREIGN KEY([subcategory])
REFERENCES [dbo].[SubCategory] ([scatID])
GO
ALTER TABLE [dbo].[Asset] CHECK CONSTRAINT [FK_Asset_SubCategory]
GO
ALTER TABLE [dbo].[Asset]  WITH CHECK ADD  CONSTRAINT [FK_Asset_SystemUser_approve] FOREIGN KEY([approve])
REFERENCES [dbo].[SystemUser] ([empID])
GO
ALTER TABLE [dbo].[Asset] CHECK CONSTRAINT [FK_Asset_SystemUser_approve]
GO
ALTER TABLE [dbo].[Asset]  WITH CHECK ADD  CONSTRAINT [FK_Asset_SystemUser_recommend] FOREIGN KEY([recommend])
REFERENCES [dbo].[SystemUser] ([empID])
GO
ALTER TABLE [dbo].[Asset] CHECK CONSTRAINT [FK_Asset_SystemUser_recommend]
GO
ALTER TABLE [dbo].[Asset]  WITH CHECK ADD  CONSTRAINT [has_loc] FOREIGN KEY([location])
REFERENCES [dbo].[Location] ([locID])
GO
ALTER TABLE [dbo].[Asset] CHECK CONSTRAINT [has_loc]
GO
ALTER TABLE [dbo].[Asset]  WITH CHECK ADD  CONSTRAINT [owns] FOREIGN KEY([owner])
REFERENCES [dbo].[Owner] ([empID])
GO
ALTER TABLE [dbo].[Asset] CHECK CONSTRAINT [owns]
GO
ALTER TABLE [dbo].[DisposeAsset]  WITH CHECK ADD  CONSTRAINT [FK_DisposeAsset_SystemUser_approve] FOREIGN KEY([approve])
REFERENCES [dbo].[SystemUser] ([empID])
GO
ALTER TABLE [dbo].[DisposeAsset] CHECK CONSTRAINT [FK_DisposeAsset_SystemUser_approve]
GO
ALTER TABLE [dbo].[DisposeAsset]  WITH CHECK ADD  CONSTRAINT [FK_DisposeAsset_SystemUser_recommend] FOREIGN KEY([recommend])
REFERENCES [dbo].[SystemUser] ([empID])
GO
ALTER TABLE [dbo].[DisposeAsset] CHECK CONSTRAINT [FK_DisposeAsset_SystemUser_recommend]
GO
ALTER TABLE [dbo].[DisposeAsset]  WITH CHECK ADD  CONSTRAINT [has_dispose] FOREIGN KEY([assetID])
REFERENCES [dbo].[Asset] ([assetID])
GO
ALTER TABLE [dbo].[DisposeAsset] CHECK CONSTRAINT [has_dispose]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_SystemUser_receive] FOREIGN KEY([receiveUser])
REFERENCES [dbo].[SystemUser] ([empID])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_SystemUser_receive]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_SystemUser_send] FOREIGN KEY([sendUser])
REFERENCES [dbo].[SystemUser] ([empID])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_SystemUser_send]
GO
ALTER TABLE [dbo].[Owner]  WITH CHECK ADD  CONSTRAINT [ISA_1] FOREIGN KEY([empID])
REFERENCES [dbo].[Employee] ([empID])
GO
ALTER TABLE [dbo].[Owner] CHECK CONSTRAINT [ISA_1]
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_Category] FOREIGN KEY([catID])
REFERENCES [dbo].[Category] ([catID])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_Category]
GO
ALTER TABLE [dbo].[SystemUser]  WITH CHECK ADD  CONSTRAINT [FK_SystemUser_Employee] FOREIGN KEY([empID])
REFERENCES [dbo].[Employee] ([empID])
GO
ALTER TABLE [dbo].[SystemUser] CHECK CONSTRAINT [FK_SystemUser_Employee]
GO
ALTER TABLE [dbo].[TransferAsset]  WITH CHECK ADD  CONSTRAINT [FK_TransferAsset_SystemUser_approve] FOREIGN KEY([approve])
REFERENCES [dbo].[SystemUser] ([empID])
GO
ALTER TABLE [dbo].[TransferAsset] CHECK CONSTRAINT [FK_TransferAsset_SystemUser_approve]
GO
ALTER TABLE [dbo].[TransferAsset]  WITH CHECK ADD  CONSTRAINT [FK_TransferAsset_SystemUser_recommend] FOREIGN KEY([recommend])
REFERENCES [dbo].[SystemUser] ([empID])
GO
ALTER TABLE [dbo].[TransferAsset] CHECK CONSTRAINT [FK_TransferAsset_SystemUser_recommend]
GO
ALTER TABLE [dbo].[TransferAsset]  WITH CHECK ADD  CONSTRAINT [has_transfer] FOREIGN KEY([assetID])
REFERENCES [dbo].[Asset] ([assetID])
GO
ALTER TABLE [dbo].[TransferAsset] CHECK CONSTRAINT [has_transfer]
GO
ALTER TABLE [dbo].[TransferAsset]  WITH CHECK ADD  CONSTRAINT [trans_loc] FOREIGN KEY([location])
REFERENCES [dbo].[Location] ([locID])
GO
ALTER TABLE [dbo].[TransferAsset] CHECK CONSTRAINT [trans_loc]
GO
ALTER TABLE [dbo].[TransferAsset]  WITH CHECK ADD  CONSTRAINT [trans_owner] FOREIGN KEY([owner])
REFERENCES [dbo].[Owner] ([empID])
GO
ALTER TABLE [dbo].[TransferAsset] CHECK CONSTRAINT [trans_owner]
GO
ALTER TABLE [dbo].[UpgradeAsset]  WITH CHECK ADD  CONSTRAINT [FK_UpgradeAsset_SystemUser_approve] FOREIGN KEY([approve])
REFERENCES [dbo].[SystemUser] ([empID])
GO
ALTER TABLE [dbo].[UpgradeAsset] CHECK CONSTRAINT [FK_UpgradeAsset_SystemUser_approve]
GO
ALTER TABLE [dbo].[UpgradeAsset]  WITH CHECK ADD  CONSTRAINT [FK_UpgradeAsset_SystemUser_recommend] FOREIGN KEY([recommend])
REFERENCES [dbo].[SystemUser] ([empID])
GO
ALTER TABLE [dbo].[UpgradeAsset] CHECK CONSTRAINT [FK_UpgradeAsset_SystemUser_recommend]
GO
ALTER TABLE [dbo].[UpgradeAsset]  WITH CHECK ADD  CONSTRAINT [has_upgrade] FOREIGN KEY([assetID])
REFERENCES [dbo].[Asset] ([assetID])
GO
ALTER TABLE [dbo].[UpgradeAsset] CHECK CONSTRAINT [has_upgrade]
GO
USE [master]
GO
ALTER DATABASE [FixAMz] SET  READ_WRITE 
GO
