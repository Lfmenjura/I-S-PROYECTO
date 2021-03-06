USE [master]
GO
/****** Object:  Database [CCOLPROYECTOS]    Script Date: 10/06/2021 8:45:10 p. m. ******/
CREATE DATABASE [CCOLPROYECTOS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CCOLPROYECTOS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\CCOLPROYECTOS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CCOLPROYECTOS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\CCOLPROYECTOS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CCOLPROYECTOS] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CCOLPROYECTOS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CCOLPROYECTOS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CCOLPROYECTOS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CCOLPROYECTOS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CCOLPROYECTOS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CCOLPROYECTOS] SET ARITHABORT OFF 
GO
ALTER DATABASE [CCOLPROYECTOS] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CCOLPROYECTOS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CCOLPROYECTOS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CCOLPROYECTOS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CCOLPROYECTOS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CCOLPROYECTOS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CCOLPROYECTOS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CCOLPROYECTOS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CCOLPROYECTOS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CCOLPROYECTOS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CCOLPROYECTOS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CCOLPROYECTOS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CCOLPROYECTOS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CCOLPROYECTOS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CCOLPROYECTOS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CCOLPROYECTOS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CCOLPROYECTOS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CCOLPROYECTOS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CCOLPROYECTOS] SET  MULTI_USER 
GO
ALTER DATABASE [CCOLPROYECTOS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CCOLPROYECTOS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CCOLPROYECTOS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CCOLPROYECTOS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CCOLPROYECTOS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CCOLPROYECTOS] SET QUERY_STORE = OFF
GO
USE [CCOLPROYECTOS]
GO
/****** Object:  Table [dbo].[Administrador]    Script Date: 10/06/2021 8:45:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrador](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigoAdmin] [int] NOT NULL,
	[correoAdmin] [varchar](50) NOT NULL,
	[contraseñaAdmin] [varchar](12) NOT NULL,
	[idPersona] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cargo]    Script Date: 10/06/2021 8:45:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cargo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombreCargo] [varchar](30) NOT NULL,
	[codCargo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ciudad]    Script Date: 10/06/2021 8:45:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ciudad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigoCiudad] [int] NOT NULL,
	[nombreCiudad] [varchar](50) NOT NULL,
	[idDepartamento] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 10/06/2021 8:45:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombreCliente] [varchar](50) NOT NULL,
	[telefonoCliente] [varchar](50) NOT NULL,
	[correoCliente] [varchar](100) NOT NULL,
	[rutCliente] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 10/06/2021 8:45:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamento](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigoDepartamento] [int] NOT NULL,
	[nombreDepartamento] [varchar](50) NOT NULL,
	[idPais] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoSerPro]    Script Date: 10/06/2021 8:45:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoSerPro](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombreEstadoSerPro] [varchar](50) NOT NULL,
	[codEstado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LineaTrabajo]    Script Date: 10/06/2021 8:45:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LineaTrabajo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombreLineaT] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 10/06/2021 8:45:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigoPais] [int] NOT NULL,
	[nombrePais] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 10/06/2021 8:45:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cedulaPersona] [int] NOT NULL,
	[nombrePersona] [varchar](20) NOT NULL,
	[apellidoPersona] [varchar](20) NOT NULL,
	[direccionPersona] [varchar](20) NOT NULL,
	[telefonoPersona] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proyecto]    Script Date: 10/06/2021 8:45:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proyecto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigoProyecto] [varchar](11) NOT NULL,
	[nombreProyecto] [varchar](100) NOT NULL,
	[fechaProyecto] [date] NOT NULL,
	[valorProyecto] [int] NOT NULL,
	[lineaProyecto] [varchar](20) NOT NULL,
	[idUsuario] [int] NOT NULL,
	[idCliente] [int] NULL,
	[idEstadoSP] [int] NULL,
	[idCiudad] [int] NULL,
	[idRecursoT] [int] NULL,
	[idLineaT] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecursoTecnico]    Script Date: 10/06/2021 8:45:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecursoTecnico](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipoRecursoT] [varchar](100) NOT NULL,
	[referenciaRecursoT] [varchar](100) NOT NULL,
	[marcaRecursoT] [varchar](100) NOT NULL,
	[valorRecursoT] [varchar](100) NOT NULL,
	[descripRecursoT] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SerPro]    Script Date: 10/06/2021 8:45:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SerPro](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idServicio] [int] NULL,
	[idProyecto] [int] NULL,
	[idCliente] [int] NOT NULL,
	[idEstadoSP] [int] NOT NULL,
	[idCiudad] [int] NOT NULL,
	[idRecursoT] [int] NOT NULL,
	[idLineaT] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicio]    Script Date: 10/06/2021 8:45:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicio](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigoServicio] [varchar](11) NOT NULL,
	[nombreServicio] [varchar](100) NOT NULL,
	[fechaServicio] [date] NOT NULL,
	[valorServicio] [int] NOT NULL,
	[lineaServicio] [varchar](20) NOT NULL,
	[idUsuarioSer] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 10/06/2021 8:45:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigoUsuario] [int] NOT NULL,
	[correoUsuario] [varchar](20) NOT NULL,
	[contrasenaUsuario] [varchar](12) NOT NULL,
	[idCargo] [int] NOT NULL,
	[idAdmin] [int] NOT NULL,
	[idPersona] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Administrador]  WITH CHECK ADD  CONSTRAINT [FK_Administrador_Perosna] FOREIGN KEY([idPersona])
REFERENCES [dbo].[Persona] ([id])
GO
ALTER TABLE [dbo].[Administrador] CHECK CONSTRAINT [FK_Administrador_Perosna]
GO
ALTER TABLE [dbo].[Ciudad]  WITH CHECK ADD  CONSTRAINT [FK_Ciudad_Departamento] FOREIGN KEY([idDepartamento])
REFERENCES [dbo].[Departamento] ([id])
GO
ALTER TABLE [dbo].[Ciudad] CHECK CONSTRAINT [FK_Ciudad_Departamento]
GO
ALTER TABLE [dbo].[Departamento]  WITH CHECK ADD  CONSTRAINT [FK_Departamento_Pais] FOREIGN KEY([idPais])
REFERENCES [dbo].[Pais] ([id])
GO
ALTER TABLE [dbo].[Departamento] CHECK CONSTRAINT [FK_Departamento_Pais]
GO
ALTER TABLE [dbo].[Proyecto]  WITH CHECK ADD  CONSTRAINT [FK_Proyceto_Cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([id])
GO
ALTER TABLE [dbo].[Proyecto] CHECK CONSTRAINT [FK_Proyceto_Cliente]
GO
ALTER TABLE [dbo].[Proyecto]  WITH CHECK ADD  CONSTRAINT [FK_Proyceto_EstadoSerPro] FOREIGN KEY([idEstadoSP])
REFERENCES [dbo].[EstadoSerPro] ([id])
GO
ALTER TABLE [dbo].[Proyecto] CHECK CONSTRAINT [FK_Proyceto_EstadoSerPro]
GO
ALTER TABLE [dbo].[Proyecto]  WITH CHECK ADD  CONSTRAINT [FK_Proyecto_Ciudad] FOREIGN KEY([idCiudad])
REFERENCES [dbo].[Ciudad] ([id])
GO
ALTER TABLE [dbo].[Proyecto] CHECK CONSTRAINT [FK_Proyecto_Ciudad]
GO
ALTER TABLE [dbo].[Proyecto]  WITH CHECK ADD  CONSTRAINT [FK_Proyecto_LineaTrabajo] FOREIGN KEY([idLineaT])
REFERENCES [dbo].[LineaTrabajo] ([id])
GO
ALTER TABLE [dbo].[Proyecto] CHECK CONSTRAINT [FK_Proyecto_LineaTrabajo]
GO
ALTER TABLE [dbo].[Proyecto]  WITH CHECK ADD  CONSTRAINT [FK_Proyecto_RecursoTecnico] FOREIGN KEY([idRecursoT])
REFERENCES [dbo].[RecursoTecnico] ([id])
GO
ALTER TABLE [dbo].[Proyecto] CHECK CONSTRAINT [FK_Proyecto_RecursoTecnico]
GO
ALTER TABLE [dbo].[Proyecto]  WITH CHECK ADD  CONSTRAINT [FK_Proyecto_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([id])
GO
ALTER TABLE [dbo].[Proyecto] CHECK CONSTRAINT [FK_Proyecto_Usuario]
GO
ALTER TABLE [dbo].[SerPro]  WITH CHECK ADD  CONSTRAINT [FK_SerPro_Ciudad] FOREIGN KEY([idCiudad])
REFERENCES [dbo].[Ciudad] ([id])
GO
ALTER TABLE [dbo].[SerPro] CHECK CONSTRAINT [FK_SerPro_Ciudad]
GO
ALTER TABLE [dbo].[SerPro]  WITH CHECK ADD  CONSTRAINT [FK_SerPro_Cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([id])
GO
ALTER TABLE [dbo].[SerPro] CHECK CONSTRAINT [FK_SerPro_Cliente]
GO
ALTER TABLE [dbo].[SerPro]  WITH CHECK ADD  CONSTRAINT [FK_SerPro_EstadoSerPro] FOREIGN KEY([idEstadoSP])
REFERENCES [dbo].[EstadoSerPro] ([id])
GO
ALTER TABLE [dbo].[SerPro] CHECK CONSTRAINT [FK_SerPro_EstadoSerPro]
GO
ALTER TABLE [dbo].[SerPro]  WITH CHECK ADD  CONSTRAINT [FK_SerPro_LineaTrabajo] FOREIGN KEY([idLineaT])
REFERENCES [dbo].[LineaTrabajo] ([id])
GO
ALTER TABLE [dbo].[SerPro] CHECK CONSTRAINT [FK_SerPro_LineaTrabajo]
GO
ALTER TABLE [dbo].[SerPro]  WITH CHECK ADD  CONSTRAINT [FK_SerPro_Proyecto] FOREIGN KEY([idProyecto])
REFERENCES [dbo].[Proyecto] ([id])
GO
ALTER TABLE [dbo].[SerPro] CHECK CONSTRAINT [FK_SerPro_Proyecto]
GO
ALTER TABLE [dbo].[SerPro]  WITH CHECK ADD  CONSTRAINT [FK_SerPro_RecursoTecnico] FOREIGN KEY([idRecursoT])
REFERENCES [dbo].[RecursoTecnico] ([id])
GO
ALTER TABLE [dbo].[SerPro] CHECK CONSTRAINT [FK_SerPro_RecursoTecnico]
GO
ALTER TABLE [dbo].[SerPro]  WITH CHECK ADD  CONSTRAINT [FK_SerPro_Servicio] FOREIGN KEY([idServicio])
REFERENCES [dbo].[Servicio] ([id])
GO
ALTER TABLE [dbo].[SerPro] CHECK CONSTRAINT [FK_SerPro_Servicio]
GO
ALTER TABLE [dbo].[Servicio]  WITH CHECK ADD  CONSTRAINT [FK_Servicio_Usuario] FOREIGN KEY([idUsuarioSer])
REFERENCES [dbo].[Usuario] ([id])
GO
ALTER TABLE [dbo].[Servicio] CHECK CONSTRAINT [FK_Servicio_Usuario]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Administrador] FOREIGN KEY([idAdmin])
REFERENCES [dbo].[Administrador] ([id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Administrador]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Cargo] FOREIGN KEY([idCargo])
REFERENCES [dbo].[Cargo] ([id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Cargo]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Persona] FOREIGN KEY([idPersona])
REFERENCES [dbo].[Persona] ([id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Persona]
GO
/****** Object:  StoredProcedure [dbo].[Consultar_AccesoSistemaWeb]    Script Date: 10/06/2021 8:45:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************* 
	NOMBRE          :   [Consultar_AccesoSistemaWeb]
	FUNCION         : 	Consultar datos de correo y contraseña para autenticaciòn de usuario
	APLICACION      :	login Proyecto

**************************************************************************************
EXEC [Consultar_AccesoSistemaWeb] 
**************************************************************************************/
CREATE PROCEDURE[dbo].[Consultar_AccesoSistemaWeb]
	@Correo					VARCHAR(150),
	@Contraseña				VARCHAR(20)

