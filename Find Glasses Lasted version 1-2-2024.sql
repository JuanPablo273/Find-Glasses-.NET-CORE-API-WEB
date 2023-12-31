USE [master]
GO
/****** Object:  Database [ProyectoBD]    Script Date: 1/2/2024 3:19:12 PM ******/
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
/****** Object:  Table [dbo].[TCarrito]    Script Date: 1/2/2024 3:19:12 PM ******/
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
/****** Object:  Table [dbo].[TCitas]    Script Date: 1/2/2024 3:19:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TCitas](
	[IdCita] [bigint] IDENTITY(1,1) NOT NULL,
	[FechaHora] [datetime] NOT NULL,
	[Estado] [bit] NOT NULL,
	[IdUsuario] [bigint] NOT NULL,
	[TipoCita] [bigint] NOT NULL,
 CONSTRAINT [PK__TCitas__394B0202021F6DB0] PRIMARY KEY CLUSTERED 
(
	[IdCita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TDescuentos]    Script Date: 1/2/2024 3:19:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TDescuentos](
	[IdDescuento] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](100) NULL,
	[PorcentajeDescuento] [decimal](5, 2) NULL,
	[FechaInicio] [date] NULL,
	[FechaFin] [date] NULL,
	[CodigoDescuento] [varchar](20) NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [PK__Descuent__A88425978DD7F0E7] PRIMARY KEY CLUSTERED 
(
	[IdDescuento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TDetalle]    Script Date: 1/2/2024 3:19:12 PM ******/
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
/****** Object:  Table [dbo].[TEncabezado]    Script Date: 1/2/2024 3:19:12 PM ******/
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
/****** Object:  Table [dbo].[TProductos]    Script Date: 1/2/2024 3:19:12 PM ******/
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
/****** Object:  Table [dbo].[TProvincia]    Script Date: 1/2/2024 3:19:12 PM ******/
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
/****** Object:  Table [dbo].[TRol]    Script Date: 1/2/2024 3:19:12 PM ******/
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
/****** Object:  Table [dbo].[TTipoProducto]    Script Date: 1/2/2024 3:19:12 PM ******/
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
/****** Object:  Table [dbo].[TTiposCitas]    Script Date: 1/2/2024 3:19:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TTiposCitas](
	[IdTipoCita] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK__TTiposCi__FF0674585F68A0AE] PRIMARY KEY CLUSTERED 
(
	[IdTipoCita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TUsuario]    Script Date: 1/2/2024 3:19:12 PM ******/
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
ALTER TABLE [dbo].[TCitas]  WITH CHECK ADD  CONSTRAINT [FK_TCitas_TTiposCitas] FOREIGN KEY([TipoCita])
REFERENCES [dbo].[TTiposCitas] ([IdTipoCita])
GO
ALTER TABLE [dbo].[TCitas] CHECK CONSTRAINT [FK_TCitas_TTiposCitas]
GO
ALTER TABLE [dbo].[TCitas]  WITH CHECK ADD  CONSTRAINT [FK_TCitas_TUsuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[TUsuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[TCitas] CHECK CONSTRAINT [FK_TCitas_TUsuario]
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
/****** Object:  StoredProcedure [dbo].[ActualizarCita]    Script Date: 1/2/2024 3:19:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarCita]
    @IdCita bigint,
    @FechaHora datetime,
    @TipoCita bigint
AS
BEGIN
    UPDATE TCitas
    SET FechaHora = @FechaHora,
        TipoCita = @TipoCita
    WHERE IdCita = @IdCita
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarClaveTemporal]    Script Date: 1/2/2024 3:19:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ActualizarCuenta]    Script Date: 1/2/2024 3:19:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ActualizarDescuento]    Script Date: 1/2/2024 3:19:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Corrección del procedimiento almacenado para actualizar descuentos
CREATE PROCEDURE [dbo].[ActualizarDescuento]
    @IdDescuento INT,
    @Nombre NVARCHAR(100),
    @Descripcion NVARCHAR(500),
    @PorcentajeDescuento DECIMAL(5, 2),
    @FechaInicio DATE,
    @FechaFin DATE,
    @CodigoDescuento NVARCHAR(50)
AS
BEGIN
    -- Actualización de los campos del descuento en la tabla TDescuentos
    UPDATE TDescuentos
    SET 
        Nombre = @Nombre,
        Descripcion = @Descripcion,
        PorcentajeDescuento = @PorcentajeDescuento,
        FechaInicio = @FechaInicio,
        FechaFin = @FechaFin,
        CodigoDescuento = @CodigoDescuento
    WHERE IdDescuento = @IdDescuento
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarEstadoCita]    Script Date: 1/2/2024 3:19:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ActualizarEstadoCita]
	@IdCita BIGINT
AS
BEGIN

	UPDATE	TCitas
	SET		estado = (CASE WHEN estado = 1 THEN 0 ELSE 1 END)
	WHERE	IdCita = @IdCita

END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarEstadoDescuento]    Script Date: 1/2/2024 3:19:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ActualizarEstadoProducto]    Script Date: 1/2/2024 3:19:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ActualizarEstadoUsuario]    Script Date: 1/2/2024 3:19:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ActualizarProducto]    Script Date: 1/2/2024 3:19:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ActualizarTipoCita]    Script Date: 1/2/2024 3:19:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarTipoCita]
    @Nombre varchar(50),
    @Descripcion varchar(100),
	@IdTipoCita bigint
AS
BEGIN
    UPDATE TTiposCitas
    SET Nombre = @Nombre,
        Descripcion = @Descripcion
    WHERE IdTipoCita = @IdTipoCita
END
GO
/****** Object:  StoredProcedure [dbo].[BuscarProductos]    Script Date: 1/2/2024 3:19:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CambiarClave]    Script Date: 1/2/2024 3:19:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CambiarClaveCuenta]    Script Date: 1/2/2024 3:19:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultaDeProductosMasComprados]    Script Date: 1/2/2024 3:19:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarCarrito]    Script Date: 1/2/2024 3:19:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarCitaPorId]    Script Date: 1/2/2024 3:19:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarCitaPorId]
    @IdCita BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT IdCita, FechaHora, Estado, IdUsuario, TipoCita
    FROM TCitas
    WHERE IdCita = @IdCita;
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarCitas]    Script Date: 1/2/2024 3:19:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarCitas]
AS
BEGIN
    SELECT IdCita,
           FechaHora,
           Estado,
           IdUsuario,
           TipoCita
    FROM dbo.TCitas
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarCitasReservadas]    Script Date: 1/2/2024 3:19:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarCitasReservadas]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        [FechaHora]
    FROM 
        [dbo].[TCitas]
    WHERE 
        [Estado] = 1; -- Filtrar por citas con estado 'Reservada' (siendo 1 el valor para 'Reservada')

    -- Puedes añadir más condiciones de filtrado si es necesario
END;
GO
/****** Object:  StoredProcedure [dbo].[ConsultarCorreoUsuario]    Script Date: 1/2/2024 3:19:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarDescuentoPorId]    Script Date: 1/2/2024 3:19:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarDescuentoPorId]
    @IdDescuento BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT IdDescuento, Nombre, Descripcion, PorcentajeDescuento, FechaInicio, FechaFin, CodigoDescuento
    FROM TDescuentos
    WHERE IdDescuento = @IdDescuento;
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarDescuentos]    Script Date: 1/2/2024 3:19:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarProductoPorId]    Script Date: 1/2/2024 3:19:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarProductos]    Script Date: 1/2/2024 3:19:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarProvincias]    Script Date: 1/2/2024 3:19:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarTipoCitaPorId]    Script Date: 1/2/2024 3:19:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarTipoCitaPorId]
    @IdTipoCita BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT IdTipoCita, Nombre, Descripcion
    FROM TTiposCitas
    WHERE IdTipoCita  = @IdTipoCita ;
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarTipoCitas]    Script Date: 1/2/2024 3:19:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarTipoCitas]
	
AS
BEGIN

	SELECT	IdTipoCita 'Value',
			Descripcion 'Text'
	FROM	dbo.TTiposCitas

END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarTipoProducto]    Script Date: 1/2/2024 3:19:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarTiposCitas]    Script Date: 1/2/2024 3:19:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarTiposCitas]
AS
BEGIN
    SELECT IdTipoCita,
           Nombre,
           Descripcion
    FROM dbo.TTiposCitas
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarUltimaFacturaYDetalles]    Script Date: 1/2/2024 3:19:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarUsuario]    Script Date: 1/2/2024 3:19:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarUsuarios]    Script Date: 1/2/2024 3:19:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CORREOFACTURA]    Script Date: 1/2/2024 3:19:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[EliminarProductoCarrito]    Script Date: 1/2/2024 3:19:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[IniciarSesion]    Script Date: 1/2/2024 3:19:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[PagarCarrito]    Script Date: 1/2/2024 3:19:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PagarCarrito]
	@IdUsuario AS BIGINT,
	@porcentajeDescuento AS DECIMAL(18, 2) = NULL
AS
BEGIN
	BEGIN TRY	
		BEGIN TRANSACTION

		IF (SELECT TOP 1 P.cantidadStock - C.Cantidad
			FROM TCarrito C
			INNER JOIN TProductos P ON C.IdProducto = P.IdProducto
			WHERE IdUsuario = @IdUsuario) < 0
		BEGIN
			-- Lógica cuando la cantidad en carrito excede el stock disponible
			-- (Tus acciones cuando la cantidad en carrito excede el stock)
			SELECT 'No se pudo realizar la transacción, verifique las unidades de su carrito' AS 'Mensaje'
		END
		ELSE
		BEGIN
			DECLARE @TotalPago DECIMAL(18, 2)
			DECLARE @CodigoFactura BIGINT

			-- Cálculo del TotalPago
			SELECT @TotalPago = SUM(P.Precio * C.Cantidad) + (SUM(P.Precio * C.Cantidad) * 0.13)
			FROM TCarrito C
			INNER JOIN TProductos P ON C.IdProducto = P.IdProducto
			WHERE IdUsuario = @IdUsuario

			-- Si se proporciona un porcentaje de descuento, se ajusta el TotalPago
			IF @porcentajeDescuento IS NOT NULL
			BEGIN
				SET @TotalPago = @TotalPago - (@TotalPago * @porcentajeDescuento / 100)
			END

			-- Insertar en TEncabezado y obtener el código de factura
			INSERT INTO dbo.TEncabezado (IdUsuario, FechaPago, TotalPago)
			VALUES (@IdUsuario, GETDATE(), @TotalPago)

			SET @CodigoFactura = @@IDENTITY

			-- Insertar en TDetalle
			INSERT INTO dbo.TDetalle (IdFactura, IdProducto, Cantidad, Impuesto, Precio)
			SELECT @CodigoFactura, C.IdProducto, C.Cantidad, (P.Precio * 0.13), P.Precio 
			FROM TCarrito C
			INNER JOIN TProductos P ON C.IdProducto = P.IdProducto
			WHERE IdUsuario = @IdUsuario

			-- Actualizar cantidadStock en TProductos
			UPDATE P
			SET P.cantidadStock -= C.Cantidad
			FROM TCarrito C
			INNER JOIN TProductos P ON C.IdProducto = P.IdProducto
			WHERE IdUsuario = @IdUsuario

			-- Limpiar carrito
			DELETE FROM TCarrito
			WHERE IdUsuario = @IdUsuario

			SELECT 'Transacción realizada correctamente' AS 'Mensaje'
		END

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		BEGIN
			ROLLBACK TRANSACTION
			SELECT 'No se pudo realizar la transacción, verifique las unidades de su carrito' AS 'Mensaje'
		END
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[RecuperarCuenta]    Script Date: 1/2/2024 3:19:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ReducirCantidadProductoCarrito]    Script Date: 1/2/2024 3:19:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[RegistrarCarrito]    Script Date: 1/2/2024 3:19:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[RegistrarCitas]    Script Date: 1/2/2024 3:19:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrarCitas]
    @FechaHora datetime,
    @IdUsuario bigint,
    @TipoCita bigint
AS
BEGIN
    INSERT INTO TCitas (FechaHora, Estado, IdUsuario, TipoCita)
    VALUES (@FechaHora, 1, @IdUsuario, @TipoCita)

    SELECT @@IDENTITY AS 'IdCita'
END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarCuenta]    Script Date: 1/2/2024 3:19:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[RegistrarDescuento]    Script Date: 1/2/2024 3:19:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrarDescuento]
    @Nombre NVARCHAR(100),
    @Descripcion NVARCHAR(500),
    @PorcentajeDescuento DECIMAL(5, 2),
    @FechaInicio DATE,
    @FechaFin DATE,
    @CodigoDescuento NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[TDescuentos] ([Nombre], [Descripcion], [PorcentajeDescuento], [FechaInicio], [FechaFin], [CodigoDescuento], [Estado])
    VALUES (@Nombre, @Descripcion, @PorcentajeDescuento, @FechaInicio, @FechaFin, @CodigoDescuento, 1) -- 1 representa TRUE

     SELECT SCOPE_IDENTITY() AS 'IdNuevoDescuento'; -- Devuelve el ID del nuevo descuento insertado

END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarProducto]    Script Date: 1/2/2024 3:19:12 PM ******/
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
/****** Object:  StoredProcedure [dbo].[RegistrarTipoCitas]    Script Date: 1/2/2024 3:19:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrarTipoCitas]
    @Nombre varchar(50),
    @Descripcion varchar(100)
AS
BEGIN
    INSERT INTO TTiposCitas (Nombre, Descripcion)
    VALUES (@Nombre,@Descripcion)

    SELECT @@IDENTITY AS 'IdCita'
END
GO
/****** Object:  StoredProcedure [dbo].[VerificarCodigoDescuento]    Script Date: 1/2/2024 3:19:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[VerificarCodigoDescuento]
    @codigoIngresado NVARCHAR(50),
    @porcentajeDescuento DECIMAL OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    -- Inicializar @porcentajeDescuento como NULL
    SET @porcentajeDescuento = NULL;

    -- Verificar si el código ingresado coincide con algún CodigoDescuento en la tabla
    IF EXISTS (SELECT 1 FROM [dbo].[TDescuentos] WHERE [CodigoDescuento] = @codigoIngresado)
    BEGIN
        -- Si se encuentra un descuento con el código, asignar el PorcentajeDescuento al parámetro de salida
        SELECT @porcentajeDescuento = [PorcentajeDescuento]
        FROM [dbo].[TDescuentos]
        WHERE [CodigoDescuento] = @codigoIngresado;
    END
END
GO
USE [master]
GO
ALTER DATABASE [ProyectoBD] SET  READ_WRITE 
GO
