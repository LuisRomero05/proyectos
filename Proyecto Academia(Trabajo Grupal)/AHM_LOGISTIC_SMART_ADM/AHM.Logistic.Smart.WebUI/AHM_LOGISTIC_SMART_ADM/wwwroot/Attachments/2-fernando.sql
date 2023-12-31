USE [master]
GO
/****** Object:  Database [LOGISTIC_SMART_AHM]    Script Date: 3/6/2022 18:23:24 ******/
CREATE DATABASE [LOGISTIC_SMART_AHM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LOGISTIC_SMART_AHM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\LOGISTIC_SMART_AHM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LOGISTIC_SMART_AHM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\LOGISTIC_SMART_AHM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LOGISTIC_SMART_AHM] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LOGISTIC_SMART_AHM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LOGISTIC_SMART_AHM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LOGISTIC_SMART_AHM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LOGISTIC_SMART_AHM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LOGISTIC_SMART_AHM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LOGISTIC_SMART_AHM] SET ARITHABORT OFF 
GO
ALTER DATABASE [LOGISTIC_SMART_AHM] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [LOGISTIC_SMART_AHM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LOGISTIC_SMART_AHM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LOGISTIC_SMART_AHM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LOGISTIC_SMART_AHM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LOGISTIC_SMART_AHM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LOGISTIC_SMART_AHM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LOGISTIC_SMART_AHM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LOGISTIC_SMART_AHM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LOGISTIC_SMART_AHM] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LOGISTIC_SMART_AHM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LOGISTIC_SMART_AHM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LOGISTIC_SMART_AHM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LOGISTIC_SMART_AHM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LOGISTIC_SMART_AHM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LOGISTIC_SMART_AHM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LOGISTIC_SMART_AHM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LOGISTIC_SMART_AHM] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LOGISTIC_SMART_AHM] SET  MULTI_USER 
GO
ALTER DATABASE [LOGISTIC_SMART_AHM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LOGISTIC_SMART_AHM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LOGISTIC_SMART_AHM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LOGISTIC_SMART_AHM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LOGISTIC_SMART_AHM] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LOGISTIC_SMART_AHM] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [LOGISTIC_SMART_AHM] SET QUERY_STORE = OFF
GO
USE [LOGISTIC_SMART_AHM]
GO
/****** Object:  Schema [Acce]    Script Date: 3/6/2022 18:23:25 ******/
CREATE SCHEMA [Acce]
GO
/****** Object:  Schema [Clte]    Script Date: 3/6/2022 18:23:25 ******/
CREATE SCHEMA [Clte]
GO
/****** Object:  Schema [Gral]    Script Date: 3/6/2022 18:23:25 ******/
CREATE SCHEMA [Gral]
GO
/****** Object:  Schema [Publ]    Script Date: 3/6/2022 18:23:25 ******/
CREATE SCHEMA [Publ]
GO
/****** Object:  Schema [Vent]    Script Date: 3/6/2022 18:23:25 ******/
CREATE SCHEMA [Vent]
GO
/****** Object:  Table [Acce].[tbComponents]    Script Date: 3/6/2022 18:23:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Acce].[tbComponents](
	[com_Id] [int] IDENTITY(1,1) NOT NULL,
	[com_Description] [nvarchar](150) NOT NULL,
	[com_Status] [bit] NOT NULL,
 CONSTRAINT [PK_Acce_tbComponentes_comp_Id] PRIMARY KEY CLUSTERED 
(
	[com_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Acce].[View_tbComponents_List]    Script Date: 3/6/2022 18:23:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--==================PROCEDIMIENTOS ALMACENADOS==================

/*SECCIÓN #37*/
CREATE VIEW [Acce].[View_tbComponents_List]
--========================================================
--Author:       Angel Teruel
--Create date:  26/05/2022
--Description:  Procedimiento que selecciona los 
--              componentes del sistema.
--========================================================
AS
        SELECT  [Comp].[com_Id],            
                [Comp].[com_Description],   
				[Comp].[com_Status]
        FROM    [Acce].[tbComponents]		AS [Comp]
GO
/****** Object:  Table [Acce].[tbModules]    Script Date: 3/6/2022 18:23:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Acce].[tbModules](
	[mod_Id] [int] IDENTITY(1,1) NOT NULL,
	[com_Id] [int] NOT NULL,
	[mod_Description] [nvarchar](50) NOT NULL,
	[mod_Status] [bit] NULL,
 CONSTRAINT [PK_Acce_tbModules_mod_Id] PRIMARY KEY CLUSTERED 
(
	[mod_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Acce].[tbModuleItems]    Script Date: 3/6/2022 18:23:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Acce].[tbModuleItems](
	[mit_Id] [int] IDENTITY(1,1) NOT NULL,
	[mod_Id] [int] NOT NULL,
	[mit_Descripction] [nvarchar](150) NOT NULL,
	[mit_Status] [bit] NULL,
 CONSTRAINT [PK_Acce_tbModulosPantallas_modpt_Id] PRIMARY KEY CLUSTERED 
(
	[mit_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Acce].[View_tbModulosPantallas_List]    Script Date: 3/6/2022 18:23:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/*SECCIÓN #45*/
CREATE VIEW [Acce].[View_tbModulosPantallas_List]
--========================================================
--Author:       Angel Teruel
--Create date:  26/05/2022
--Description:  Selecciona todos los registros de las
--              pantallas.
--========================================================
AS
        SELECT  [Modite].mit_Id,
				[Modite].mit_Descripction,
                [Mod].[mod_Id],
                [Mod].[mod_Description],
                [Modite].mit_Status
        FROM    [Acce].[tbModuleItems] Modite INNER JOIN [Acce].[tbModules] [Mod]
        ON      [Modite].[mod_Id] = [Mod].[mod_Id]
GO
/****** Object:  Table [Acce].[tbRoles]    Script Date: 3/6/2022 18:23:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Acce].[tbRoles](
	[rol_Id] [int] IDENTITY(1,1) NOT NULL,
	[rol_Description] [nvarchar](50) NOT NULL,
	[rol_Status] [bit] NOT NULL,
	[rol_IdUserCreate] [int] NOT NULL,
	[rol_DateCreate] [datetime] NOT NULL,
	[rol_IdUserModifies] [int] NULL,
	[rol_DateModifies] [datetime] NULL,
 CONSTRAINT [PK_Acce_tbRoles_rol_Id] PRIMARY KEY CLUSTERED 
(
	[rol_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Acce].[tbUsers]    Script Date: 3/6/2022 18:23:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Acce].[tbUsers](
	[usu_Id] [int] IDENTITY(1,1) NOT NULL,
	[usu_UserName] [varchar](20) NOT NULL,
	[usu_Password] [nvarchar](max) NOT NULL,
	[usu_PasswordSalt] [nvarchar](max) NOT NULL,
	[rol_Id] [int] NULL,
	[usu_Status] [bit] NOT NULL,
	[Per_Id] [int] NOT NULL,
	[usu_IdUserCreate] [int] NOT NULL,
	[usu_DateCreate] [datetime] NOT NULL,
	[usu_IdUserModifies] [int] NULL,
	[usu_DateModifies] [datetime] NULL,
 CONSTRAINT [PK_Acce_tbUsers_usu_Id] PRIMARY KEY CLUSTERED 
(
	[usu_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [Acce].[View_tbRoles_List]    Script Date: 3/6/2022 18:23:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #46*/
CREATE VIEW [Acce].[View_tbRoles_List]
--========================================================
--Author:       Angel Teruel
--Create date:  26/05/2022
--Description:  Selecciona todos los roles activos.
--========================================================
AS

        SELECT  
                [roles].[rol_Id],                
                [roles].[rol_Description],
                [roles].[rol_Status],
        CASE    [roles].[rol_Status] WHEN 1 THEN 'Activo' WHEN 0 THEN 'Inactivo' END  Estado   ,
				us.usu_UserName AS Usuario_Crea,
				[roles].[rol_DateCreate] AS Fecha_creacion
        FROM    [Acce].[tbRoles] AS roles 
		INNER JOIN [Acce].[tbUsers] AS us ON roles.rol_IdUserCreate=us.usu_Id
GO
/****** Object:  Table [Acce].[tbRoleModuleItems]    Script Date: 3/6/2022 18:23:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Acce].[tbRoleModuleItems](
	[rmi_Id] [int] IDENTITY(1,1) NOT NULL,
	[mit_Id] [int] NOT NULL,
	[rol_Id] [int] NOT NULL,
 CONSTRAINT [PK_Acce_tbRolModulesScreen_rmi_Id] PRIMARY KEY CLUSTERED 
(
	[rmi_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Acce].[View_tbRoleModuleItems_List]    Script Date: 3/6/2022 18:23:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #51*/
CREATE VIEW [Acce].[View_tbRoleModuleItems_List]
--========================================================
--Author:       Angel Teruel
--Create date:  26/05/2022
--Description:  Selecciona todos los roles por modulos.
--========================================================
AS
        SELECT  
                rmi.rmi_Id,
				rol.rol_Description,
				mi.mit_Descripction
        FROM    [Acce].[tbRoleModuleItems] AS rmi 
		INNER JOIN  [Acce].[tbRoles] AS rol ON rol.rol_Id=rmi.rol_Id
		INNER JOIN  [Acce].[tbModuleItems] AS mi ON mi.mit_Id=rmi.mit_Id
GO
/****** Object:  Table [Gral].[tbDepartments]    Script Date: 3/6/2022 18:23:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbDepartments](
	[dep_Id] [int] IDENTITY(1,1) NOT NULL,
	[dep_Code] [varchar](2) NOT NULL,
	[dep_Description] [nvarchar](100) NOT NULL,
	[dep_Status] [bit] NOT NULL,
	[dep_IdUserCreate] [int] NOT NULL,
	[dep_DateCreate] [datetime] NOT NULL,
	[dep_IdUserModifies] [int] NULL,
	[dep_DateModifies] [datetime] NULL,
 CONSTRAINT [PK_Gral_tbDepartments_depto_Id] PRIMARY KEY CLUSTERED 
(
	[dep_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Gral].[View_tbDepartments_List]    Script Date: 3/6/2022 18:23:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*SECCIÓN #52*/
CREATE VIEW [Gral].[View_tbDepartments_List]
--========================================================
--Author:       Angel Teruel
--Create date:  26/05/2022
--Description:  Selecciona todos los Departamenntos.
--========================================================
AS
        SELECT  
                dep.dep_Id,
				dep.dep_Code,
				dep.dep_Description,
				dep.dep_Status,
				dep.dep_IdUserCreate,
				us.usu_UserName AS usu_UserNameCreate,
				dep.dep_DateCreate,
				dep.dep_IdUserModifies,
				usm.usu_UserName AS usu_UserNameModifies,
				dep.dep_DateModifies
        FROM   [Gral].[tbDepartments]  AS dep
		INNER JOIN [Acce].[tbUsers] AS us ON dep.dep_IdUserCreate=us.usu_Id
		LEFT JOIN [Acce].[tbUsers] AS usm ON dep.dep_IdUserModifies = usm.usu_Id
		WHERE dep.dep_Status = 1
GO
/****** Object:  Table [Gral].[tbMunicipalities]    Script Date: 3/6/2022 18:23:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbMunicipalities](
	[mun_Id] [int] IDENTITY(1,1) NOT NULL,
	[mun_Code] [varchar](4) NOT NULL,
	[mun_Description] [nvarchar](100) NOT NULL,
	[dep_Id] [int] NOT NULL,
	[mun_Status] [bit] NOT NULL,
	[mun_IdUserCreate] [int] NOT NULL,
	[mun_DateCreate] [datetime] NOT NULL,
	[mun_IdUserModifies] [int] NULL,
	[mun_DateModifies] [datetime] NULL,
 CONSTRAINT [PK_Gral_tbMunicipalities_mun_Id] PRIMARY KEY CLUSTERED 
(
	[mun_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Gral].[View_tbMunicipalities_List]    Script Date: 3/6/2022 18:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #56*/
CREATE VIEW [Gral].[View_tbMunicipalities_List]
--========================================================
--Author:       Angel Teruel
--Create date:  26/05/2022
--Description:  Selecciona todos los roles activos.
--========================================================
AS
        SELECT  mun.[mun_Id],
				mun.[mun_Code],
				mun.[mun_Description],
				mun.[dep_Id],
				dep.dep_Description,
				mun.[mun_Status],
				mun.[mun_IdUserCreate],
				us.usu_UserName AS usu_UserNameCreate,
                mun.mun_DateCreate,
				mun.mun_IdUserModifies,
				usm.usu_UserName AS usu_UserNameModifies,
				mun.mun_DateModifies
        FROM   [Gral].[tbMunicipalities]  AS mun 
		INNER JOIN [Acce].[tbUsers] AS us ON mun.mun_IdUserCreate=us.usu_Id
		LEFT JOIN [Acce].[tbUsers] AS usm ON mun.mun_IdUserModifies = usm.usu_Id
		INNER JOIN [Gral].[tbDepartments] AS dep ON dep.dep_Id = mun.dep_Id
		WHERE mun.[mun_Status] = 1
GO
/****** Object:  Table [Gral].[tbAreas]    Script Date: 3/6/2022 18:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbAreas](
	[are_Id] [int] IDENTITY(1,1) NOT NULL,
	[are_Description] [nvarchar](max) NULL,
	[are_Status] [bit] NOT NULL,
	[are_IdUserCreate] [int] NULL,
	[are_DateCreate] [datetime] NOT NULL,
	[are_IdUserModifies] [int] NULL,
	[are_DateModifies] [datetime] NULL,
 CONSTRAINT [PK_Gral_tbAreas_are_Id] PRIMARY KEY CLUSTERED 
(
	[are_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [Gral].[View_Areas_List]    Script Date: 3/6/2022 18:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #60*/
CREATE VIEW [Gral].[View_Areas_List]
--========================================================
--Author:       Angel Teruel
--Create date:  26/05/2022
--Description:  Selecciona todos los roles activos.
--========================================================
AS 
	SELECT * FROM [Gral].[tbAreas]
GO
/****** Object:  Table [Gral].[tbOccupations]    Script Date: 3/6/2022 18:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbOccupations](
	[occ_Id] [int] IDENTITY(1,1) NOT NULL,
	[occ_Description] [nvarchar](100) NULL,
	[occ_Status] [bit] NOT NULL,
	[occ_IdUserCreate] [int] NOT NULL,
	[occ_DateCreate] [datetime] NOT NULL,
	[occ_IdUserModifies] [int] NULL,
	[occ_DateModifies] [datetime] NULL,
 CONSTRAINT [PK_tbOccupations_occ_Id] PRIMARY KEY CLUSTERED 
(
	[occ_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Gral].[View_tbOccupations_List]    Script Date: 3/6/2022 18:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #64*/
CREATE VIEW [Gral].[View_tbOccupations_List]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Selecciona todas las ocupaciones.
--========================================================
AS
        SELECT occ_Id,
			   occ_Description,
			   occ_Status,
			   occ_IdUserCreate,
			   us.usu_UserName AS usu_UserNameCreate,
			   occ.occ_DateCreate,
			   occ.occ_IdUserModifies,
			   usm.usu_UserName AS usu_UserNameModifies,
			   occ.occ_DateModifies
        FROM   [Gral].[tbOccupations]  AS  occ
		INNER JOIN [Acce].[tbUsers] AS us ON occ.occ_IdUserCreate=us.usu_Id
		LEFT JOIN [Acce].[tbUsers] AS usm ON occ.occ_IdUserModifies=us.usu_Id
		WHERE occ_Status = 1