AS
BEGIN
	
	DECLARE @DataUsuario TABLE(

		Acceso  BIT,
		Mensaje VARCHAR (MAX),
		Admin_ BIT
	)

	DECLARE @CedulaAdmin  INT, @CedulaUsuario INT, @Acceso BIT, @Mensaje VARCHAR(MAX), @Admin BIT

	SELECT @CedulaAdmin= P.cedulaPersona
	FROM Administrador A
	INNER JOIN Persona P ON P.id = A.idPersona
	WHERE correoAdmin = @Correo
	AND	  contraseñaAdmin = @Contraseña

	IF(@CedulaAdmin IS NOT NULL)
		BEGIN
			SET @Acceso = 1
			SET @Mensaje = 'Acceso Autorizado'
			SET @Admin = 1		
		END
	ELSE
		BEGIN
			SELECT @CedulaUsuario = P.cedulaPersona
			FROM Usuario U
			INNER JOIN Persona P ON P.id = U.idPersona
			WHERE correoUsuario = @Correo
			AND	  contrasenaUsuario = @Contraseña

			IF(@CedulaUsuario IS NOT NULL)
				BEGIN			
					SET @Acceso = 1
					SET @Mensaje = 'Acceso Autorizado'
					SET @Admin = 0
				END
			ELSE
				BEGIN
					SET @Acceso = 0
					SET @Mensaje = 'Acceso No Autorizado'
					SET @Admin = 0
				END
		END

	INSERT INTO @DataUsuario (Acceso,Mensaje,Admin_) VALUES(@Acceso,@Mensaje, @Admin)
	
	SELECT Acceso,Mensaje,Admin_ FROM @DataUsuario

