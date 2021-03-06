USE [master]
GO
/****** Object:  Database [PARQUEASIS]    Script Date: 22/08/2021 20:54:06 ******/
CREATE DATABASE [PARQUEASIS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PARQUEASIS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PARQUEASIS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PARQUEASIS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PARQUEASIS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PARQUEASIS] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PARQUEASIS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PARQUEASIS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PARQUEASIS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PARQUEASIS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PARQUEASIS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PARQUEASIS] SET ARITHABORT OFF 
GO
ALTER DATABASE [PARQUEASIS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PARQUEASIS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PARQUEASIS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PARQUEASIS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PARQUEASIS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PARQUEASIS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PARQUEASIS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PARQUEASIS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PARQUEASIS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PARQUEASIS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PARQUEASIS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PARQUEASIS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PARQUEASIS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PARQUEASIS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PARQUEASIS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PARQUEASIS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PARQUEASIS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PARQUEASIS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PARQUEASIS] SET  MULTI_USER 
GO
ALTER DATABASE [PARQUEASIS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PARQUEASIS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PARQUEASIS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PARQUEASIS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PARQUEASIS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PARQUEASIS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PARQUEASIS] SET QUERY_STORE = OFF
GO
USE [PARQUEASIS]
GO
/****** Object:  User [usr_parqueasis]    Script Date: 22/08/2021 20:54:06 ******/
CREATE USER [usr_parqueasis] FOR LOGIN [usr_parqueasis] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [usr_parqueasis]
GO
/****** Object:  Table [dbo].[CONTRATO]    Script Date: 22/08/2021 20:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONTRATO](
	[ID_CONTRATO] [int] NOT NULL,
	[ID_PERSONA] [int] NOT NULL,
	[ID_PARQUEADERO] [int] NOT NULL,
	[ID_ESTADO] [int] NOT NULL,
	[FECHA_INICIO_CONTRATO] [date] NOT NULL,
	[FECHA_FIN_CONTRATO] [date] NOT NULL,
 CONSTRAINT [PK_CONTRATO] PRIMARY KEY CLUSTERED 
(
	[ID_CONTRATO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ESTADO]    Script Date: 22/08/2021 20:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ESTADO](
	[ID_ESTADO] [int] IDENTITY(1,1) NOT NULL,
	[DESCRIPCION] [varchar](20) NULL,
 CONSTRAINT [PK_ESTADO] PRIMARY KEY CLUSTERED 
(
	[ID_ESTADO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PARQUEADERO]    Script Date: 22/08/2021 20:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PARQUEADERO](
	[ID_PARQUEADERO] [int] IDENTITY(1,1) NOT NULL,
	[EN_USO] [bit] NOT NULL,
 CONSTRAINT [PK_PARQUEADERO] PRIMARY KEY CLUSTERED 
(
	[ID_PARQUEADERO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERSONA]    Script Date: 22/08/2021 20:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERSONA](
	[ID_PERSONA] [int] IDENTITY(1,1) NOT NULL,
	[IDENTIFICACION] [varchar](13) NOT NULL,
	[NOMBRES] [varchar](100) NULL,
	[ESTADO] [bit] NOT NULL,
 CONSTRAINT [PK_PERSONA] PRIMARY KEY CLUSTERED 
(
	[ID_PERSONA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PARQUEADERO] ADD  DEFAULT ((0)) FOR [EN_USO]
GO
ALTER TABLE [dbo].[PERSONA] ADD  DEFAULT ((1)) FOR [ESTADO]
GO
ALTER TABLE [dbo].[CONTRATO]  WITH CHECK ADD  CONSTRAINT [FK_CONTRATO_ESTADO] FOREIGN KEY([ID_ESTADO])
REFERENCES [dbo].[ESTADO] ([ID_ESTADO])
GO
ALTER TABLE [dbo].[CONTRATO] CHECK CONSTRAINT [FK_CONTRATO_ESTADO]
GO
ALTER TABLE [dbo].[CONTRATO]  WITH CHECK ADD  CONSTRAINT [FK_CONTRATO_PARQUEADERO] FOREIGN KEY([ID_PARQUEADERO])
REFERENCES [dbo].[PARQUEADERO] ([ID_PARQUEADERO])
GO
ALTER TABLE [dbo].[CONTRATO] CHECK CONSTRAINT [FK_CONTRATO_PARQUEADERO]
GO
ALTER TABLE [dbo].[CONTRATO]  WITH CHECK ADD  CONSTRAINT [FK_CONTRATO_PERSONA] FOREIGN KEY([ID_PERSONA])
REFERENCES [dbo].[PERSONA] ([ID_PERSONA])
GO
ALTER TABLE [dbo].[CONTRATO] CHECK CONSTRAINT [FK_CONTRATO_PERSONA]
GO
/****** Object:  StoredProcedure [dbo].[PRO_ACTUALIZA_PERSONA]    Script Date: 22/08/2021 20:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PRO_ACTUALIZA_PERSONA]
(
 @ID_PERSONA INT,
 @IDENTIFICACION VARCHAR(13),
 @NOMBRES VARCHAR(100),
 @ESTADO BIT,
 @CODIGO_ERROR INT OUTPUT,
 @DESCRIPCION_ERROR VARCHAR(50) OUTPUT
)
AS
BEGIN

	SET @CODIGO_ERROR = 0;
	SET @DESCRIPCION_ERROR = 'PROCESO OK';

	IF EXISTS (SELECT COUNT(1) FROM PERSONA WHERE ID_PERSONA = @ID_PERSONA)
	BEGIN
		UPDATE PERSONA
		SET IDENTIFICACION = @IDENTIFICACION,
			NOMBRES = @NOMBRES,
			ESTADO = @ESTADO
		WHERE ID_PERSONA = @ID_PERSONA;

		IF @@ERROR <> 0
		BEGIN
			SET @CODIGO_ERROR = @@ERROR;
			SET @DESCRIPCION_ERROR = 'PROCESO OK';
		END
	END
	ELSE
	BEGIN
		SET @CODIGO_ERROR = -1;
		SET @DESCRIPCION_ERROR = 'PERSONA NO EXISTE';
	END
END
GO
/****** Object:  StoredProcedure [dbo].[PRO_CONSULTA_PERSONA]    Script Date: 22/08/2021 20:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PRO_CONSULTA_PERSONA]
(
 @ACCION VARCHAR(10),
 @ID_PERSONA INT
)
AS
BEGIN

	IF @ACCION = 'TODOS'
	BEGIN
		SELECT ID_PERSONA,
			   IDENTIFICACION,
			   NOMBRES,
			   ESTADO
		FROM PERSONA
	END

	IF @ACCION = 'UNICO'
	BEGIN
		SELECT ID_PERSONA,
			   IDENTIFICACION,
			   NOMBRES,
			   ESTADO
		FROM PERSONA
		WHERE ID_PERSONA = @ID_PERSONA;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[PRO_INSERTA_PERSONA]    Script Date: 22/08/2021 20:54:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PRO_INSERTA_PERSONA]
(
 @IDENTIFICACION VARCHAR(13),
 @NOMBRES VARCHAR(100),
 @CODIGO_ERROR INT OUTPUT,
 @DESCRIPCION_ERROR VARCHAR(50) OUTPUT
)
AS
BEGIN

	SET @CODIGO_ERROR = 0;
	SET @DESCRIPCION_ERROR = 'PROCESO OK';

	IF NOT EXISTS (SELECT * FROM PERSONA WHERE IDENTIFICACION = @IDENTIFICACION AND ESTADO = 1)
	BEGIN
		INSERT INTO PERSONA
		(
			IDENTIFICACION,
			NOMBRES
		)
		VALUES
		(
			@IDENTIFICACION,
			@NOMBRES
		);

		IF @@ERROR <> 0
		BEGIN
			SET @CODIGO_ERROR = @@ERROR;
			SET @DESCRIPCION_ERROR = 'ERROR AL INSERTAR PERSONA';
		END
	END
	ELSE
	BEGIN
		SET @CODIGO_ERROR = 99;
		SET @DESCRIPCION_ERROR = 'PERSONA YA EXISTE';
	END
END
GO
USE [master]
GO
ALTER DATABASE [PARQUEASIS] SET  READ_WRITE 
GO