GO
/****** Object:  Table [Gral].[tbPersons]    Script Date: 3/6/2022 18:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbPersons](
	[per_Id] [int] IDENTITY(1,1) NOT NULL,
	[per_Identidad] [varchar](13) NOT NULL,
	[per_Firstname] [nvarchar](20) NOT NULL,
	[per_Secondname] [nvarchar](20) NULL,
	[per_LastNames] [nvarchar](20) NOT NULL,
	[per_BirthDate] [date] NOT NULL,
	[per_Sex] [char](1) NULL,
	[per_Email] [nvarchar](100) NOT NULL,
	[per_Phone] [nvarchar](11) NOT NULL,
	[per_Direccion] [nvarchar](200) NOT NULL,
	[dep_Id] [int] NOT NULL,
	[mun_Id] [int] NOT NULL,
	[per_Esciv] [char](1) NOT NULL,
	[per_Status] [bit] NOT NULL,
	[per_IdUserCreate] [int] NOT NULL,
	[per_DateCreate] [datetime] NULL,
	[per_IdUserModifies] [int] NULL,
	[per_DateModifies] [datetime] NULL,
 CONSTRAINT [PK_Gral_tbPersons_per_Id] PRIMARY KEY CLUSTERED 
(
	[per_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Acce].[View_tbUsers_List]    Script Date: 3/6/2022 18:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #68*/
CREATE VIEW [Acce].[View_tbUsers_List]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Muestra todos los usuarios registrados.
--========================================================
AS
		SELECT  usu.usu_Id AS [Id], 
				usu.usu_UserName AS [User Name], 
				usu.usu_Password AS [Password],
				rol.rol_Description AS [Role], 
				per.per_Firstname +' '+ per.per_Secondname AS [Person],
				usu.usu_Status,
				usu.usu_IdUserCreate,
				us.usu_UserName AS usu_UserNameCreate,
				usu.usu_DateCreate AS [Date Create],
				usu.usu_IdUserModifies,
				usm.usu_UserName AS usu_UserNameModifies,
				usu.usu_DateModifies
		FROM Acce.tbUsers AS usu INNER JOIN Acce.tbRoles AS rol ON usu.rol_Id = rol.rol_Id
								 INNER JOIN Gral.tbPersons AS per ON per.per_Id = usu.per_Id
								 INNER JOIN acce.tbUsers AS us ON usu.usu_IdUserCreate = us.usu_Id
								 LEFT JOIN acce.tbUsers AS usm ON usu.usu_IdUserModifies = usm.usu_Id
	    WHERE usu.usu_Status = 1
GO
/****** Object:  Table [Vent].[tbCategories]    Script Date: 3/6/2022 18:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vent].[tbCategories](
	[cat_Id] [int] IDENTITY(1,1) NOT NULL,
	[cat_Description] [nvarchar](300) NULL,
	[cat_Status] [bit] NOT NULL,
	[cat_IdUserCreate] [int] NOT NULL,
	[cat_DateCreate] [datetime] NOT NULL,
	[cat_IdUserModifies] [int] NULL,
	[cat_DateModifies] [datetime] NULL,
 CONSTRAINT [PK_Vent_tbCategories_cat_Id] PRIMARY KEY CLUSTERED 
(
	[cat_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Vent].[View_tbCategories_List]    Script Date: 3/6/2022 18:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #73*/
CREATE VIEW [Vent].[View_tbCategories_List]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Muestra el listado 
--              de la tabla Categorias.
--========================================================
AS
	SELECT * FROM [Vent].[tbCategories] 

GO
/****** Object:  Table [Clte].[tbTypeChannels]    Script Date: 3/6/2022 18:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Clte].[tbTypeChannels](
	[tyCh_Id] [int] IDENTITY(1,1) NOT NULL,
	[tyCh_Description] [nvarchar](100) NULL,
	[tyCh_Status] [bit] NOT NULL,
	[tyCh_IdUserCreate] [int] NOT NULL,
	[tyCh_DateCreate] [datetime] NOT NULL,
	[tyCh_IdUserModifies] [int] NULL,
	[tyCh_DateModifies] [datetime] NULL,
 CONSTRAINT [PK_Clte_tbTypeChannels_tyCh_Id] PRIMARY KEY CLUSTERED 
(
	[tyCh_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Clte].[tbCustomers]    Script Date: 3/6/2022 18:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Clte].[tbCustomers](
	[cus_Id] [int] IDENTITY(1,1) NOT NULL,
	[cus_AssignedUser] [int] NULL,
	[tyCh_Id] [int] NULL,
	[cus_Name] [nvarchar](200) NULL,
	[cus_RTN] [nvarchar](13) NULL,
	[cus_Address] [nvarchar](200) NULL,
	[mun_Id] [int] NULL,
	[cus_Email] [nvarchar](100) NULL,
	[cus_Phone] [nvarchar](11) NULL,
	[cus_AnotherPhone] [nvarchar](11) NULL,
	[cus_Status] [bit] NOT NULL,
	[cus_IdUserCreate] [int] NOT NULL,
	[cus_DateCreate] [datetime] NOT NULL,
	[cus_IdUserModifies] [int] NULL,
	[cus_DateModifies] [datetime] NULL,
 CONSTRAINT [PK_Clte_tbCustomers_cus_Id] PRIMARY KEY CLUSTERED 
(
	[cus_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Clte].[View_tbCustomers_List]    Script Date: 3/6/2022 18:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #77*/
CREATE VIEW [Clte].[View_tbCustomers_List]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que muestra el listado
--              en la tabla customers.
--========================================================
AS
		SELECT	cus.cus_Id					AS cus_Id,
				cus.cus_AssignedUser		AS cus_AssignedUser,
				cus.tyCh_Id					AS tyCh_Id,
				typ.tyCh_Description		AS tyCh_Description,
				cus.cus_Name				AS cus_Name,
				cus.cus_RTN					AS cus_RTN,
				cus.cus_Address				AS cus_Address,
				cus.mun_Id					AS mun_Id,
				mun.mun_Description			AS mun_Description,
				cus.cus_Email				AS cus_Email,
				cus_Phone					AS cus_Phone,
				cus_AnotherPhone			AS cus_AnotherPhone,
				cus_Status					AS cus_Status,
				cus_IdUserCreate			AS cus_IdUserCreate,
				usu.usu_UserName            AS usu_UserNameCreate,
				cus_DateCreate				AS cus_DateCreate,
				cus_IdUserModifies			AS cus_IdUserModifies,
				usm.usu_UserName            AS usu_UserNameModifies,
				cus_DateModifies			AS cus_DateModifies
		FROM	Clte.tbCustomers AS cus	
				INNER JOIN Gral.tbMunicipalities	AS mun	ON mun.mun_Id	= cus.mun_Id
				INNER JOIN Clte.tbTypeChannels		AS typ	ON cus.tyCh_Id = typ.tyCh_Id
				INNER JOIN Acce.tbUsers				AS usu	ON cus.cus_IdUserCreate = usu.usu_Id
				LEFT JOIN  Acce.tbUsers				AS usm	ON cus.cus_IdUserModifies = usm.usu_Id
		WHERE cus_Status = 1
GO
/****** Object:  Table [Vent].[tbSubCategories]    Script Date: 3/6/2022 18:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vent].[tbSubCategories](
	[scat_Id] [int] IDENTITY(1,1) NOT NULL,
	[scat_Description] [nvarchar](100) NULL,
	[cat_Id] [int] NULL,
	[scat_Status] [bit] NOT NULL,
	[scat_IdUserCreate] [int] NOT NULL,
	[scat_DateCreate] [datetime] NOT NULL,
	[scat_IdUserModifies] [int] NULL,
	[scat_DateModifies] [datetime] NULL,
 CONSTRAINT [PK_Vent_tbSubCategories_scat_Id] PRIMARY KEY CLUSTERED 
(
	[scat_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Vent].[View_tbSubCategories_List]    Script Date: 3/6/2022 18:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #81*/
CREATE VIEW [Vent].[View_tbSubCategories_List]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que muestra los registros
--              de la SubCategories.
--========================================================
AS
		SELECT	sbc.scat_Id AS [scat_Id],
				sbc.scat_Description AS [scat_Description],
				cat.cat_Id			AS [cat_Id],
				cat.cat_Description AS [cat_Description],
				sbc.scat_Status AS [scat_Status],
				sbc.scat_IdUserCreate,
				usr.usu_UserName AS [usu_UserNameCreate],
				sbc.scat_DateCreate AS [scat_DateCreate],
				sbc.scat_IdUserModifies,
				usr2.usu_UserName AS [usu_UserNameModifies],
				sbc.scat_DateModifies AS [scat_DateModifies]
		FROM Vent.tbSubCategories AS sbc	INNER JOIN Vent.tbCategories AS cat ON cat.cat_Id = sbc.cat_Id
											INNER JOIN Acce.tbUsers AS usr ON sbc.scat_IdUserCreate = usr.usu_Id
											LEFT JOIN Acce.tbUsers AS usr2 ON sbc.scat_IdUserModifies = usr2.usu_Id
		WHERE sbc.scat_Status = 1
GO
/****** Object:  Table [Clte].[tbContacts]    Script Date: 3/6/2022 18:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Clte].[tbContacts](
	[cont_Id] [int] IDENTITY(1,1) NOT NULL,
	[cont_Name] [nvarchar](100) NULL,
	[cont_LastName] [nvarchar](100) NULL,
	[cont_Email] [nvarchar](100) NULL,
	[cont_Phone] [nvarchar](11) NULL,
	[occ_Id] [int] NULL,
	[cus_Id] [int] NULL,
	[cont_Status] [bit] NOT NULL,
	[cont_IdUserCreate] [int] NOT NULL,
	[cont_DateCreate] [datetime] NOT NULL,
	[cont_IdUserModifies] [int] NULL,
	[cont_DateModifies] [datetime] NULL,
 CONSTRAINT [PK_Clte_tbContacts_cont_Id] PRIMARY KEY CLUSTERED 
(
	[cont_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Clte].[View_tbContacts_List]    Script Date: 3/6/2022 18:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/*SECCIÓN #85*/
CREATE VIEW [Clte].[View_tbContacts_List]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que muestra los registros
--              de la tabla Contacts.
--========================================================
AS
		SELECT	cont.cont_Id AS [cont_Id],
				cont.cont_Name,
				cont.cont_LastName,
				cont.cont_Email AS [cont_Email],
				cont.cont_Phone AS [cont_Phone],
				occ.occ_Id AS [occ_Id],
				occ.occ_Description AS [occ_Description],
				cus.cus_Id AS [cus_Id],
				cus.cus_Name AS [cus_Name], 
				cont.cont_Status AS [cont_Status],
				cont.cont_IdUserCreate AS [cont_IdUserCreate],
				usu.usu_UserName AS usu_UserNameCreate,
				cont.cont_DateCreate AS [cont_DateCreate],
				cont.cont_IdUserModifies AS [cont_IdUserModifies],
				usm.usu_UserName AS usu_UserNameModifies,
				cont.cont_DateModifies AS [cont_DateModifies]
		FROM Clte.tbContacts AS cont INNER JOIN Gral.tbOccupations AS occ ON occ.occ_Id = cont.occ_Id
		INNER JOIN Clte.tbCustomers AS cus ON cus.cus_Id = cont.cus_Id
		INNER JOIN acce.tbUsers AS usu ON cont.cont_IdUserCreate = usu.usu_Id
		LEFT JOIN acce.tbUsers AS usm ON cont.cont_IdUserModifies = usm.usu_Id
		WHERE cont.cont_Status = 1
GO
/****** Object:  Table [Gral].[tbEmployees]    Script Date: 3/6/2022 18:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbEmployees](
	[emp_Id] [int] IDENTITY(1,1) NOT NULL,
	[per_Id] [int] NULL,
	[are_Id] [int] NULL,
	[occ_Id] [int] NULL,
	[emp_Status] [bit] NOT NULL,
	[emp_IdUserCreate] [int] NOT NULL,
	[emp_DateCreate] [datetime] NOT NULL,
	[emp_IdUserModifies] [int] NULL,
	[emp_DateModifies] [datetime] NULL,
 CONSTRAINT [PK_tbEmployees_emp_Id] PRIMARY KEY CLUSTERED 
(
	[emp_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Gral].[View_tbEmployees_List]    Script Date: 3/6/2022 18:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #89*/
CREATE VIEW [Gral].[View_tbEmployees_List]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que muestra los registros
--              de la tabla Employees.
--========================================================
AS
		SELECT	emp.emp_Id AS [emp_Id],
				per.per_Id AS [per_Id],
				per.per_Firstname AS [per_Firstname],
				per.per_LastNames AS [per_LastNames],
				are.are_Id AS [are_Id],
				are.are_Description AS [are_Description],
				occ.occ_Id AS [occ_Id],
				occ.occ_Description AS [occ_Description],
				emp.emp_Status AS [emp_Status],
				emp.emp_IdUserCreate AS [emp_IdUserCreate],
				usu.usu_UserName AS usu_UserNameCreate,
				emp.emp_DateCreate AS [emp_DateCreate],
				emp.emp_IdUserModifies AS [emp_IdUserModifies],
				usm.usu_UserName AS usu_UserNameModifies,
				emp.emp_DateModifies AS [emp_DateModifies]
		FROM Gral.tbEmployees AS emp	INNER JOIN Gral.tbPersons AS per ON per.per_Id = emp.per_Id
										INNER JOIN Gral.tbAreas AS are ON are.are_Id = emp.are_Id
										INNER JOIN Gral.tbOccupations AS occ ON occ.occ_Id = emp.occ_Id
										INNER JOIN acce.tbUsers AS usu ON emp.emp_IdUserCreate = usu.usu_Id
										LEFT JOIN acce.tbUsers AS usm ON emp.emp_IdUserModifies = usm.usu_Id
		WHERE emp.emp_Status = 1
									
GO
/****** Object:  Table [Vent].[tbUnits]    Script Date: 3/6/2022 18:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vent].[tbUnits](
	[uni_Id] [int] IDENTITY(1,1) NOT NULL,
	[uni_Description] [nvarchar](100) NULL,
	[uni_Abrevitation] [nvarchar](4) NULL,
	[uni_Status] [bit] NOT NULL,
	[uni_IdUserCreate] [int] NOT NULL,
	[uni_DateCreate] [datetime] NOT NULL,
	[uni_IdUserModifies] [int] NULL,
	[uni_DateModifies] [datetime] NULL,
 CONSTRAINT [PK_Vent_tbUnits_uni_Id] PRIMARY KEY CLUSTERED 
(
	[uni_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Vent].[tbProducts]    Script Date: 3/6/2022 18:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vent].[tbProducts](
	[pro_Id] [int] IDENTITY(1,1) NOT NULL,
	[pro_Description] [nvarchar](200) NULL,
	[pro_PurchasePrice] [numeric](8, 2) NULL,
	[pro_SalesPrice] [numeric](8, 2) NULL,
	[pro_Stock] [int] NULL,
	[pro_ISV] [numeric](18, 0) NULL,
	[uni_Id] [int] NULL,
	[scat_Id] [int] NULL,
	[pro_Status] [bit] NOT NULL,
	[pro_IdUserCreate] [int] NOT NULL,
	[pro_DateCreate] [datetime] NOT NULL,
	[pro_IdUserModifies] [int] NULL,
	[pro_DateModifies] [datetime] NULL,
 CONSTRAINT [PK_Vent_tbProducts_pro_Id] PRIMARY KEY CLUSTERED 
(
	[pro_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Vent].[View_tbProducts_List]    Script Date: 3/6/2022 18:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #93*/
CREATE VIEW [Vent].[View_tbProducts_List]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que muestra los registros
--              de la tabla Products.
--========================================================
AS
	SELECT  pro.pro_Id,
		    pro.pro_Description,
			pro.pro_PurchasePrice,
			pro.pro_SalesPrice,
			pro.pro_Stock,
			pro.pro_ISV,
			pro.uni_Id,
			uni.uni_Description,
			subc.scat_Description,
			pro.scat_Id,
			pro.pro_Status,
			pro.pro_IdUserCreate,
			usu.usu_UserName AS usu_UserNameCreate,
			pro.pro_DateCreate,
			pro.pro_IdUserModifies,
			usm.usu_UserName AS usu_UserNameModifies,
			pro.pro_DateModifies
		
	FROM [Vent].[tbProducts] AS pro
	INNER JOIN [Vent].[tbUnits] AS uni ON uni.uni_Id=pro.uni_Id
	INNER JOIN [Vent].[tbSubCategories] AS subc ON subc.scat_Id=pro.scat_Id
	INNER JOIN acce.tbUsers AS usu ON pro.pro_IdUserCreate = usu.usu_Id
	LEFT JOIN acce.tbUsers AS usm ON pro.pro_IdUserModifies = usm.usu_Id
	WHERE pro.pro_Status = 1