END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarAdministrador]    Script Date: 10/06/2021 8:45:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************* 
	NOMBRE          :   [ConsultarAdministrador]
	FUNCION         : 	Consultar administrador de la empresa CCOL
	APLICACION      :	Admisnitrador
**************************************************************************************
EXEC [ConsultarAdministrador] 
**************************************************************************************/
CREATE PROCEDURE[dbo].[ConsultarAdministrador]
	
AS
BEGIN 

		SELECT A.ID,codigoAdmin, cedulaPersona, nombrePersona, apellidoPersona, telefonoPersona,
			direccionPersona, correoAdmin
	FROM Administrador A
	INNER JOIN Persona P ON P.ID = A.idPersona
	

END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarCargo]    Script Date: 10/06/2021 8:45:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************* 
	NOMBRE          :   [ConsultarCargo]
	FUNCION         : 	Consultar cargos de la empresa CCOL
	APLICACION      :	Cargo
**************************************************************************************
EXEC [ConsultarCargo] 
**************************************************************************************/
CREATE PROCEDURE[dbo].[ConsultarCargo]
	
AS
BEGIN 

	SELECT ID, nombreCargo, codCargo FROM Cargo 

END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarCiudad]    Script Date: 10/06/2021 8:45:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************* 
	NOMBRE          :   [ConsultarCiudad]
	FUNCION         : 	Consultar Ciudad de la empresa CCOL
	APLICACION      :	Ciudad
**************************************************************************************
EXEC [ConsultarCiudad] 
**************************************************************************************/
CREATE PROCEDURE[dbo].[ConsultarCiudad]
	@IdDepartamento INT 
AS
BEGIN 

	SELECT ID,codigoCiudad, nombreciudad FROM Ciudad WHERE idDepartamento=@IdDepartamento

END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarCliente]    Script Date: 10/06/2021 8:45:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************* 
	NOMBRE          :   [ConsultarCliente]
	FUNCION         : 	Consultar clientes de la empresa CCOL
	APLICACION      :	Cliente
**************************************************************************************
EXEC [ConsultarCliente] 
**************************************************************************************/
CREATE PROCEDURE[dbo].[ConsultarCliente]
	
AS
BEGIN 

	SELECT ID, nombreCliente,telefonoCliente,correoCliente,rutCliente FROM Cliente 

END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarDepartamento]    Script Date: 10/06/2021 8:45:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************* 
	NOMBRE          :   [ConsultarDepartamento]
	FUNCION         : 	Consultar departamento de la empresa CCOL
	APLICACION      :	Departamento
**************************************************************************************
EXEC [ConsultarDepartamento] 
**************************************************************************************/
CREATE PROCEDURE[dbo].[ConsultarDepartamento]
	@IdPais INT 
AS
BEGIN 

	SELECT ID,codigoDepartamento, nombreDepartamento FROM Departamento WHERE idPais=@IdPais

END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarEstado]    Script Date: 10/06/2021 8:45:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************* 
	NOMBRE          :   [ConsultarEstado]
	FUNCION         : 	Consultar estado de la empresa CCOL
	APLICACION      :	Estado
**************************************************************************************
EXEC [ConsultarEstado] 
**************************************************************************************/
CREATE PROCEDURE[dbo].[ConsultarEstado]
	
AS
BEGIN 

	SELECT ID, nombreEstadoSerPro,codEstado FROM EstadoSerPro 

END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarGrupoT]    Script Date: 10/06/2021 8:45:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************* 
	NOMBRE          :   [ConsultarGrupoT]
	FUNCION         : 	Consultar grupo trabajo de la empresa CCOL
	APLICACION      :	Grupo Trabajo
