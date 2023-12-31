USE [master]
GO
/****** Object:  Database [ProyectoBD]    Script Date: 12/21/2023 10:33:12 AM ******/
CREATE DATABASE [ProyectoBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProyectoBD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ProyectoBD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProyectoBD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ProyectoBD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ProyectoBD] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProyectoBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProyectoBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProyectoBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProyectoBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProyectoBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProyectoBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProyectoBD] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ProyectoBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProyectoBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProyectoBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProyectoBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProyectoBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProyectoBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProyectoBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProyectoBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProyectoBD] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ProyectoBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProyectoBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProyectoBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProyectoBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProyectoBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProyectoBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProyectoBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProyectoBD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProyectoBD] SET  MULTI_USER 
GO
ALTER DATABASE [ProyectoBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProyectoBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProyectoBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProyectoBD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProyectoBD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProyectoBD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ProyectoBD] SET QUERY_STORE = ON
GO
ALTER DATABASE [ProyectoBD] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ProyectoBD]
GO
/****** Object:  Table [dbo].[TCarrito]    Script Date: 12/21/2023 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TCarrito](
	[IdCarrito] [bigint] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [bigint] NOT NULL,
	[IdProducto] [bigint] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_TCarrito] PRIMARY KEY CLUSTERED 
(
	[IdCarrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TDescuentos]    Script Date: 12/21/2023 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TDescuentos](
	[IdDescuento] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](100) NULL,
	[PorcentajeDescuento] [decimal](5, 2) NULL,
	[FechaInicio] [date] NULL,
	[FechaFin] [date] NULL,
	[CodigoDescuento] [varchar](20) NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDescuento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TDetalle]    Script Date: 12/21/2023 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TDetalle](
	[IdDetalle] [bigint] IDENTITY(1,1) NOT NULL,
	[IdFactura] [bigint] NOT NULL,
	[IdProducto] [bigint] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Impuesto] [decimal](18, 2) NOT NULL,
	[Precio] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_TDetalle] PRIMARY KEY CLUSTERED 
(
	[IdDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TEncabezado]    Script Date: 12/21/2023 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TEncabezado](
	[IdFactura] [bigint] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [bigint] NOT NULL,
	[FechaPago] [datetime] NOT NULL,
	[TotalPago] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_TEncabezado] PRIMARY KEY CLUSTERED 
(
	[IdFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TProductos]    Script Date: 12/21/2023 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TProductos](
	[IdProducto] [bigint] IDENTITY(1,1) NOT NULL,
	[nombreProducto] [varchar](100) NOT NULL,
	[descripcion] [varchar](500) NOT NULL,
	[precio] [decimal](10, 2) NOT NULL,
	[cantidadStock] [bigint] NOT NULL,
	[marca] [varchar](50) NOT NULL,
	[tipoProducto] [bigint] NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK__tProduct__A430AE832AD60A48] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TProvincia]    Script Date: 12/21/2023 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TProvincia](
	[ConProvincia] [bigint] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TProvincia] PRIMARY KEY CLUSTERED 
(
	[ConProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRol]    Script Date: 12/21/2023 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRol](
	[ConRol] [bigint] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TRol] PRIMARY KEY CLUSTERED 
(
	[ConRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TTipoProducto]    Script Date: 12/21/2023 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TTipoProducto](
	[TipoProducto] [bigint] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TTipoProducto] PRIMARY KEY CLUSTERED 
(
	[TipoProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TUsuario]    Script Date: 12/21/2023 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TUsuario](
	[IdUsuario] [bigint] IDENTITY(1,1) NOT NULL,
	[identificacion] [varchar](20) NOT NULL,
	[nombre] [varchar](200) NOT NULL,
	[usuario] [varchar](25) NOT NULL,
	[correo] [varchar](50) NOT NULL,
	[contrasenna] [varchar](25) NOT NULL,
	[estado] [bit] NOT NULL,
	[esClaveTemp] [bit] NOT NULL,
	[vencimientoClaveTemp] [datetime] NOT NULL,
	[ConRol] [bigint] NOT NULL,
	[ConProvincia] [bigint] NOT NULL,
 CONSTRAINT [PK_TUsuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TCarrito] ON 

INSERT [dbo].[TCarrito] ([IdCarrito], [IdUsuario], [IdProducto], [Cantidad], [Fecha]) VALUES (4, 8, 1, 1, CAST(N'2023-12-14T18:24:22.857' AS DateTime))
SET IDENTITY_INSERT [dbo].[TCarrito] OFF
GO
INSERT [dbo].[TDescuentos] ([IdDescuento], [Nombre], [Descripcion], [PorcentajeDescuento], [FechaInicio], [FechaFin], [CodigoDescuento], [Estado]) VALUES (1, N'Descuento Navideño', N'Descuento de temporada navideña', CAST(15.00 AS Decimal(5, 2)), CAST(N'2023-12-01' AS Date), CAST(N'2023-12-31' AS Date), N'NAVIDAD2023', 1)
INSERT [dbo].[TDescuentos] ([IdDescuento], [Nombre], [Descripcion], [PorcentajeDescuento], [FechaInicio], [FechaFin], [CodigoDescuento], [Estado]) VALUES (2, N'Oferta de Verano', N'Descuento especial de verano', CAST(10.50 AS Decimal(5, 2)), CAST(N'2023-06-15' AS Date), CAST(N'2023-08-31' AS Date), N'VERANO10', 1)
INSERT [dbo].[TDescuentos] ([IdDescuento], [Nombre], [Descripcion], [PorcentajeDescuento], [FechaInicio], [FechaFin], [CodigoDescuento], [Estado]) VALUES (3, N'Descuento de Primavera', N'Oferta para la temporada de primavera', CAST(20.00 AS Decimal(5, 2)), CAST(N'2023-03-01' AS Date), CAST(N'2023-04-30' AS Date), N'PRIMA20', NULL)
GO
SET IDENTITY_INSERT [dbo].[TDetalle] ON 

INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (4, 5, 1, 1, CAST(10257.00 AS Decimal(18, 2)), CAST(78900.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (5, 5, 2, 1, CAST(455.00 AS Decimal(18, 2)), CAST(3500.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (6, 6, 1, 1, CAST(10257.00 AS Decimal(18, 2)), CAST(78900.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (7, 7, 1, 1, CAST(10257.00 AS Decimal(18, 2)), CAST(78900.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (8, 8, 1, 1, CAST(10257.00 AS Decimal(18, 2)), CAST(78900.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (9, 9, 1, 1, CAST(10257.00 AS Decimal(18, 2)), CAST(78900.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (10, 10, 1, 3, CAST(10257.00 AS Decimal(18, 2)), CAST(78900.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (11, 11, 1, 3, CAST(10257.00 AS Decimal(18, 2)), CAST(78900.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (12, 12, 1, 3, CAST(10257.00 AS Decimal(18, 2)), CAST(78900.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (13, 13, 1, 3, CAST(10257.00 AS Decimal(18, 2)), CAST(78900.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (14, 14, 1, 3, CAST(10257.00 AS Decimal(18, 2)), CAST(78900.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (15, 15, 1, 2, CAST(10257.00 AS Decimal(18, 2)), CAST(78900.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (16, 16, 1, 4, CAST(10257.00 AS Decimal(18, 2)), CAST(78900.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (17, 17, 1, 3, CAST(10257.00 AS Decimal(18, 2)), CAST(78900.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (18, 18, 1, 2, CAST(10257.00 AS Decimal(18, 2)), CAST(78900.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (19, 19, 1, 1, CAST(10257.00 AS Decimal(18, 2)), CAST(78900.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (20, 20, 1, 3, CAST(10257.00 AS Decimal(18, 2)), CAST(78900.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (21, 21, 1, 3, CAST(10257.00 AS Decimal(18, 2)), CAST(78900.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (22, 23, 1, 2, CAST(10257.00 AS Decimal(18, 2)), CAST(78900.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (23, 24, 1, 3, CAST(10257.00 AS Decimal(18, 2)), CAST(78900.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (24, 25, 1, 3, CAST(10257.00 AS Decimal(18, 2)), CAST(78900.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (25, 26, 1, 1, CAST(10257.00 AS Decimal(18, 2)), CAST(78900.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (26, 26, 4, 1, CAST(12220.00 AS Decimal(18, 2)), CAST(94000.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (27, 27, 3, 2, CAST(14300.00 AS Decimal(18, 2)), CAST(110000.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (28, 27, 4, 2, CAST(12220.00 AS Decimal(18, 2)), CAST(94000.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (29, 28, 1, 2, CAST(10257.00 AS Decimal(18, 2)), CAST(78900.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (30, 28, 3, 2, CAST(14300.00 AS Decimal(18, 2)), CAST(110000.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (31, 29, 1, 2, CAST(10257.00 AS Decimal(18, 2)), CAST(78900.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (32, 30, 1, 2, CAST(10257.00 AS Decimal(18, 2)), CAST(78900.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (33, 30, 3, 2, CAST(14300.00 AS Decimal(18, 2)), CAST(110000.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (34, 31, 1, 3, CAST(10257.00 AS Decimal(18, 2)), CAST(78900.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (35, 31, 3, 2, CAST(14300.00 AS Decimal(18, 2)), CAST(110000.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (36, 32, 1, 3, CAST(10257.00 AS Decimal(18, 2)), CAST(78900.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (37, 33, 1, 2, CAST(10257.00 AS Decimal(18, 2)), CAST(78900.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (38, 33, 3, 2, CAST(14300.00 AS Decimal(18, 2)), CAST(110000.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (39, 34, 3, 2, CAST(14300.00 AS Decimal(18, 2)), CAST(110000.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (40, 34, 2, 2, CAST(455.00 AS Decimal(18, 2)), CAST(3500.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (41, 35, 1, 1, CAST(10257.00 AS Decimal(18, 2)), CAST(78900.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (42, 35, 4, 1, CAST(12220.00 AS Decimal(18, 2)), CAST(94000.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (43, 36, 3, 1, CAST(14300.00 AS Decimal(18, 2)), CAST(110000.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (44, 37, 3, 1, CAST(14300.00 AS Decimal(18, 2)), CAST(110000.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (45, 38, 4, 1, CAST(12220.00 AS Decimal(18, 2)), CAST(94000.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (46, 39, 3, 1, CAST(14300.00 AS Decimal(18, 2)), CAST(110000.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (47, 40, 2, 1, CAST(455.00 AS Decimal(18, 2)), CAST(3500.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (48, 41, 2, 2, CAST(455.00 AS Decimal(18, 2)), CAST(3500.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (49, 42, 4, 1, CAST(12220.00 AS Decimal(18, 2)), CAST(94000.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (50, 43, 3, 1, CAST(14300.00 AS Decimal(18, 2)), CAST(110000.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (51, 44, 2, 1, CAST(455.00 AS Decimal(18, 2)), CAST(3500.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (52, 45, 1, 1, CAST(10257.00 AS Decimal(18, 2)), CAST(78900.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (53, 46, 1, 1, CAST(10257.00 AS Decimal(18, 2)), CAST(78900.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (54, 47, 1, 1, CAST(10257.00 AS Decimal(18, 2)), CAST(78900.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (55, 48, 3, 2, CAST(14300.00 AS Decimal(18, 2)), CAST(110000.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (56, 49, 1, 1, CAST(10257.00 AS Decimal(18, 2)), CAST(78900.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (57, 50, 4, 1, CAST(12220.00 AS Decimal(18, 2)), CAST(94000.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (58, 51, 3, 1, CAST(14300.00 AS Decimal(18, 2)), CAST(110000.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (59, 52, 3, 1, CAST(14300.00 AS Decimal(18, 2)), CAST(110000.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (60, 53, 4, 1, CAST(12220.00 AS Decimal(18, 2)), CAST(94000.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (61, 54, 3, 1, CAST(14300.00 AS Decimal(18, 2)), CAST(110000.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (62, 55, 3, 1, CAST(14300.00 AS Decimal(18, 2)), CAST(110000.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (63, 56, 1, 1, CAST(10257.00 AS Decimal(18, 2)), CAST(78900.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (64, 57, 1, 1, CAST(10257.00 AS Decimal(18, 2)), CAST(78900.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (65, 58, 3, 1, CAST(14300.00 AS Decimal(18, 2)), CAST(110000.00 AS Decimal(18, 2)))
INSERT [dbo].[TDetalle] ([IdDetalle], [IdFactura], [IdProducto], [Cantidad], [Impuesto], [Precio]) VALUES (66, 59, 1, 1, CAST(10257.00 AS Decimal(18, 2)), CAST(78900.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[TDetalle] OFF
GO
SET IDENTITY_INSERT [dbo].[TEncabezado] ON 

INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (5, 8, CAST(N'2023-12-10T08:33:25.730' AS DateTime), CAST(93112.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (6, 8, CAST(N'2023-12-10T09:15:33.720' AS DateTime), CAST(89157.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (7, 8, CAST(N'2023-12-10T09:16:25.033' AS DateTime), CAST(89157.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (8, 8, CAST(N'2023-12-10T09:20:05.437' AS DateTime), CAST(89157.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (9, 8, CAST(N'2023-12-10T09:25:38.140' AS DateTime), CAST(89157.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (10, 8, CAST(N'2023-12-10T10:07:49.107' AS DateTime), CAST(267471.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (11, 8, CAST(N'2023-12-10T10:08:41.637' AS DateTime), CAST(267471.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (12, 8, CAST(N'2023-12-10T10:10:08.723' AS DateTime), CAST(267471.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (13, 8, CAST(N'2023-12-10T10:18:24.170' AS DateTime), CAST(267471.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (14, 8, CAST(N'2023-12-10T10:22:35.127' AS DateTime), CAST(267471.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (15, 8, CAST(N'2023-12-10T10:24:40.167' AS DateTime), CAST(178314.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (16, 8, CAST(N'2023-12-10T10:30:14.607' AS DateTime), CAST(356628.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (17, 8, CAST(N'2023-12-10T10:32:40.857' AS DateTime), CAST(267471.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (18, 8, CAST(N'2023-12-10T10:34:04.023' AS DateTime), CAST(178314.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (19, 8, CAST(N'2023-12-10T10:37:56.303' AS DateTime), CAST(89157.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (20, 8, CAST(N'2023-12-10T10:43:16.580' AS DateTime), CAST(267471.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (21, 8, CAST(N'2023-12-10T10:45:11.360' AS DateTime), CAST(267471.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (23, 8, CAST(N'2023-12-10T10:48:17.610' AS DateTime), CAST(178314.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (24, 8, CAST(N'2023-12-10T10:52:08.707' AS DateTime), CAST(267471.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (25, 8, CAST(N'2023-12-10T10:58:34.627' AS DateTime), CAST(267471.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (26, 8, CAST(N'2023-12-10T13:43:28.890' AS DateTime), CAST(195377.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (27, 8, CAST(N'2023-12-10T13:50:03.500' AS DateTime), CAST(461040.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (28, 8, CAST(N'2023-12-10T14:29:30.960' AS DateTime), CAST(426914.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (29, 8, CAST(N'2023-12-10T20:31:06.017' AS DateTime), CAST(178314.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (30, 8, CAST(N'2023-12-10T20:32:45.013' AS DateTime), CAST(426914.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (31, 8, CAST(N'2023-12-10T20:35:10.290' AS DateTime), CAST(516071.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (32, 8, CAST(N'2023-12-10T20:36:29.520' AS DateTime), CAST(267471.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (33, 8, CAST(N'2023-12-11T10:06:17.527' AS DateTime), CAST(426914.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (34, 8, CAST(N'2023-12-11T11:09:39.300' AS DateTime), CAST(256510.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (35, 8, CAST(N'2023-12-11T13:45:37.213' AS DateTime), CAST(195377.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (36, 8, CAST(N'2023-12-11T13:58:05.270' AS DateTime), CAST(124300.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (37, 8, CAST(N'2023-12-11T14:12:36.850' AS DateTime), CAST(124300.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (38, 8, CAST(N'2023-12-11T14:15:00.017' AS DateTime), CAST(106220.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (39, 8, CAST(N'2023-12-11T14:17:23.950' AS DateTime), CAST(124300.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (40, 8, CAST(N'2023-12-11T14:19:01.240' AS DateTime), CAST(3955.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (41, 8, CAST(N'2023-12-11T14:19:23.790' AS DateTime), CAST(7910.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (42, 8, CAST(N'2023-12-11T14:21:22.227' AS DateTime), CAST(106220.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (43, 8, CAST(N'2023-12-11T14:28:37.053' AS DateTime), CAST(124300.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (44, 8, CAST(N'2023-12-11T14:31:07.370' AS DateTime), CAST(3955.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (45, 8, CAST(N'2023-12-11T14:36:20.693' AS DateTime), CAST(89157.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (46, 8, CAST(N'2023-12-11T14:39:05.543' AS DateTime), CAST(89157.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (47, 8, CAST(N'2023-12-11T14:43:57.700' AS DateTime), CAST(89157.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (48, 8, CAST(N'2023-12-11T14:48:07.220' AS DateTime), CAST(248600.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (49, 8, CAST(N'2023-12-11T14:52:25.880' AS DateTime), CAST(89157.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (50, 8, CAST(N'2023-12-11T18:16:23.713' AS DateTime), CAST(106220.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (51, 8, CAST(N'2023-12-12T13:51:30.873' AS DateTime), CAST(124300.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (52, 8, CAST(N'2023-12-12T13:53:59.843' AS DateTime), CAST(124300.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (53, 8, CAST(N'2023-12-12T13:57:58.000' AS DateTime), CAST(106220.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (54, 8, CAST(N'2023-12-12T14:07:14.043' AS DateTime), CAST(124300.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (55, 8, CAST(N'2023-12-12T14:08:50.060' AS DateTime), CAST(124300.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (56, 8, CAST(N'2023-12-12T14:12:25.287' AS DateTime), CAST(89157.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (57, 11, CAST(N'2023-12-14T15:55:04.470' AS DateTime), CAST(89157.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (58, 8, CAST(N'2023-12-14T15:57:00.680' AS DateTime), CAST(124300.00 AS Decimal(18, 2)))
INSERT [dbo].[TEncabezado] ([IdFactura], [IdUsuario], [FechaPago], [TotalPago]) VALUES (59, 8, CAST(N'2023-12-14T16:04:41.450' AS DateTime), CAST(89157.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[TEncabezado] OFF
GO
SET IDENTITY_INSERT [dbo].[TProductos] ON 

INSERT [dbo].[TProductos] ([IdProducto], [nombreProducto], [descripcion], [precio], [cantidadStock], [marca], [tipoProducto], [estado]) VALUES (1, N'Lentes Sol', N'Lentes para el sol', CAST(78900.00 AS Decimal(10, 2)), 4, N'RAY-BAN', 1, 1)
INSERT [dbo].[TProductos] ([IdProducto], [nombreProducto], [descripcion], [precio], [cantidadStock], [marca], [tipoProducto], [estado]) VALUES (2, N'Sujetador', N'Sujetador de Lentes', CAST(3500.00 AS Decimal(10, 2)), 13, N'Valentino', 3, 1)
INSERT [dbo].[TProductos] ([IdProducto], [nombreProducto], [descripcion], [precio], [cantidadStock], [marca], [tipoProducto], [estado]) VALUES (3, N'Lentes Progresivos', N'Lentes para transición suave', CAST(110000.00 AS Decimal(10, 2)), 33, N'RAY-BAN', 2, 1)
INSERT [dbo].[TProductos] ([IdProducto], [nombreProducto], [descripcion], [precio], [cantidadStock], [marca], [tipoProducto], [estado]) VALUES (4, N'Lentes Fotocromáticos', N'Lentes para interiores y exteriores', CAST(94000.00 AS Decimal(10, 2)), 33, N'RAY-BAN', 2, 1)
INSERT [dbo].[TProductos] ([IdProducto], [nombreProducto], [descripcion], [precio], [cantidadStock], [marca], [tipoProducto], [estado]) VALUES (5, N'Lentes Bifocales', N'Lentes visión cerca y lejos', CAST(95450.00 AS Decimal(10, 2)), 41, N'RAY-BAN', 2, 1)
INSERT [dbo].[TProductos] ([IdProducto], [nombreProducto], [descripcion], [precio], [cantidadStock], [marca], [tipoProducto], [estado]) VALUES (6, N'Lentes Monofocales', N'Lentes para miopía', CAST(78900.00 AS Decimal(10, 2)), 28, N'Valentino', 2, 1)
SET IDENTITY_INSERT [dbo].[TProductos] OFF
GO
INSERT [dbo].[TProvincia] ([ConProvincia], [Descripcion]) VALUES (0, N'Asignar')
INSERT [dbo].[TProvincia] ([ConProvincia], [Descripcion]) VALUES (1, N'San José')
INSERT [dbo].[TProvincia] ([ConProvincia], [Descripcion]) VALUES (2, N'Alajuela')
INSERT [dbo].[TProvincia] ([ConProvincia], [Descripcion]) VALUES (3, N'Cartago')
INSERT [dbo].[TProvincia] ([ConProvincia], [Descripcion]) VALUES (4, N'Heredia')
INSERT [dbo].[TProvincia] ([ConProvincia], [Descripcion]) VALUES (5, N'Guanacaste')
INSERT [dbo].[TProvincia] ([ConProvincia], [Descripcion]) VALUES (6, N'Puntarenas')
INSERT [dbo].[TProvincia] ([ConProvincia], [Descripcion]) VALUES (7, N'Limón')
GO
SET IDENTITY_INSERT [dbo].[TRol] ON 

INSERT [dbo].[TRol] ([ConRol], [Descripcion]) VALUES (1, N'Administrador')
INSERT [dbo].[TRol] ([ConRol], [Descripcion]) VALUES (2, N'Usuario')
SET IDENTITY_INSERT [dbo].[TRol] OFF
GO
INSERT [dbo].[TTipoProducto] ([TipoProducto], [Descripcion]) VALUES (0, N'Tipo de Producto')
INSERT [dbo].[TTipoProducto] ([TipoProducto], [Descripcion]) VALUES (1, N'Lentes de Sol')
INSERT [dbo].[TTipoProducto] ([TipoProducto], [Descripcion]) VALUES (2, N'Anteojos')
INSERT [dbo].[TTipoProducto] ([TipoProducto], [Descripcion]) VALUES (3, N'Accesorios')
GO
SET IDENTITY_INSERT [dbo].[TUsuario] ON 

INSERT [dbo].[TUsuario] ([IdUsuario], [identificacion], [nombre], [usuario], [correo], [contrasenna], [estado], [esClaveTemp], [vencimientoClaveTemp], [ConRol], [ConProvincia]) VALUES (8, N'117930274', N'MARTINEZ SEGURA JUAN PABLO', N'Juan', N'jpms19992015@gmail.com', N'123', 1, 0, CAST(N'2023-11-14T23:15:55.723' AS DateTime), 1, 4)
INSERT [dbo].[TUsuario] ([IdUsuario], [identificacion], [nombre], [usuario], [correo], [contrasenna], [estado], [esClaveTemp], [vencimientoClaveTemp], [ConRol], [ConProvincia]) VALUES (9, N'118440506', N'GUILARTE SILES ESTEBAN ALEXANDER', N'Esteban1', N'eguilarte40506@ufide.ac.cr', N'Esteban1', 1, 0, CAST(N'2023-11-15T19:50:19.983' AS DateTime), 1, 1)
INSERT [dbo].[TUsuario] ([IdUsuario], [identificacion], [nombre], [usuario], [correo], [contrasenna], [estado], [esClaveTemp], [vencimientoClaveTemp], [ConRol], [ConProvincia]) VALUES (11, N'117930273', N'RODRIGUEZ SALAZAR ESTEBAN JOSE', N'PRUEBA', N'PRUEBA@GMAIL.COM', N'123', 1, 0, CAST(N'2023-12-09T17:17:53.987' AS DateTime), 2, 3)
SET IDENTITY_INSERT [dbo].[TUsuario] OFF
GO
ALTER TABLE [dbo].[TCarrito]  WITH CHECK ADD  CONSTRAINT [FK_TCarrito_TProducto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[TProductos] ([IdProducto])
GO
ALTER TABLE [dbo].[TCarrito] CHECK CONSTRAINT [FK_TCarrito_TProducto]
GO
ALTER TABLE [dbo].[TCarrito]  WITH CHECK ADD  CONSTRAINT [FK_TCarrito_TUsuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[TUsuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[TCarrito] CHECK CONSTRAINT [FK_TCarrito_TUsuario]
GO
ALTER TABLE [dbo].[TDetalle]  WITH CHECK ADD  CONSTRAINT [FK_TDetalle_TEncabezado] FOREIGN KEY([IdFactura])
REFERENCES [dbo].[TEncabezado] ([IdFactura])
GO
ALTER TABLE [dbo].[TDetalle] CHECK CONSTRAINT [FK_TDetalle_TEncabezado]
GO
ALTER TABLE [dbo].[TDetalle]  WITH CHECK ADD  CONSTRAINT [FK_TDetalle_TProducto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[TProductos] ([IdProducto])
GO
ALTER TABLE [dbo].[TDetalle] CHECK CONSTRAINT [FK_TDetalle_TProducto]
GO
ALTER TABLE [dbo].[TEncabezado]  WITH CHECK ADD  CONSTRAINT [FK_TEncabezado_TUsuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[TUsuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[TEncabezado] CHECK CONSTRAINT [FK_TEncabezado_TUsuario]
GO
ALTER TABLE [dbo].[TProductos]  WITH CHECK ADD  CONSTRAINT [FK_TProductos_TTipoProducto] FOREIGN KEY([tipoProducto])
REFERENCES [dbo].[TTipoProducto] ([TipoProducto])
GO
ALTER TABLE [dbo].[TProductos] CHECK CONSTRAINT [FK_TProductos_TTipoProducto]
GO
ALTER TABLE [dbo].[TUsuario]  WITH CHECK ADD  CONSTRAINT [FK_TUsuario_TProvincia] FOREIGN KEY([ConProvincia])
REFERENCES [dbo].[TProvincia] ([ConProvincia])
GO
ALTER TABLE [dbo].[TUsuario] CHECK CONSTRAINT [FK_TUsuario_TProvincia]
GO
ALTER TABLE [dbo].[TUsuario]  WITH CHECK ADD  CONSTRAINT [FK_TUsuario_TRol] FOREIGN KEY([ConRol])
REFERENCES [dbo].[TRol] ([ConRol])
GO
ALTER TABLE [dbo].[TUsuario] CHECK CONSTRAINT [FK_TUsuario_TRol]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarClaveTemporal]    Script Date: 12/21/2023 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ActualizarClaveTemporal]
	@IdUsuario				bigint,
	@contrasennaTemporal	varchar(4)
AS
BEGIN

	UPDATE dbo.TUsuario
	SET contrasenna = @contrasennaTemporal,
		esClaveTemp = 1,
        vencimientoClaveTemp = DATEADD(mi,30,GETDATE())
	WHERE IdUsuario = @IdUsuario

END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarCuenta]    Script Date: 12/21/2023 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ActualizarCuenta]
	@identificacion varchar(20),
	@nombre varchar(200),
	@usuario varchar(25),
	@correo varchar(50),
	@ConProvincia bigint,
	@IdUsuario bigint
AS
BEGIN
	
	UPDATE	TUsuario
	   SET	identificacion = @identificacion,
			nombre = @nombre,
			usuario = @usuario,
			correo = @correo,
			ConProvincia = @ConProvincia
	 WHERE	IdUsuario = @IdUsuario

END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarEstadoDescuento]    Script Date: 12/21/2023 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ActualizarEstadoDescuento]
	@IdDescuento BIGINT
AS
BEGIN

	UPDATE	TDescuentos
	SET		Estado = (CASE WHEN Estado = 1 THEN 0 ELSE 1 END)
	WHERE	IdDescuento = @IdDescuento

END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarEstadoProducto]    Script Date: 12/21/2023 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ActualizarEstadoProducto]
	@IdProducto BIGINT
AS
BEGIN

	UPDATE	TProductos
	SET		estado = (CASE WHEN estado = 1 THEN 0 ELSE 1 END)
	WHERE	IdProducto = @IdProducto

END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarEstadoUsuario]    Script Date: 12/21/2023 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarEstadoUsuario]
	@IdUsuario BIGINT
AS
BEGIN

	UPDATE	TUsuario
	SET		estado = (CASE WHEN estado = 1 THEN 0 ELSE 1 END)
	WHERE	IdUsuario = @IdUsuario

END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarProducto]    Script Date: 12/21/2023 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarProducto]
	@nombreProducto varchar(100),
	@descripcion varchar(500),
	@precio decimal(10,2),
	@cantidadStock bigint,
	@marca varchar(50),
	@tipoProducto bigint,
	@IdProducto bigint
AS
BEGIN
	
	UPDATE TProductos
	SET nombreProducto = @nombreProducto,
		descripcion = @descripcion,
		precio = @precio,
		cantidadStock = @cantidadStock,
		marca = @marca,
		tipoProducto = @tipoProducto
	WHERE IdProducto = @IdProducto

END
GO
/****** Object:  StoredProcedure [dbo].[BuscarProductos]    Script Date: 12/21/2023 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BuscarProductos]
    @nombreProducto VARCHAR(100)
AS
BEGIN
    SELECT *
    FROM TProductos
    WHERE nombreProducto LIKE '%' + @nombreProducto + '%'
END

GO
/****** Object:  StoredProcedure [dbo].[CambiarClave]    Script Date: 12/21/2023 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CambiarClave]
	@IdUsuario				bigint,
	@contrasennaAnterior	varchar(25),
	@contrasenna			varchar(25)
AS
BEGIN

	IF EXISTS(SELECT IdUsuario
			  FROM	 dbo.TUsuario
			  WHERE	IdUsuario = @IdUsuario
				AND contrasenna = @contrasennaAnterior)
	BEGIN

		UPDATE dbo.TUsuario
		SET contrasenna = @contrasenna
		WHERE IdUsuario = @IdUsuario

	END

END
GO
/****** Object:  StoredProcedure [dbo].[CambiarClaveCuenta]    Script Date: 12/21/2023 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CambiarClaveCuenta]
	@IdUsuario				bigint,
	@contrasennaTemporal	varchar(4),
	@contrasenna			varchar(25)
AS
BEGIN

	IF EXISTS(SELECT IdUsuario
			  FROM	 dbo.TUsuario
			  WHERE	IdUsuario = @IdUsuario
				AND contrasenna = @contrasennaTemporal
				AND esClaveTemp = 1
				AND vencimientoClaveTemp >= GETDATE())
	BEGIN

		UPDATE dbo.TUsuario
		SET contrasenna = @contrasenna,
			esClaveTemp = 0,
			vencimientoClaveTemp = GETDATE()
		WHERE IdUsuario = @IdUsuario

	END

END
GO
/****** Object:  StoredProcedure [dbo].[ConsultaDeProductosMasComprados]    Script Date: 12/21/2023 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultaDeProductosMasComprados]
    @ordenamiento VARCHAR(50)
AS
BEGIN
    IF @ordenamiento = 'menorAMayorVecesComprado'
    BEGIN
        SELECT
            DP.[IdProducto],
            P.[nombreProducto],
            COUNT(*) AS VecesComprado,
            SUM(DP.[Precio]) AS TotalGanado
        FROM
            [dbo].[TDetalle] DP
        INNER JOIN
            [dbo].[TProductos] P ON DP.[IdProducto] = P.[IdProducto]
        GROUP BY
            DP.[IdProducto],
            P.[nombreProducto]
        ORDER BY
            VecesComprado ASC, TotalGanado ASC;
    END
    ELSE IF @ordenamiento = 'mayorAMenorVecesComprado'
    BEGIN
        SELECT
            DP.[IdProducto],
            P.[nombreProducto],
            COUNT(*) AS VecesComprado,
            SUM(DP.[Precio]) AS TotalGanado
        FROM
            [dbo].[TDetalle] DP
        INNER JOIN
            [dbo].[TProductos] P ON DP.[IdProducto] = P.[IdProducto]
        GROUP BY
            DP.[IdProducto],
            P.[nombreProducto]
        ORDER BY
            VecesComprado DESC, TotalGanado DESC;
    END
    ELSE IF @ordenamiento = 'menorAMayorTotalGanado'
    BEGIN
        SELECT
            DP.[IdProducto],
            P.[nombreProducto],
            COUNT(*) AS VecesComprado,
            SUM(DP.[Precio]) AS TotalGanado
        FROM
            [dbo].[TDetalle] DP
        INNER JOIN
            [dbo].[TProductos] P ON DP.[IdProducto] = P.[IdProducto]
        GROUP BY
            DP.[IdProducto],
            P.[nombreProducto]
        ORDER BY
            TotalGanado ASC, VecesComprado ASC;
    END
    ELSE IF @ordenamiento = 'mayorAMenorTotalGanado'
    BEGIN
        SELECT
            DP.[IdProducto],
            P.[nombreProducto],
            COUNT(*) AS VecesComprado,
            SUM(DP.[Precio]) AS TotalGanado
        FROM
            [dbo].[TDetalle] DP
        INNER JOIN
            [dbo].[TProductos] P ON DP.[IdProducto] = P.[IdProducto]
        GROUP BY
            DP.[IdProducto],
            P.[nombreProducto]
        ORDER BY
            TotalGanado DESC, VecesComprado DESC;
    END
    ELSE
    BEGIN
        -- Si el parámetro no coincide con ninguna opción válida, se devuelve la lista ordenada por defecto (mayor a menor veces comprado)
        SELECT
            DP.[IdProducto],
            P.[nombreProducto],
            COUNT(*) AS VecesComprado,
            SUM(DP.[Precio]) AS TotalGanado
        FROM
            [dbo].[TDetalle] DP
        INNER JOIN
            [dbo].[TProductos] P ON DP.[IdProducto] = P.[IdProducto]
        GROUP BY
            DP.[IdProducto],
            P.[nombreProducto]
        ORDER BY
            VecesComprado DESC, TotalGanado DESC;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarCarrito]    Script Date: 12/21/2023 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarCarrito]
	@IdUsuario	bigint
AS
BEGIN

SELECT	IdCarrito,
			IdUsuario,
			C.IdProducto,
			C.Cantidad,
			Fecha,
			P.Precio,
			P.Precio * C.Cantidad 'SubTotal',
			(P.Precio * C.Cantidad) * 0.13 'Impuesto',
			P.Precio * C.Cantidad + (P.Precio * C.Cantidad) * 0.13 'Total',
			P.[nombreProducto]
	FROM	dbo.TCarrito C
	INNER JOIN dbo.TProductos P ON C.IdProducto = P.IdProducto
	WHERE	IdUsuario = @IdUsuario

END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarCorreoUsuario]    Script Date: 12/21/2023 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Crear o alterar el procedimiento almacenado ConsultarCorreoUsuario
CREATE PROCEDURE [dbo].[ConsultarCorreoUsuario]
    @IdUsuario BIGINT
AS
BEGIN
    -- Seleccionar el correo del usuario basado en el IdUsuario proporcionado
    SELECT correo AS CorreoUsuario
    FROM TUsuario
    WHERE IdUsuario = @IdUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarDescuentos]    Script Date: 12/21/2023 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarDescuentos]
AS
BEGIN
    SELECT * FROM TDescuentos;
END;
GO
/****** Object:  StoredProcedure [dbo].[ConsultarProductoPorId]    Script Date: 12/21/2023 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarProductoPorId]
    @IdProducto BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT IdProducto, nombreProducto, descripcion, precio, cantidadStock, marca, tipoProducto
    FROM TProductos
    WHERE IdProducto = @IdProducto;
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarProductos]    Script Date: 12/21/2023 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarProductos]

AS
BEGIN
	
	SELECT IdProducto,
		   nombreProducto,
		   descripcion,
		   precio,
		   cantidadStock,
		   marca,
		   estado,
		   tipoProducto,
		   '\images\' + convert(varchar,IdProducto) + '.png' 'Imagen'
	  FROM dbo.TProductos

END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarProvincias]    Script Date: 12/21/2023 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarProvincias]
	
AS
BEGIN

	SELECT	ConProvincia 'Value',
			Descripcion 'Text'
	FROM	dbo.TProvincia

END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarTipoProducto]    Script Date: 12/21/2023 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarTipoProducto]
	
AS
BEGIN

	SELECT	TipoProducto 'Value',
			Descripcion 'Text'
	FROM	dbo.TTipoProducto

END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarUltimaFacturaYDetalles]    Script Date: 12/21/2023 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarUltimaFacturaYDetalles]
    @IdUsuario bigint
AS
BEGIN
    SELECT 
        CASE 
            WHEN ROW_NUMBER() OVER(PARTITION BY D.IdFactura ORDER BY D.IdFactura DESC) = 1 THEN D.IdFactura
            ELSE NULL
        END AS IdFacturaDetalle,
        P.nombreProducto AS NombreProducto,
        D.Cantidad,
        D.Impuesto,
        D.Precio,
        CASE 
            WHEN ROW_NUMBER() OVER(PARTITION BY E.IdFactura ORDER BY E.IdFactura DESC) = 1 THEN E.IdFactura
            ELSE NULL
        END AS IdFacturaEncabezado,
        CASE 
            WHEN ROW_NUMBER() OVER(PARTITION BY E.IdUsuario ORDER BY E.FechaPago DESC) = 1 THEN E.IdUsuario
            ELSE NULL
        END AS IdUsuario,
        E.FechaPago,
        CASE 
            WHEN ROW_NUMBER() OVER(PARTITION BY E.TotalPago ORDER BY E.FechaPago DESC) = 1 THEN E.TotalPago
            ELSE NULL
        END AS TotalPago
    FROM 
        TDetalle D
    INNER JOIN 
        TEncabezado E ON D.IdFactura = E.IdFactura
    INNER JOIN 
        TProductos P ON D.IdProducto = P.IdProducto
    INNER JOIN 
        (
            SELECT IdUsuario, MAX(FechaPago) AS UltimaFechaPago
            FROM TEncabezado
            WHERE IdUsuario = @IdUsuario
            GROUP BY IdUsuario
        ) UltimaFecha ON E.IdUsuario = UltimaFecha.IdUsuario AND E.FechaPago = UltimaFecha.UltimaFechaPago
    WHERE 
        E.IdUsuario = @IdUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarUsuario]    Script Date: 12/21/2023 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarUsuario]
	@IdUsuario BIGINT
AS
BEGIN
	
	SELECT IdUsuario,
		   identificacion,
		   nombre,
		   usuario,
		   correo,
		   estado,
		   ConRol,
		   ConProvincia
	  FROM dbo.TUsuario
	  WHERE IdUsuario = @IdUsuario

END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarUsuarios]    Script Date: 12/21/2023 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarUsuarios]
	@IdUsuario BIGINT
AS
BEGIN
	
	SELECT IdUsuario,
		   identificacion,
		   nombre,
		   usuario,
		   correo,
		   estado,
		   ConRol,
		   ConProvincia
	  FROM dbo.TUsuario
	  WHERE IdUsuario != @IdUsuario

END
GO
/****** Object:  StoredProcedure [dbo].[CORREOFACTURA]    Script Date: 12/21/2023 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CORREOFACTURA]
    @IdUsuario bigint
AS
BEGIN
    DECLARE @correo VARCHAR(100)
    DECLARE @nombreUsuario VARCHAR(50)
    DECLARE @contenidoCorreo NVARCHAR(MAX)

	DECLARE @FacturaDetalleTemp AS TABLE(IdFacturaDetalle BIGINT NULL,
										 NombreProducto VARCHAR(500) NULL,
										 Cantidad int Null,
										 Impuesto decimal(18, 2) NULL,
										 Precio decimal(18, 2) NULL,
										 IdFacturaEncabezado BIGINT NULL,
										 IdUsuario BIGINT NULL,
										 FechaPago datetime NULL,
										 TotalPago decimal(18, 2) NULL)

    -- Obtener el correo y nombre del usuario a partir del IdUsuario
    SELECT @correo = correo, @nombreUsuario = nombre
    FROM TUsuario
    WHERE IdUsuario = @IdUsuario AND estado = 1

    -- Verificar si se encontró un usuario con ese IdUsuario y estado activo
    IF (@correo IS NOT NULL)
    BEGIN
        -- Obtener los detalles de la última factura del usuario utilizando el procedimiento ConsultarUltimaFacturaYDetalles
        ----    Cantidad*,
        ----    Impuesto*,
        ----    Precio*,
        ----    IdFacturaEncabezado*,
        ----    IdUsuario*,
        ----    FechaPago*,
        ----    TotalPago*
        INSERT INTO @FacturaDetalleTemp(IdFacturaDetalle, NombreProducto, Cantidad, Impuesto,Precio, IdFacturaEncabezado, IdUsuario,FechaPago, TotalPago)
        exec ConsultarUltimaFacturaYDetalles @IdUsuario

		SELECT * FROM @FacturaDetalleTemp
	

        -- Verificar si se encontraron detalles de factura para el usuario
        IF EXISTS (SELECT 1 FROM @FacturaDetalleTemp)
        BEGIN
            -- Construir el contenido del correo electrónico utilizando los datos recuperados de la última factura
            SET @contenidoCorreo = 'Estimado ' + @nombreUsuario + ',<br><br>' +
                                   'Aquí están los detalles de tu última factura:<br>' +
                                   '<table border="1">' +
                                   '<tr><th>Nombre del Producto</th><th>Cantidad</th><th>Precio</th></tr>'

            SELECT @contenidoCorreo = @contenidoCorreo + 
                                      '<tr><td>' + NombreProducto + '</td><td>' + CONVERT(NVARCHAR(10), Cantidad) + 
                                      '</td><td>' + CONVERT(NVARCHAR(20), Precio) + '</td></tr>'
            FROM @FacturaDetalleTemp

            SET @contenidoCorreo = @contenidoCorreo + '</table><br>Gracias por tu preferencia.'

            -- Envía el correo electrónico utilizando @correo como destinatario y @contenidoCorreo como contenido
            -- Asegúrate de configurar adecuadamente el envío de correo electrónico con sp_send_dbmail

            -- Ejemplo de envío de correo (reemplaza con tu método de envío de correo)
            -- EXEC msdb.dbo.sp_send_dbmail ...

            -- Devuelve un mensaje de éxito
            SELECT 'Correo enviado correctamente' AS Resultado
        END
        ELSE
        BEGIN
            -- Si no se encontraron detalles de factura para el usuario
            SELECT 'No se encontraron detalles de factura para el usuario' AS Resultado
        END

		
    END
    ELSE
    BEGIN
        -- Si no se encontró un usuario activo con ese IdUsuario
        SELECT 'No se encontró un usuario activo con el IdUsuario proporcionado' AS Resultado
    END

END
GO
/****** Object:  StoredProcedure [dbo].[EliminarProductoCarrito]    Script Date: 12/21/2023 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarProductoCarrito]
	@IdCarrito AS BIGINT
AS
BEGIN
	
	DELETE FROM TCarrito
	WHERE IdCarrito = @IdCarrito

END
GO
/****** Object:  StoredProcedure [dbo].[IniciarSesion]    Script Date: 12/21/2023 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IniciarSesion]
	@usuario		VARCHAR(25),
	@contrasenna	VARCHAR(25)
AS
BEGIN

	SELECT	IdUsuario, nombre, identificacion, correo, usuario, estado, ConRol
	FROM	TUsuario
	WHERE	(usuario = @usuario OR correo = @usuario)
		AND contrasenna = @contrasenna
		AND estado		= 1
		AND esClaveTemp = 0

END
GO
/****** Object:  StoredProcedure [dbo].[PagarCarrito]    Script Date: 12/21/2023 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PagarCarrito]
	@IdUsuario AS BIGINT
AS
BEGIN
	BEGIN TRY	

		BEGIN TRANSACTION

		IF(	SELECT TOP 1 P.cantidadStock - C.Cantidad
			FROM TCarrito	C
			INNER	JOIN TProductos P ON C.IdProducto = P.IdProducto
			WHERE	IdUsuario = @IdUsuario ) < 0
		BEGIN

			DELETE	C
			FROM	TCarrito C
			INNER	JOIN TProductos P ON C.IdProducto = P.IdProducto
			WHERE	IdUsuario = @IdUsuario
			AND		P.cantidadStock = 0

			UPDATE	C
			SET		C.Cantidad = P.cantidadStock
			FROM	TCarrito C
			INNER	JOIN TProductos P ON C.IdProducto = P.IdProducto
			WHERE	IdUsuario = @IdUsuario
			AND    (P.cantidadStock - C.Cantidad) < 0 

			SELECT 'No se pudo realizar la transacción, verifique las unidades de su carrito' 'Mensaje'

		END
		ELSE
		BEGIN

			DECLARE @TotalPago DECIMAL(18,2)
			DECLARE @CodigoFactura BIGINT

			SELECT	@TotalPago = SUM(P.Precio * C.Cantidad) + (SUM(P.Precio * C.Cantidad) * 0.13)
			FROM	TCarrito	C
			INNER	JOIN TProductos P ON C.IdProducto = P.IdProducto
			WHERE	IdUsuario = @IdUsuario

			INSERT	INTO dbo.TEncabezado(IdUsuario,FechaPago,TotalPago)
			VALUES	(@IdUsuario,GETDATE(),@TotalPago)

			SET @CodigoFactura = @@IDENTITY

			INSERT	INTO dbo.TDetalle(IdFactura,IdProducto,Cantidad,Impuesto,Precio)
			SELECT	@CodigoFactura, C.IdProducto, C.Cantidad, (P.Precio * 0.13), P.Precio 
			FROM	TCarrito	C
			INNER	JOIN TProductos P ON C.IdProducto = P.IdProducto
			WHERE	IdUsuario = @IdUsuario

			UPDATE	P
			SET		P.cantidadStock -= C.Cantidad
			FROM	TCarrito	C
			INNER	JOIN TProductos P ON C.IdProducto = P.IdProducto
			WHERE	IdUsuario = @IdUsuario

			DELETE FROM TCarrito
			WHERE IdUsuario = @IdUsuario

			SELECT 'Transacción realizada correctamente' 'Mensaje'

		END

		COMMIT TRANSACTION

	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION
			SELECT 'No se pudo realizar la transacción, verifique las unidades de su carrito' 'Mensaje'
		END
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[RecuperarCuenta]    Script Date: 12/21/2023 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RecuperarCuenta]
	@usuario		VARCHAR(25)
AS
BEGIN
	
	SELECT	IdUsuario, nombre, correo
	FROM	TUsuario
	WHERE	(usuario = @usuario OR correo = @usuario)
		AND estado		= 1

END
GO
/****** Object:  StoredProcedure [dbo].[ReducirCantidadProductoCarrito]    Script Date: 12/21/2023 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ReducirCantidadProductoCarrito]
    @IdCarrito AS BIGINT
AS
BEGIN
    DECLARE @CantidadActual INT;

    -- Obtener la cantidad actual del producto en el carrito
    SELECT @CantidadActual = Cantidad
    FROM TCarrito
    WHERE IdCarrito = @IdCarrito;

    IF @CantidadActual > 1
    BEGIN
        -- Reducir en 1 la cantidad del producto en el carrito
        UPDATE TCarrito
        SET Cantidad = Cantidad - 1
        WHERE IdCarrito = @IdCarrito;
    END
    ELSE
    BEGIN
        -- Si la cantidad es 1, eliminar la línea del carrito
        DELETE FROM TCarrito
        WHERE IdCarrito = @IdCarrito;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarCarrito]    Script Date: 12/21/2023 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrarCarrito]
    @IdUsuario bigint,
    @IdProducto bigint,
    @Cantidad int
AS
BEGIN
    DECLARE @ProductExists int;

    -- Verificar si el producto ya existe en el carrito del usuario
    SELECT @ProductExists = COUNT(*) FROM TCarrito WHERE IdUsuario = @IdUsuario AND IdProducto = @IdProducto;

    IF @ProductExists > 0
    BEGIN
        -- Si el producto ya existe, actualizar la cantidad en lugar de insertar
        UPDATE TCarrito
        SET Cantidad = Cantidad + @Cantidad
        WHERE IdUsuario = @IdUsuario AND IdProducto = @IdProducto;
    END
    ELSE
    BEGIN
        -- Si el producto no existe en el carrito del usuario, insertarlo como un nuevo registro
        INSERT INTO dbo.TCarrito(IdUsuario, IdProducto, Cantidad, Fecha)
        VALUES (@IdUsuario, @IdProducto, @Cantidad, GETDATE());
    END
END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarCuenta]    Script Date: 12/21/2023 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrarCuenta]
    @identificacion varchar(20),
    @nombre         varchar(200),
    @usuario        varchar(25),
    @correo         varchar(50),
    @contrasenna    varchar(25)
AS
BEGIN
    DECLARE @resultado INT;

    BEGIN TRY
        -- Verificar si el correo ya está registrado
        IF EXISTS (SELECT 1 FROM TUsuario WHERE correo = @correo)
        BEGIN
            -- Si el correo ya está en uso, establecer @resultado en 2 y devolverlo
            SET @resultado = 2;
            RETURN @resultado;
        END

        -- Si el correo no está registrado, se procede a insertar el nuevo registro.
        INSERT INTO TUsuario (identificacion, nombre, usuario, correo, contrasenna, estado, esClaveTemp, vencimientoClaveTemp, ConRol, ConProvincia)
        VALUES (@identificacion, @nombre, @usuario, @correo, @contrasenna, 1, 0, GETDATE(), 2, 0);

        -- Si la inserción se realizó correctamente, establecer @resultado en 1 y devolverlo
        SET @resultado = 1;
        RETURN @resultado;
    END TRY
    BEGIN CATCH
        -- Capturar el error y establecer @resultado en 3 para otros errores
        SET @resultado = 3;
        RETURN @resultado;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarProducto]    Script Date: 12/21/2023 10:33:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrarProducto]
	@nombreProducto varchar(100),
	@descripcion varchar(500),
	@precio decimal(10,2),
	@cantidadStock bigint,
	@marca varchar(50),
	@tipoProducto bigint
AS
BEGIN
	INSERT INTO TProductos (nombreProducto, descripcion, precio, cantidadStock, marca, tipoProducto, estado)
	VALUES (@nombreProducto, @descripcion, @precio, @cantidadStock, @marca, @tipoProducto, 1)

	SELECT @@IDENTITY 'IdProducto'
END

SET ANSI_NULLS ON
GO
USE [master]
GO
ALTER DATABASE [ProyectoBD] SET  READ_WRITE 
GO