GO
/****** Object:  View [Vent].[View_tbPersons_List]    Script Date: 3/6/2022 18:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #97*/
CREATE VIEW [Vent].[View_tbPersons_List]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que muestra los registros
--              de la tabla Persons.
--========================================================
AS
	SELECT  per.[per_Id],
			per.[per_Identidad],
			per.[per_Firstname],
			per.[per_Secondname],
			per.[per_LastNames],
			per.[per_BirthDate],
			per.[per_Sex],
			per.[per_Email],
			per.[per_Phone],
			per.[per_Direccion],
			per.[dep_Id],
			dep.dep_Description,
			per.[mun_Id],
			mun.mun_Description,
			per.[per_Esciv],
			per.[per_Status],
			per.[per_IdUserCreate],
			usu.usu_UserName AS usu_UserNameCreate,
			per.[per_DateCreate],
			per.per_IdUserModifies,
			usm.usu_UserName AS usu_UserNameModifies,
			per.per_DateModifies
		
	FROM [Gral].[tbPersons] AS per
	INNER JOIN [Gral].[tbDepartments] AS dep ON per.dep_Id=dep.dep_Id
	INNER JOIN [Gral].[tbMunicipalities] AS mun ON mun.mun_Id=per.mun_Id
	INNER JOIN acce.tbUsers AS usu ON per.per_IdUserCreate = usu.usu_Id
	LEFT JOIN acce.tbUsers AS usm ON per.per_IdUserModifies = usm.usu_Id
	WHERE per.[per_Status] = 1
GO
/****** Object:  Table [Vent].[tbCotizationsDetail]    Script Date: 3/6/2022 18:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vent].[tbCotizationsDetail](
	[code_Id] [int] IDENTITY(1,1) NOT NULL,
	[code_Cantidad] [int] NULL,
	[pro_Id] [int] NULL,
	[code_TotalPrice] [numeric](8, 2) NULL,
	[cot_Id] [int] NULL,
	[code_Status] [bit] NOT NULL,
	[code_IdUserCreate] [int] NOT NULL,
	[code_DateCreate] [datetime] NOT NULL,
	[code_IdUserModifies] [int] NULL,
	[code_DateModifies] [datetime] NULL,
 CONSTRAINT [PK_Vent_tbCotizationsDetail_code_Id] PRIMARY KEY CLUSTERED 
(
	[code_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Clte].[tbCustomerNotes]    Script Date: 3/6/2022 18:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Clte].[tbCustomerNotes](
	[cun_Id] [int] IDENTITY(1,1) NOT NULL,
	[cun_Descripcion] [nvarchar](100) NULL,
	[cun_ExpirationDate] [date] NULL,
	[pry_Id] [int] NULL,
	[cun_FileRoute] [nvarchar](max) NULL,
	[cus_Id] [int] NULL,
	[cun_Status] [bit] NOT NULL,
	[cun_IdUserCreate] [int] NOT NULL,
	[cun_DateCreate] [datetime] NOT NULL,
	[cun_IdUserModifies] [int] NULL,
	[cun_DateModifies] [datetime] NULL,
 CONSTRAINT [PK_Clte_tbCustomerNotes_cun_Id] PRIMARY KEY CLUSTERED 
(
	[cun_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Gral].[tbStates]    Script Date: 3/6/2022 18:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbStates](
	[sta_Id] [int] IDENTITY(1,1) NOT NULL,
	[sta_Description] [nvarchar](100) NULL,
	[sta_Status] [bit] NOT NULL,
	[sta_IdUserCreate] [int] NOT NULL,
	[sta_DateCreate] [datetime] NOT NULL,
	[sta_IdUserModifies] [int] NULL,
	[sta_DateModifies] [datetime] NULL,
 CONSTRAINT [PK_Gral_tbStates_sta_Id] PRIMARY KEY CLUSTERED 
(
	[sta_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Vent].[tbCotizations]    Script Date: 3/6/2022 18:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vent].[tbCotizations](
	[cot_Id] [int] IDENTITY(1,1) NOT NULL,
	[cun_Id] [int] NULL,
	[cot_DateValidUntil] [datetime] NULL,
	[sta_Id] [int] NULL,
	[cot_Status] [bit] NOT NULL,
	[cot_IdUserCreate] [int] NOT NULL,
	[cot_DateCreate] [datetime] NOT NULL,
	[cot_IdUserModifies] [int] NULL,
	[cot_DateModifies] [datetime] NULL,
 CONSTRAINT [PK_Vent_tbCotizations_cot_Id] PRIMARY KEY CLUSTERED 
(
	[cot_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Vent].[View_tbCotizations_List]    Script Date: 3/6/2022 18:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*SECCIÓN #101*/
CREATE VIEW [Vent].[View_tbCotizations_List]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Selecciona todas la cotizaciones.
--========================================================
AS
        SELECT coti.cot_Id,
			   coti.[cun_Id],
			   cun.cun_Descripcion,
			   coti.cot_DateValidUntil,
			   coti.sta_Id,
			   sta.sta_Description,
			   cotd.pro_Id,
			   pro.pro_Description,
			   coti.cot_Status,
			   coti.cot_IdUserCreate,
			   usu.usu_UserName AS usu_UserNameCreate,
			   coti.cot_DateCreate,
			   coti.cot_IdUserModifies,
			   usm.usu_UserName AS usu_UserNameModifies,
			   coti.cot_DateModifies
        FROM   [Vent].[tbCotizations]  AS  coti
		INNER JOIN [Clte].[tbCustomerNotes] AS cun ON cun.cun_Id=coti.cun_Id
		INNER JOIN [Gral].[tbStates] AS sta ON sta.sta_Id=coti.sta_Id
		INNER JOIN [Vent].[tbCotizationsDetail] AS cotd ON cotd.cot_Id=coti.cot_Id
		INNER JOIN [Vent].[tbProducts] AS pro ON cotd.pro_Id = pro.pro_Id
		INNER JOIN acce.tbUsers AS usu ON coti.cot_IdUserCreate = usu.usu_Id
		LEFT JOIN acce.tbUsers AS usm ON coti.cot_IdUserModifies = usm.usu_Id
		WHERE coti.cot_Status = 1