**************************************************************************************
EXEC [ConsultarGrupoT] 
**************************************************************************************/
CREATE PROCEDURE[dbo].[ConsultarGrupoT]
	
AS
BEGIN 

	SELECT ID, nombreGrupoT FROM GrupoTrabajo

END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarLineaT]    Script Date: 10/06/2021 8:45:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************* 
	NOMBRE          :   [ConsultarLineaT]
	FUNCION         : 	Consultar linea de trabajo de la empresa CCOL
	APLICACION      :	LineaTrabajo
**************************************************************************************
EXEC [ConsultarCargo] 
**************************************************************************************/
CREATE PROCEDURE[dbo].[ConsultarLineaT]
	
AS
BEGIN 

	SELECT ID, nombreLineaT FROM LineaTrabajo 

END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarPais]    Script Date: 10/06/2021 8:45:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************* 
	NOMBRE          :   [ConsultarPais]
	FUNCION         : 	Consultar pais de la empresa CCOL
	APLICACION      :	Pais
**************************************************************************************
EXEC [ConsultarPais] 
**************************************************************************************/
CREATE PROCEDURE[dbo].[ConsultarPais]
	
AS
BEGIN 

	SELECT ID,codigoPais, nombrePais FROM Pais 

END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarRecursoTecnico]    Script Date: 10/06/2021 8:45:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************* 
	NOMBRE          :   [ConsultarRecursoTecnico]
	FUNCION         : 	Consultar recursos tecnicos de la empresa CCOL
	APLICACION      :	RecursoTecnico
**************************************************************************************
EXEC [ConsultarRecursoTecnico] 
**************************************************************************************/
CREATE PROCEDURE[dbo].[ConsultarRecursoTecnico]
	
AS
BEGIN 

	SELECT ID,tipoRecursoT, referenciaRecursoT, marcaRecursoT,valorRecursoT,descripRecursoT FROM RecursoTecnico

END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarUsuario]    Script Date: 10/06/2021 8:45:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************* 
	NOMBRE          :   [ConsultarUsuario]
	FUNCION         : 	Consultar Usuario de la empresa CCOL
	APLICACION      :	Usuario
**************************************************************************************
EXEC [ConsultarUsuario] 
**************************************************************************************/
CREATE PROCEDURE[dbo].[ConsultarUsuario]
	
AS
BEGIN 

	SELECT U.ID, codigoUsuario, cedulaPersona, nombrePersona, apellidoPersona, telefonoPersona,
			direccionPersona, correoUsuario, C.nombreCargo
	FROM Usuario U
	INNER JOIN Persona P ON P.ID = U.idPersona
	INNER JOIN Cargo C ON C.id = U.id

END
GO
/****** Object:  StoredProcedure [dbo].[EliminarAdmin]    Script Date: 10/06/2021 8:45:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************* 
	NOMBRE          :   [EliminarAdmin]
	FUNCION         : 	Eliminar administradores de la empresa CCOL
	APLICACION      :	Administrador
**************************************************************************************
EXEC [EliminarAdmin] 
**************************************************************************************/
CREATE PROCEDURE[dbo].[EliminarAdmin]
	@idAdmin INT 
AS
BEGIN 

	DELETE FROM Administrador WHERE ID = @idAdmin

END
GO
/****** Object:  StoredProcedure [dbo].[EliminarCargo]    Script Date: 10/06/2021 8:45:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************* 
	NOMBRE          :   [EliminarCargo]
	FUNCION         : 	Eliminar cargos de la empresa CCOL
	APLICACION      :	Cargo
**************************************************************************************
EXEC [EliminarCargo] 
**************************************************************************************/
CREATE PROCEDURE[dbo].[EliminarCargo]
	@idCargo INT 
AS
BEGIN 

	DELETE FROM Cargo WHERE ID = @idCargo 

END
GO
/****** Object:  StoredProcedure [dbo].[EliminarCiudad]    Script Date: 10/06/2021 8:45:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************* 
	NOMBRE          :   [EliminarCiudad]
	FUNCION         : 	Eliminar Ciudad de la empresa CCOL
	APLICACION      :	Ciudad
**************************************************************************************
EXEC [EliminarCiudad] 
**************************************************************************************/
CREATE PROCEDURE[dbo].[EliminarCiudad]
	@idCiudad INT 
AS
BEGIN 

	DELETE FROM Ciudad WHERE ID = @idCiudad

END
GO
/****** Object:  StoredProcedure [dbo].[EliminarCliente]    Script Date: 10/06/2021 8:45:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************* 
	NOMBRE          :   [EliminarCliente]
	FUNCION         : 	Eliminar clientes de la empresa CCOL
	APLICACION      :	Cliente
**************************************************************************************
EXEC [EliminarCliente] 
**************************************************************************************/
CREATE PROCEDURE[dbo].[EliminarCliente]
	@idCliente INT 
AS
BEGIN 

	DELETE FROM Cliente WHERE ID = @idCliente

END
GO
/****** Object:  StoredProcedure [dbo].[EliminarDepartamento]    Script Date: 10/06/2021 8:45:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************* 
	NOMBRE          :   [EliminarDepartamento]
	FUNCION         : 	Eliminar departamentos de la empresa CCOL
	APLICACION      :	Departamento
**************************************************************************************
EXEC [EliminarCargo] 
**************************************************************************************/
CREATE PROCEDURE[dbo].[EliminarDepartamento]
	@idDepartamento INT 
AS
BEGIN 

	DELETE FROM Departamento WHERE ID = @idDepartamento

END
GO
/****** Object:  StoredProcedure [dbo].[EliminarEstado]    Script Date: 10/06/2021 8:45:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************* 
	NOMBRE          :   [EliminarEstado]
	FUNCION         : 	Eliminar estados de la empresa CCOL
	APLICACION      :	EstadoSerPro
**************************************************************************************
EXEC [EliminarEstado] 
**************************************************************************************/
CREATE PROCEDURE[dbo].[EliminarEstado]
	@idEstado INT 
