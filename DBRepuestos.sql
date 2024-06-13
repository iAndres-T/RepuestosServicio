USE [master]
GO
/****** Object:  Database [DBRepuestos]    Script Date: 2/06/2024 9:54:58 p. m. ******/
CREATE DATABASE [DBRepuestos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBRepuestos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DBRepuestos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBRepuestos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DBRepuestos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DBRepuestos] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBRepuestos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBRepuestos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBRepuestos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBRepuestos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBRepuestos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBRepuestos] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBRepuestos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBRepuestos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBRepuestos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBRepuestos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBRepuestos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBRepuestos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBRepuestos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBRepuestos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBRepuestos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBRepuestos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBRepuestos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBRepuestos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBRepuestos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBRepuestos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBRepuestos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBRepuestos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBRepuestos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBRepuestos] SET RECOVERY FULL 
GO
ALTER DATABASE [DBRepuestos] SET  MULTI_USER 
GO
ALTER DATABASE [DBRepuestos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBRepuestos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBRepuestos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBRepuestos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBRepuestos] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBRepuestos] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBRepuestos', N'ON'
GO
ALTER DATABASE [DBRepuestos] SET QUERY_STORE = ON
GO
ALTER DATABASE [DBRepuestos] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DBRepuestos]
GO
/****** Object:  Table [dbo].[Cargo]    Script Date: 2/06/2024 9:54:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cargo](
	[id] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[salario] [decimal](10, 2) NULL,
	[jornada] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cilindraje]    Script Date: 2/06/2024 9:54:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cilindraje](
	[id] [int] NOT NULL,
	[numero] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 2/06/2024 9:54:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[documento] [varchar](10) NOT NULL,
	[nombre] [varchar](30) NULL,
	[primer_apellido] [varchar](30) NULL,
	[segundo_apellido] [varchar](30) NULL,
	[fecha_nacimiento] [date] NULL,
	[genero] [varchar](10) NULL,
	[direccion] [varchar](200) NULL,
	[telefono] [varchar](10) NULL,
	[correo] [varchar](100) NULL,
	[ultima_compra] [date] NULL,
	[tipo_persona] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleServicio]    Script Date: 2/06/2024 9:54:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleServicio](
	[codigo] [int] NOT NULL,
	[id_servicio] [int] NOT NULL,
	[id_venta] [int] NOT NULL,
	[valor] [decimal](10, 2) NOT NULL,
	[duracion] [varchar](20) NOT NULL,
 CONSTRAINT [PK_DetalleServicio] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleVenta]    Script Date: 2/06/2024 9:54:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleVenta](
	[codigo] [int] NOT NULL,
	[id_venta] [int] NOT NULL,
	[id_repuesto] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[valor_unitario] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_DetalleVenta] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DireccionProveedor]    Script Date: 2/06/2024 9:54:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DireccionProveedor](
	[direccion] [varchar](200) NOT NULL,
	[ciudad] [varchar](30) NULL,
	[id_pais] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[direccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 2/06/2024 9:54:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[documento] [varchar](10) NOT NULL,
	[nombre] [varchar](50) NULL,
	[primer_apellido] [varchar](50) NULL,
	[segundo_apellido] [varchar](50) NULL,
	[fecha_nacimiento] [date] NULL,
	[genero] [varchar](20) NULL,
	[direccion] [varchar](200) NULL,
	[telefono] [varchar](10) NULL,
	[correo] [varchar](50) NULL,
	[fecha_inicio_contrato] [date] NULL,
	[fecha_fin_contrato] [date] NULL,
	[id_cargo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Garantia]    Script Date: 2/06/2024 9:54:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Garantia](
	[id] [int] NOT NULL,
	[descripcion] [varchar](255) NULL,
	[duracion] [varchar](50) NULL,
	[id_cliente] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marca]    Script Date: 2/06/2024 9:54:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marca](
	[id] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Moto]    Script Date: 2/06/2024 9:54:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Moto](
	[linea] [varchar](50) NULL,
	[modelo] [int] NULL,
	[id_marca] [int] NULL,
	[id_cilindraje] [int] NULL,
	[placa] [varchar](6) NOT NULL,
	[id_cliente] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[placa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 2/06/2024 9:54:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[id] [int] NOT NULL,
	[nombre] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 2/06/2024 9:54:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[id] [int] NOT NULL,
	[nombre] [varchar](255) NULL,
	[correo] [varchar](255) NULL,
	[telefono] [varchar](20) NULL,
	[direccion] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Repuesto]    Script Date: 2/06/2024 9:54:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Repuesto](
	[id] [int] NOT NULL,
	[nombre] [varchar](150) NULL,
	[descripcion] [varchar](200) NULL,
	[numero_referencia] [varchar](30) NULL,
	[numero_serie] [varchar](30) NULL,
	[precio] [decimal](10, 2) NULL,
	[stock] [int] NULL,
	[fecha_actualizacion] [date] NULL,
	[id_tipo_repuesto] [int] NULL,
	[id_marca] [int] NULL,
	[id_proveedor] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicio]    Script Date: 2/06/2024 9:54:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicio](
	[id] [int] NOT NULL,
	[descripcion] [varchar](200) NULL,
	[id_empleado] [varchar](10) NULL,
	[valor] [decimal](10, 2) NULL,
	[duracion] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Repuesto]    Script Date: 2/06/2024 9:54:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Repuesto](
	[id] [int] NOT NULL,
	[categoria] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 2/06/2024 9:54:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id] [int] NOT NULL,
	[id_empleado] [varchar](10) NOT NULL,
	[user_name] [varchar](50) NOT NULL,
	[clave] [nvarchar](2000) NOT NULL,
	[salt] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta_Repuesto]    Script Date: 2/06/2024 9:54:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta_Repuesto](
	[id] [int] NOT NULL,
	[id_cliente] [varchar](10) NULL,
	[id_empleado] [varchar](10) NULL,
	[fecha_venta] [date] NULL,
	[metodo_pago] [varchar](15) NULL,
	[total] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta_Servicio]    Script Date: 2/06/2024 9:54:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta_Servicio](
	[id] [int] NOT NULL,
	[fecha_venta] [date] NULL,
	[id_cliente] [varchar](10) NULL,
	[metodo_pago] [varchar](15) NULL,
	[id_garantia] [int] NULL,
	[total] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Cargo] ([id], [nombre], [salario], [jornada]) VALUES (1, N'Mecánico', CAST(2000000.00 AS Decimal(10, 2)), N'8 Horas')
INSERT [dbo].[Cargo] ([id], [nombre], [salario], [jornada]) VALUES (2, N'Vendedor', CAST(1500000.00 AS Decimal(10, 2)), N'8 Horas')
INSERT [dbo].[Cargo] ([id], [nombre], [salario], [jornada]) VALUES (3, N'Almacenista', CAST(1500000.00 AS Decimal(10, 2)), N'8 Horas')
INSERT [dbo].[Cargo] ([id], [nombre], [salario], [jornada]) VALUES (4, N'Administrador', CAST(2500000.00 AS Decimal(10, 2)), N'6 Horas')
GO
INSERT [dbo].[Cilindraje] ([id], [numero]) VALUES (1, 100)
INSERT [dbo].[Cilindraje] ([id], [numero]) VALUES (2, 110)
INSERT [dbo].[Cilindraje] ([id], [numero]) VALUES (3, 115)
INSERT [dbo].[Cilindraje] ([id], [numero]) VALUES (4, 125)
INSERT [dbo].[Cilindraje] ([id], [numero]) VALUES (5, 135)
INSERT [dbo].[Cilindraje] ([id], [numero]) VALUES (6, 150)
INSERT [dbo].[Cilindraje] ([id], [numero]) VALUES (7, 155)
INSERT [dbo].[Cilindraje] ([id], [numero]) VALUES (8, 160)
INSERT [dbo].[Cilindraje] ([id], [numero]) VALUES (9, 180)
INSERT [dbo].[Cilindraje] ([id], [numero]) VALUES (10, 190)
INSERT [dbo].[Cilindraje] ([id], [numero]) VALUES (11, 200)
INSERT [dbo].[Cilindraje] ([id], [numero]) VALUES (12, 250)
INSERT [dbo].[Cilindraje] ([id], [numero]) VALUES (13, 300)
INSERT [dbo].[Cilindraje] ([id], [numero]) VALUES (14, 390)
INSERT [dbo].[Cilindraje] ([id], [numero]) VALUES (15, 400)
INSERT [dbo].[Cilindraje] ([id], [numero]) VALUES (16, 410)
INSERT [dbo].[Cilindraje] ([id], [numero]) VALUES (17, 450)
INSERT [dbo].[Cilindraje] ([id], [numero]) VALUES (18, 500)
INSERT [dbo].[Cilindraje] ([id], [numero]) VALUES (19, 600)
INSERT [dbo].[Cilindraje] ([id], [numero]) VALUES (20, 650)
INSERT [dbo].[Cilindraje] ([id], [numero]) VALUES (21, 700)
INSERT [dbo].[Cilindraje] ([id], [numero]) VALUES (22, 750)
INSERT [dbo].[Cilindraje] ([id], [numero]) VALUES (23, 800)
INSERT [dbo].[Cilindraje] ([id], [numero]) VALUES (24, 850)
INSERT [dbo].[Cilindraje] ([id], [numero]) VALUES (25, 900)
INSERT [dbo].[Cilindraje] ([id], [numero]) VALUES (26, 950)
INSERT [dbo].[Cilindraje] ([id], [numero]) VALUES (27, 1000)
INSERT [dbo].[Cilindraje] ([id], [numero]) VALUES (28, 1100)
INSERT [dbo].[Cilindraje] ([id], [numero]) VALUES (29, 1200)
INSERT [dbo].[Cilindraje] ([id], [numero]) VALUES (30, 1300)
GO
INSERT [dbo].[Cliente] ([documento], [nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [genero], [direccion], [telefono], [correo], [ultima_compra], [tipo_persona]) VALUES (N'1001', N'Jhon', N'Perez', N'Ospina', CAST(N'2003-09-02' AS Date), N'Hombre', N'Cra 57 #12-A', N'3134342340', N'frankii@gmail.com', CAST(N'2024-06-02' AS Date), N'Natural')
INSERT [dbo].[Cliente] ([documento], [nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [genero], [direccion], [telefono], [correo], [ultima_compra], [tipo_persona]) VALUES (N'1002', N'Camilo', N'Ospina', N'Hernandez', CAST(N'2000-04-07' AS Date), N'Hombre', N'Cra 11 #21-C', N'3214323111', N'kamilo@gmail.com', CAST(N'2024-06-02' AS Date), N'Natural')
INSERT [dbo].[Cliente] ([documento], [nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [genero], [direccion], [telefono], [correo], [ultima_compra], [tipo_persona]) VALUES (N'1003', N'Emmanuel', N'Ortiz', N'Areiza', CAST(N'2000-03-16' AS Date), N'Hombre', N'Cra 25 #33-C', N'3024769807', N'elmanuelo@gmail.com', CAST(N'2024-06-02' AS Date), N'Natural')
INSERT [dbo].[Cliente] ([documento], [nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [genero], [direccion], [telefono], [correo], [ultima_compra], [tipo_persona]) VALUES (N'1004', N'Juan David ', N'Aceros', N'Lopez', CAST(N'2003-08-24' AS Date), N'Hombre', N'Calle 19 #53-01', N'3217840906', N'acerosjuan@gmail.com', NULL, N'Natural')
INSERT [dbo].[Cliente] ([documento], [nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [genero], [direccion], [telefono], [correo], [ultima_compra], [tipo_persona]) VALUES (N'1005', N'Luis Miguel', N'Gomez', N'Usuga', CAST(N'2001-07-18' AS Date), N'Hombre', N'Cra 33 #27-A', N'3146148990', N'luisMgomezU@gmail.com', NULL, N'Natural')
GO
INSERT [dbo].[DetalleServicio] ([codigo], [id_servicio], [id_venta], [valor], [duracion]) VALUES (1, 1, 1, CAST(120000.00 AS Decimal(10, 2)), N'2 Horas')
INSERT [dbo].[DetalleServicio] ([codigo], [id_servicio], [id_venta], [valor], [duracion]) VALUES (2, 2, 2, CAST(20000.00 AS Decimal(10, 2)), N'20 Minutos')
INSERT [dbo].[DetalleServicio] ([codigo], [id_servicio], [id_venta], [valor], [duracion]) VALUES (3, 1, 2, CAST(120000.00 AS Decimal(10, 2)), N'2 Horas')
INSERT [dbo].[DetalleServicio] ([codigo], [id_servicio], [id_venta], [valor], [duracion]) VALUES (4, 2, 3, CAST(20000.00 AS Decimal(10, 2)), N'20 Minutos')
GO
INSERT [dbo].[DetalleVenta] ([codigo], [id_venta], [id_repuesto], [cantidad], [valor_unitario]) VALUES (1, 1, 7, 1, CAST(80000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleVenta] ([codigo], [id_venta], [id_repuesto], [cantidad], [valor_unitario]) VALUES (2, 2, 1, 1, CAST(55000.00 AS Decimal(10, 2)))
INSERT [dbo].[DetalleVenta] ([codigo], [id_venta], [id_repuesto], [cantidad], [valor_unitario]) VALUES (3, 2, 8, 1, CAST(120000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DireccionProveedor] ([direccion], [ciudad], [id_pais]) VALUES (N'13225 Circle Drive', N'Anamosa', 4)
INSERT [dbo].[DireccionProveedor] ([direccion], [ciudad], [id_pais]) VALUES (N'3 Chome-30-11 Uenohara', N'Nagoya', 7)
INSERT [dbo].[DireccionProveedor] ([direccion], [ciudad], [id_pais]) VALUES (N'Carrer de Balmes, 170', N'Barcelona', 3)
INSERT [dbo].[DireccionProveedor] ([direccion], [ciudad], [id_pais]) VALUES (N'Cra 33 #14-02A', N'Bogotá', 1)
INSERT [dbo].[DireccionProveedor] ([direccion], [ciudad], [id_pais]) VALUES (N'Johannstrabe 37-43', N'Stuttgart', 2)
INSERT [dbo].[DireccionProveedor] ([direccion], [ciudad], [id_pais]) VALUES (N'Units 7/8 Bowker Vale Industrial Estate', N'Liverpool', 5)
INSERT [dbo].[DireccionProveedor] ([direccion], [ciudad], [id_pais]) VALUES (N'Witveldweg 32, 5961 ND', N'Horst', 6)
GO
INSERT [dbo].[Empleado] ([documento], [nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [genero], [direccion], [telefono], [correo], [fecha_inicio_contrato], [fecha_fin_contrato], [id_cargo]) VALUES (N'1001', N'Juan Pablo', N'Jimenez', N'Lopera', CAST(N'1995-04-11' AS Date), N'Hombre', N'Calle 32 #18-B', N'3123422232', N'juancho1995@gmail.com', CAST(N'2022-04-20' AS Date), CAST(N'2025-04-20' AS Date), 4)
INSERT [dbo].[Empleado] ([documento], [nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [genero], [direccion], [telefono], [correo], [fecha_inicio_contrato], [fecha_fin_contrato], [id_cargo]) VALUES (N'1002', N'Miguel', N'Largo', N'Gutierrrez', CAST(N'2003-10-29' AS Date), N'Hombre', N'Cra 55 Calle 83-c Sur', N'3124456543', N'largopai@gmail.com', CAST(N'2023-02-07' AS Date), CAST(N'2024-12-07' AS Date), 1)
INSERT [dbo].[Empleado] ([documento], [nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [genero], [direccion], [telefono], [correo], [fecha_inicio_contrato], [fecha_fin_contrato], [id_cargo]) VALUES (N'1003', N'Luisa', N'Obando', N'Velázquez ', CAST(N'1997-02-12' AS Date), N'Mujer', N'Calle 45 #21-A', N'3057320187', N'luisaV@gmail.com', CAST(N'2022-07-15' AS Date), CAST(N'2025-07-15' AS Date), 2)
INSERT [dbo].[Empleado] ([documento], [nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [genero], [direccion], [telefono], [correo], [fecha_inicio_contrato], [fecha_fin_contrato], [id_cargo]) VALUES (N'1004', N'Santiago', N'Lopera', N'Vasquez', CAST(N'2003-06-01' AS Date), N'Hombre', N'Cra 37 Calle 70-A', N'3124980721', N'santi0601@gmail.com', CAST(N'2023-01-05' AS Date), CAST(N'2024-10-05' AS Date), 3)
INSERT [dbo].[Empleado] ([documento], [nombre], [primer_apellido], [segundo_apellido], [fecha_nacimiento], [genero], [direccion], [telefono], [correo], [fecha_inicio_contrato], [fecha_fin_contrato], [id_cargo]) VALUES (N'1005', N'Sebastian', N'Lastras', N'Zapata', CAST(N'1994-11-17' AS Date), N'Hombre', N'Cra 10 #50-C', N'3209864265', N'lastras94@gmail.com', CAST(N'2017-03-01' AS Date), CAST(N'2026-10-20' AS Date), 1)
GO
INSERT [dbo].[Garantia] ([id], [descripcion], [duracion], [id_cliente]) VALUES (1, N'Garantía de 1 mes a partir del 02/06/2024 por servicios prestados', N'1 Mes', N'1001')
INSERT [dbo].[Garantia] ([id], [descripcion], [duracion], [id_cliente]) VALUES (2, N'Garantía de 1 mes a partir del 02/06/2024 por servicios prestados', N'1 Mes', N'1002')
INSERT [dbo].[Garantia] ([id], [descripcion], [duracion], [id_cliente]) VALUES (3, N'Garantía de 1 mes a partir del 02/06/2024 por servicios prestados', N'1 Mes', N'1002')
GO
INSERT [dbo].[Marca] ([id], [nombre]) VALUES (1, N'Honda')
INSERT [dbo].[Marca] ([id], [nombre]) VALUES (2, N'Yamaha')
INSERT [dbo].[Marca] ([id], [nombre]) VALUES (3, N'Kawasaki')
INSERT [dbo].[Marca] ([id], [nombre]) VALUES (4, N'Suzuki')
INSERT [dbo].[Marca] ([id], [nombre]) VALUES (5, N'BMW')
INSERT [dbo].[Marca] ([id], [nombre]) VALUES (6, N'Ducati')
INSERT [dbo].[Marca] ([id], [nombre]) VALUES (7, N'Harley-Davidson')
INSERT [dbo].[Marca] ([id], [nombre]) VALUES (8, N'Royald Enfield')
INSERT [dbo].[Marca] ([id], [nombre]) VALUES (9, N'Aprilia')
INSERT [dbo].[Marca] ([id], [nombre]) VALUES (10, N'AKT')
INSERT [dbo].[Marca] ([id], [nombre]) VALUES (11, N'Bajaj')
INSERT [dbo].[Marca] ([id], [nombre]) VALUES (12, N'KTM')
INSERT [dbo].[Marca] ([id], [nombre]) VALUES (13, N'Hero')
INSERT [dbo].[Marca] ([id], [nombre]) VALUES (14, N'TVS')
GO
INSERT [dbo].[Moto] ([linea], [modelo], [id_marca], [id_cilindraje], [placa], [id_cliente]) VALUES (N'NKD', 2016, 10, 4, N'BHD12D', N'1005')
INSERT [dbo].[Moto] ([linea], [modelo], [id_marca], [id_cilindraje], [placa], [id_cliente]) VALUES (N'Boxer CT', 2017, 11, 1, N'CRX97E', N'1001')
INSERT [dbo].[Moto] ([linea], [modelo], [id_marca], [id_cilindraje], [placa], [id_cliente]) VALUES (N'Himalaya', 2021, 8, 16, N'EFL67F', N'1002')
INSERT [dbo].[Moto] ([linea], [modelo], [id_marca], [id_cilindraje], [placa], [id_cliente]) VALUES (N'Libero', 2014, 2, 4, N'GTU56C', N'1003')
INSERT [dbo].[Moto] ([linea], [modelo], [id_marca], [id_cilindraje], [placa], [id_cliente]) VALUES (N'Apache', 2022, 14, 8, N'HJV03G', N'1004')
GO
INSERT [dbo].[Pais] ([id], [nombre]) VALUES (1, N'Colombia')
INSERT [dbo].[Pais] ([id], [nombre]) VALUES (2, N'Alemania')
INSERT [dbo].[Pais] ([id], [nombre]) VALUES (3, N'España')
INSERT [dbo].[Pais] ([id], [nombre]) VALUES (4, N'Estados Unidos')
INSERT [dbo].[Pais] ([id], [nombre]) VALUES (5, N'Reino Unido')
INSERT [dbo].[Pais] ([id], [nombre]) VALUES (6, N'Paises Bajos')
INSERT [dbo].[Pais] ([id], [nombre]) VALUES (7, N'Japón')
GO
INSERT [dbo].[Proveedor] ([id], [nombre], [correo], [telefono], [direccion]) VALUES (1, N'AKT Motos', N'aktmotos@aktsa.com', N'3102323287', N'Cra 33 #14-02A')
INSERT [dbo].[Proveedor] ([id], [nombre], [correo], [telefono], [direccion]) VALUES (2, N'Louis Motorrad', N'motorrad@louis.com', N'3123454321', N'Johannstrabe 37-43')
INSERT [dbo].[Proveedor] ([id], [nombre], [correo], [telefono], [direccion]) VALUES (3, N'Motocard', N'motocard@gmail.com', N'3223980911', N'Carrer de Balmes, 170')
INSERT [dbo].[Proveedor] ([id], [nombre], [correo], [telefono], [direccion]) VALUES (4, N'J&P Cycles', N'cyclesjp@gmail.com', N'3023546543', N'13225 Circle Drive')
INSERT [dbo].[Proveedor] ([id], [nombre], [correo], [telefono], [direccion]) VALUES (5, N'Wemoto', N'wemoto@gmail.com', N'3218379012', N'Units 7/8 Bowker Vale Industrial Estate')
INSERT [dbo].[Proveedor] ([id], [nombre], [correo], [telefono], [direccion]) VALUES (6, N'CMSNL', N'classicmotor@gmail.com', N'3156273571', N'Witveldweg 32, 5961 ND')
INSERT [dbo].[Proveedor] ([id], [nombre], [correo], [telefono], [direccion]) VALUES (7, N'Webike Japan', N'webike@japan.com', N'3143902482', N'3 Chome-30-11 Uenohara')
GO
INSERT [dbo].[Repuesto] ([id], [nombre], [descripcion], [numero_referencia], [numero_serie], [precio], [stock], [fecha_actualizacion], [id_tipo_repuesto], [id_marca], [id_proveedor]) VALUES (1, N'Filtro de aceite', N'Para motor limpio', N'432413', N'543GFT67', CAST(55000.00 AS Decimal(10, 2)), 5, CAST(N'2024-03-23' AS Date), 2, 4, 3)
INSERT [dbo].[Repuesto] ([id], [nombre], [descripcion], [numero_referencia], [numero_serie], [precio], [stock], [fecha_actualizacion], [id_tipo_repuesto], [id_marca], [id_proveedor]) VALUES (2, N'Llantas Diablo Rosso V4', N'Ninguna', N'2423432', N'GTDS6575G', CAST(1200000.00 AS Decimal(10, 2)), 1, CAST(N'2024-04-28' AS Date), 7, 6, 6)
INSERT [dbo].[Repuesto] ([id], [nombre], [descripcion], [numero_referencia], [numero_serie], [precio], [stock], [fecha_actualizacion], [id_tipo_repuesto], [id_marca], [id_proveedor]) VALUES (3, N'Cilindro', N'Ninguna', N'13421824', N'YYUUAVST6765CC', CAST(220000.00 AS Decimal(10, 2)), 10, CAST(N'2024-06-01' AS Date), 1, 11, 3)
INSERT [dbo].[Repuesto] ([id], [nombre], [descripcion], [numero_referencia], [numero_serie], [precio], [stock], [fecha_actualizacion], [id_tipo_repuesto], [id_marca], [id_proveedor]) VALUES (4, N'Kit de Cilindro Completo FZ16', N'Ninguna', N'5325213', N'NAJBSH654C', CAST(420000.00 AS Decimal(10, 2)), 10, CAST(N'2024-06-01' AS Date), 1, 2, 6)
INSERT [dbo].[Repuesto] ([id], [nombre], [descripcion], [numero_referencia], [numero_serie], [precio], [stock], [fecha_actualizacion], [id_tipo_repuesto], [id_marca], [id_proveedor]) VALUES (5, N'Kit de Arrastre RK y JT', N'Ninguna', N'733543454', N'OVDVGATC6684D', CAST(155000.00 AS Decimal(10, 2)), 28, CAST(N'2024-06-01' AS Date), 2, 4, 4)
INSERT [dbo].[Repuesto] ([id], [nombre], [descripcion], [numero_referencia], [numero_serie], [precio], [stock], [fecha_actualizacion], [id_tipo_repuesto], [id_marca], [id_proveedor]) VALUES (6, N'Kit de Transmisión Honda CB190R', N'Ninguna', N'134321431', N'OIYTVJ655543P', CAST(180000.00 AS Decimal(10, 2)), 13, CAST(N'2024-06-01' AS Date), 2, 1, 4)
INSERT [dbo].[Repuesto] ([id], [nombre], [descripcion], [numero_referencia], [numero_serie], [precio], [stock], [fecha_actualizacion], [id_tipo_repuesto], [id_marca], [id_proveedor]) VALUES (7, N'Pastillas de Freno Brembo', N'Ninguna', N'01783472', N'RCGHVYD65546F', CAST(80000.00 AS Decimal(10, 2)), 12, CAST(N'2024-06-01' AS Date), 3, 3, 5)
INSERT [dbo].[Repuesto] ([id], [nombre], [descripcion], [numero_referencia], [numero_serie], [precio], [stock], [fecha_actualizacion], [id_tipo_repuesto], [id_marca], [id_proveedor]) VALUES (8, N'Discos de Freno para Yamaha', N'Ninguna', N'245246765', N'BHAGV9855CCH', CAST(120000.00 AS Decimal(10, 2)), 8, CAST(N'2024-06-01' AS Date), 3, 2, 7)
INSERT [dbo].[Repuesto] ([id], [nombre], [descripcion], [numero_referencia], [numero_serie], [precio], [stock], [fecha_actualizacion], [id_tipo_repuesto], [id_marca], [id_proveedor]) VALUES (9, N'Amortiguador YSS', N'Ninguna', N'30284736', N'OVRTACF8754F', CAST(350000.00 AS Decimal(10, 2)), 7, CAST(N'2024-06-01' AS Date), 4, 5, 6)
INSERT [dbo].[Repuesto] ([id], [nombre], [descripcion], [numero_referencia], [numero_serie], [precio], [stock], [fecha_actualizacion], [id_tipo_repuesto], [id_marca], [id_proveedor]) VALUES (10, N'Horquilla Delantera', N'Ninguna', N'012384129', N'VAYUSVUA78654L', CAST(280000.00 AS Decimal(10, 2)), 4, CAST(N'2024-06-01' AS Date), 4, 6, 2)
INSERT [dbo].[Repuesto] ([id], [nombre], [descripcion], [numero_referencia], [numero_serie], [precio], [stock], [fecha_actualizacion], [id_tipo_repuesto], [id_marca], [id_proveedor]) VALUES (11, N'Batería Yuasa', N'Ninguna', N'137946129', N'KJNAVSAV85476R', CAST(180000.00 AS Decimal(10, 2)), 2, CAST(N'2024-06-01' AS Date), 5, 7, 2)
INSERT [dbo].[Repuesto] ([id], [nombre], [descripcion], [numero_referencia], [numero_serie], [precio], [stock], [fecha_actualizacion], [id_tipo_repuesto], [id_marca], [id_proveedor]) VALUES (12, N'Regulador de Voltaje', N'Ninguna', N'35712683133', N'BVACSYCC85456FS', CAST(190000.00 AS Decimal(10, 2)), 8, CAST(N'2024-06-01' AS Date), 5, 8, 4)
INSERT [dbo].[Repuesto] ([id], [nombre], [descripcion], [numero_referencia], [numero_serie], [precio], [stock], [fecha_actualizacion], [id_tipo_repuesto], [id_marca], [id_proveedor]) VALUES (13, N'Juego de Carenados', N'Ninguna', N'732931073', N'BDALGI6758X', CAST(410000.00 AS Decimal(10, 2)), 1, CAST(N'2024-06-01' AS Date), 6, 9, 3)
INSERT [dbo].[Repuesto] ([id], [nombre], [descripcion], [numero_referencia], [numero_serie], [precio], [stock], [fecha_actualizacion], [id_tipo_repuesto], [id_marca], [id_proveedor]) VALUES (14, N'Asiento para KTM Duke', N'Ninguna', N'7164872638', N'HSKJAFB9787Y', CAST(400000.00 AS Decimal(10, 2)), 0, CAST(N'2024-06-01' AS Date), 6, 12, 2)
INSERT [dbo].[Repuesto] ([id], [nombre], [descripcion], [numero_referencia], [numero_serie], [precio], [stock], [fecha_actualizacion], [id_tipo_repuesto], [id_marca], [id_proveedor]) VALUES (15, N'Llanta Pirelli Diablo Rosso II', N'Ninguna', N'346236234', N'NAJKHSH796I', CAST(300000.00 AS Decimal(10, 2)), 9, CAST(N'2024-06-01' AS Date), 7, 6, 2)
INSERT [dbo].[Repuesto] ([id], [nombre], [descripcion], [numero_referencia], [numero_serie], [precio], [stock], [fecha_actualizacion], [id_tipo_repuesto], [id_marca], [id_proveedor]) VALUES (16, N'Escape Akrapovic', N'Ninguna', N'63298634829', N'SKALFAHVO731H', CAST(1500000.00 AS Decimal(10, 2)), 1, CAST(N'2024-06-01' AS Date), 8, 12, 4)
INSERT [dbo].[Repuesto] ([id], [nombre], [descripcion], [numero_referencia], [numero_serie], [precio], [stock], [fecha_actualizacion], [id_tipo_repuesto], [id_marca], [id_proveedor]) VALUES (17, N'Silenciador IXIL', N'Ninguna', N'793473929', N'HASKFBSAK673R', CAST(800000.00 AS Decimal(10, 2)), 5, CAST(N'2024-06-01' AS Date), 8, 6, 6)
INSERT [dbo].[Repuesto] ([id], [nombre], [descripcion], [numero_referencia], [numero_serie], [precio], [stock], [fecha_actualizacion], [id_tipo_repuesto], [id_marca], [id_proveedor]) VALUES (18, N'Filtro de Gasolina', N'Ninguna', N'432791239', N'BSAIFDBC82393J', CAST(30000.00 AS Decimal(10, 2)), 95, CAST(N'2024-06-01' AS Date), 9, 10, 1)
INSERT [dbo].[Repuesto] ([id], [nombre], [descripcion], [numero_referencia], [numero_serie], [precio], [stock], [fecha_actualizacion], [id_tipo_repuesto], [id_marca], [id_proveedor]) VALUES (19, N'Bomba de Combustible', N'Ninguna', N'5932794293', N'BFSAFOII362N', CAST(90000.00 AS Decimal(10, 2)), 30, CAST(N'2024-06-01' AS Date), 9, 13, 1)
INSERT [dbo].[Repuesto] ([id], [nombre], [descripcion], [numero_referencia], [numero_serie], [precio], [stock], [fecha_actualizacion], [id_tipo_repuesto], [id_marca], [id_proveedor]) VALUES (20, N'Faro Principal LED', N'Ninguna', N'643290474', N'BFSALKSH8332Y', CAST(140000.00 AS Decimal(10, 2)), 9, CAST(N'2024-06-01' AS Date), 10, 14, 1)
INSERT [dbo].[Repuesto] ([id], [nombre], [descripcion], [numero_referencia], [numero_serie], [precio], [stock], [fecha_actualizacion], [id_tipo_repuesto], [id_marca], [id_proveedor]) VALUES (21, N'Luces Intermitentes', N'Ninguna', N'712947274', N'BDUIEUR736A', CAST(95000.00 AS Decimal(10, 2)), 14, CAST(N'2024-06-01' AS Date), 10, 4, 7)
GO
INSERT [dbo].[Servicio] ([id], [descripcion], [id_empleado], [valor], [duracion]) VALUES (1, N'Mantenimiento General', N'1005', CAST(180000.00 AS Decimal(10, 2)), N'2 Horas')
INSERT [dbo].[Servicio] ([id], [descripcion], [id_empleado], [valor], [duracion]) VALUES (2, N'Cambio de Aceite', N'1002', CAST(20000.00 AS Decimal(10, 2)), N'20 Minutos')
INSERT [dbo].[Servicio] ([id], [descripcion], [id_empleado], [valor], [duracion]) VALUES (3, N'Cambio de Neumáticos', N'1004', CAST(80000.00 AS Decimal(10, 2)), N'1 Hora')
INSERT [dbo].[Servicio] ([id], [descripcion], [id_empleado], [valor], [duracion]) VALUES (4, N'Revisión Sistema de Frenos', N'1002', CAST(138000.00 AS Decimal(10, 2)), N'1 Hora')
INSERT [dbo].[Servicio] ([id], [descripcion], [id_empleado], [valor], [duracion]) VALUES (5, N'Cambio KIT de Arrastre', N'1005', CAST(200000.00 AS Decimal(10, 2)), N'3 Horas')
GO
INSERT [dbo].[Tipo_Repuesto] ([id], [categoria]) VALUES (1, N'Motor')
INSERT [dbo].[Tipo_Repuesto] ([id], [categoria]) VALUES (2, N'Transmisión')
INSERT [dbo].[Tipo_Repuesto] ([id], [categoria]) VALUES (3, N'Frenos')
INSERT [dbo].[Tipo_Repuesto] ([id], [categoria]) VALUES (4, N'Suspensión')
INSERT [dbo].[Tipo_Repuesto] ([id], [categoria]) VALUES (5, N'Eléctricos')
INSERT [dbo].[Tipo_Repuesto] ([id], [categoria]) VALUES (6, N'Carrocería')
INSERT [dbo].[Tipo_Repuesto] ([id], [categoria]) VALUES (7, N'Llantas')
INSERT [dbo].[Tipo_Repuesto] ([id], [categoria]) VALUES (8, N'Escape')
INSERT [dbo].[Tipo_Repuesto] ([id], [categoria]) VALUES (9, N'Sistema Combustible')
INSERT [dbo].[Tipo_Repuesto] ([id], [categoria]) VALUES (10, N'Iluminación')
GO
INSERT [dbo].[Usuario] ([id], [id_empleado], [user_name], [clave], [salt]) VALUES (1, N'1002', N'largop', N'4/Y2wEZIoZkydXyvLsFuflDeC/jwIsvWeGAIwQb06b0TeWAazhfIoL15pcNPGH4+', N'4/Y2wEZIoZkydXyvLsFufg==')
INSERT [dbo].[Usuario] ([id], [id_empleado], [user_name], [clave], [salt]) VALUES (2, N'1001', N'juanpa', N'uL3pWlO3As6tt6QIof4KArY3/Pf8qe3nmWznGH5FROWKQCb91uYAiu2mwl07jqjT', N'uL3pWlO3As6tt6QIof4KAg==')
INSERT [dbo].[Usuario] ([id], [id_empleado], [user_name], [clave], [salt]) VALUES (3, N'1003', N'luisaV', N'LS2Pi6bTHsxRvDQ/6/5E9StCYvGZyVRUmTwBKNMi4T4aw9t831Bno4Voff014u1u', N'LS2Pi6bTHsxRvDQ/6/5E9Q==')
INSERT [dbo].[Usuario] ([id], [id_empleado], [user_name], [clave], [salt]) VALUES (4, N'1004', N'santi06', N'H7Ci8UccIVk0uFoA3NjULmBcdYzKq2b8E+K8tcIaxQWtO8AF1TMtlFHBY04Wrqyj', N'H7Ci8UccIVk0uFoA3NjULg==')
INSERT [dbo].[Usuario] ([id], [id_empleado], [user_name], [clave], [salt]) VALUES (5, N'1005', N'sebasLa', N'mkI7/+aBdvB2nJtoTCYXvH2rP+HzOVmSCc2zY4HXt5G5MMxmyrhqo0QOtM5YiJ5I', N'mkI7/+aBdvB2nJtoTCYXvA==')
GO
INSERT [dbo].[Venta_Repuesto] ([id], [id_cliente], [id_empleado], [fecha_venta], [metodo_pago], [total]) VALUES (1, N'1003', N'1001', CAST(N'2024-06-02' AS Date), N'Transferencia', CAST(80000.00 AS Decimal(10, 2)))
INSERT [dbo].[Venta_Repuesto] ([id], [id_cliente], [id_empleado], [fecha_venta], [metodo_pago], [total]) VALUES (2, N'1001', N'1001', CAST(N'2024-06-02' AS Date), N'Transferencia', CAST(175000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Venta_Servicio] ([id], [fecha_venta], [id_cliente], [metodo_pago], [id_garantia], [total]) VALUES (1, CAST(N'2024-06-02' AS Date), N'1001', N'Transferencia', 1, CAST(120000.00 AS Decimal(10, 2)))
INSERT [dbo].[Venta_Servicio] ([id], [fecha_venta], [id_cliente], [metodo_pago], [id_garantia], [total]) VALUES (2, CAST(N'2024-06-02' AS Date), N'1002', N'Efectivo', 2, CAST(140000.00 AS Decimal(10, 2)))
INSERT [dbo].[Venta_Servicio] ([id], [fecha_venta], [id_cliente], [metodo_pago], [id_garantia], [total]) VALUES (3, CAST(N'2024-06-02' AS Date), N'1002', N'Efectivo', 3, CAST(20000.00 AS Decimal(10, 2)))
GO
ALTER TABLE [dbo].[DetalleServicio]  WITH CHECK ADD  CONSTRAINT [FK_DetalleServicio_Servicio] FOREIGN KEY([id_servicio])
REFERENCES [dbo].[Servicio] ([id])
GO
ALTER TABLE [dbo].[DetalleServicio] CHECK CONSTRAINT [FK_DetalleServicio_Servicio]
GO
ALTER TABLE [dbo].[DetalleServicio]  WITH CHECK ADD  CONSTRAINT [FK_DetalleServicio_Venta_Servicio] FOREIGN KEY([id_venta])
REFERENCES [dbo].[Venta_Servicio] ([id])
GO
ALTER TABLE [dbo].[DetalleServicio] CHECK CONSTRAINT [FK_DetalleServicio_Venta_Servicio]
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_DetalleVenta_Repuesto] FOREIGN KEY([id_repuesto])
REFERENCES [dbo].[Repuesto] ([id])
GO
ALTER TABLE [dbo].[DetalleVenta] CHECK CONSTRAINT [FK_DetalleVenta_Repuesto]
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_DetalleVenta_VentaRepuesto] FOREIGN KEY([id_venta])
REFERENCES [dbo].[Venta_Repuesto] ([id])
GO
ALTER TABLE [dbo].[DetalleVenta] CHECK CONSTRAINT [FK_DetalleVenta_VentaRepuesto]
GO
ALTER TABLE [dbo].[DireccionProveedor]  WITH CHECK ADD FOREIGN KEY([id_pais])
REFERENCES [dbo].[Pais] ([id])
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD FOREIGN KEY([id_cargo])
REFERENCES [dbo].[Cargo] ([id])
GO
ALTER TABLE [dbo].[Garantia]  WITH CHECK ADD FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Cliente] ([documento])
GO
ALTER TABLE [dbo].[Moto]  WITH CHECK ADD FOREIGN KEY([id_cilindraje])
REFERENCES [dbo].[Cilindraje] ([id])
GO
ALTER TABLE [dbo].[Moto]  WITH CHECK ADD FOREIGN KEY([id_marca])
REFERENCES [dbo].[Marca] ([id])
GO
ALTER TABLE [dbo].[Moto]  WITH CHECK ADD  CONSTRAINT [FK_Moto_Cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Cliente] ([documento])
GO
ALTER TABLE [dbo].[Moto] CHECK CONSTRAINT [FK_Moto_Cliente]
GO
ALTER TABLE [dbo].[Proveedor]  WITH CHECK ADD FOREIGN KEY([direccion])
REFERENCES [dbo].[DireccionProveedor] ([direccion])
GO
ALTER TABLE [dbo].[Repuesto]  WITH CHECK ADD FOREIGN KEY([id_marca])
REFERENCES [dbo].[Marca] ([id])
GO
ALTER TABLE [dbo].[Repuesto]  WITH CHECK ADD FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[Proveedor] ([id])
GO
ALTER TABLE [dbo].[Repuesto]  WITH CHECK ADD FOREIGN KEY([id_tipo_repuesto])
REFERENCES [dbo].[Tipo_Repuesto] ([id])
GO
ALTER TABLE [dbo].[Servicio]  WITH CHECK ADD FOREIGN KEY([id_empleado])
REFERENCES [dbo].[Empleado] ([documento])
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Empleado] FOREIGN KEY([id_empleado])
REFERENCES [dbo].[Empleado] ([documento])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Empleado]
GO
ALTER TABLE [dbo].[Venta_Repuesto]  WITH CHECK ADD FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Cliente] ([documento])
GO
ALTER TABLE [dbo].[Venta_Repuesto]  WITH CHECK ADD FOREIGN KEY([id_empleado])
REFERENCES [dbo].[Empleado] ([documento])
GO
ALTER TABLE [dbo].[Venta_Servicio]  WITH CHECK ADD FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Cliente] ([documento])
GO
ALTER TABLE [dbo].[Venta_Servicio]  WITH CHECK ADD FOREIGN KEY([id_garantia])
REFERENCES [dbo].[Garantia] ([id])
GO
USE [master]
GO
ALTER DATABASE [DBRepuestos] SET  READ_WRITE 
GO