GO
/****** Object:  Table [Clte].[tbCustomerCalls]    Script Date: 3/6/2022 18:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Clte].[tbCustomerCalls](
	[cca_Id] [int] IDENTITY(1,1) NOT NULL,
	[cca_CallType] [char](1) NULL,
	[cca_Bussines] [nvarchar](100) NULL,
	[cus_Id] [int] NULL,
	[cca_Status] [bit] NOT NULL,
	[cca_IdUserCreate] [int] NOT NULL,
	[cca_DateCreate] [datetime] NOT NULL,
	[cca_IdUserModifies] [int] NULL,
	[cca_DateModifies] [datetime] NULL,
 CONSTRAINT [PK_Clte_tbCustomerCalls_cca_Id] PRIMARY KEY CLUSTERED 
(
	[cca_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Clte].[tbMeetings]    Script Date: 3/6/2022 18:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Clte].[tbMeetings](
	[met_Id] [int] IDENTITY(1,1) NOT NULL,
	[met_Title] [nvarchar](100) NULL,
	[met_MeetingLink] [nvarchar](max) NOT NULL,
	[met_StartTime] [time](7) NULL,
	[met_EndTime] [time](7) NULL,
	[met_Status] [bit] NOT NULL,
	[met_IdUserCreate] [int] NOT NULL,
	[met_DateCreate] [datetime] NOT NULL,
	[met_IdUserModifies] [int] NULL,
	[met_DateModifies] [datetime] NULL,
 CONSTRAINT [PK_Clte_tbMeetings_met_Id] PRIMARY KEY CLUSTERED 
(
	[met_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Clte].[tbMeetingsDetails]    Script Date: 3/6/2022 18:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Clte].[tbMeetingsDetails](
	[mde_Id] [int] IDENTITY(1,1) NOT NULL,
	[met_Id] [int] NULL,
	[cus_Id] [int] NULL,
	[mde_Status] [bit] NOT NULL,
	[mde_IdUserCreate] [int] NOT NULL,
	[mde_DateCreate] [datetime] NOT NULL,
	[mde_IdUserModifies] [int] NULL,
	[mde_DateModifies] [datetime] NULL,
 CONSTRAINT [PK_Clte_tbMeetingsDetails_mde_Id] PRIMARY KEY CLUSTERED 
(
	[mde_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Clte].[tbPriorities]    Script Date: 3/6/2022 18:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Clte].[tbPriorities](
	[pry_Id] [int] IDENTITY(1,1) NOT NULL,
	[pry_Descripcion] [nvarchar](100) NULL,
	[pry_Status] [bit] NOT NULL,
	[pry_IdUserCreate] [int] NOT NULL,
	[pry_DateCreate] [datetime] NOT NULL,
	[pry_IdUserModifies] [int] NULL,
	[pry_DateModifies] [datetime] NULL,
 CONSTRAINT [PK_Clte_tbPriorities_pry_Id] PRIMARY KEY CLUSTERED 
(
	[pry_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Vent].[tbMarketingDetails]    Script Date: 3/6/2022 18:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vent].[tbMarketingDetails](
	[mde_Id] [int] IDENTITY(1,1) NOT NULL,
	[mhe_Id] [int] NOT NULL,
	[cus_Id] [int] NOT NULL,
	[mde_Status] [bit] NOT NULL,
	[mde_IdUserCreate] [int] NOT NULL,
	[mde_DateCreate] [datetime] NOT NULL,
	[mde_IdUserModifies] [int] NULL,
	[mde_DateModifies] [datetime] NULL,
 CONSTRAINT [PK_Vent_tbMarketingDetails_mde_Id] PRIMARY KEY CLUSTERED 
(
	[mde_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Vent].[tbMarketingHeaders]    Script Date: 3/6/2022 18:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vent].[tbMarketingHeaders](
	[mhe_Id] [int] IDENTITY(1,1) NOT NULL,
	[mhe_Description] [nvarchar](100) NULL,
	[mhe_Status] [bit] NOT NULL,
	[mhe_IdUserCreate] [int] NOT NULL,
	[mhe_DateCreate] [datetime] NOT NULL,
	[mhe_IdUserModifies] [int] NULL,
	[mhe_DateModifies] [datetime] NULL,
 CONSTRAINT [PK_Vent_tbMarketingHeaders_mhe_Id] PRIMARY KEY CLUSTERED 
(
	[mhe_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Vent].[tbOrderDetails]    Script Date: 3/6/2022 18:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vent].[tbOrderDetails](
	[ode_Id] [int] IDENTITY(1,1) NOT NULL,
	[ode_Amount] [int] NOT NULL,
	[pro_Id] [int] NULL,
	[ode_TotalPrice] [numeric](8, 2) NOT NULL,
	[sor_Id] [int] NULL,
	[ode_Status] [bit] NOT NULL,
	[ode_IdUserCreate] [int] NOT NULL,
	[ode_DateCreate] [datetime] NOT NULL,
	[ode_IdUserModifies] [int] NULL,
	[ode_DateModifies] [datetime] NULL,
 CONSTRAINT [PK_Vent_tbOrderDetails_ode_Id] PRIMARY KEY CLUSTERED 
(
	[ode_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Vent].[tbSaleOrders]    Script Date: 3/6/2022 18:23:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vent].[tbSaleOrders](
	[sor_Id] [int] IDENTITY(1,1) NOT NULL,
	[cus_Id] [int] NULL,
	[cot_Id] [int] NULL,
	[sta_Id] [int] NULL,
	[sor_Status] [bit] NOT NULL,
	[sor_IdUserCreate] [int] NOT NULL,
	[sor_DateCreate] [datetime] NOT NULL,
	[sor_IdUserModifies] [int] NULL,
	[sor_DateModifies] [datetime] NULL,
 CONSTRAINT [PK_Vent_tbSaleOrders_sor_Id] PRIMARY KEY CLUSTERED 
(
	[sor_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Acce].[tbComponents] ON 

INSERT [Acce].[tbComponents] ([com_Id], [com_Description], [com_Status]) VALUES (1, N'Contabilidad', 1)
INSERT [Acce].[tbComponents] ([com_Id], [com_Description], [com_Status]) VALUES (2, N'Distribucion', 1)
INSERT [Acce].[tbComponents] ([com_Id], [com_Description], [com_Status]) VALUES (3, N'Produccion', 1)
INSERT [Acce].[tbComponents] ([com_Id], [com_Description], [com_Status]) VALUES (4, N'Mercadeo', 1)
INSERT [Acce].[tbComponents] ([com_Id], [com_Description], [com_Status]) VALUES (5, N'Recursos Humanos', 1)
SET IDENTITY_INSERT [Acce].[tbComponents] OFF
GO
SET IDENTITY_INSERT [Acce].[tbModules] ON 

INSERT [Acce].[tbModules] ([mod_Id], [com_Id], [mod_Description], [mod_Status]) VALUES (1, 5, N'Servicio al cliente', 1)
INSERT [Acce].[tbModules] ([mod_Id], [com_Id], [mod_Description], [mod_Status]) VALUES (2, 4, N'Ventas', 1)
INSERT [Acce].[tbModules] ([mod_Id], [com_Id], [mod_Description], [mod_Status]) VALUES (3, 4, N'Marketing', 1)
INSERT [Acce].[tbModules] ([mod_Id], [com_Id], [mod_Description], [mod_Status]) VALUES (5, 1, N'Informes,estadisticas y cuadros de mando', 1)
INSERT [Acce].[tbModules] ([mod_Id], [com_Id], [mod_Description], [mod_Status]) VALUES (6, 2, N'Social', 1)
SET IDENTITY_INSERT [Acce].[tbModules] OFF
GO
SET IDENTITY_INSERT [Acce].[tbRoles] ON 

INSERT [Acce].[tbRoles] ([rol_Id], [rol_Description], [rol_Status], [rol_IdUserCreate], [rol_DateCreate], [rol_IdUserModifies], [rol_DateModifies]) VALUES (1, N'Administrador', 1, 1, CAST(N'2022-06-03T01:26:55.487' AS DateTime), NULL, NULL)
INSERT [Acce].[tbRoles] ([rol_Id], [rol_Description], [rol_Status], [rol_IdUserCreate], [rol_DateCreate], [rol_IdUserModifies], [rol_DateModifies]) VALUES (2, N'Ejecuivo de ventas', 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Acce].[tbRoles] ([rol_Id], [rol_Description], [rol_Status], [rol_IdUserCreate], [rol_DateCreate], [rol_IdUserModifies], [rol_DateModifies]) VALUES (3, N'Ejecutivo de servicio al cliente', 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Acce].[tbRoles] ([rol_Id], [rol_Description], [rol_Status], [rol_IdUserCreate], [rol_DateCreate], [rol_IdUserModifies], [rol_DateModifies]) VALUES (4, N'Lider de ventas', 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [Acce].[tbRoles] OFF
GO
SET IDENTITY_INSERT [Acce].[tbUsers] ON 

INSERT [Acce].[tbUsers] ([usu_Id], [usu_UserName], [usu_Password], [usu_PasswordSalt], [rol_Id], [usu_Status], [Per_Id], [usu_IdUserCreate], [usu_DateCreate], [usu_IdUserModifies], [usu_DateModifies]) VALUES (1, N'Administrator', N'String', N'String', 1, 1, 1, 1, CAST(N'2022-06-03T01:26:55.490' AS DateTime), NULL, NULL)
INSERT [Acce].[tbUsers] ([usu_Id], [usu_UserName], [usu_Password], [usu_PasswordSalt], [rol_Id], [usu_Status], [Per_Id], [usu_IdUserCreate], [usu_DateCreate], [usu_IdUserModifies], [usu_DateModifies]) VALUES (2, N'Jose Ham', N'123', N'123', 2, 1, 2, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Acce].[tbUsers] ([usu_Id], [usu_UserName], [usu_Password], [usu_PasswordSalt], [rol_Id], [usu_Status], [Per_Id], [usu_IdUserCreate], [usu_DateCreate], [usu_IdUserModifies], [usu_DateModifies]) VALUES (3, N'Mauricio Escalante', N'123', N'123', 4, 1, 3, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [Acce].[tbUsers] OFF
GO
SET IDENTITY_INSERT [Clte].[tbContacts] ON 

INSERT [Clte].[tbContacts] ([cont_Id], [cont_Name], [cont_LastName], [cont_Email], [cont_Phone], [occ_Id], [cus_Id], [cont_Status], [cont_IdUserCreate], [cont_DateCreate], [cont_IdUserModifies], [cont_DateModifies]) VALUES (2, N'Jose ', N'Ham', N'jose@gmail.com', N'22225365', 1, 1, 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [Clte].[tbContacts] OFF
GO
SET IDENTITY_INSERT [Clte].[tbCustomerNotes] ON 

INSERT [Clte].[tbCustomerNotes] ([cun_Id], [cun_Descripcion], [cun_ExpirationDate], [pry_Id], [cun_FileRoute], [cus_Id], [cun_Status], [cun_IdUserCreate], [cun_DateCreate], [cun_IdUserModifies], [cun_DateModifies]) VALUES (1, N'revicion de venta a jose ham', CAST(N'2022-06-25' AS Date), 1, N'1', 2, 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [Clte].[tbCustomerNotes] OFF
GO
SET IDENTITY_INSERT [Clte].[tbCustomers] ON 

INSERT [Clte].[tbCustomers] ([cus_Id], [cus_AssignedUser], [tyCh_Id], [cus_Name], [cus_RTN], [cus_Address], [mun_Id], [cus_Email], [cus_Phone], [cus_AnotherPhone], [cus_Status], [cus_IdUserCreate], [cus_DateCreate], [cus_IdUserModifies], [cus_DateModifies]) VALUES (1, 3, 1, N'Mauricio', N'0512200335265', NULL, 1, N'Maumau@gmail.com', N'98896959', N'22225365', 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Clte].[tbCustomers] ([cus_Id], [cus_AssignedUser], [tyCh_Id], [cus_Name], [cus_RTN], [cus_Address], [mun_Id], [cus_Email], [cus_Phone], [cus_AnotherPhone], [cus_Status], [cus_IdUserCreate], [cus_DateCreate], [cus_IdUserModifies], [cus_DateModifies]) VALUES (2, 2, 2, N'Jose', N'0501235605102', NULL, 2, N'joseham@gmail.com', N'32569895', N'22225365', 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [Clte].[tbCustomers] OFF
GO
SET IDENTITY_INSERT [Clte].[tbMeetings] ON 

INSERT [Clte].[tbMeetings] ([met_Id], [met_Title], [met_MeetingLink], [met_StartTime], [met_EndTime], [met_Status], [met_IdUserCreate], [met_DateCreate], [met_IdUserModifies], [met_DateModifies]) VALUES (1, N'Reunion de ventas', N'www.example.com', CAST(N'11:30:00' AS Time), CAST(N'14:00:00' AS Time), 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Clte].[tbMeetings] ([met_Id], [met_Title], [met_MeetingLink], [met_StartTime], [met_EndTime], [met_Status], [met_IdUserCreate], [met_DateCreate], [met_IdUserModifies], [met_DateModifies]) VALUES (2, N'Reunion de lider de marketing', N'www.example.com', CAST(N'15:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [Clte].[tbMeetings] OFF
GO
SET IDENTITY_INSERT [Clte].[tbPriorities] ON 

INSERT [Clte].[tbPriorities] ([pry_Id], [pry_Descripcion], [pry_Status], [pry_IdUserCreate], [pry_DateCreate], [pry_IdUserModifies], [pry_DateModifies]) VALUES (1, N'Hacer gestionamiento del envio #011225', 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Clte].[tbPriorities] ([pry_Id], [pry_Descripcion], [pry_Status], [pry_IdUserCreate], [pry_DateCreate], [pry_IdUserModifies], [pry_DateModifies]) VALUES (2, N'Revisar envio de Mauricio Escalante, pedido #200110', 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [Clte].[tbPriorities] OFF
GO
SET IDENTITY_INSERT [Clte].[tbTypeChannels] ON 

INSERT [Clte].[tbTypeChannels] ([tyCh_Id], [tyCh_Description], [tyCh_Status], [tyCh_IdUserCreate], [tyCh_DateCreate], [tyCh_IdUserModifies], [tyCh_DateModifies]) VALUES (1, N'Privado', 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Clte].[tbTypeChannels] ([tyCh_Id], [tyCh_Description], [tyCh_Status], [tyCh_IdUserCreate], [tyCh_DateCreate], [tyCh_IdUserModifies], [tyCh_DateModifies]) VALUES (2, N'Public', 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [Clte].[tbTypeChannels] OFF
GO
SET IDENTITY_INSERT [Gral].[tbAreas] ON 

INSERT [Gral].[tbAreas] ([are_Id], [are_Description], [are_Status], [are_IdUserCreate], [are_DateCreate], [are_IdUserModifies], [are_DateModifies]) VALUES (1, N'Administracion', 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Gral].[tbAreas] ([are_Id], [are_Description], [are_Status], [are_IdUserCreate], [are_DateCreate], [are_IdUserModifies], [are_DateModifies]) VALUES (2, N'Ventas', 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Gral].[tbAreas] ([are_Id], [are_Description], [are_Status], [are_IdUserCreate], [are_DateCreate], [are_IdUserModifies], [are_DateModifies]) VALUES (3, N'Acceso', 0, 1, CAST(N'2022-06-03T09:06:11.287' AS DateTime), 0, CAST(N'2022-06-03T09:06:26.047' AS DateTime))
INSERT [Gral].[tbAreas] ([are_Id], [are_Description], [are_Status], [are_IdUserCreate], [are_DateCreate], [are_IdUserModifies], [are_DateModifies]) VALUES (4, N'Generales', 0, 1, CAST(N'2022-06-03T09:08:45.380' AS DateTime), 0, CAST(N'2022-06-03T12:43:49.610' AS DateTime))
SET IDENTITY_INSERT [Gral].[tbAreas] OFF
GO
SET IDENTITY_INSERT [Gral].[tbDepartments] ON 

INSERT [Gral].[tbDepartments] ([dep_Id], [dep_Code], [dep_Description], [dep_Status], [dep_IdUserCreate], [dep_DateCreate], [dep_IdUserModifies], [dep_DateModifies]) VALUES (1, N'01', N'Atlantida', 1, 1, CAST(N'2022-06-03T01:26:55.470' AS DateTime), NULL, NULL)
INSERT [Gral].[tbDepartments] ([dep_Id], [dep_Code], [dep_Description], [dep_Status], [dep_IdUserCreate], [dep_DateCreate], [dep_IdUserModifies], [dep_DateModifies]) VALUES (2, N'02', N'Colon', 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Gral].[tbDepartments] ([dep_Id], [dep_Code], [dep_Description], [dep_Status], [dep_IdUserCreate], [dep_DateCreate], [dep_IdUserModifies], [dep_DateModifies]) VALUES (3, N'03', N'Comayagua', 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Gral].[tbDepartments] ([dep_Id], [dep_Code], [dep_Description], [dep_Status], [dep_IdUserCreate], [dep_DateCreate], [dep_IdUserModifies], [dep_DateModifies]) VALUES (4, N'04', N'Copan', 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Gral].[tbDepartments] ([dep_Id], [dep_Code], [dep_Description], [dep_Status], [dep_IdUserCreate], [dep_DateCreate], [dep_IdUserModifies], [dep_DateModifies]) VALUES (5, N'05', N'Cortes', 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [Gral].[tbDepartments] OFF
GO
SET IDENTITY_INSERT [Gral].[tbEmployees] ON 

INSERT [Gral].[tbEmployees] ([emp_Id], [per_Id], [are_Id], [occ_Id], [emp_Status], [emp_IdUserCreate], [emp_DateCreate], [emp_IdUserModifies], [emp_DateModifies]) VALUES (1, 2, 1, 1, 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Gral].[tbEmployees] ([emp_Id], [per_Id], [are_Id], [occ_Id], [emp_Status], [emp_IdUserCreate], [emp_DateCreate], [emp_IdUserModifies], [emp_DateModifies]) VALUES (2, 3, 1, 2, 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [Gral].[tbEmployees] OFF
GO
SET IDENTITY_INSERT [Gral].[tbMunicipalities] ON 

INSERT [Gral].[tbMunicipalities] ([mun_Id], [mun_Code], [mun_Description], [dep_Id], [mun_Status], [mun_IdUserCreate], [mun_DateCreate], [mun_IdUserModifies], [mun_DateModifies]) VALUES (1, N'0101', N'La Ceiba', 1, 1, 1, CAST(N'2022-06-03T01:26:55.477' AS DateTime), NULL, NULL)
INSERT [Gral].[tbMunicipalities] ([mun_Id], [mun_Code], [mun_Description], [dep_Id], [mun_Status], [mun_IdUserCreate], [mun_DateCreate], [mun_IdUserModifies], [mun_DateModifies]) VALUES (2, N'0201', N'Trujillo', 2, 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Gral].[tbMunicipalities] ([mun_Id], [mun_Code], [mun_Description], [dep_Id], [mun_Status], [mun_IdUserCreate], [mun_DateCreate], [mun_IdUserModifies], [mun_DateModifies]) VALUES (3, N'0301', N'Comayagua', 3, 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Gral].[tbMunicipalities] ([mun_Id], [mun_Code], [mun_Description], [dep_Id], [mun_Status], [mun_IdUserCreate], [mun_DateCreate], [mun_IdUserModifies], [mun_DateModifies]) VALUES (5, N'0401', N'STA. Rosa de copan', 4, 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Gral].[tbMunicipalities] ([mun_Id], [mun_Code], [mun_Description], [dep_Id], [mun_Status], [mun_IdUserCreate], [mun_DateCreate], [mun_IdUserModifies], [mun_DateModifies]) VALUES (6, N'0501', N'San pedro sula', 5, 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [Gral].[tbMunicipalities] OFF
GO
SET IDENTITY_INSERT [Gral].[tbOccupations] ON 

INSERT [Gral].[tbOccupations] ([occ_Id], [occ_Description], [occ_Status], [occ_IdUserCreate], [occ_DateCreate], [occ_IdUserModifies], [occ_DateModifies]) VALUES (1, N'Lider de ventas', 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Gral].[tbOccupations] ([occ_Id], [occ_Description], [occ_Status], [occ_IdUserCreate], [occ_DateCreate], [occ_IdUserModifies], [occ_DateModifies]) VALUES (2, N'Ejecutivo de ventas', 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Gral].[tbOccupations] ([occ_Id], [occ_Description], [occ_Status], [occ_IdUserCreate], [occ_DateCreate], [occ_IdUserModifies], [occ_DateModifies]) VALUES (3, N'Lider de servicio al cliente', 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Gral].[tbOccupations] ([occ_Id], [occ_Description], [occ_Status], [occ_IdUserCreate], [occ_DateCreate], [occ_IdUserModifies], [occ_DateModifies]) VALUES (4, N'Ejecutivo de servicio al cliente', 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Gral].[tbOccupations] ([occ_Id], [occ_Description], [occ_Status], [occ_IdUserCreate], [occ_DateCreate], [occ_IdUserModifies], [occ_DateModifies]) VALUES (5, N'Lider de Marcketing', 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [Gral].[tbOccupations] OFF
GO
SET IDENTITY_INSERT [Gral].[tbPersons] ON 

INSERT [Gral].[tbPersons] ([per_Id], [per_Identidad], [per_Firstname], [per_Secondname], [per_LastNames], [per_BirthDate], [per_Sex], [per_Email], [per_Phone], [per_Direccion], [dep_Id], [mun_Id], [per_Esciv], [per_Status], [per_IdUserCreate], [per_DateCreate], [per_IdUserModifies], [per_DateModifies]) VALUES (1, N'0607199301183', N'Magdaly', N'Prueba', N'Zuniga', CAST(N'1993-11-25' AS Date), N'F', N'magdaly.zuniga03@hotmail.com', N'87839575', N'Time Square,New York', 1, 1, N'C', 1, 1, CAST(N'2022-06-03T01:26:55.480' AS DateTime), 1, CAST(N'2022-06-03T10:46:37.490' AS DateTime))
INSERT [Gral].[tbPersons] ([per_Id], [per_Identidad], [per_Firstname], [per_Secondname], [per_LastNames], [per_BirthDate], [per_Sex], [per_Email], [per_Phone], [per_Direccion], [dep_Id], [mun_Id], [per_Esciv], [per_Status], [per_IdUserCreate], [per_DateCreate], [per_IdUserModifies], [per_DateModifies]) VALUES (2, N'0501199101102', N'Jose', N'Armando', N'Benkay', CAST(N'2001-05-21' AS Date), N'M', N'jose@gmail.com', N'22225653', N'Col. los alamos,calle principal,casa de esquina roja', 5, 5, N'S', 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Gral].[tbPersons] ([per_Id], [per_Identidad], [per_Firstname], [per_Secondname], [per_LastNames], [per_BirthDate], [per_Sex], [per_Email], [per_Phone], [per_Direccion], [dep_Id], [mun_Id], [per_Esciv], [per_Status], [per_IdUserCreate], [per_DateCreate], [per_IdUserModifies], [per_DateModifies]) VALUES (3, N'0101200103560', N'Mauricio', N'Roberto', N'Escalante', CAST(N'2002-06-24' AS Date), N'M', N'Maumau@gmail.com', N'26547598', N'Col. la barqueña', 1, 1, N'U', 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Gral].[tbPersons] ([per_Id], [per_Identidad], [per_Firstname], [per_Secondname], [per_LastNames], [per_BirthDate], [per_Sex], [per_Email], [per_Phone], [per_Direccion], [dep_Id], [mun_Id], [per_Esciv], [per_Status], [per_IdUserCreate], [per_DateCreate], [per_IdUserModifies], [per_DateModifies]) VALUES (4, N'1601200300809', N'Jireh', N'Aguilar', N'Madrid', CAST(N'2022-06-03' AS Date), N'M', N'jadonay', N'90909', N'Barrio', 1, 1, N'C', 1, 1, CAST(N'2022-06-03T05:15:32.033' AS DateTime), NULL, NULL)
INSERT [Gral].[tbPersons] ([per_Id], [per_Identidad], [per_Firstname], [per_Secondname], [per_LastNames], [per_BirthDate], [per_Sex], [per_Email], [per_Phone], [per_Direccion], [dep_Id], [mun_Id], [per_Esciv], [per_Status], [per_IdUserCreate], [per_DateCreate], [per_IdUserModifies], [per_DateModifies]) VALUES (5, N'1601200300810', N'Gunter', N'Fredo', N'Aguilar', CAST(N'2022-06-03' AS Date), N'F', N'prueba', N'4566', N'Barrio', 1, 1, N'S', 1, 1, CAST(N'2022-06-03T05:21:28.720' AS DateTime), 1, CAST(N'2022-06-03T12:29:14.963' AS DateTime))
INSERT [Gral].[tbPersons] ([per_Id], [per_Identidad], [per_Firstname], [per_Secondname], [per_LastNames], [per_BirthDate], [per_Sex], [per_Email], [per_Phone], [per_Direccion], [dep_Id], [mun_Id], [per_Esciv], [per_Status], [per_IdUserCreate], [per_DateCreate], [per_IdUserModifies], [per_DateModifies]) VALUES (6, N'1601200300811', N'Andony', N'Garay', N'Del Monte', CAST(N'2022-06-03' AS Date), N'M', N'hy', N'6789', N'Barrio', 1, 2, N'U', 1, 1, CAST(N'2022-06-03T12:32:32.807' AS DateTime), 1, CAST(N'2022-06-03T12:53:50.983' AS DateTime))
SET IDENTITY_INSERT [Gral].[tbPersons] OFF
GO
SET IDENTITY_INSERT [Gral].[tbStates] ON 

INSERT [Gral].[tbStates] ([sta_Id], [sta_Description], [sta_Status], [sta_IdUserCreate], [sta_DateCreate], [sta_IdUserModifies], [sta_DateModifies]) VALUES (1, N'Ejecutandose', 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Gral].[tbStates] ([sta_Id], [sta_Description], [sta_Status], [sta_IdUserCreate], [sta_DateCreate], [sta_IdUserModifies], [sta_DateModifies]) VALUES (2, N'En Curso', 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Gral].[tbStates] ([sta_Id], [sta_Description], [sta_Status], [sta_IdUserCreate], [sta_DateCreate], [sta_IdUserModifies], [sta_DateModifies]) VALUES (3, N'Entregado', 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Gral].[tbStates] ([sta_Id], [sta_Description], [sta_Status], [sta_IdUserCreate], [sta_DateCreate], [sta_IdUserModifies], [sta_DateModifies]) VALUES (4, N'Finalizado', 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [Gral].[tbStates] OFF
GO
SET IDENTITY_INSERT [Vent].[tbCategories] ON 

INSERT [Vent].[tbCategories] ([cat_Id], [cat_Description], [cat_Status], [cat_IdUserCreate], [cat_DateCreate], [cat_IdUserModifies], [cat_DateModifies]) VALUES (1, N'Equipo Industrial', 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Vent].[tbCategories] ([cat_Id], [cat_Description], [cat_Status], [cat_IdUserCreate], [cat_DateCreate], [cat_IdUserModifies], [cat_DateModifies]) VALUES (2, N'Equipo de Construccion', 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [Vent].[tbCategories] OFF
GO
SET IDENTITY_INSERT [Vent].[tbCotizations] ON 

INSERT [Vent].[tbCotizations] ([cot_Id], [cun_Id], [cot_DateValidUntil], [sta_Id], [cot_Status], [cot_IdUserCreate], [cot_DateCreate], [cot_IdUserModifies], [cot_DateModifies]) VALUES (1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), 1, 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Vent].[tbCotizations] ([cot_Id], [cun_Id], [cot_DateValidUntil], [sta_Id], [cot_Status], [cot_IdUserCreate], [cot_DateCreate], [cot_IdUserModifies], [cot_DateModifies]) VALUES (5, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), 3, 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [Vent].[tbCotizations] OFF
GO
SET IDENTITY_INSERT [Vent].[tbCotizationsDetail] ON 

INSERT [Vent].[tbCotizationsDetail] ([code_Id], [code_Cantidad], [pro_Id], [code_TotalPrice], [cot_Id], [code_Status], [code_IdUserCreate], [code_DateCreate], [code_IdUserModifies], [code_DateModifies]) VALUES (4, 5, 1, CAST(50000.00 AS Numeric(8, 2)), 1, 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Vent].[tbCotizationsDetail] ([code_Id], [code_Cantidad], [pro_Id], [code_TotalPrice], [cot_Id], [code_Status], [code_IdUserCreate], [code_DateCreate], [code_IdUserModifies], [code_DateModifies]) VALUES (5, 1, 2, CAST(50000.00 AS Numeric(8, 2)), 5, 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [Vent].[tbCotizationsDetail] OFF
GO
SET IDENTITY_INSERT [Vent].[tbProducts] ON 

INSERT [Vent].[tbProducts] ([pro_Id], [pro_Description], [pro_PurchasePrice], [pro_SalesPrice], [pro_Stock], [pro_ISV], [uni_Id], [scat_Id], [pro_Status], [pro_IdUserCreate], [pro_DateCreate], [pro_IdUserModifies], [pro_DateModifies]) VALUES (1, N'Generador Generig', CAST(10000.00 AS Numeric(8, 2)), CAST(15000.00 AS Numeric(8, 2)), 5, CAST(12 AS Numeric(18, 0)), 1, 1, 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Vent].[tbProducts] ([pro_Id], [pro_Description], [pro_PurchasePrice], [pro_SalesPrice], [pro_Stock], [pro_ISV], [uni_Id], [scat_Id], [pro_Status], [pro_IdUserCreate], [pro_DateCreate], [pro_IdUserModifies], [pro_DateModifies]) VALUES (2, N'Hoja retroescabadora L2000', CAST(50000.00 AS Numeric(8, 2)), CAST(55000.00 AS Numeric(8, 2)), 10, CAST(12 AS Numeric(18, 0)), 2, 2, 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [Vent].[tbProducts] OFF
GO
SET IDENTITY_INSERT [Vent].[tbSubCategories] ON 

INSERT [Vent].[tbSubCategories] ([scat_Id], [scat_Description], [cat_Id], [scat_Status], [scat_IdUserCreate], [scat_DateCreate], [scat_IdUserModifies], [scat_DateModifies]) VALUES (1, N'Generador 2400kb', 1, 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Vent].[tbSubCategories] ([scat_Id], [scat_Description], [cat_Id], [scat_Status], [scat_IdUserCreate], [scat_DateCreate], [scat_IdUserModifies], [scat_DateModifies]) VALUES (2, N'Retroescabadora CAT', 2, 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [Vent].[tbSubCategories] OFF
GO
SET IDENTITY_INSERT [Vent].[tbUnits] ON 

INSERT [Vent].[tbUnits] ([uni_Id], [uni_Description], [uni_Abrevitation], [uni_Status], [uni_IdUserCreate], [uni_DateCreate], [uni_IdUserModifies], [uni_DateModifies]) VALUES (1, N'Miligramo', N'Mg', 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Vent].[tbUnits] ([uni_Id], [uni_Description], [uni_Abrevitation], [uni_Status], [uni_IdUserCreate], [uni_DateCreate], [uni_IdUserModifies], [uni_DateModifies]) VALUES (2, N'Gramo', N'G', 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [Vent].[tbUnits] ([uni_Id], [uni_Description], [uni_Abrevitation], [uni_Status], [uni_IdUserCreate], [uni_DateCreate], [uni_IdUserModifies], [uni_DateModifies]) VALUES (3, N'KiloGramo', N'Kg', 1, 1, CAST(N'2022-06-01T00:00:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [Vent].[tbUnits] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Acce_tbRoles_rol_Description]    Script Date: 3/6/2022 18:23:28 ******/
ALTER TABLE [Acce].[tbRoles] ADD  CONSTRAINT [UQ_Acce_tbRoles_rol_Description] UNIQUE NONCLUSTERED 
(
	[rol_Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Acce_tbUsers_usu_UserName]    Script Date: 3/6/2022 18:23:28 ******/
ALTER TABLE [Acce].[tbUsers] ADD  CONSTRAINT [UQ_Acce_tbUsers_usu_UserName] UNIQUE NONCLUSTERED 
(
	[usu_UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Gral_tbDepartments_depto_DescripTion]    Script Date: 3/6/2022 18:23:28 ******/
ALTER TABLE [Gral].[tbDepartments] ADD  CONSTRAINT [UQ_Gral_tbDepartments_depto_DescripTion] UNIQUE NONCLUSTERED 
(
	[dep_Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Gral_tbPersons_per_Identidad]    Script Date: 3/6/2022 18:23:28 ******/
ALTER TABLE [Gral].[tbPersons] ADD  CONSTRAINT [UQ_Gral_tbPersons_per_Identidad] UNIQUE NONCLUSTERED 
(
	[per_Identidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [Acce].[tbModuleItems]  WITH CHECK ADD  CONSTRAINT [FK_Acce_tbModulos_tbModuleItems_mod_Id] FOREIGN KEY([mod_Id])
REFERENCES [Acce].[tbModules] ([mod_Id])
GO
ALTER TABLE [Acce].[tbModuleItems] CHECK CONSTRAINT [FK_Acce_tbModulos_tbModuleItems_mod_Id]
GO
ALTER TABLE [Acce].[tbModules]  WITH CHECK ADD  CONSTRAINT [FK_Acce_tbComponents_tbModules_comp_Id] FOREIGN KEY([com_Id])
REFERENCES [Acce].[tbComponents] ([com_Id])
GO
ALTER TABLE [Acce].[tbModules] CHECK CONSTRAINT [FK_Acce_tbComponents_tbModules_comp_Id]
GO
ALTER TABLE [Acce].[tbRoleModuleItems]  WITH CHECK ADD  CONSTRAINT [FK_Acce_tbModuleItems_tbRolModulesScreen_mit_Id] FOREIGN KEY([mit_Id])
REFERENCES [Acce].[tbModuleItems] ([mit_Id])
GO
ALTER TABLE [Acce].[tbRoleModuleItems] CHECK CONSTRAINT [FK_Acce_tbModuleItems_tbRolModulesScreen_mit_Id]
GO
ALTER TABLE [Acce].[tbRoleModuleItems]  WITH CHECK ADD  CONSTRAINT [FK_Acce_tbRoles_tbRolModulesScreen_rol_Id] FOREIGN KEY([rol_Id])
REFERENCES [Acce].[tbRoles] ([rol_Id])
GO
ALTER TABLE [Acce].[tbRoleModuleItems] CHECK CONSTRAINT [FK_Acce_tbRoles_tbRolModulesScreen_rol_Id]
GO
ALTER TABLE [Acce].[tbRoles]  WITH CHECK ADD  CONSTRAINT [FK_Acce_tbUsers_tbRoles_rol_IdUserCreate] FOREIGN KEY([rol_IdUserCreate])
REFERENCES [Acce].[tbUsers] ([usu_Id])
GO
ALTER TABLE [Acce].[tbRoles] CHECK CONSTRAINT [FK_Acce_tbUsers_tbRoles_rol_IdUserCreate]
GO
ALTER TABLE [Acce].[tbRoles]  WITH CHECK ADD  CONSTRAINT [FK_Acce_tbUsers_tbRoles_rol_IdUserModifies] FOREIGN KEY([rol_IdUserModifies])
REFERENCES [Acce].[tbUsers] ([usu_Id])
GO
ALTER TABLE [Acce].[tbRoles] CHECK CONSTRAINT [FK_Acce_tbUsers_tbRoles_rol_IdUserModifies]
GO
ALTER TABLE [Acce].[tbUsers]  WITH CHECK ADD  CONSTRAINT [FK_Acce_tbPersons_tbUsers_per_Id] FOREIGN KEY([Per_Id])
REFERENCES [Gral].[tbPersons] ([per_Id])
GO
ALTER TABLE [Acce].[tbUsers] CHECK CONSTRAINT [FK_Acce_tbPersons_tbUsers_per_Id]
GO
ALTER TABLE [Acce].[tbUsers]  WITH CHECK ADD  CONSTRAINT [FK_Acce_tbUsers_tbrol_rol_Id] FOREIGN KEY([rol_Id])
REFERENCES [Acce].[tbRoles] ([rol_Id])
GO
ALTER TABLE [Acce].[tbUsers] CHECK CONSTRAINT [FK_Acce_tbUsers_tbrol_rol_Id]
GO
ALTER TABLE [Acce].[tbUsers]  WITH CHECK ADD  CONSTRAINT [FK_Acce_tbUsers_tbUsers_usu_IdUserModifies] FOREIGN KEY([usu_IdUserModifies])
REFERENCES [Acce].[tbUsers] ([usu_Id])
GO
ALTER TABLE [Acce].[tbUsers] CHECK CONSTRAINT [FK_Acce_tbUsers_tbUsers_usu_IdUserModifies]
GO
ALTER TABLE [Clte].[tbContacts]  WITH CHECK ADD  CONSTRAINT [FK_Clte_tbContacts_tbCustomers_cus_Id] FOREIGN KEY([cus_Id])
REFERENCES [Clte].[tbCustomers] ([cus_Id])
GO
ALTER TABLE [Clte].[tbContacts] CHECK CONSTRAINT [FK_Clte_tbContacts_tbCustomers_cus_Id]
GO
ALTER TABLE [Clte].[tbContacts]  WITH CHECK ADD  CONSTRAINT [FK_Clte_tbContacts_tbOccupations_occ_Id] FOREIGN KEY([occ_Id])
REFERENCES [Gral].[tbOccupations] ([occ_Id])
GO
ALTER TABLE [Clte].[tbContacts] CHECK CONSTRAINT [FK_Clte_tbContacts_tbOccupations_occ_Id]
GO
ALTER TABLE [Clte].[tbCustomerCalls]  WITH CHECK ADD  CONSTRAINT [FK_Clte_tbCustomerCalls_cus_Id_Clte_tbCustomer_cus_Id] FOREIGN KEY([cus_Id])
REFERENCES [Clte].[tbCustomers] ([cus_Id])
GO
ALTER TABLE [Clte].[tbCustomerCalls] CHECK CONSTRAINT [FK_Clte_tbCustomerCalls_cus_Id_Clte_tbCustomer_cus_Id]
GO
ALTER TABLE [Clte].[tbCustomerNotes]  WITH CHECK ADD  CONSTRAINT [FK_Clte_tbCustomerNotes_pry_Id_Clte_tbPriorities_pry_Id] FOREIGN KEY([pry_Id])
REFERENCES [Clte].[tbPriorities] ([pry_Id])
GO
ALTER TABLE [Clte].[tbCustomerNotes] CHECK CONSTRAINT [FK_Clte_tbCustomerNotes_pry_Id_Clte_tbPriorities_pry_Id]
GO
ALTER TABLE [Clte].[tbCustomers]  WITH CHECK ADD  CONSTRAINT [FK_Clte_tbCustomers_Acce_tbUsers_usu_Id] FOREIGN KEY([cus_AssignedUser])
REFERENCES [Acce].[tbUsers] ([usu_Id])
GO
ALTER TABLE [Clte].[tbCustomers] CHECK CONSTRAINT [FK_Clte_tbCustomers_Acce_tbUsers_usu_Id]
GO
ALTER TABLE [Clte].[tbCustomers]  WITH CHECK ADD  CONSTRAINT [FK_Clte_tbCustomers_Gral_tbMunicipalities_mun_Id] FOREIGN KEY([mun_Id])
REFERENCES [Gral].[tbMunicipalities] ([mun_Id])
GO
ALTER TABLE [Clte].[tbCustomers] CHECK CONSTRAINT [FK_Clte_tbCustomers_Gral_tbMunicipalities_mun_Id]
GO
ALTER TABLE [Clte].[tbCustomers]  WITH CHECK ADD  CONSTRAINT [FK_Clte_tbCustomers_tyCh_Id_Clte_tbTypeChannels_tyCh_Id] FOREIGN KEY([tyCh_Id])
REFERENCES [Clte].[tbTypeChannels] ([tyCh_Id])
GO
ALTER TABLE [Clte].[tbCustomers] CHECK CONSTRAINT [FK_Clte_tbCustomers_tyCh_Id_Clte_tbTypeChannels_tyCh_Id]
GO
ALTER TABLE [Clte].[tbMeetingsDetails]  WITH CHECK ADD  CONSTRAINT [FK_Clte_tbMeetingsDetails_cus_Id_Clte_tbCustomers_cus_Id] FOREIGN KEY([cus_Id])
REFERENCES [Clte].[tbCustomers] ([cus_Id])
GO
ALTER TABLE [Clte].[tbMeetingsDetails] CHECK CONSTRAINT [FK_Clte_tbMeetingsDetails_cus_Id_Clte_tbCustomers_cus_Id]
GO
ALTER TABLE [Clte].[tbMeetingsDetails]  WITH CHECK ADD  CONSTRAINT [FK_Clte_tbMeetingsDetails_met_Id_Clte_tbMeetings_met_Id] FOREIGN KEY([met_Id])
REFERENCES [Clte].[tbMeetings] ([met_Id])
GO
ALTER TABLE [Clte].[tbMeetingsDetails] CHECK CONSTRAINT [FK_Clte_tbMeetingsDetails_met_Id_Clte_tbMeetings_met_Id]
GO
ALTER TABLE [Gral].[tbDepartments]  WITH CHECK ADD  CONSTRAINT [FK_Gral_tbUsers_tbDepartments_depto_IdUserCreate] FOREIGN KEY([dep_IdUserCreate])
REFERENCES [Acce].[tbUsers] ([usu_Id])
GO
ALTER TABLE [Gral].[tbDepartments] CHECK CONSTRAINT [FK_Gral_tbUsers_tbDepartments_depto_IdUserCreate]
GO
ALTER TABLE [Gral].[tbDepartments]  WITH CHECK ADD  CONSTRAINT [FK_Gral_tbUsers_tbDepartments_depto_IdUserModifies] FOREIGN KEY([dep_IdUserModifies])
REFERENCES [Acce].[tbUsers] ([usu_Id])
GO
ALTER TABLE [Gral].[tbDepartments] CHECK CONSTRAINT [FK_Gral_tbUsers_tbDepartments_depto_IdUserModifies]
GO
ALTER TABLE [Gral].[tbEmployees]  WITH CHECK ADD  CONSTRAINT [FK_tbEmployees_tbAreas_are_Id] FOREIGN KEY([are_Id])
REFERENCES [Gral].[tbAreas] ([are_Id])
GO
ALTER TABLE [Gral].[tbEmployees] CHECK CONSTRAINT [FK_tbEmployees_tbAreas_are_Id]
GO
ALTER TABLE [Gral].[tbEmployees]  WITH CHECK ADD  CONSTRAINT [FK_tbEmployees_tbOccupations_occ_Id] FOREIGN KEY([occ_Id])
REFERENCES [Gral].[tbOccupations] ([occ_Id])
GO
ALTER TABLE [Gral].[tbEmployees] CHECK CONSTRAINT [FK_tbEmployees_tbOccupations_occ_Id]
GO
ALTER TABLE [Gral].[tbEmployees]  WITH CHECK ADD  CONSTRAINT [FK_tbEmployees_tbPersons_per_Id] FOREIGN KEY([per_Id])
REFERENCES [Gral].[tbPersons] ([per_Id])
GO
ALTER TABLE [Gral].[tbEmployees] CHECK CONSTRAINT [FK_tbEmployees_tbPersons_per_Id]
GO
ALTER TABLE [Gral].[tbMunicipalities]  WITH CHECK ADD  CONSTRAINT [FK_Gral_tbDepartments_tbMunicipalities_dep_Id] FOREIGN KEY([dep_Id])
REFERENCES [Gral].[tbDepartments] ([dep_Id])
GO
ALTER TABLE [Gral].[tbMunicipalities] CHECK CONSTRAINT [FK_Gral_tbDepartments_tbMunicipalities_dep_Id]
GO
ALTER TABLE [Gral].[tbMunicipalities]  WITH CHECK ADD  CONSTRAINT [FK_Gral_tbUsers_tbMunicipalities_mpio_IdUserCreate] FOREIGN KEY([mun_IdUserCreate])
REFERENCES [Acce].[tbUsers] ([usu_Id])
GO
ALTER TABLE [Gral].[tbMunicipalities] CHECK CONSTRAINT [FK_Gral_tbUsers_tbMunicipalities_mpio_IdUserCreate]
GO
ALTER TABLE [Gral].[tbMunicipalities]  WITH CHECK ADD  CONSTRAINT [FK_Gral_tbUsers_tbMunicipalities_mpio_IdUserModifies] FOREIGN KEY([mun_IdUserModifies])
REFERENCES [Acce].[tbUsers] ([usu_Id])
GO
ALTER TABLE [Gral].[tbMunicipalities] CHECK CONSTRAINT [FK_Gral_tbUsers_tbMunicipalities_mpio_IdUserModifies]
GO
ALTER TABLE [Gral].[tbPersons]  WITH CHECK ADD  CONSTRAINT [FK_Acce_tbUsers_tbPersons_pers_IdUserModifies] FOREIGN KEY([per_IdUserModifies])
REFERENCES [Acce].[tbUsers] ([usu_Id])
GO
ALTER TABLE [Gral].[tbPersons] CHECK CONSTRAINT [FK_Acce_tbUsers_tbPersons_pers_IdUserModifies]
GO
ALTER TABLE [Gral].[tbPersons]  WITH CHECK ADD  CONSTRAINT [FK_Gral_tbDepartments_tbPersons_dep_Id] FOREIGN KEY([dep_Id])
REFERENCES [Gral].[tbDepartments] ([dep_Id])
GO
ALTER TABLE [Gral].[tbPersons] CHECK CONSTRAINT [FK_Gral_tbDepartments_tbPersons_dep_Id]
GO
ALTER TABLE [Gral].[tbPersons]  WITH CHECK ADD  CONSTRAINT [FK_Gral_tbMunicipalities_tbPersons_mun_Id] FOREIGN KEY([mun_Id])
REFERENCES [Gral].[tbMunicipalities] ([mun_Id])
GO
ALTER TABLE [Gral].[tbPersons] CHECK CONSTRAINT [FK_Gral_tbMunicipalities_tbPersons_mun_Id]
GO
ALTER TABLE [Vent].[tbCotizations]  WITH CHECK ADD  CONSTRAINT [FK_Vent_tbCotizations_cus_Id_Clte_tbCustomerNotes_cus_Id] FOREIGN KEY([cun_Id])
REFERENCES [Clte].[tbCustomerNotes] ([cun_Id])
GO
ALTER TABLE [Vent].[tbCotizations] CHECK CONSTRAINT [FK_Vent_tbCotizations_cus_Id_Clte_tbCustomerNotes_cus_Id]
GO
ALTER TABLE [Vent].[tbCotizations]  WITH CHECK ADD  CONSTRAINT [FK_Vent_tbCotizations_sta_Id_Gral_tbStates_sta_Id] FOREIGN KEY([sta_Id])
REFERENCES [Gral].[tbStates] ([sta_Id])
GO
ALTER TABLE [Vent].[tbCotizations] CHECK CONSTRAINT [FK_Vent_tbCotizations_sta_Id_Gral_tbStates_sta_Id]
GO
ALTER TABLE [Vent].[tbCotizationsDetail]  WITH CHECK ADD  CONSTRAINT [FK_Vent_tbCotizationsDetail_cot_Id_Vent_tbCotizations_cot_Id] FOREIGN KEY([cot_Id])
REFERENCES [Vent].[tbCotizations] ([cot_Id])
GO
ALTER TABLE [Vent].[tbCotizationsDetail] CHECK CONSTRAINT [FK_Vent_tbCotizationsDetail_cot_Id_Vent_tbCotizations_cot_Id]
GO
ALTER TABLE [Vent].[tbMarketingDetails]  WITH CHECK ADD  CONSTRAINT [FK_Vent_tbMarketingDetails_cus_Id_Clte_tbCustomers_cus_Id] FOREIGN KEY([cus_Id])
REFERENCES [Clte].[tbCustomers] ([cus_Id])
GO
ALTER TABLE [Vent].[tbMarketingDetails] CHECK CONSTRAINT [FK_Vent_tbMarketingDetails_cus_Id_Clte_tbCustomers_cus_Id]
GO
ALTER TABLE [Vent].[tbMarketingDetails]  WITH CHECK ADD  CONSTRAINT [FK_Vent_tbMarketingDetails_mhe_Id_Vent_tbMarketingHeaders_mhe_Id] FOREIGN KEY([mhe_Id])
REFERENCES [Vent].[tbMarketingHeaders] ([mhe_Id])
GO
ALTER TABLE [Vent].[tbMarketingDetails] CHECK CONSTRAINT [FK_Vent_tbMarketingDetails_mhe_Id_Vent_tbMarketingHeaders_mhe_Id]
GO
ALTER TABLE [Vent].[tbOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_Vent_tbOrderDetails_pro_Id_Vent_tbProducts_pro_Id] FOREIGN KEY([pro_Id])
REFERENCES [Vent].[tbProducts] ([pro_Id])
GO
ALTER TABLE [Vent].[tbOrderDetails] CHECK CONSTRAINT [FK_Vent_tbOrderDetails_pro_Id_Vent_tbProducts_pro_Id]
GO
ALTER TABLE [Vent].[tbOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_Vent_tbOrderDetails_sor_Id_tbSaleOrders] FOREIGN KEY([sor_Id])
REFERENCES [Vent].[tbSaleOrders] ([sor_Id])
GO
ALTER TABLE [Vent].[tbOrderDetails] CHECK CONSTRAINT [FK_Vent_tbOrderDetails_sor_Id_tbSaleOrders]
GO
ALTER TABLE [Vent].[tbProducts]  WITH CHECK ADD  CONSTRAINT [FK_Vent_tbProducts_scat_Id_Vent_tbSubCategories_scat_Id] FOREIGN KEY([scat_Id])
REFERENCES [Vent].[tbSubCategories] ([scat_Id])
GO
ALTER TABLE [Vent].[tbProducts] CHECK CONSTRAINT [FK_Vent_tbProducts_scat_Id_Vent_tbSubCategories_scat_Id]
GO
ALTER TABLE [Vent].[tbProducts]  WITH CHECK ADD  CONSTRAINT [FK_Vent_tbProducts_uni_Id_Vent_tbUnits_uni_Id] FOREIGN KEY([uni_Id])
REFERENCES [Vent].[tbUnits] ([uni_Id])
GO
ALTER TABLE [Vent].[tbProducts] CHECK CONSTRAINT [FK_Vent_tbProducts_uni_Id_Vent_tbUnits_uni_Id]
GO
ALTER TABLE [Vent].[tbSaleOrders]  WITH CHECK ADD  CONSTRAINT [FK_Vent_tbSaleOrders_cot_Id_Vent_tbCotizations_cot_Id] FOREIGN KEY([cot_Id])
REFERENCES [Vent].[tbCotizations] ([cot_Id])
GO
ALTER TABLE [Vent].[tbSaleOrders] CHECK CONSTRAINT [FK_Vent_tbSaleOrders_cot_Id_Vent_tbCotizations_cot_Id]
GO
ALTER TABLE [Vent].[tbSaleOrders]  WITH CHECK ADD  CONSTRAINT [FK_Vent_tbSaleOrders_cus_Id_Clte_tbCustomers_cus_Id] FOREIGN KEY([cus_Id])
REFERENCES [Clte].[tbCustomers] ([cus_Id])
GO
ALTER TABLE [Vent].[tbSaleOrders] CHECK CONSTRAINT [FK_Vent_tbSaleOrders_cus_Id_Clte_tbCustomers_cus_Id]
GO
ALTER TABLE [Vent].[tbSaleOrders]  WITH CHECK ADD  CONSTRAINT [FK_Vent_tbSaleOrders_sta_Id_Vent_tbStates_sta_Id] FOREIGN KEY([sta_Id])
REFERENCES [Gral].[tbStates] ([sta_Id])
GO
ALTER TABLE [Vent].[tbSaleOrders] CHECK CONSTRAINT [FK_Vent_tbSaleOrders_sta_Id_Vent_tbStates_sta_Id]
GO
ALTER TABLE [Vent].[tbSubCategories]  WITH CHECK ADD  CONSTRAINT [FK_Vent_tbSubCategories_cat_Id_Vent_tbCategories_cat_Id] FOREIGN KEY([cat_Id])
REFERENCES [Vent].[tbCategories] ([cat_Id])
GO
ALTER TABLE [Vent].[tbSubCategories] CHECK CONSTRAINT [FK_Vent_tbSubCategories_cat_Id_Vent_tbCategories_cat_Id]
GO
ALTER TABLE [Gral].[tbPersons]  WITH CHECK ADD  CONSTRAINT [CHK_Gral_tbPersons_per_Esciv] CHECK  (([per_Esciv]='U' OR [per_Esciv]='V' OR [per_Esciv]='D' OR [per_Esciv]='C' OR [per_Esciv]='S'))
GO
ALTER TABLE [Gral].[tbPersons] CHECK CONSTRAINT [CHK_Gral_tbPersons_per_Esciv]
GO
ALTER TABLE [Gral].[tbPersons]  WITH CHECK ADD  CONSTRAINT [CK_Gral_tbPersonas_per_Sex] CHECK  (([per_Sex]='F' OR [per_Sex]='M'))
GO
ALTER TABLE [Gral].[tbPersons] CHECK CONSTRAINT [CK_Gral_tbPersonas_per_Sex]
GO
/****** Object:  StoredProcedure [Acce].[UDP_tbComponents_DELETE]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*SECCIÓN #40*/
CREATE PROCEDURE [Acce].[UDP_tbComponents_DELETE]
--========================================================
--Author:       Angel Teruel
--Create date:  26/05/2022
--Description:  Procedimiento que elimina datos de la
--				tabla componentes al sistema.
--========================================================
		@com_Id				INT		
AS
    BEGIN
        UPDATE [Acce].[tbComponents]
        SET    [com_Status] = 0
        WHERE  com_Id = @com_Id
END
GO
/****** Object:  StoredProcedure [Acce].[UDP_tbComponents_INSERT]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*SECCIÓN #38*/
CREATE PROCEDURE [Acce].[UDP_tbComponents_INSERT]
--========================================================
--Author:       Angel Teruel
--Create date:  26/05/2022
--Description:  Procedimiento que inserta nuevos
--				componentes al sistema.
--========================================================
		@com_Description  NVARCHAR(50),		
		@com_Status		BIT					
AS
    BEGIN
        INSERT INTO Acce.tbComponents
        (
			[com_Description],
			[com_Status]
		)
        VALUES
        (
			@com_Description,
			@com_Status	
		)
		SELECT SCOPE_IDENTITY() AS [com_Id];
END
GO
/****** Object:  StoredProcedure [Acce].[UDP_tbComponents_UPDATE]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*SECCIÓN #39*/
CREATE PROCEDURE [Acce].[UDP_tbComponents_UPDATE]
--========================================================
--Author:       Angel Teruel
--Create date:  26/05/2022
--Description:  Procedimiento que modifica la tabla
--				componentes al sistema.
--========================================================
		@com_Id				INT,
		@com_Description	NVARCHAR(50),		
		@com_Status			BIT					
AS
    BEGIN
         UPDATE Acce.tbComponents
         SET      [com_Description]   = @com_Description,
				  [com_Status]        = @com_Status
               
         WHERE	 com_Id = @com_Id
END
GO
/****** Object:  StoredProcedure [Acce].[UDP_tbModules_DELETE]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #44*/
CREATE PROCEDURE [Acce].[UDP_tbModules_DELETE]
--========================================================
--Author:       Angel Teruel
--Create date:  26/05/2022
--Description:  Procedimiento que elimina datos de la
--				tabla modulos del sistema.
--========================================================
		@mod_Id				INT				
AS
    BEGIN
        UPDATE [Acce].[tbModules]
        SET    [mod_Status] = 0
        WHERE  mod_Id = @mod_Id
END
GO
/****** Object:  StoredProcedure [Acce].[UDP_tbModules_INSERT]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #42*/
CREATE PROCEDURE [Acce].[UDP_tbModules_INSERT]
--========================================================
--Author:       Angel Teruel
--Create date:  26/05/2022
--Description:  Procedimiento que inserta nuevos
--				modulos al sistema.
--========================================================
		@mod_Description  NVARCHAR(50),	
		@com_Id			  INT,
		@mod_Status		  BIT					
AS
    BEGIN
        INSERT INTO [Acce].[tbModules]
        (
			[com_Id],
			[mod_Description],
			[mod_Status]
		)
        VALUES
        (
			@com_Id	,
			@mod_Description,
			@mod_Status		
		)
		SELECT SCOPE_IDENTITY() AS [mod_Id];
END
GO
/****** Object:  StoredProcedure [Acce].[UDP_tbModules_UPDATE]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #43*/
CREATE PROCEDURE [Acce].[UDP_tbModules_UPDATE]
--========================================================
--Author:       Angel Teruel
--Create date:  26/05/2022
--Description:  Procedimiento que modifica la tabla
--				modulos del sistema.
--========================================================
		@mod_Id		  INT,
		@mod_Description  NVARCHAR(50),	
		@com_Id			  INT,
		@mod_Status		  BIT				
AS
    BEGIN
         UPDATE [Acce].[tbModules]
        SET      
				 [com_Id]           = @mod_Description,
				 [mod_Description]	= @com_Id,			
				 [mod_Status]	    = @mod_Status		

               
        WHERE  @mod_Id = @mod_Id
END
GO
/****** Object:  StoredProcedure [Acce].[UDP_tbRoles_DELETE]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #49*/
CREATE PROCEDURE [Acce].[UDP_tbRoles_DELETE]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que elimina registros
--              de la tabla roles.
--========================================================
	@rol_Id					INT,
	@rol_IdUserModifies		INT
AS
	BEGIN
		UPDATE Acce.tbRoles
		SET rol_Status = 0, rol_IdUserModifies = @rol_IdUserModifies
		WHERE rol_Id = @rol_Id
END

GO
/****** Object:  StoredProcedure [Acce].[UDP_tbRoles_INSERT]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #47*/
CREATE PROCEDURE [Acce].[UDP_tbRoles_INSERT]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que inserta registros
--              de la tabla de roles.
--========================================================
	@Description NVARCHAR(100),
	@IdUserCreate INT	
AS
	BEGIN
	INSERT INTO [Acce].[tbRoles]
           ([rol_Description]
           ,[rol_Status]
           ,[rol_IdUserCreate]
           ,[rol_DateCreate]
           ,[rol_IdUserModifies]
           ,[rol_DateModifies])
     VALUES
           (@Description,
		   1,
		   @IdUserCreate,
		   GETDATE(),
		   null,
		   null)
		   SELECT @@IDENTITY
	END

GO
/****** Object:  StoredProcedure [Acce].[UDP_tbRoles_UPDATE]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #48*/
CREATE PROCEDURE [Acce].[UDP_tbRoles_UPDATE]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que modifica registros
--              de la tabla de roles.
--========================================================
@rol_Id INT,
@rol_Description NVARCHAR(100),
@rol_IdUserModifies INT
AS
    BEGIN
    UPDATE [Acce].[tbRoles]
    SET [rol_Description] = @rol_Description,
       [rol_IdUserModifies] = @rol_IdUserModifies,
       [rol_DateModifies] = GETDATE()
   WHERE rol_Id = @rol_Id
		
	SELECT @@IDENTITY
 END

GO
/****** Object:  StoredProcedure [Acce].[UDP_tbUsers_DELETE]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #71*/
CREATE PROCEDURE [Acce].[UDP_tbUsers_DELETE]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que elimina registros
--              a la tabla Users.
--========================================================
	@usu_Id					INT,
	@usu_IdUserModifies		INT
AS
	BEGIN
		UPDATE Acce.tbUsers
		SET usu_Status = 0,
			usu_IdUserModifies = @usu_IdUserModifies,
			usu_DateModifies = GETDATE()
		WHERE usu_Id = @usu_Id
	END

GO
/****** Object:  StoredProcedure [Acce].[UDP_tbUsers_INSERT]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #69*/
CREATE PROCEDURE [Acce].[UDP_tbUsers_INSERT]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que Inserta registros
--              a la tabla Users.
--========================================================
    @usu_UserName      VARCHAR(100),
	@usu_Password      NVARCHAR(100),
	@usu_PasswordSalt  NVARCHAR(MAX),
	@rol_Id            INT,
	@Per_Id            INT,
	@usu_IdUserCreate  INT
AS
BEGIN
	INSERT INTO Acce.tbUsers
	VALUES(@usu_UserName, @usu_Password, @usu_PasswordSalt, @rol_Id, 1, @Per_Id, @usu_IdUserCreate, GETDATE(), NULL, NULL)

	SELECT @@IDENTITY
END

GO
/****** Object:  StoredProcedure [Acce].[UDP_tbUsers_UPDATE]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*SECCIÓN #70*/
CREATE PROCEDURE [Acce].[UDP_tbUsers_UPDATE]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que modifica registros
--              a la tabla Users.
--========================================================
    @usu_Id                    INT,
    @usu_UserName            VARCHAR(20),
    @usu_Password            NVARCHAR(30),
    @rol_Id                    INT,
    @per_Id                    INT,
    @usu_IdUserModifies        INT
AS
    BEGIN
        UPDATE Acce.tbUsers
        SET usu_UserName = @usu_UserName, usu_Password = @usu_Password, rol_Id = @rol_Id, per_Id = @per_Id, usu_IdUserModifies = @usu_IdUserModifies, usu_DateModifies = GETDATE()
        WHERE usu_Id = @usu_Id
		
	SELECT @@IDENTITY
    END

GO
/****** Object:  StoredProcedure [Acce].[UPD_tbUsers_LOGIN]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #72*/
CREATE PROCEDURE [Acce].[UPD_tbUsers_LOGIN]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento valida el pasword y
--              usuari que entra al sistema.
--========================================================
	@usu_UserName      VARCHAR(100),
	@usu_Password      NVARCHAR(100)
AS
BEGIN
	SELECT 
	Acce.tbUsers.usu_Password,
	Acce.tbUsers.usu_PasswordSalt
	FROM Acce.tbUsers
	WHERE Acce.tbUsers.usu_UserName = @usu_UserName
END

GO
/****** Object:  StoredProcedure [Clte].[UDP_Areas_DELETE]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*SECCIÓN #63*/
CREATE PROCEDURE [Clte].[UDP_Areas_DELETE]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que elimina registros
--              de la tabla segun el id.
--========================================================
    @Id						 INT,
	@are_IdUserModifies	 INT
AS
BEGIN
	  UPDATE [Gral].[tbAreas]
	  SET	are_Status = 0,
			are_IdUserModifies=@are_IdUserModifies,
			are_DateModifies=GETDATE()
      WHERE are_Id=@Id
			
    SELECT @@IDENTITY
END
GO
/****** Object:  StoredProcedure [Clte].[UDP_Areas_REGISTER]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #61*/
CREATE PROCEDURE [Clte].[UDP_Areas_REGISTER]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que elimina registros
--              de la tabla segun el id.
--========================================================
    @are_Description     NVARCHAR(100),
    @are_IdUserCreate    INT
AS
BEGIN
INSERT INTO [Gral].[tbAreas]
           ([are_Description]
           ,[are_Status]
           ,[are_IdUserCreate]
           ,[are_DateCreate]
           ,[are_IdUserModifies]
           ,[are_DateModifies])
     VALUES
             (@are_Description,1,@are_IdUserCreate,GETDATE(),NULL,NULL)

    SELECT @@IDENTITY
END
GO
/****** Object:  StoredProcedure [Clte].[UDP_Areas_UPDATE]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #62*/
CREATE PROCEDURE [Clte].[UDP_Areas_UPDATE]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que elimina registros
--              de la tabla segun el id.
--========================================================
    @Id                  INT,
    @are_Description     NVARCHAR(100),
    @are_IdUserModifies      INT

AS
BEGIN
    UPDATE [Gral].[tbAreas]
    SET
            [are_Description]=@are_Description
           ,[are_IdUserModifies]=@are_IdUserModifies
           ,[are_DateModifies]=GETDATE()
    WHERE are_Id=@Id

    SELECT @@IDENTITY
END
GO
/****** Object:  StoredProcedure [Clte].[UDP_tbContacts_DELETE]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #88*/
CREATE PROCEDURE [Clte].[UDP_tbContacts_DELETE]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que elimina un registros
--              en la tabla Contacts.
--========================================================
	@cont_Id					INT,
	@cont_IdUserModifies		INT
AS
	BEGIN
		UPDATE Clte.tbContacts
		SET cont_Status = 0, 
		cont_IdUserModifies = @cont_IdUserModifies, 
		cont_DateModifies = GETDATE()
		WHERE cont_Id = @cont_Id
	END

GO
/****** Object:  StoredProcedure [Clte].[UDP_tbContacts_INSERT]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #86*/
CREATE PROCEDURE [Clte].[UDP_tbContacts_INSERT]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que inserta un registros
--              en la tabla Contacts.
--========================================================
	@cont_Name					NVARCHAR(100),
	@cont_LastName				NVARCHAR(100),
	@cont_Email					NVARCHAR(100),
	@cont_Phone					NVARCHAR(11),
	@occ_Id						INT,
	@cus_Id						INT,
	@cont_IdUserCreate			INT
AS
	BEGIN
		INSERT INTO Clte.tbContacts
		VALUES (@cont_Name, @cont_LastName, @cont_Email, @cont_Phone, @occ_Id,@cus_Id, 1, @cont_IdUserCreate, GETDATE(), NULL, NULL)
	END
	SELECT @@IDENTITY
GO
/****** Object:  StoredProcedure [Clte].[UDP_tbContacts_UPDATE]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #87*/
CREATE PROCEDURE [Clte].[UDP_tbContacts_UPDATE]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que modifica los registros
--              de la tabla Contacts.
--========================================================
	@cont_Id					INT,
	@cont_Name					NVARCHAR(100),
	@cont_LastName				NVARCHAR(100),
	@cont_Email					NVARCHAR(100),
	@cont_Phone					NVARCHAR(11),
	@occ_Id						INT,
	@cus_Id						INT,
	@cont_IdUserModifies		INT
AS
	BEGIN
		UPDATE Clte.tbContacts
		SET cont_Name			= @cont_Name, 
			cont_LastName		= @cont_LastName, 
			cont_Email			= @cont_Email, 
			cont_Phone			= @cont_Phone, 
			occ_Id				= @occ_Id, 
			cus_Id				= @cus_Id,
			cont_IdUserModifies = @cont_IdUserModifies, 
			cont_DateModifies	= GETDATE()
		WHERE cont_Id = @cont_Id
	END

GO
/****** Object:  StoredProcedure [Clte].[UDP_tbCustomers_DELETE]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #80*/
CREATE PROCEDURE [Clte].[UDP_tbCustomers_DELETE]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que elimina
--              en la tabla customers.
--========================================================
@cus_Id					INT,
@cus_IdUserModifies		INT
AS
	BEGIN
		UPDATE Clte.tbCustomers
		SET cus_Status = 0, 
		cus_IdUserModifies = @cus_IdUserModifies,
		cus_DateModifies = GETDATE()
		WHERE cus_Id = @cus_Id
	END

GO
/****** Object:  StoredProcedure [Clte].[UDP_tbCustomers_INSERT]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #78*/
CREATE PROCEDURE [Clte].[UDP_tbCustomers_INSERT]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que inserta
--              en la tabla customers.
--========================================================
@cus_AssignedUser		INT,
@tyCh_Id				INT,
@cus_Name				NVARCHAR(200),
@cus_RTN				NVARCHAR(13),
@cus_Address			NVARCHAR(200),
@mun_Id					INT,
@cus_Email				NVARCHAR(100),
@cus_Phone				NVARCHAR(11),
@cus_AnotherPhone		NVARCHAR(11),
@cus_IdUserCreate		INT
AS
	BEGIN
		INSERT INTO Clte.tbCustomers
		VALUES (
		@cus_AssignedUser,
		@tyCh_Id,
		@cus_Name,
		@cus_RTN,
		@cus_Address,
		@mun_Id,
		@cus_Email,
		@cus_Phone,
		@cus_AnotherPhone,
		1,
		@cus_IdUserCreate,
		GETDATE(),
		NULL,
		NULL)

	SELECT @@IDENTITY
	END
GO
/****** Object:  StoredProcedure [Clte].[UDP_tbCustomers_UPDATE]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*SECCIÓN #79*/
CREATE PROCEDURE [Clte].[UDP_tbCustomers_UPDATE]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que modifica
--              en la tabla customers.
--========================================================
@cus_Id					INT,
@cus_AssignedUser		INT,
@tyCh_Id				INT,
@cus_Name				NVARCHAR(200),
@cus_RTN				NVARCHAR(13),
@cus_Address			NVARCHAR(200),
@mun_Id					INT,
@cus_Email				NVARCHAR(100),
@cus_Phone				NVARCHAR(11),
@cus_AnotherPhone		NVARCHAR(11),
@cus_IdUserModifies		INT
AS
	BEGIN
		UPDATE Clte.tbCustomers
		SET cus_AssignedUser	= @cus_AssignedUser, 
		tyCh_Id					= @tyCh_Id, 
		cus_Name				= @cus_Name, 
		cus_RTN					= @cus_RTN, 
		cus_Address				= @cus_Address, 
		mun_Id					= @mun_Id,  
		cus_Email				= @cus_Email, 
		cus_Phone				= @cus_Phone, 
		cus_AnotherPhone		= @cus_AnotherPhone, 
		cus_Status				= 1, 
		cus_IdUserModifies		= @cus_IdUserModifies, 
		cus_DateModifies		= GETDATE()
		WHERE cus_Id = @cus_Id
	END

GO
/****** Object:  StoredProcedure [Gral].[UDP_tbDepartamentos_DELETE]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


 /*SECCIÓN #55*/
CREATE PROCEDURE [Gral].[UDP_tbDepartamentos_DELETE]
 --========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que elimina registros
--              de la tabla segun el id.
--========================================================
	@dep_Id	            INT,
	@dep_IdUserModifies	INT
AS
BEGIN
	UPDATE	[Gral].[tbDepartments]
	SET		dep_Status			 = 0,
			[dep_IdUserModifies] = @dep_IdUserModifies,
			[dep_DateModifies]	 = GETDATE()
	WHERE	[dep_Id]			 = @dep_Id
END
GO
/****** Object:  StoredProcedure [Gral].[UDP_tbDepartamentos_INSERT]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #53*/
CREATE PROCEDURE [Gral].[UDP_tbDepartamentos_INSERT]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento con el cual se insertan 
--              datos en la tabla departamentos.
--========================================================
	@dep_Code			 VARCHAR(2), 
	@dep_Description		 NVARCHAR(100),
	@dep_UsuarioCrea		 INT
AS
BEGIN
	INSERT [Gral].[tbDepartments]
	(
		[dep_Code],
		[dep_Description],
		dep_Status, 
		dep_IdUserCreate,
		dep_DateCreate
	)
	VALUES 
	(
		@dep_Code, 
		@dep_Description,
		1,
		@dep_UsuarioCrea, 
		GETDATE()
	)
	SELECT SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [Gral].[UDP_tbDepartamentos_UPDATE]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*SECCIÓN #54*/
CREATE PROCEDURE [Gral].[UDP_tbDepartamentos_UPDATE]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que actualiza los datos
--              de un registro en la tabla departamentos.
--========================================================
	@dep_Id				INT, 
	@dep_Code			VARCHAR(2), 
	@dep_Description	NVARCHAR(100),
	@dep_IdUserModifies	INT
AS
BEGIN
	UPDATE  [Gral].[tbDepartments]
	SET 	[dep_Code]			= @dep_Code,
			[dep_Description]	= @dep_Description,
			dep_Status	=		1, 
			dep_IdUserModifies  = @dep_IdUserModifies,
			dep_DateModifies	= GETDATE()
	WHERE	[dep_Id]		    = @dep_Id
END
GO
/****** Object:  StoredProcedure [Gral].[UDP_tbEmployees_DELETE]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #92*/
CREATE PROCEDURE [Gral].[UDP_tbEmployees_DELETE]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que elimina un registros
--              a la tabla Employees.
--========================================================
	@emp_Id						INT,
	@emp_IdUserModifies			INT
AS
	BEGIN
		UPDATE Gral.tbEmployees
		SET emp_Status		= 0, 
		emp_IdUserModifies	= @emp_IdUserModifies, 
		emp_DateModifies	= GETDATE()
		WHERE emp_Id = @emp_Id
	END
GO
/****** Object:  StoredProcedure [Gral].[UDP_tbEmployees_INSERT]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #90*/
CREATE PROCEDURE [Gral].[UDP_tbEmployees_INSERT]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que inserta un registros
--              a la tabla Employees.
--========================================================
	@per_Id						INT,
	@are_Id						INT,
	@occ_Id						INT,
	@emp_IdUserCreate			INT
AS
	BEGIN
		INSERT INTO Gral.tbEmployees
		VALUES (@per_Id, @are_Id, @occ_Id, 1,@emp_IdUserCreate, GETDATE(), NULL, NULL)
	END
	SELECT @@IDENTITY

GO
/****** Object:  StoredProcedure [Gral].[UDP_tbEmployees_UPDATE]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #91*/
CREATE PROCEDURE [Gral].[UDP_tbEmployees_UPDATE]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que modifica un registro
--              a la tabla Employees.
--========================================================
	@emp_Id						INT,
	@per_Id						INT,
	@are_Id						INT,
	@occ_Id						INT,
	@emp_IdUserModifies			INT
AS
	BEGIN
		UPDATE Gral.tbEmployees
		SET per_Id			= @per_Id, 
		are_Id				= @are_Id, 
		occ_Id				= @occ_Id, 
		emp_IdUserModifies	= @emp_IdUserModifies, 
		emp_DateModifies	= GETDATE()
		WHERE emp_Id = @emp_Id
	END

GO
/****** Object:  StoredProcedure [Gral].[UDP_tbMunicipalities_DELETE]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #59*/
CREATE PROCEDURE [Gral].[UDP_tbMunicipalities_DELETE]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que elimina registros
--              de la tabla segun el id.
--========================================================
	@mun_Id INT,
	@mun_IdUserModifies	INT
AS
BEGIN
	UPDATE	[Gral].[tbMunicipalities]
	SET		mun_Status =			0,
			mun_IdUserModifies	= 	@mun_IdUserModifies,
			mun_DateModifies = GETDATE()
	WHERE	[mun_Id] =				@mun_Id
END
GO
/****** Object:  StoredProcedure [Gral].[UDP_tbMunicipalities_INSERT]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #57*/
CREATE PROCEDURE [Gral].[UDP_tbMunicipalities_INSERT]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento con el cual se insertan 
--              datos en la tabla municipios.
--========================================================
	@mun_Code        	VARCHAR(4),
	@mun_Description	NVARCHAR(100),
	@dep_Id				INT,
	@mun_UsuarioCrea	INT
AS
BEGIN
	INSERT INTO [Gral].[tbMunicipalities]	
	( 
	   [mun_Code],
	   [mun_Description], 
	   [dep_Id],
	   mun_Status,
	   mun_IdUserCreate, 
       mun_DateCreate
	 )

	VALUES 
	(

	    @mun_Code,
		@mun_Description,
		@dep_Id,  
		1,
		@mun_UsuarioCrea,  
		GETDATE()
	)
	SELECT SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [Gral].[UDP_tbMunicipalities_UPDATE]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #58*/
CREATE PROCEDURE [Gral].[UDP_tbMunicipalities_UPDATE]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que  actualiza los datos
--              de un registro en la tabla municipios.
--========================================================
	@mun_Id				INT,
	@mun_Code			VARCHAR(4),
	@mun_Descripcion	NVARCHAR(100),
	@dep_Id				INT,
	@mun_UsuarioModifica INT
AS
BEGIN
	UPDATE	[Gral].[tbMunicipalities]
	SET		[mun_Code] = @mun_Code,
			[mun_Description] = @mun_Descripcion,
			[dep_Id] = @dep_Id,
			mun_IdUserModifies = @mun_UsuarioModifica,
			mun_DateModifies = GETDATE()
	WHERE	[mun_Id] = @mun_Id
END
GO
/****** Object:  StoredProcedure [Gral].[UDP_tbOccupations_DELETE]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #67*/
CREATE PROCEDURE [Gral].[UDP_tbOccupations_DELETE]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que elimina registros
--              de la tabla segun el id.
--========================================================
	@occ_Id INT,
	@occ_IdUserModifies INT
AS
BEGIN
	UPDATE	[Gral].[tbOccupations]
	SET		occ_Status = 0,
			occ_IdUserModifies = @occ_IdUserModifies,
			occ_DateModifies  = GETDATE()
	WHERE	[occ_Id] = @occ_Id
END
GO
/****** Object:  StoredProcedure [Gral].[UDP_tbOccupations_INSERT]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #65*/
CREATE PROCEDURE [Gral].[UDP_tbOccupations_INSERT]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento con el cual se insertan 
--              datos en la tabla occupation.
--========================================================
	@occ_Description 	VARCHAR(100),
	@occ_IdUserCreate	INT
AS
BEGIN
	INSERT INTO Gral.tbOccupations	
	(  
		occ_Description,
		occ_Status,
		occ_IdUserCreate,
		occ_DateCreate
	 )

	VALUES 
	(
	    @occ_Description,  
		1,
		@occ_IdUserCreate,  
		GETDATE()
	)
	SELECT SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [Gral].[UDP_tbOccupations_UPDATE]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #66*/
CREATE PROCEDURE [Gral].[UDP_tbOccupations_UPDATE]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que  actualiza los datos
--              de un registro en la tabla occupations.
--========================================================
	@occ_Id				INT,
	@occ_Description 	VARCHAR(100),
	@occ_IdUserModifies	INT
AS
BEGIN
	UPDATE	[Gral].[tbOccupations]
	SET		occ_Description = @occ_Description,
			occ_IdUserModifies = @occ_IdUserModifies,
			occ_DateModifies = GETDATE()
	WHERE	[occ_Id] = @occ_Id
END
GO
/****** Object:  StoredProcedure [Vent].[UDP_tbCategories_DELETE]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #76*/
CREATE PROCEDURE [Vent].[UDP_tbCategories_DELETE]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que elimina
--              en la tabla categorias.
--========================================================
	@cat_Id					INT,
	@cat_IdUserModifies		INT
AS
	BEGIN
		UPDATE Vent.tbCategories
		SET cat_Status = 0,
			cat_IdUserModifies = @cat_IdUserModifies,
			cat_DateModifies = GETDATE()
		WHERE cat_Id = @cat_Id
	END

GO
/****** Object:  StoredProcedure [Vent].[UDP_tbCategories_REGISTER]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*SECCIÓN #74*/
CREATE PROCEDURE [Vent].[UDP_tbCategories_REGISTER]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que registra
--              en la tabla categorias.
--========================================================
@cat_Description NVARCHAR(100),
@cat_IdUserCreate INT
AS
	BEGIN
     INSERT INTO [Vent].[tbCategories]
           ([cat_Description]
           ,[cat_Status]
           ,[cat_IdUserCreate]
           ,[cat_DateCreate]
           ,[cat_IdUserModifies]
           ,[cat_DateModifies])
     VALUES
           (@cat_Description,1,@cat_IdUserCreate,GETDATE(),NULL,NULL)
		    SELECT @@IDENTITY
END

GO
/****** Object:  StoredProcedure [Vent].[UDP_tbCategories_UPDATE]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*SECCIÓN #75*/
CREATE PROCEDURE [Vent].[UDP_tbCategories_UPDATE]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que modifica
--              en la tabla categorias.
--========================================================
@cat_Description NVARCHAR(100),
@cat_IdUserModifies INT,
@cat_Id INT
AS
    BEGIN
       UPDATE [Vent].[tbCategories]
       SET 
	   [cat_Description] = @cat_Description,
       [cat_IdUserModifies] = @cat_IdUserModifies,
       [cat_DateModifies] = GETDATE()
      WHERE cat_Id = @cat_Id
		
	SELECT @@IDENTITY
    END

GO
/****** Object:  StoredProcedure [Vent].[UDP_tbPersons_DELETE]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*SECCIÓN #100*/
CREATE PROCEDURE [Vent].[UDP_tbPersons_DELETE]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que elimina un registros
--              a la tabla Personas.
--========================================================
	@per_Id						INT,
	@per_IdUserModifies			INT
AS
	BEGIN
		UPDATE [Gral].[tbPersons]
		SET per_Status		= 0, 
		per_IdUserModifies	= @per_IdUserModifies, 
		per_DateModifies	= GETDATE()
		WHERE per_Id = @per_Id
	END
GO
/****** Object:  StoredProcedure [Vent].[UDP_tbPersons_INSERT]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[UDP_tbPersons_INSERT]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que inserta un registros
--              a la tabla Persons.
--========================================================
    @per_Identidad		 NVARCHAR(13)		,
    @per_Firstname		 NVARCHAR(20)		,
    @per_Secondname		 NVARCHAR(20)		,
    @per_LastNames		 NVARCHAR(20)		,
    @per_BirthDate		 DATE				,
    @per_Sex			 CHAR(1)			,
    @per_Email			 NVARCHAR(100)		,
	@per_Phone			 NVARCHAR(11)		,
	@per_Direccion		 NVARCHAR(200)		,
	@dep_Id				 INT				,
	@mun_Id				 INT				,
	@per_Esciv			 CHAR				,
    @per_IdUserCreate    INT
AS
    BEGIN

     INSERT INTO [Gral].[tbPersons]
           (per_Identidad	
           ,per_Firstname	
           ,per_Secondname	
           ,per_LastNames	
           ,per_BirthDate	
           ,per_Sex		
           ,per_Email		
           ,per_Phone		
           ,per_Direccion	
           ,dep_Id			
           ,mun_Id			
           ,per_Esciv		
		   ,per_Status		
		   ,per_IdUserCreate
		   ,per_DateCreate)
     VALUES
           ( @per_Identidad	,	
			 @per_Firstname	,	
			 @per_Secondname,		
			 @per_LastNames	,	
			 @per_BirthDate	,	
			 @per_Sex		,	
			 @per_Email		,	
			 @per_Phone		,	
			 @per_Direccion	,	
			 @dep_Id		,		
			 @mun_Id		,		
			 @per_Esciv		,	
			 1	,	
			 @per_IdUserCreate,
		     GETDATE()
		   )

    SELECT @@IDENTITY
    END
GO
/****** Object:  StoredProcedure [Vent].[UDP_tbPersons_UPDATE]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Vent].[UDP_tbPersons_UPDATE]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que modifica un registros
--              a la tabla Persons.
--========================================================
    @per_Id				 INT                ,
    @per_Identidad		 NVARCHAR(13)		,
    @per_Firstname		 NVARCHAR(20)		,
    @per_Secondname		 NVARCHAR(20)		,
    @per_LastNames		 NVARCHAR(20)		,
    @per_BirthDate		 DATE				,
    @per_Sex			 CHAR(1)			,
    @per_Email			 NVARCHAR(100)		,
	@per_Phone			 NVARCHAR(11)		,
	@per_Direccion		 NVARCHAR(200)		,
	@dep_Id				 INT				,
	@mun_Id				 INT				,
	@per_Esciv			 CHAR				,
    @per_IdUserModifies  INT
AS
    BEGIN
    UPDATE [Gral].[tbPersons]
   SET  [per_Identidad]  =	   @per_Identidad	,	
		[per_Firstname]  =	   @per_Firstname	,	
		[per_Secondname] =	   @per_Secondname	,	
		[per_LastNames]  =	   @per_LastNames	,	
		[per_BirthDate]  =	   @per_BirthDate	,	
		[per_Sex]        =	   @per_Sex			,
		[per_Email]      =	   @per_Email		,	
		[per_Phone]      =	   @per_Phone		,	
		[per_Direccion]  =	   @per_Direccion	,	
		[dep_Id]         =	   @dep_Id			,	
		[mun_Id]         =	   @mun_Id			,	
		[per_Esciv]		 =	   @per_Esciv		,	
        [per_IdUserModifies] = @per_IdUserModifies,
        [per_DateModifies] =   GETDATE()
 WHERE  per_Id = @per_Id
END
GO
/****** Object:  StoredProcedure [Vent].[UDP_tbProducts_DELETE]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*SECCIÓN #96*/
CREATE PROCEDURE [Vent].[UDP_tbProducts_DELETE]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que elimina un registros
--              a la tabla Products.
--========================================================
	@pro_Id						INT,
	@pro_IdUserModifies			INT
AS
	BEGIN
		UPDATE [Vent].[tbProducts]
		SET pro_Status		= 0, 
		pro_IdUserModifies	= @pro_IdUserModifies, 
		pro_DateModifies	= GETDATE()
		WHERE pro_Id = @pro_Id
	END
GO
/****** Object:  StoredProcedure [Vent].[UDP_tbProducts_INSERT]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #94*/
CREATE PROCEDURE [Vent].[UDP_tbProducts_INSERT]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que inserta un registros
--              a la tabla Products.
--========================================================
    @pro_Description NVARCHAR(100),
    @pro_PurchasePrice NUMERIC(8,2),
    @pro_SalesPrice NUMERIC(8,2),
    @pro_Stock INT,
    @pro_ISV NUMERIC(18,0),
    @uni_Id INT,
    @scat_Id INT,
    @pro_IdUserCreate INT
AS
    BEGIN

     INSERT INTO Vent.tbProducts
           ([pro_Description]
           ,[pro_PurchasePrice]
           ,[pro_SalesPrice]
           ,[pro_Stock]
           ,[pro_ISV]
           ,[uni_Id]
           ,[scat_Id]
           ,[pro_Status]
           ,[pro_IdUserCreate]
           ,[pro_DateCreate]
           ,[pro_IdUserModifies]
           ,[pro_DateModifies])
     VALUES
           (@pro_Description,@pro_PurchasePrice,@pro_SalesPrice,@pro_Stock,@pro_ISV,@uni_Id,@scat_Id,1,@pro_IdUserCreate,GETDATE(),Null,Null)

    SELECT @@IDENTITY
    END
GO
/****** Object:  StoredProcedure [Vent].[UDP_tbProducts_UPDATE]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #95*/
CREATE PROCEDURE [Vent].[UDP_tbProducts_UPDATE]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que modifica un registros
--              a la tabla Products.
--========================================================
    @pro_Id INT,
    @pro_Description NVARCHAR(100),
    @pro_PurchasePrice NUMERIC(8,2),
    @pro_SalesPrice NUMERIC(8,2),
    @pro_Stock INT,
    @pro_ISV NUMERIC(18,0),
    @uni_Id INT,
    @scat_Id INT,
    @pro_IdUserModifies INT
AS
    BEGIN
    UPDATE [Vent].[tbProducts]
   SET [pro_Description] = @pro_Description,
       [pro_PurchasePrice] = @pro_PurchasePrice,
       [pro_SalesPrice] = @pro_SalesPrice,
       [pro_Stock] = @pro_Stock,
       [pro_ISV] = @pro_ISV,
       [uni_Id] = @uni_Id,
       [scat_Id] = @scat_Id,
       [pro_IdUserModifies] = @pro_IdUserModifies,
       [pro_DateModifies] = GETDATE()
 WHERE pro_Id = @pro_Id
END
GO
/****** Object:  StoredProcedure [Vent].[UDP_tbSubCategories_DELETE]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #84*/
CREATE PROCEDURE [Vent].[UDP_tbSubCategories_DELETE]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que elimina un registros
--              en la tabla SubCategories.
--========================================================
	@scat_Id								INT,
	@scat_IdUserModifies					INT
AS
	BEGIN
		UPDATE Vent.tbSubCategories
		SET scat_Status			= 0, 
			scat_IdUserModifies = @scat_IdUserModifies, 
			scat_DateModifies	= GETDATE()
		WHERE scat_Id			= @scat_Id
	END

GO
/****** Object:  StoredProcedure [Vent].[UDP_tbSubCategories_INSERT]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #82*/
CREATE PROCEDURE [Vent].[UDP_tbSubCategories_INSERT]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que inserta registros
--              en la tabla SubCategories.
--========================================================
	@scat_Description						NVARCHAR(100),
	@cat_Id									INT,
	@scat_IdUserCreate						INT
AS
	BEGIN
		INSERT INTO Vent.tbSubCategories
		VALUES (@scat_Description,@cat_Id,1,@scat_IdUserCreate,GETDATE(), NULL,NULL)
	END
	SELECT @@IDENTITY

GO
/****** Object:  StoredProcedure [Vent].[UDP_tbSubCategories_UPDATE]    Script Date: 3/6/2022 18:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*SECCIÓN #83*/
CREATE PROCEDURE [Vent].[UDP_tbSubCategories_UPDATE]
--========================================================
--Author:       Angel Teruel
--Create date:  29/05/2022
--Description:  Procedimiento que modifica los registros
--              de la tabla SubCategories.
--========================================================
	@scat_Id								INT,
	@scat_Description						NVARCHAR(100),
	@cat_Id									INT,
	@scat_IdUserModifies					INT
AS
	BEGIN
		UPDATE Vent.tbSubCategories
		SET scat_Description	= @scat_Description, 
			cat_Id				= @cat_Id, 
			scat_IdUserModifies = @scat_IdUserModifies, 
			scat_DateModifies	= GETDATE()
		WHERE scat_Id			= @scat_Id
	END

GO
USE [master]
GO
ALTER DATABASE [LOGISTIC_SMART_AHM] SET  READ_WRITE 
GO