AS
BEGIN 

	DELETE FROM EstadoSerPro WHERE ID = @idEstado

END
GO
/****** Object:  StoredProcedure [dbo].[EliminarGrupo]    Script Date: 10/06/2021 8:45:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************* 
	NOMBRE          :   [EliminarGrupo]
	FUNCION         : 	Eliminar grupos de la empresa CCOL
	APLICACION      :	GrupoTrabajo
**************************************************************************************
EXEC [EliminarGrupo] 
**************************************************************************************/
CREATE PROCEDURE[dbo].[EliminarGrupo]
	@idGrupo INT 
AS
BEGIN 

	DELETE FROM GrupoTrabajo WHERE ID = @idGrupo

END
GO
/****** Object:  StoredProcedure [dbo].[EliminarLineaT]    Script Date: 10/06/2021 8:45:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************* 
	NOMBRE          :   [EliminarLinea]
	FUNCION         : 	Eliminar linea de trabajo de la empresa CCOL
	APLICACION      :	LineaTrabajo
**************************************************************************************
EXEC [EliminarLineaT] 
**************************************************************************************/
CREATE PROCEDURE[dbo].[EliminarLineaT]
	@idLineaT INT 
AS
BEGIN 

	DELETE FROM LineaTrabajo WHERE ID = @idLineaT

END
GO
/****** Object:  StoredProcedure [dbo].[EliminarPais]    Script Date: 10/06/2021 8:45:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************* 
	NOMBRE          :   [EliminarPais]
	FUNCION         : 	Eliminar pais de la empresa CCOL
	APLICACION      :	Pais
**************************************************************************************
EXEC [EliminarPais] 
**************************************************************************************/
CREATE PROCEDURE[dbo].[EliminarPais]
	@idPais INT 
AS
BEGIN 

	DELETE FROM Pais WHERE ID = @idPais

END
GO
/****** Object:  StoredProcedure [dbo].[EliminarRecursoTecnico]    Script Date: 10/06/2021 8:45:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************* 
	NOMBRE          :   [EliminarRecursoTecnico]
	FUNCION         : 	Eliminar Recursos tecnicos de la empresa CCOL
	APLICACION      :	RecursoTecnico
**************************************************************************************
EXEC [EliminarRecursoTecnico] 
**************************************************************************************/
CREATE PROCEDURE[dbo].[EliminarRecursoTecnico]
	@idRecursoT INT 
AS
BEGIN 

	DELETE FROM RecursoTecnico WHERE ID = @idRecursoT 

END
GO
/****** Object:  StoredProcedure [dbo].[EliminarUsuario]    Script Date: 10/06/2021 8:45:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************* 
	NOMBRE          :   [EliminarUsuario]
	FUNCION         : 	Eliminar usuarios de la empresa CCOL
	APLICACION      :	Usuario
**************************************************************************************
EXEC [EliminarUsuario] 
**************************************************************************************/
CREATE PROCEDURE[dbo].[EliminarUsuario]
	@idUsuario INT 
AS
BEGIN 

	DELETE FROM Usuario WHERE ID = @idUsuario

END
GO
/****** Object:  StoredProcedure [dbo].[InsertarAdmin]    Script Date: 10/06/2021 8:45:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************* 
	NOMBRE          :   [InsertarAdmin]
	FUNCION         : 	Insertar Administrador de la empresa CCOL
	APLICACION      :	Administrador
**************************************************************************************
EXEC [InsertarAdmin] 123, 'admin@ccolproyectos.com','123Admin',123456,'lina','menjura','hola',12345
**************************************************************************************/
CREATE PROCEDURE[dbo].[InsertarAdmin]
	@codigoAdmin int,
	@correoAdmin varchar(50),
	@contrasenaAdmin varchar(20),
	@cedulaPersona int ,
	@nombrePersona varchar(80),
	@apellidoPersona varchar(80),
	@direccionPersona varchar(20),
	@telefonoPersona int
	
AS
BEGIN 

	DECLARE @idPersona int,
			@AdminInsertado BIT

	DECLARE @AdminExiste TABLE(
		ID INT,
		adminInsertado BIT
	)

	IF NOT EXISTS (SELECT TOP 1 1 FROM Persona WHERE cedulaPersona = @cedulaPersona)
	
		BEGIN 

			INSERT INTO Persona VALUES (@cedulaPersona,@nombrePersona,@apellidoPersona,@direccionPersona,@telefonoPersona)
			
			SELECT TOP 1 @idPersona= id FROM Persona WHERE cedulaPersona = @cedulaPersona

			INSERT INTO Administrador VALUES(@codigoAdmin, @correoAdmin,@contrasenaAdmin,@idPersona)

			SET @AdminInsertado = 1
		END
	ELSE
		BEGIN
			SET @AdminInsertado = 0
		END


	INSERT INTO @AdminExiste VALUES(1, @AdminInsertado)

	SELECT ID, adminInsertado FROM @AdminExiste

END
GO
/****** Object:  StoredProcedure [dbo].[InsertarCargo]    Script Date: 10/06/2021 8:45:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************* 
	NOMBRE          :   [InsertarCargo]
	FUNCION         : 	Insertar cargos de la empresa CCOL
	APLICACION      :	Cargo
**************************************************************************************
EXEC [InsertarCargo] 
**************************************************************************************/
CREATE PROCEDURE[dbo].[InsertarCargo]
	@codCargo INT,@nombreCargo VARCHAR(MAX)
AS
BEGIN 


	DECLARE @CargoExiste TABLE(
		ID INT,
		cargoInsertado BIT
	)

	DECLARE @CargoInsertado BIT

IF NOT EXISTS(  SELECT TOP 1 1 FROM Cargo WHERE codCargo = @codCargo )	
	BEGIN

		INSERT INTO Cargo VALUES(@nombreCargo, @codCargo)
		SET @CargoInsertado = 1
	END
