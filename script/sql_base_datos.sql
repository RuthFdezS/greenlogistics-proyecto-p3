USE [master]
GO
/****** Object:  Database [GreenLogistics]    Script Date: 17/12/2018 11:47:14 p. m. ******/
CREATE DATABASE [GreenLogistics]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GreenLogistics', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\GreenLogistics.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GreenLogistics_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\GreenLogistics_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [GreenLogistics] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GreenLogistics].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GreenLogistics] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GreenLogistics] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GreenLogistics] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GreenLogistics] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GreenLogistics] SET ARITHABORT OFF 
GO
ALTER DATABASE [GreenLogistics] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [GreenLogistics] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GreenLogistics] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GreenLogistics] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GreenLogistics] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GreenLogistics] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GreenLogistics] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GreenLogistics] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GreenLogistics] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GreenLogistics] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GreenLogistics] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GreenLogistics] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GreenLogistics] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GreenLogistics] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GreenLogistics] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GreenLogistics] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GreenLogistics] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GreenLogistics] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GreenLogistics] SET  MULTI_USER 
GO
ALTER DATABASE [GreenLogistics] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GreenLogistics] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GreenLogistics] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GreenLogistics] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GreenLogistics] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GreenLogistics] SET QUERY_STORE = OFF
GO
USE [GreenLogistics]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 17/12/2018 11:47:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[CodCliente] [int] NOT NULL,
	[nomCliente] [varchar](20) NULL,
	[apellCliente] [varchar](50) NULL,
	[contrasena] [varchar](20) NULL,
	[correElectronico] [varchar](50) NULL,
	[telefono] [varchar](20) NULL,
	[ubicacion] [varchar](50) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[CodCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente_Perfil]    Script Date: 17/12/2018 11:47:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente_Perfil](
	[CodCliente] [int] NOT NULL,
	[CodPerfil] [int] NOT NULL,
	[activo] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoPedido]    Script Date: 17/12/2018 11:47:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoPedido](
	[CodEstadoPedido] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_EstadoPedido] PRIMARY KEY CLUSTERED 
(
	[CodEstadoPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Informacion_Pedidos]    Script Date: 17/12/2018 11:47:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Informacion_Pedidos](
	[CodCliente] [int] NULL,
	[CodPedido] [int] NULL,
	[CodEstadoPedido] [int] NULL,
	[CodTipoServicio] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 17/12/2018 11:47:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[CodPedido] [int] NOT NULL,
	[descPedido] [varchar](50) NULL,
	[lugarPedido] [varchar](50) NULL,
	[lugarEntrega] [varchar](50) NULL,
	[FechaPedido] [date] NULL,
 CONSTRAINT [PK_Pedido] PRIMARY KEY CLUSTERED 
(
	[CodPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perfil]    Script Date: 17/12/2018 11:47:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfil](
	[CodPerfil] [int] NOT NULL,
	[nomPerfil] [varchar](20) NULL,
 CONSTRAINT [PK_Perfil] PRIMARY KEY CLUSTERED 
(
	[CodPerfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistroServicio]    Script Date: 17/12/2018 11:47:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistroServicio](
	[CodRegistroServicio] [int] NOT NULL,
	[nombreTienda] [varchar](50) NULL,
	[encargado] [varchar](20) NULL,
	[telefono] [varchar](20) NULL,
	[ubicacion] [varchar](50) NULL,
 CONSTRAINT [PK_RegistroServicio] PRIMARY KEY CLUSTERED 
(
	[CodRegistroServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoServicio]    Script Date: 17/12/2018 11:47:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoServicio](
	[CodTipoServicio] [int] NOT NULL,
	[CodRegistroServicio] [int] NULL,
	[nomServicio] [varchar](50) NULL,
 CONSTRAINT [PK_TipoServicio] PRIMARY KEY CLUSTERED 
(
	[CodTipoServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cliente_Perfil]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Perfil_Cliente] FOREIGN KEY([CodCliente])
REFERENCES [dbo].[Cliente] ([CodCliente])
GO
ALTER TABLE [dbo].[Cliente_Perfil] CHECK CONSTRAINT [FK_Cliente_Perfil_Cliente]
GO
ALTER TABLE [dbo].[Cliente_Perfil]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Perfil_Perfil1] FOREIGN KEY([CodPerfil])
REFERENCES [dbo].[Perfil] ([CodPerfil])
GO
ALTER TABLE [dbo].[Cliente_Perfil] CHECK CONSTRAINT [FK_Cliente_Perfil_Perfil1]
GO
ALTER TABLE [dbo].[Informacion_Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Informacion_Pedidos_Cliente] FOREIGN KEY([CodCliente])
REFERENCES [dbo].[Cliente] ([CodCliente])
GO
ALTER TABLE [dbo].[Informacion_Pedidos] CHECK CONSTRAINT [FK_Informacion_Pedidos_Cliente]
GO
ALTER TABLE [dbo].[Informacion_Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Informacion_Pedidos_EstadoPedido] FOREIGN KEY([CodEstadoPedido])
REFERENCES [dbo].[EstadoPedido] ([CodEstadoPedido])
GO
ALTER TABLE [dbo].[Informacion_Pedidos] CHECK CONSTRAINT [FK_Informacion_Pedidos_EstadoPedido]
GO
ALTER TABLE [dbo].[Informacion_Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Informacion_Pedidos_Pedido] FOREIGN KEY([CodPedido])
REFERENCES [dbo].[Pedido] ([CodPedido])
GO
ALTER TABLE [dbo].[Informacion_Pedidos] CHECK CONSTRAINT [FK_Informacion_Pedidos_Pedido]
GO
ALTER TABLE [dbo].[Informacion_Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Informacion_Pedidos_TipoServicio] FOREIGN KEY([CodTipoServicio])
REFERENCES [dbo].[TipoServicio] ([CodTipoServicio])
GO
ALTER TABLE [dbo].[Informacion_Pedidos] CHECK CONSTRAINT [FK_Informacion_Pedidos_TipoServicio]
GO
ALTER TABLE [dbo].[TipoServicio]  WITH CHECK ADD  CONSTRAINT [FK_TipoServicio_RegistroServicio] FOREIGN KEY([CodRegistroServicio])
REFERENCES [dbo].[RegistroServicio] ([CodRegistroServicio])
GO
ALTER TABLE [dbo].[TipoServicio] CHECK CONSTRAINT [FK_TipoServicio_RegistroServicio]
GO
USE [master]
GO
ALTER DATABASE [GreenLogistics] SET  READ_WRITE 
GO