ELSE
	BEGIN
		SET @CargoInsertado = 0
	END

	INSERT INTO @CargoExiste VALUES(1, @CargoInsertado)
	
	SELECT ID, cargoInsertado FROM @CargoExiste


END
GO
/****** Object:  StoredProcedure [dbo].[InsertarCiudad]    Script Date: 10/06/2021 8:45:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************* 
	NOMBRE          :   [InsertarCiudad]
	FUNCION         : 	Insertar ciudad de la empresa CCOL
	APLICACION      :	Ciudad
**************************************************************************************
EXEC [InsertarCiudad] 
**************************************************************************************/
CREATE PROCEDURE[dbo].[InsertarCiudad]
	@codCiudad INT,@nombreCiudad VARCHAR(MAX),@nombreDepartamento VARCHAR(MAX)
AS
BEGIN 
	DECLARE @IdDepartamento INT 
	SELECT TOP 1 @IdDepartamento = id FROM Departamento WHERE nombreDepartamento = @nombreDepartamento

	DECLARE @CiudadExiste TABLE(
		ID INT,
		ciudadInsertado BIT
	)

	DECLARE @CiudadInsertado BIT

IF NOT EXISTS(  SELECT TOP 1 1 FROM Ciudad WHERE codigoCiudad = @codCiudad )	
	BEGIN

		INSERT INTO Ciudad VALUES( @codCiudad,@nombreCiudad,@IdDepartamento)
		SET @CiudadInsertado = 1
	END
ELSE
	BEGIN
		SET @CiudadInsertado = 0
	END

	INSERT INTO @CiudadExiste VALUES(1, @CiudadInsertado)
	
	SELECT ID, CiudadInsertado FROM @CiudadExiste


END
GO
/****** Object:  StoredProcedure [dbo].[InsertarCliente]    Script Date: 10/06/2021 8:45:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************* 
	NOMBRE          :   [InsertarCliente]
	FUNCION         : 	Insertar clientes de la empresa CCOL
	APLICACION      :	Cliente
**************************************************************************************
EXEC [InsertarCliente] 
**************************************************************************************/
CREATE PROCEDURE[dbo].[InsertarCliente]
	@nombreCliente VARCHAR(MAX),@telefonoCliente VARCHAR(MAX),@correoCliente VARCHAR(MAX),@rutCliente INT
AS
BEGIN 

	DECLARE @ClienteExiste TABLE(
		ID INT,
		clienteInsertado BIT
	)

	DECLARE @ClienteInsertado BIT

IF NOT EXISTS(  SELECT TOP 1 1 FROM Cliente WHERE rutCliente = @rutCliente )	
	BEGIN

		INSERT INTO Cliente VALUES(@nombreCliente,@telefonoCliente, @correoCliente,@rutCliente)
		SET @ClienteInsertado = 1
	END
ELSE
	BEGIN
		SET @ClienteInsertado = 0
	END

	INSERT INTO @ClienteExiste VALUES(1, @ClienteInsertado)
	
	SELECT ID, clienteInsertado FROM @ClienteExiste


END
GO
/****** Object:  StoredProcedure [dbo].[InsertarDepartamento ]    Script Date: 10/06/2021 8:45:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************* 
	NOMBRE          :   [InsertarDepartamento]
	FUNCION         : 	Insertar departamentos de la empresa CCOL
	APLICACION      :	Departamento
**************************************************************************************
EXEC [InsertarDepartamento] 
**************************************************************************************/
CREATE PROCEDURE[dbo].[InsertarDepartamento ]
	@codDepartamento INT,@nombreDepartamento VARCHAR(MAX),@nombrePais VARCHAR(MAX)
AS
BEGIN 
	DECLARE @IdPais INT 
	SELECT TOP 1 @IdPais = id FROM Pais WHERE nombrePais = @nombrePais

	DECLARE @DepartamentoExiste TABLE(
		ID INT,
		departamentoInsertado BIT
	)

	DECLARE @DepartamentoInsertado BIT

IF NOT EXISTS(  SELECT TOP 1 1 FROM Departamento WHERE codigoDepartamento = @codDepartamento )	
	BEGIN

		INSERT INTO Departamento VALUES( @codDepartamento,@nombreDepartamento,@IdPais)
		SET @DepartamentoInsertado = 1
	END
ELSE
	BEGIN
		SET @DepartamentoInsertado = 0
	END

	INSERT INTO @DepartamentoExiste VALUES(1, @DepartamentoInsertado)
	
	SELECT ID, departamentoInsertado FROM @DepartamentoExiste


END
GO
/****** Object:  StoredProcedure [dbo].[InsertarEstado]    Script Date: 10/06/2021 8:45:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************* 
	NOMBRE          :   [InsertarEstado]
	FUNCION         : 	Insertar estados de la empresa CCOL
	APLICACION      :	Estado
**************************************************************************************
EXEC [InsertarEstado] 
**************************************************************************************/
CREATE PROCEDURE[dbo].[InsertarEstado]
	@codEstado INT,@nombreEstado VARCHAR(MAX)
AS
BEGIN 

	DECLARE @EstadoExiste TABLE(
		ID INT,
		estadoInsertado BIT
	)

	DECLARE @EstadoInsertado BIT

IF NOT EXISTS(  SELECT TOP 1 1 FROM EstadoSerPro WHERE codEstado = @codEstado )	
	BEGIN

		INSERT INTO EstadoSerPro VALUES(@nombreEstado, @codEstado)
		SET @EstadoInsertado = 1
	END
ELSE
	BEGIN
		SET @EstadoInsertado = 0
	END

	INSERT INTO @EstadoExiste VALUES(1, @EstadoInsertado)
	
	
	SELECT ID, estadoInsertado FROM @EstadoExiste


END
GO
/****** Object:  StoredProcedure [dbo].[InsertarGrupo]    Script Date: 10/06/2021 8:45:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************* 
	NOMBRE          :   [InsertarGrupo]
	FUNCION         : 	Insertar grupos de la empresa CCOL
	APLICACION      :	GrupoTrabajo
**************************************************************************************
EXEC [InsertarGrupo] 
**************************************************************************************/
CREATE PROCEDURE[dbo].[InsertarGrupo]
	@codGrupoT INT,@nombreGrupoT VARCHAR(MAX)
AS
BEGIN 


	DECLARE @GrupoExiste TABLE(
		ID INT,
		grupoInsertado BIT
	)

	DECLARE @GrupoInsertado BIT

IF NOT EXISTS(  SELECT TOP 1 1 FROM GrupoTrabajo WHERE codigoGrupoT = @codGrupoT )	
	BEGIN

		INSERT INTO GrupoTrabajo VALUES(@nombreGrupoT, @codGrupoT)
		SET @GrupoInsertado = 1
	END
ELSE
	BEGIN
		SET @GrupoInsertado = 0
	END

	INSERT INTO @GrupoExiste VALUES(1, @GrupoInsertado)

END
GO
/****** Object:  StoredProcedure [dbo].[InsertarLineaT]    Script Date: 10/06/2021 8:45:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************* 
	NOMBRE          :   [InsertarLineaT]
	FUNCION         : 	Insertar linea de la empresa CCOL
	APLICACION      :	LineaTrabajo
**************************************************************************************
EXEC [InsertarLineaT] 
**************************************************************************************/
CREATE PROCEDURE[dbo].[InsertarLineaT]
	@nombreLineaT VARCHAR(MAX)
AS
BEGIN 


	DECLARE @LineaExiste TABLE(
		ID INT,
		lineaInsertado BIT
	)

	DECLARE @LineaInsertado BIT

IF NOT EXISTS(  SELECT TOP 1 1 FROM LineaTrabajo WHERE nombreLineaT = @nombreLineaT )	
	BEGIN

		INSERT INTO LineaTrabajo VALUES(@nombreLineaT)
		SET @LineaInsertado = 1
	END
ELSE
	BEGIN
		SET @LineaInsertado = 0
	END

	INSERT INTO @LineaExiste VALUES(1, @LineaInsertado)
	
	SELECT ID, lineaInsertado FROM @LineaExiste
	




END
GO
/****** Object:  StoredProcedure [dbo].[InsertarPais]    Script Date: 10/06/2021 8:45:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************* 
	NOMBRE          :   [InsertarPais]
	FUNCION         : 	Insertar Pais de la empresa CCOL
	APLICACION      :	Pais
**************************************************************************************
EXEC [InsertarPais] 
**************************************************************************************/
CREATE PROCEDURE[dbo].[InsertarPais]
	@codPais INT,@nombrePais VARCHAR(MAX)
AS
BEGIN 


	DECLARE @PaisExiste TABLE(
		ID INT,
		paisInsertado BIT
	)

	DECLARE @PaisInsertado BIT

IF NOT EXISTS(  SELECT TOP 1 1 FROM Pais WHERE codigoPais = @codPais )	
	BEGIN

		INSERT INTO Pais VALUES( @codPais,@nombrePais)
		SET @PaisInsertado = 1
	END
ELSE
	BEGIN
		SET @PaisInsertado = 0
	END
	INSERT INTO @PaisExiste VALUES(1, @PaisInsertado)
	
	SELECT ID, paisInsertado FROM @PaisExiste


END
GO
/****** Object:  StoredProcedure [dbo].[InsertarRecursoT]    Script Date: 10/06/2021 8:45:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************* 
	NOMBRE          :   [InsertarRecursoT]
	FUNCION         : 	Insertar recursos de la empresa CCOL
	APLICACION      :	Recurso Tecnico
**************************************************************************************
EXEC [InsertarRecursoT] 
**************************************************************************************/
CREATE PROCEDURE[dbo].[InsertarRecursoT]
	@refRecurso VARCHAR (MAX),@tipoRecurso VARCHAR(MAX),@marcaRecurso VARCHAR(MAX),@valorRecurso VARCHAR(MAX),@descripRecurso VARCHAR(MAX)
AS
BEGIN 


	DECLARE @RecursoExiste TABLE(
		ID INT,
		recursoInsertado BIT
	)

	DECLARE @RecursoInsertado BIT

IF NOT EXISTS(  SELECT TOP 1 1 FROM RecursoTecnico WHERE referenciaRecursoT = @refRecurso )	
	BEGIN

		INSERT INTO RecursoTecnico VALUES(@tipoRecurso,@refRecurso,@marcaRecurso,@valorRecurso,@descripRecurso)
		SET @RecursoInsertado = 1
	END
ELSE
	BEGIN
		SET @RecursoInsertado = 0
	END

	INSERT INTO @RecursoExiste VALUES(1, @RecursoInsertado)
	
	SELECT ID, recursoInsertado FROM @RecursoExiste

	
END
GO
/****** Object:  StoredProcedure [dbo].[InsertarUsuario]    Script Date: 10/06/2021 8:45:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************* 
	NOMBRE          :   [InsertarUsuario]
	FUNCION         : 	Insertar Usuarios de la empresa CCOL
	APLICACION      :	Usuario
**************************************************************************************
EXEC [InsertarUsuario] 
**************************************************************************************/
CREATE PROCEDURE[dbo].[InsertarUsuario]
	@codigoUsuario int,
	@correoUsuario varchar(20),
	@contrasenaUsuario varchar(12),
	@cedulaPersona int ,
	@nombrePersona varchar(20),
	@apellidoPersona varchar(20),
	@direccionPersona varchar(20),
	@telefonoPersona int,
	@cargo varchar(max)
AS
BEGIN 

	DECLARE @idCargo int ,
			@idPersona int,
			@UsuarioInsertado BIT

	DECLARE @UsuarioExiste TABLE(
		ID INT,
		usuarioInsertado BIT
	)

	IF NOT EXISTS (SELECT TOP 1 1 FROM Persona WHERE cedulaPersona = @cedulaPersona)
	
		BEGIN 

			INSERT INTO Persona VALUES (@cedulaPersona,@nombrePersona,@apellidoPersona,@direccionPersona,@telefonoPersona)
			
			SELECT TOP 1 @idPersona= id FROM Persona WHERE cedulaPersona = @cedulaPersona

			SELECT TOP 1 @idCargo = ID FROM Cargo WHERE nombreCargo = @cargo

			INSERT INTO Usuario VALUES(@codigoUsuario, @correoUsuario,@contrasenaUsuario, @idCargo, NULL, @idPersona)

			SET @UsuarioInsertado = 1
		END
	ELSE
		BEGIN
			SET @UsuarioInsertado = 0
		END


	INSERT INTO @UsuarioExiste VALUES(1, @UsuarioInsertado)

	SELECT ID, usuarioInsertado FROM @UsuarioExiste

END
GO
/****** Object:  StoredProcedure [dbo].[ModificarAdmin]    Script Date: 10/06/2021 8:45:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************* 
	NOMBRE          :   [ModificarAdmin]
	FUNCION         : 	modificar administrador de la empresa CCOL
	APLICACION      :	Administrador
**************************************************************************************
EXEC [ModificarAdmin] 
**************************************************************************************/
CREATE PROCEDURE[dbo].[ModificarAdmin]
	@codigoAdmin int,
	@correoAdmin varchar(20),
	@contrasenaAdmin varchar(12),
	@cedulaPersona int ,
	@nombrePersona varchar(20),
	@apellidoPersona varchar(20),
	@direccionPersona varchar(20),
	@telefonoPersona int
	
AS
BEGIN

	UPDATE	P
	SET		cedulaPersona = @cedulaPersona,
			nombrePersona=@nombrePersona,
			apellidoPersona=@apellidoPersona,
			direccionPersona=@direccionPersona,
			telefonoPersona=@telefonoPersona
	FROM		Persona P
	INNER JOIN	Administrador A ON A.idPersona = P.id
	WHERE		A.codigoAdmin = @codigoAdmin

	UPDATE  A
	SET		correoAdmin = @correoAdmin
	FROM	Administrador A
	WHERE	A.codigoAdmin = @codigoAdmin
	 
END
GO
/****** Object:  StoredProcedure [dbo].[ModificarCliente]    Script Date: 10/06/2021 8:45:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************* 
	NOMBRE          :   [ModificarCliente]
	FUNCION         : 	modificar clientes de la empresa CCOL
	APLICACION      :	Cliente
**************************************************************************************
EXEC [ModificarCliente] 
**************************************************************************************/
CREATE PROCEDURE[dbo].[ModificarCliente]
	@nombreCliente VARCHAR(MAX),
	@telefonoCliente VARCHAR(MAX),
	@correoCliente VARCHAR(MAX),
	@rutCliente VARCHAR(MAX)

AS
BEGIN

	
	UPDATE  C
	SET		nombreCliente = @nombreCliente,
			telefonoCliente=@telefonoCliente,
			correoCliente=@correoCliente

	FROM	Cliente C
	WHERE	C.rutCliente = @rutCliente
END
GO
/****** Object:  StoredProcedure [dbo].[ModificarRecursoT]    Script Date: 10/06/2021 8:45:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************* 
	NOMBRE          :   [ModificarRecursoT]
	FUNCION         : 	modificar recursode la empresa CCOL
	APLICACION      :	RecursoTecnico
**************************************************************************************
EXEC [ModificarRecursoT] 
**************************************************************************************/
CREATE PROCEDURE[dbo].[ModificarRecursoT]
	@tipoRecurso VARCHAR(MAX),
	@referenciaRecurso VARCHAR(MAX),
	@marcaRecurso VARCHAR(MAX),
	@valorRecurso VARCHAR(MAX),
	@descripRecurso VARCHAR(MAX)

AS
BEGIN

	
	UPDATE  R
	SET		tipoRecursoT = @tipoRecurso,
			referenciaRecursoT = @referenciaRecurso ,
			marcaRecursoT =	@marcaRecurso ,
			valorRecursoT =	@valorRecurso ,
			descripRecursoT =@descripRecurso 

	FROM	RecursoTecnico R
	WHERE	R.referenciaRecursoT = @referenciaRecurso
END
GO
/****** Object:  StoredProcedure [dbo].[ModificarUsuario]    Script Date: 10/06/2021 8:45:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************* 
	NOMBRE          :   [ModificarUsuario]
	FUNCION         : 	modificar usuarios de la empresa CCOL
	APLICACION      :	Usuario
**************************************************************************************
EXEC [ModificarUsuario] 
**************************************************************************************/
CREATE PROCEDURE[dbo].[ModificarUsuario]
	@codigoUsuario int,
	@correoUsuario varchar(20),
	@contrasenaUsuario varchar(12),
	@cedulaPersona int ,
	@nombrePersona varchar(20),
	@apellidoPersona varchar(20),
	@direccionPersona varchar(20),
	@telefonoPersona int,
	@cargo varchar(max)

AS
BEGIN

	UPDATE	P
	SET		cedulaPersona = @cedulaPersona,
			nombrePersona=@nombrePersona,
			apellidoPersona=@apellidoPersona,
			direccionPersona=@direccionPersona,
			telefonoPersona=@telefonoPersona
	FROM		Persona P
	INNER JOIN	Usuario U ON U.idPersona = P.id
	WHERE		U.codigoUsuario = @codigoUsuario

	UPDATE  U
	SET		correoUsuario = @correoUsuario
	FROM	Usuario U
	WHERE	U.codigoUsuario = @codigoUsuario
	 
END
GO
USE [master]
GO
ALTER DATABASE [CCOLPROYECTOS] SET  READ_WRITE 
GO
