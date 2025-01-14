USE [master]
GO
/****** Object:  Database [MedLife]    Script Date: 22/11/2024 12:11:21 ******/
CREATE DATABASE [MedLife]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MedLife', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MedLife.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MedLife_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MedLife_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MedLife] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MedLife].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MedLife] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MedLife] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MedLife] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MedLife] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MedLife] SET ARITHABORT OFF 
GO
ALTER DATABASE [MedLife] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MedLife] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MedLife] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MedLife] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MedLife] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MedLife] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MedLife] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MedLife] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MedLife] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MedLife] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MedLife] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MedLife] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MedLife] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MedLife] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MedLife] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MedLife] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MedLife] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MedLife] SET RECOVERY FULL 
GO
ALTER DATABASE [MedLife] SET  MULTI_USER 
GO
ALTER DATABASE [MedLife] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MedLife] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MedLife] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MedLife] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MedLife] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MedLife', N'ON'
GO
ALTER DATABASE [MedLife] SET QUERY_STORE = OFF
GO
USE [MedLife]
GO
/****** Object:  User [alumno]    Script Date: 22/11/2024 12:11:21 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Hospital]    Script Date: 22/11/2024 12:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospital](
	[IdHospital] [int] IDENTITY(1,1) NOT NULL,
	[NombreHospital] [varchar](1000) NOT NULL,
	[Email1] [varchar](1000) NOT NULL,
	[Email2] [varchar](1000) NULL,
	[Email3] [varchar](1000) NULL,
	[Email4] [varchar](1000) NULL,
	[Email5] [varchar](1000) NULL,
	[Referente1] [varchar](1000) NOT NULL,
	[Referente2] [varchar](1000) NULL,
	[Referente3] [varchar](1000) NULL,
	[Referente4] [varchar](1000) NULL,
	[Referente5] [varchar](1000) NULL,
	[Tel1] [bigint] NOT NULL,
	[Tel2] [bigint] NULL,
	[Tel3] [bigint] NULL,
	[Tel4] [bigint] NULL,
	[Tel5] [bigint] NULL,
	[Direccion] [varchar](1000) NOT NULL,
	[Localidad] [varchar](1000) NOT NULL,
	[Provincia] [varchar](1000) NOT NULL,
	[Telefono] [bigint] NOT NULL,
	[Responsable] [varchar](1000) NOT NULL,
	[Servicio] [varchar](1000) NOT NULL,
 CONSTRAINT [PK_Hospital] PRIMARY KEY CLUSTERED 
(
	[IdHospital] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Muestra]    Script Date: 22/11/2024 12:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Muestra](
	[IdMuestra] [int] IDENTITY(1,1) NOT NULL,
	[IdResultado] [int] NULL,
	[InstitucionNacimiento] [varchar](1000) NULL,
	[IdHospitalMuestra] [int] NULL,
	[ApellidoBebe] [varchar](1000) NULL,
	[NombreBebe] [varchar](1000) NULL,
	[FechaHoraNacimiento] [datetime] NULL,
	[FechaHoraExtraccion] [datetime] NULL,
	[Sexo] [varchar](1000) NULL,
	[Alimentacion] [varchar](1000) NULL,
	[FechaIngestaLeche] [datetime] NULL,
	[SemanasGestacion] [int] NULL,
	[Peso] [int] NULL,
	[CondicionRN] [varchar](1000) NULL,
	[PatologiaBase] [varchar](1000) NULL,
	[Patologia] [varchar](1000) NULL,
	[Parto] [varchar](1000) NULL,
	[EmbarazoMultiple] [bit] NULL,
	[EmbarazoGemelar] [bit] NULL,
	[ApellidoMama] [varchar](1000) NULL,
	[NombreMama] [varchar](1000) NULL,
	[Documento] [int] NULL,
	[Domicilio] [varchar](1000) NULL,
	[Localidad] [varchar](1000) NULL,
	[Telefono] [int] NULL,
	[LugarControlEmbarazo] [varchar](1000) NULL,
	[Antibioticos] [bit] NULL,
	[DesinfectantesYodados] [bit] NULL,
	[Transfusion] [bit] NULL,
	[FechaTransfusion] [datetime] NULL,
	[Dopamina] [bit] NULL,
	[Dobutamina] [bit] NULL,
	[CorticoidesMadre] [bit] NULL,
	[CorticoidesBebe] [bit] NULL,
	[Tiroidepatias] [bit] NULL,
	[Otras] [varchar](1000) NULL,
	[RepiteMuestra] [bit] NULL,
	[Prematuro] [bit] NULL,
	[MalaMuestra] [bit] NULL,
	[ResultadoAlterado] [bit] NULL,
	[Analitico] [bit] NULL,
	[Responsable] [varchar](1000) NULL,
	[RolResponsable] [varchar](1000) NULL,
	[FirmaSello] [varchar](1000) NULL,
	[FechaEnvio] [datetime] NULL,
	[FechaLlegada] [datetime] NULL,
	[Observaciones] [varchar](1000) NULL,
 CONSTRAINT [PK_Muestra] PRIMARY KEY CLUSTERED 
(
	[IdMuestra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MuestraResultado]    Script Date: 22/11/2024 12:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MuestraResultado](
	[IdResultado] [int] IDENTITY(1,1) NOT NULL,
	[IdMuestra] [int] NOT NULL,
	[TshNeonatal] [varchar](1000) NULL,
	[MetodologiaTsh] [varchar](1000) NULL,
	[Fenilanina] [varchar](1000) NULL,
	[MetodologiaFenilanina] [varchar](1000) NULL,
	[IrtNeonatal] [varchar](1000) NULL,
	[MetodologiaIrt] [varchar](1000) NULL,
	[Galactosa] [varchar](1000) NULL,
	[MetodologiaGalactosa] [varchar](1000) NULL,
	[Hidroxiprogesterona] [varchar](1000) NULL,
	[MetodologiaHidro] [varchar](1000) NULL,
	[Biotinidasa] [varchar](1000) NULL,
	[MetodologiaBiotinidasa] [varchar](1000) NULL,
	[NormalidadTsh] [varchar](1000) NULL,
	[NormalidadFenilanina] [varchar](1000) NULL,
	[NormalidadIrt] [varchar](1000) NULL,
	[NormalidadGalactosa] [varchar](1000) NULL,
	[NormalidadHidro] [varchar](1000) NULL,
	[NormalidadBiotinidasa] [varchar](1000) NULL,
	[Observaciones] [varchar](1000) NULL,
 CONSTRAINT [PK_MuestraResultado] PRIMARY KEY CLUSTERED 
(
	[IdResultado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 22/11/2024 12:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[IdPaciente] [int] IDENTITY(1,1) NOT NULL,
	[IdMuestra] [int] NOT NULL,
	[Acta] [int] NOT NULL,
	[Hc] [int] NULL,
	[IdGarrahan] [int] NULL,
	[FechaLlegada] [datetime] NULL,
	[FechaEnvio] [datetime] NULL,
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
(
	[IdPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perfil]    Script Date: 22/11/2024 12:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfil](
	[IdPerfil] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](1000) NOT NULL,
	[Apellido] [varchar](1000) NOT NULL,
	[Email] [varchar](1000) NOT NULL,
	[Telefono] [int] NOT NULL,
	[IdHospital] [int] NOT NULL,
	[LecturaPermiso] [bit] NOT NULL,
	[EdicionPermiso] [bit] NOT NULL,
	[ImpresionPermiso] [bit] NOT NULL,
	[Contrasena] [varchar](15) NOT NULL,
	[MantenerActivo] [bit] NULL,
 CONSTRAINT [PK_Perfil] PRIMARY KEY CLUSTERED 
(
	[IdPerfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Hospital] ON 

INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (1, N'Italiano', N'Garrahan', NULL, NULL, NULL, NULL, N'Gustavo', NULL, NULL, NULL, NULL, 12345678, NULL, NULL, NULL, NULL, N'forro 200', N'caba', N'buenos aires', 12345678, N'Gustavo', N'Pediatria')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (2, N'Hospital Allen "Dr. Ernesto Accame"', N'TAURO_53@YAHOO.COM.AR', N'MORDIL@SPEEDY.COM.AR', NULL, NULL, NULL, N'DR Hugo Niz (Medico Pediatra)', N'Bioq Alejandro Moretti', NULL, NULL, NULL, 2941452530, NULL, NULL, NULL, NULL, N'Ing. Quesnel s/n', N'Allen', N'Río Negro', 2941452530, N'Lic. Patricia Osses', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (3, N'Hospital Zonal Bariloche "Ramon Carrillo"', N'NEO@HOSPITALBARILOCHE.COM.AR', N'HOSPITAL@BARILOCHE.COM.AR', NULL, NULL, NULL, N'Dra. Fabiana Herbon', N'Dra. Adriana Ranieri', NULL, NULL, NULL, 2944426117, 29442426100, NULL, NULL, NULL, N'Moreno 601', N'San Carlos de Bariloche', N'Río Negro', 2944426117, N'Dra. Graciela Tapia Massini', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (4, N'Clínica Beccar', N'CLINICABECCAR@YAHOO.COM.AR', N'PLANOFABIAN@YAHOO.COM.AR', NULL, NULL, NULL, N'Dr. Plano', NULL, NULL, NULL, NULL, 47476381, 47430396, 47422509, NULL, NULL, N'Julian Navarro 48', N'Beccar', N'Buenos Aires', 47476381, N'Enfermera Soledad Lugo', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (5, N'Hospital Provincial Neuquén', N'HOSPITALPNNQN@YAHOO.COM.AR', NULL, NULL, NULL, NULL, N'Dr. Mario Alcorta', NULL, NULL, NULL, NULL, 2994454610, NULL, NULL, NULL, NULL, N'Buenos Aires 700', N'Neuquén', N'Neuquén', 2994454610, N'Bioq. Liliana Guerrero', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (6, N'Clínica Modelo S.A', N'INFO@CLINICAMODELO.COM.AR', N'ADMISION@CLINICAMODELO.COM.AR', NULL, NULL, NULL, N'Dr. Cimadevilla, Jorge D', N'Dr. Pucheu, Hugo L', NULL, NULL, NULL, 2494387500, 2494387587, NULL, NULL, NULL, N'Vélez Sarsfield 55', N'Luján', N'Buenos Aires', 2494387500, N'Ing. Juan Domínguez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (7, N'Sanatorio San Carlos', N'SANATORIOSANCARLOS@HOTMAIL.COM.AR', N'SANATORIOSANCARLOS@HOTMAIL.COM.AR', NULL, NULL, NULL, N'Dr. Pedro Rodriguez', NULL, NULL, NULL, NULL, 2926442601, NULL, NULL, NULL, NULL, N'Belgrano 525', N'San Carlos de Bariloche', N'Río Negro', 2926442601, N'Dr. Pedro Rodriguez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (8, N'Hospital Zonal Esquel', N'DIRECCION@HOSPITALESQUEL.COM.AR', N'SAMIC@HOSPITALESQUEL.COM.AR', NULL, NULL, NULL, N'Dra. Viviana Bettini', N'Dra. Claudia Linares', NULL, NULL, NULL, 2945453033, 2945453021, NULL, NULL, NULL, N'Calle Primo Capraro', N'Esquel', N'Chubut', 2945453033, N'Dr. Miguel Huenupan', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (9, N'HOSPITALZONAL@MADRYN.ORG.AR', N'NEUROZONAMADRYN@YAHOO.COM.AR', N'CGONZALEZ@MADRYN.ORG.AR', NULL, NULL, NULL, N'Dr. Pedro Carranza', N'Lic. Mónica Nuñez', NULL, NULL, NULL, 2804479301, 2804479301, NULL, NULL, NULL, N'Avenida Gales 1466', N'Puerto Madryn', N'Chubut', 2804479301, N'Dr. Pedro Carranza', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (10, N'Sanatorio del Sol', N'INFO@SANATORIODELSOL.COM.AR', N'SANATORIODELSOL@YAHOO.COM.AR', NULL, NULL, NULL, N'Dr. Gustavo Piscicelli', N'Dr. Alejandro Pardo', NULL, NULL, NULL, 2615068111, 2614311111, NULL, NULL, NULL, N'Chacras de Coria', N'Luján de Cuyo', N'Mendoza', 2615068111, N'Dr. Gustavo Piscicelli', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (11, N'Hospital Británico', N'INFO@HOSPITALBRITANICO.ORG.AR', N'DIRECCIONDEMAIL1@HOSPITALBRITANICO.ORG.AR', NULL, NULL, NULL, N'Dr. Federico Pérez', N'Dr. Marcos Villar', NULL, NULL, NULL, 1148117000, 1148117222, NULL, NULL, NULL, N'Perdriel 74', N'Buenos Aires', N'Buenos Aires', 1148117000, N'Lic. María Soler', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (12, N'Hospital Italiano', N'INFO@HOSPITALITALIANO.ORG.AR', N'CONTACTO@HOSPITALITALIANO.ORG.AR', NULL, NULL, NULL, N'Dr. Ricardo Peralta', N'Dr. Lucas Martínez', NULL, NULL, NULL, 1154635000, 1154635000, NULL, NULL, NULL, N'Gascón 450', N'Buenos Aires', N'Buenos Aires', 1154635000, N'Lic. Laura Fernández', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (13, N'Sanatorio Güemes', N'INFO@SANATORIOGUEMES.COM.AR', N'CONTACTO@SANATORIOGUEMES.COM.AR', NULL, NULL, NULL, N'Dr. Carlos Martínez', N'Dr. Pablo Gómez', NULL, NULL, NULL, 3814505000, 3814505123, NULL, NULL, NULL, N'Av. Entre Ríos 450', N'San Miguel de Tucumán', N'Tucumán', 3814505000, N'Dr. Carlos Martínez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (14, N'Sanatorio Allende', N'CONTACTO@SANATORIOALLENDE.COM.AR', N'INFO@SANATORIOALLENDE.COM.AR', NULL, NULL, NULL, N'Dr. Martín Soto', N'Dr. Laura Romero', NULL, NULL, NULL, 3514689400, 3514689401, NULL, NULL, NULL, N'Mariano Larra 345', N'Córdoba', N'Córdoba', 3514689400, N'Dr. Martín Soto', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (15, N'Clínica del Sol', N'INFO@CLINICADELSOL.COM.AR', N'CLINICADELSOL@YAHOO.COM.AR', NULL, NULL, NULL, N'Dr. Eduardo García', N'Dr. Marcos Sánchez', NULL, NULL, NULL, 2615008000, 2615008111, NULL, NULL, NULL, N'Av. Colón 827', N'Mendoza', N'Mendoza', 2615008000, N'Dr. Eduardo García', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (16, N'Hospital Privado de Córdoba', N'INFO@HOSPITALPRIVADO.COM.AR', N'INFO@HOSPITALPRIVADO.COM.AR', NULL, NULL, NULL, N'Dr. Marcelo Quirós', N'Dr. José Gómez', NULL, NULL, NULL, 3514688200, 3514688201, NULL, NULL, NULL, N'Avenida Naciones Unidas 346', N'Córdoba', N'Córdoba', 3514688200, N'Dr. Marcelo Quirós', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (17, N'Sanatorio de la Trinidad', N'INFO@SANATORIOTRINIDAD.COM.AR', N'CONTACTO@SANATORIOTRINIDAD.COM.AR', NULL, NULL, NULL, N'Dr. Andrés López', N'Dr. Santiago Pérez', NULL, NULL, NULL, 1158002500, 1158002600, NULL, NULL, NULL, N'Mitre 2020', N'Buenos Aires', N'Buenos Aires', 1158002500, N'Dr. Andrés López', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (18, N'Hospital Alemán', N'INFO@HOSPITALALEMAN.COM.AR', N'CONTACTO@HOSPITALALEMAN.COM.AR', NULL, NULL, NULL, N'Dr. Santiago Olivera', N'Dr. Martín González', NULL, NULL, NULL, 1143758200, 1143758201, NULL, NULL, NULL, N'Av. Pueyrredón 1640', N'Buenos Aires', N'Buenos Aires', 1143758200, N'Dr. Santiago Olivera', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (19, N'Hospital Español', N'INFO@HOSPITALESPAÑOL.COM.AR', N'CONTACTO@HOSPITALESPAÑOL.COM.AR', NULL, NULL, NULL, N'Dr. Enrique Sánchez', N'Dr. Pablo Ramírez', NULL, NULL, NULL, 1154509500, 1154509501, NULL, NULL, NULL, N'Av. Belgrano 2710', N'Buenos Aires', N'Buenos Aires', 1154509500, N'Dr. Enrique Sánchez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (20, N'Hospital Italiano de Rosario', N'INFO@HOSPITALITALIANOROSARIO.ORG.AR', N'CONTACTO@HOSPITALITALIANOROSARIO.ORG.AR', NULL, NULL, NULL, N'Dr. Alberto López', N'Dr. María González', NULL, NULL, NULL, 3414994400, 3414994401, NULL, NULL, NULL, N'Bv. Oroño 450', N'Rosario', N'Santa Fe', 3414994400, N'Dr. Alberto López', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (21, N'Sanatorio Güemes', N'INFO@SANATORIOGUEMES.COM.AR', N'CONTACTO@SANATORIOGUEMES.COM.AR', NULL, NULL, NULL, N'Dr. Carlos Martínez', N'Dr. Pablo Gómez', NULL, NULL, NULL, 3814505000, 3814505123, NULL, NULL, NULL, N'Av. Entre Ríos 450', N'San Miguel de Tucumán', N'Tucumán', 3814505000, N'Dr. Carlos Martínez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (22, N'Hospital Universitario Austral', N'INFO@HUA.ORG.AR', N'CONTACTO@HUA.ORG.AR', NULL, NULL, NULL, N'Dr. Juan López', N'Dr. María García', NULL, NULL, NULL, 2304488000, 2304488111, NULL, NULL, NULL, N'Av. Perón 1500', N'Pilar', N'Buenos Aires', 2304488000, N'Dr. Juan López', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (23, N'Hospital El Cruce', N'INFO@HOSPITALELCRUCE.ORG.AR', N'CONTACTO@HOSPITALELCRUCE.ORG.AR', NULL, NULL, NULL, N'Dr. Martín Sánchez', N'Dr. Laura Pérez', NULL, NULL, NULL, 1168178000, 1168178111, NULL, NULL, NULL, N'Camino de Cintura y Mariano Acosta', N'Florencio Varela', N'Buenos Aires', 1168178000, N'Dr. Martín Sánchez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (24, N'Hospital Italiano de Buenos Aires', N'INFO@HIBA.ORG.AR', N'CONTACTO@HIBA.ORG.AR', NULL, NULL, NULL, N'Dr. Eduardo Fernández', N'Dr. Ana López', NULL, NULL, NULL, 1145309000, 1145309111, NULL, NULL, NULL, N'Juan D. Perón 4190', N'Buenos Aires', N'Buenos Aires', 1145309000, N'Dr. Eduardo Fernández', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (25, N'Hospital de Clínicas José de San Martín', N'INFO@HOSPITALDECLINICAS.UBA.AR', N'CONTACTO@HOSPITALDECLINICAS.UBA.AR', NULL, NULL, NULL, N'Dr. Alejandro López', N'Dr. María Rodríguez', NULL, NULL, NULL, 1145928000, 1145928111, NULL, NULL, NULL, N'Av. Córdoba 2351', N'Buenos Aires', N'Buenos Aires', 1145928000, N'Dr. Alejandro López', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (26, N'Hospital de Niños Ricardo Gutiérrez', N'INFO@HNRG.ORG.AR', N'CONTACTO@HNRG.ORG.AR', NULL, NULL, NULL, N'Dr. Carlos Sánchez', N'Dr. Laura Martínez', NULL, NULL, NULL, 1143017000, 1143017111, NULL, NULL, NULL, N'Gallo 1330', N'Buenos Aires', N'Buenos Aires', 1143017000, N'Dr. Carlos Sánchez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (27, N'Hospital Posadas', N'INFO@HOSPITALPOSADAS.GOB.AR', N'CONTACTO@HOSPITALPOSADAS.GOB.AR', NULL, NULL, NULL, N'Dr. Juan Pérez', N'Dr. María Rodríguez', NULL, NULL, NULL, 1146620200, 1146620300, NULL, NULL, NULL, N'Av. Presidente Illia s/n', N'El Palomar', N'Buenos Aires', 1146620200, N'Dr. Juan Pérez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (28, N'Hospital Ramos Mejía', N'INFO@HOSPITALRAMOSMEJIA.BA.GOV.AR', N'CONTACTO@HOSPITALRAMOSMEJIA.BA.GOV.AR', NULL, NULL, NULL, N'Dr. Martín Fernández', N'Dr. Laura Martínez', NULL, NULL, NULL, 1144339500, 1144339600, NULL, NULL, NULL, N'Urquiza 609', N'Buenos Aires', N'Buenos Aires', 1144339500, N'Dr. Martín Fernández', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (29, N'Hospital Italiano de La Plata', N'INFO@HOSPITALITALIANOLP.ORG.AR', N'CONTACTO@HOSPITALITALIANOLP.ORG.AR', NULL, NULL, NULL, N'Dr. Marcos Pérez', N'Dr. Sofía Gómez', NULL, NULL, NULL, 2216105000, 2216105111, NULL, NULL, NULL, N'Calle 51 Nº 320', N'La Plata', N'Buenos Aires', 2216105000, N'Dr. Marcos Pérez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (30, N'Hospital de Pediatría Prof. Dr. Juan P. Garrahan', N'INFO@HOSPITALGARRAHAN.GOV.AR', N'CONTACTO@HOSPITALGARRAHAN.GOV.AR', NULL, NULL, NULL, N'Dr. Sebastián Pérez', N'Dr. Ana López', NULL, NULL, NULL, 1143005400, 1143005411, NULL, NULL, NULL, N'Combate de los Pozos 1881', N'Buenos Aires', N'Buenos Aires', 1143005400, N'Dr. Sebastián Pérez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (31, N'Hospital Privado de Rosario', N'INFO@HOSPITALPRIVADOROSARIO.COM.AR', N'CONTACTO@HOSPITALPRIVADOROSARIO.COM.AR', NULL, NULL, NULL, N'Dr. Juan Martínez', N'Dr. María Rodríguez', NULL, NULL, NULL, 3414486700, 3414486711, NULL, NULL, NULL, N'Urquiza 3101', N'Rosario', N'Santa Fe', 3414486700, N'Dr. Juan Martínez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (32, N'Hospital Privado de Rosario', N'INFO@HOSPITALPRIVADOROSARIO.COM.AR', N'CONTACTO@HOSPITALPRIVADOROSARIO.COM.AR', NULL, NULL, NULL, N'Dr. Juan Martínez', N'Dr. María Rodríguez', NULL, NULL, NULL, 3414486700, 3414486711, NULL, NULL, NULL, N'Urquiza 3101', N'Rosario', N'Santa Fe', 3414486700, N'Dr. Juan Martínez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (33, N'Hospital Italiano de Mendoza', N'INFO@HOSPITALITALIANOMZA.ORG.AR', N'CONTACTO@HOSPITALITALIANOMZA.ORG.AR', NULL, NULL, NULL, N'Dr. Marcos Gutiérrez', N'Dra. Laura Pérez', NULL, NULL, NULL, 2614478900, 2614478911, NULL, NULL, NULL, N'Patricias Mendocinas 1550', N'Mendoza', N'Mendoza', 2614478900, N'Dr. Marcos Gutiérrez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (34, N'Hospital Italiano de Bahía Blanca', N'INFO@HOSPITALITALIANOBB.ORG.AR', N'CONTACTO@HOSPITALITALIANOBB.ORG.AR', NULL, NULL, NULL, N'Dr. Juan Sánchez', N'Dra. Ana Martínez', NULL, NULL, NULL, 2914567800, 2914567811, NULL, NULL, NULL, N'Donado 401', N'Bahía Blanca', N'Buenos Aires', 2914567800, N'Dr. Juan Sánchez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (35, N'Sanatorio Allende', N'INFO@SANATORIOALLENDE.COM.AR', N'CONTACTO@SANATORIOALLENDE.COM.AR', NULL, NULL, NULL, N'Dr. José Martínez', N'Dra. María Sánchez', NULL, NULL, NULL, 3514009000, 3514009111, NULL, NULL, NULL, N'Humberto Primo 1200', N'Córdoba', N'Córdoba', 3514009000, N'Dr. José Martínez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (36, N'Sanatorio Güemes', N'INFO@SANATORIOGUEMES.COM.AR', N'CONTACTO@SANATORIOGUEMES.COM.AR', NULL, NULL, NULL, N'Dr. Carlos Martínez', N'Dr. Pablo Gómez', NULL, NULL, NULL, 3814505000, 3814505123, NULL, NULL, NULL, N'Av. Entre Ríos 450', N'San Miguel de Tucumán', N'Tucumán', 3814505000, N'Dr. Carlos Martínez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (37, N'Clínica Santa Isabel', N'INFO@CLINICASANTAISABEL.COM.AR', N'CONTACTO@CLINICASANTAISABEL.COM.AR', NULL, NULL, NULL, N'Dr. Juan Pérez', N'Dra. Laura Sánchez', NULL, NULL, NULL, 3874628700, 3874628711, NULL, NULL, NULL, N'San Martín 1350', N'Salta', N'Salta', 3874628700, N'Dr. Juan Pérez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (38, N'Sanatorio Otamendi y Miroli', N'INFO@OTAMENDI.COM.AR', N'CONTACTO@OTAMENDI.COM.AR', NULL, NULL, NULL, N'Dr. Federico López', N'Dra. Ana Martínez', NULL, NULL, NULL, 1143084000, 1143084111, NULL, NULL, NULL, N'Azcuénaga 870', N'Buenos Aires', N'Buenos Aires', 1143084000, N'Dr. Federico López', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (39, N'Sanatorio Güemes', N'INFO@SANATORIOGUEMES.COM.AR', N'CONTACTO@SANATORIOGUEMES.COM.AR', NULL, NULL, NULL, N'Dr. Carlos Martínez', N'Dr. Pablo Gómez', NULL, NULL, NULL, 3814505000, 3814505123, NULL, NULL, NULL, N'Av. Entre Ríos 450', N'San Miguel de Tucumán', N'Tucumán', 3814505000, N'Dr. Carlos Martínez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (40, N'Sanatorio Mater Dei', N'INFO@SANATORIOMATERDEI.COM.AR', N'CONTACTO@SANATORIOMATERDEI.COM.AR', NULL, NULL, NULL, N'Dr. Juan Martínez', N'Dra. María Rodríguez', NULL, NULL, NULL, 1143698700, 1143698711, NULL, NULL, NULL, N'Hidalgo 2390', N'Buenos Aires', N'Buenos Aires', 1143698700, N'Dr. Juan Martínez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (41, N'Sanatorio La Trinidad Palermo', N'INFO@SANATORIOLATRINIDAD.COM.AR', N'CONTACTO@SANATORIOLATRINIDAD.COM.AR', NULL, NULL, NULL, N'Dr. Federico Pérez', N'Dra. Laura Gómez', NULL, NULL, NULL, 1148456000, 1148456111, NULL, NULL, NULL, N'Guardia Vieja 4435', N'Buenos Aires', N'Buenos Aires', 1148456000, N'Dr. Federico Pérez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (42, N'Sanatorio Güemes', N'INFO@SANATORIOGUEMES.COM.AR', N'CONTACTO@SANATORIOGUEMES.COM.AR', NULL, NULL, NULL, N'Dr. Carlos Martínez', N'Dr. Pablo Gómez', NULL, NULL, NULL, 3814505000, 3814505123, NULL, NULL, NULL, N'Av. Entre Ríos 450', N'San Miguel de Tucumán', N'Tucumán', 3814505000, N'Dr. Carlos Martínez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (43, N'Sanatorio Güemes', N'INFO@SANATORIOGUEMES.COM.AR', N'CONTACTO@SANATORIOGUEMES.COM.AR', NULL, NULL, NULL, N'Dr. Carlos Martínez', N'Dr. Pablo Gómez', NULL, NULL, NULL, 3814505000, 3814505123, NULL, NULL, NULL, N'Av. Entre Ríos 450', N'San Miguel de Tucumán', N'Tucumán', 3814505000, N'Dr. Carlos Martínez', N'Hospital')
INSERT [dbo].[Hospital] ([IdHospital], [NombreHospital], [Email1], [Email2], [Email3], [Email4], [Email5], [Referente1], [Referente2], [Referente3], [Referente4], [Referente5], [Tel1], [Tel2], [Tel3], [Tel4], [Tel5], [Direccion], [Localidad], [Provincia], [Telefono], [Responsable], [Servicio]) VALUES (46, N'Hospital Rivadavia', N'hospiriv@buenosaires.gov.ar', NULL, NULL, NULL, NULL, N'Gerardo Riccardi', NULL, NULL, NULL, NULL, 11222333, NULL, NULL, NULL, NULL, N'Av. Gral. Las Heras 2670', N'CABA', N'Buenos Aires', 1148092000, N'Gerardo Riccardi', N'General')
SET IDENTITY_INSERT [dbo].[Hospital] OFF
GO
SET IDENTITY_INSERT [dbo].[Muestra] ON 

INSERT [dbo].[Muestra] ([IdMuestra], [IdResultado], [InstitucionNacimiento], [IdHospitalMuestra], [ApellidoBebe], [NombreBebe], [FechaHoraNacimiento], [FechaHoraExtraccion], [Sexo], [Alimentacion], [FechaIngestaLeche], [SemanasGestacion], [Peso], [CondicionRN], [PatologiaBase], [Patologia], [Parto], [EmbarazoMultiple], [EmbarazoGemelar], [ApellidoMama], [NombreMama], [Documento], [Domicilio], [Localidad], [Telefono], [LugarControlEmbarazo], [Antibioticos], [DesinfectantesYodados], [Transfusion], [FechaTransfusion], [Dopamina], [Dobutamina], [CorticoidesMadre], [CorticoidesBebe], [Tiroidepatias], [Otras], [RepiteMuestra], [Prematuro], [MalaMuestra], [ResultadoAlterado], [Analitico], [Responsable], [RolResponsable], [FirmaSello], [FechaEnvio], [FechaLlegada], [Observaciones]) VALUES (1, NULL, N'italiano', 1, N'Ape Bebe', N'Nom Bebe', CAST(N'2024-09-20T09:58:00.000' AS DateTime), CAST(N'2024-09-20T09:58:00.000' AS DateTime), N'M', N'Biberon', CAST(N'2024-09-20T09:58:00.000' AS DateTime), 10, 10, N'Enfermo', N'pat Bebe', NULL, N'Termino', 0, 1, N'ape mam', N'Nom mam', 12345678, N'dom madre', N'loc madre', 1234567, N'lug emb', 1, 1, 1, CAST(N'2024-09-20T09:59:00.000' AS DateTime), 0, 1, 0, 0, 1, N'asdfghjk', 0, 0, 0, 1, 1, N'resp', N'rol', N'', CAST(N'2024-09-20T09:59:00.000' AS DateTime), CAST(N'2024-09-20T09:59:00.000' AS DateTime), N'')
INSERT [dbo].[Muestra] ([IdMuestra], [IdResultado], [InstitucionNacimiento], [IdHospitalMuestra], [ApellidoBebe], [NombreBebe], [FechaHoraNacimiento], [FechaHoraExtraccion], [Sexo], [Alimentacion], [FechaIngestaLeche], [SemanasGestacion], [Peso], [CondicionRN], [PatologiaBase], [Patologia], [Parto], [EmbarazoMultiple], [EmbarazoGemelar], [ApellidoMama], [NombreMama], [Documento], [Domicilio], [Localidad], [Telefono], [LugarControlEmbarazo], [Antibioticos], [DesinfectantesYodados], [Transfusion], [FechaTransfusion], [Dopamina], [Dobutamina], [CorticoidesMadre], [CorticoidesBebe], [Tiroidepatias], [Otras], [RepiteMuestra], [Prematuro], [MalaMuestra], [ResultadoAlterado], [Analitico], [Responsable], [RolResponsable], [FirmaSello], [FechaEnvio], [FechaLlegada], [Observaciones]) VALUES (2, NULL, N'italiano', 1, N'Ape Bebe', N'Nom Bebe', CAST(N'2024-10-31T08:45:00.000' AS DateTime), CAST(N'2024-11-07T08:45:00.000' AS DateTime), N'M', N'Biberon', CAST(N'2024-11-07T08:45:00.000' AS DateTime), 10, 10, N'Enfermo', N'pat Bebe', NULL, N'Termino', 1, 0, N'ape mam', N'Nom mam', 12345678, N'dom madre', N'loc madre', 1234567, N'lug emb', 1, 1, 1, CAST(N'2024-11-06T08:45:00.000' AS DateTime), 1, 0, 1, 1, 1, N'', 0, 0, 1, 1, 1, N'resp', N'rol', N'null', CAST(N'2024-11-07T08:46:00.000' AS DateTime), CAST(N'2024-11-07T08:46:00.000' AS DateTime), N'')
INSERT [dbo].[Muestra] ([IdMuestra], [IdResultado], [InstitucionNacimiento], [IdHospitalMuestra], [ApellidoBebe], [NombreBebe], [FechaHoraNacimiento], [FechaHoraExtraccion], [Sexo], [Alimentacion], [FechaIngestaLeche], [SemanasGestacion], [Peso], [CondicionRN], [PatologiaBase], [Patologia], [Parto], [EmbarazoMultiple], [EmbarazoGemelar], [ApellidoMama], [NombreMama], [Documento], [Domicilio], [Localidad], [Telefono], [LugarControlEmbarazo], [Antibioticos], [DesinfectantesYodados], [Transfusion], [FechaTransfusion], [Dopamina], [Dobutamina], [CorticoidesMadre], [CorticoidesBebe], [Tiroidepatias], [Otras], [RepiteMuestra], [Prematuro], [MalaMuestra], [ResultadoAlterado], [Analitico], [Responsable], [RolResponsable], [FirmaSello], [FechaEnvio], [FechaLlegada], [Observaciones]) VALUES (3, NULL, N'italiano', 1, N'Ape Bebe', N'Nom Bebe', CAST(N'2024-11-06T08:54:00.000' AS DateTime), CAST(N'2024-11-13T08:54:00.000' AS DateTime), N'F', N'Pecho', CAST(N'2024-11-20T08:54:00.000' AS DateTime), 10, 10, N'Enfermo', N'pat Bebe', NULL, N'Termino', 1, 0, N'ape mam', N'Nom mam', 12345678, N'dom madre', N'loc madre', 1234567, N'lug emb', 1, 1, 1, CAST(N'2024-11-06T08:54:00.000' AS DateTime), 0, 1, 0, 1, 1, N'', 0, 1, 1, 1, 1, N'resp', N'rol', N'null', CAST(N'2024-11-07T08:55:00.000' AS DateTime), CAST(N'2024-11-07T08:55:00.000' AS DateTime), N'')
INSERT [dbo].[Muestra] ([IdMuestra], [IdResultado], [InstitucionNacimiento], [IdHospitalMuestra], [ApellidoBebe], [NombreBebe], [FechaHoraNacimiento], [FechaHoraExtraccion], [Sexo], [Alimentacion], [FechaIngestaLeche], [SemanasGestacion], [Peso], [CondicionRN], [PatologiaBase], [Patologia], [Parto], [EmbarazoMultiple], [EmbarazoGemelar], [ApellidoMama], [NombreMama], [Documento], [Domicilio], [Localidad], [Telefono], [LugarControlEmbarazo], [Antibioticos], [DesinfectantesYodados], [Transfusion], [FechaTransfusion], [Dopamina], [Dobutamina], [CorticoidesMadre], [CorticoidesBebe], [Tiroidepatias], [Otras], [RepiteMuestra], [Prematuro], [MalaMuestra], [ResultadoAlterado], [Analitico], [Responsable], [RolResponsable], [FirmaSello], [FechaEnvio], [FechaLlegada], [Observaciones]) VALUES (4, NULL, N'italiano', 1, N'Ape Bebe', N'Nom Bebe', CAST(N'2024-11-12T08:56:00.000' AS DateTime), CAST(N'2024-11-21T08:56:00.000' AS DateTime), N'M', N'AyunoEnteral', CAST(N'2024-11-20T08:56:00.000' AS DateTime), 10, 10, N'Enfermo', N'pat Bebe', NULL, N'Prematuro', 1, 1, N'ape mam', N'Nom mam', 12345678, N'dom madre', N'loc madre', 1234567, N'lug emb', 0, 1, 0, CAST(N'2024-10-31T08:56:00.000' AS DateTime), 1, 1, 0, 1, 1, N'', 0, 0, 1, 1, 1, N'resp', N'rol', N'null', CAST(N'2024-11-14T08:57:00.000' AS DateTime), CAST(N'2024-11-14T08:57:00.000' AS DateTime), N'')
INSERT [dbo].[Muestra] ([IdMuestra], [IdResultado], [InstitucionNacimiento], [IdHospitalMuestra], [ApellidoBebe], [NombreBebe], [FechaHoraNacimiento], [FechaHoraExtraccion], [Sexo], [Alimentacion], [FechaIngestaLeche], [SemanasGestacion], [Peso], [CondicionRN], [PatologiaBase], [Patologia], [Parto], [EmbarazoMultiple], [EmbarazoGemelar], [ApellidoMama], [NombreMama], [Documento], [Domicilio], [Localidad], [Telefono], [LugarControlEmbarazo], [Antibioticos], [DesinfectantesYodados], [Transfusion], [FechaTransfusion], [Dopamina], [Dobutamina], [CorticoidesMadre], [CorticoidesBebe], [Tiroidepatias], [Otras], [RepiteMuestra], [Prematuro], [MalaMuestra], [ResultadoAlterado], [Analitico], [Responsable], [RolResponsable], [FirmaSello], [FechaEnvio], [FechaLlegada], [Observaciones]) VALUES (5, NULL, N'italiano', 1, N'Ape Bebe', N'Nom Bebe', CAST(N'2024-11-06T09:00:00.000' AS DateTime), CAST(N'2024-11-12T09:00:00.000' AS DateTime), N'M', N'Pecho', CAST(N'2024-11-13T09:01:00.000' AS DateTime), 10, 10, N'Enfermo', N'pat Bebe', NULL, N'Termino', 0, 0, N'ape mam', N'Nom mam', 12345678, N'dom madre', N'loc madre', 1234567, N'lug emb', 0, 1, 1, CAST(N'2024-11-07T09:01:00.000' AS DateTime), 1, 0, 1, 0, 1, N'', 0, 1, 1, 1, 1, N'resp', N'rol', N'null', CAST(N'2024-11-07T09:01:00.000' AS DateTime), CAST(N'2024-11-07T09:01:00.000' AS DateTime), N'')
INSERT [dbo].[Muestra] ([IdMuestra], [IdResultado], [InstitucionNacimiento], [IdHospitalMuestra], [ApellidoBebe], [NombreBebe], [FechaHoraNacimiento], [FechaHoraExtraccion], [Sexo], [Alimentacion], [FechaIngestaLeche], [SemanasGestacion], [Peso], [CondicionRN], [PatologiaBase], [Patologia], [Parto], [EmbarazoMultiple], [EmbarazoGemelar], [ApellidoMama], [NombreMama], [Documento], [Domicilio], [Localidad], [Telefono], [LugarControlEmbarazo], [Antibioticos], [DesinfectantesYodados], [Transfusion], [FechaTransfusion], [Dopamina], [Dobutamina], [CorticoidesMadre], [CorticoidesBebe], [Tiroidepatias], [Otras], [RepiteMuestra], [Prematuro], [MalaMuestra], [ResultadoAlterado], [Analitico], [Responsable], [RolResponsable], [FirmaSello], [FechaEnvio], [FechaLlegada], [Observaciones]) VALUES (6, NULL, N'italiano', 1, N'Ape Bebe', N'Nom Bebe', CAST(N'2024-11-05T09:05:00.000' AS DateTime), CAST(N'2024-11-12T09:05:00.000' AS DateTime), N'F', N'Pecho', CAST(N'2024-11-06T09:05:00.000' AS DateTime), 10, 10, N'Enfermo', N'pat Bebe', NULL, N'Prematuro', 0, 1, N'ape mam', N'Nom mam', 12345678, N'dom madre', N'loc madre', 1234567, N'lug emb', 0, 1, 1, CAST(N'2024-11-05T09:05:00.000' AS DateTime), 1, 1, 0, 1, 1, N'', 0, 1, 1, 1, 1, N'resp', N'rol', N'null', CAST(N'2024-10-30T09:06:00.000' AS DateTime), CAST(N'2024-10-30T09:06:00.000' AS DateTime), N'')
INSERT [dbo].[Muestra] ([IdMuestra], [IdResultado], [InstitucionNacimiento], [IdHospitalMuestra], [ApellidoBebe], [NombreBebe], [FechaHoraNacimiento], [FechaHoraExtraccion], [Sexo], [Alimentacion], [FechaIngestaLeche], [SemanasGestacion], [Peso], [CondicionRN], [PatologiaBase], [Patologia], [Parto], [EmbarazoMultiple], [EmbarazoGemelar], [ApellidoMama], [NombreMama], [Documento], [Domicilio], [Localidad], [Telefono], [LugarControlEmbarazo], [Antibioticos], [DesinfectantesYodados], [Transfusion], [FechaTransfusion], [Dopamina], [Dobutamina], [CorticoidesMadre], [CorticoidesBebe], [Tiroidepatias], [Otras], [RepiteMuestra], [Prematuro], [MalaMuestra], [ResultadoAlterado], [Analitico], [Responsable], [RolResponsable], [FirmaSello], [FechaEnvio], [FechaLlegada], [Observaciones]) VALUES (7, NULL, N'italiano', 1, N'Ape Bebe', N'Nom Bebe', CAST(N'2024-11-07T09:10:00.000' AS DateTime), CAST(N'2024-11-07T09:10:00.000' AS DateTime), N'M', N'Biberon', CAST(N'2024-10-30T09:10:00.000' AS DateTime), 10, 10, N'Sano', N'pat Bebe', NULL, N'Termino', 1, 1, N'ape mam', N'Nom mam', 12345678, N'dom madre', N'loc madre', 1234567, N'lug emb', 1, 1, 1, CAST(N'2024-11-07T09:10:00.000' AS DateTime), 1, 1, 1, 1, 1, N'', 1, 1, 1, 1, 1, N'resp', N'rol', N'null', CAST(N'2024-10-31T09:10:00.000' AS DateTime), CAST(N'2024-10-31T09:10:00.000' AS DateTime), N'')
INSERT [dbo].[Muestra] ([IdMuestra], [IdResultado], [InstitucionNacimiento], [IdHospitalMuestra], [ApellidoBebe], [NombreBebe], [FechaHoraNacimiento], [FechaHoraExtraccion], [Sexo], [Alimentacion], [FechaIngestaLeche], [SemanasGestacion], [Peso], [CondicionRN], [PatologiaBase], [Patologia], [Parto], [EmbarazoMultiple], [EmbarazoGemelar], [ApellidoMama], [NombreMama], [Documento], [Domicilio], [Localidad], [Telefono], [LugarControlEmbarazo], [Antibioticos], [DesinfectantesYodados], [Transfusion], [FechaTransfusion], [Dopamina], [Dobutamina], [CorticoidesMadre], [CorticoidesBebe], [Tiroidepatias], [Otras], [RepiteMuestra], [Prematuro], [MalaMuestra], [ResultadoAlterado], [Analitico], [Responsable], [RolResponsable], [FirmaSello], [FechaEnvio], [FechaLlegada], [Observaciones]) VALUES (8, NULL, N'italiano', 1, N'Ape Bebe', N'Nom Bebe', CAST(N'2024-11-07T09:12:00.000' AS DateTime), CAST(N'2024-11-13T09:12:00.000' AS DateTime), N'M', N'Biberon', CAST(N'2024-10-29T09:12:00.000' AS DateTime), 10, 10, N'Sano', N'pat Bebe', NULL, N'Termino', 1, 1, N'ape mam', N'Nom mam', 12345678, N'dom madre', N'loc madre', 1234567, N'lug emb', 1, 1, 1, CAST(N'2024-10-31T09:12:00.000' AS DateTime), 1, 1, 1, 1, 1, N'', 1, 1, 1, 1, 1, N'resp', N'rol', N'null', CAST(N'2024-11-09T09:12:00.000' AS DateTime), CAST(N'2024-11-09T09:12:00.000' AS DateTime), N'')
INSERT [dbo].[Muestra] ([IdMuestra], [IdResultado], [InstitucionNacimiento], [IdHospitalMuestra], [ApellidoBebe], [NombreBebe], [FechaHoraNacimiento], [FechaHoraExtraccion], [Sexo], [Alimentacion], [FechaIngestaLeche], [SemanasGestacion], [Peso], [CondicionRN], [PatologiaBase], [Patologia], [Parto], [EmbarazoMultiple], [EmbarazoGemelar], [ApellidoMama], [NombreMama], [Documento], [Domicilio], [Localidad], [Telefono], [LugarControlEmbarazo], [Antibioticos], [DesinfectantesYodados], [Transfusion], [FechaTransfusion], [Dopamina], [Dobutamina], [CorticoidesMadre], [CorticoidesBebe], [Tiroidepatias], [Otras], [RepiteMuestra], [Prematuro], [MalaMuestra], [ResultadoAlterado], [Analitico], [Responsable], [RolResponsable], [FirmaSello], [FechaEnvio], [FechaLlegada], [Observaciones]) VALUES (9, NULL, N'italiano', 1, N'Ape Bebe', N'Nom Bebe', CAST(N'2024-11-08T09:15:00.000' AS DateTime), CAST(N'2024-11-15T09:15:00.000' AS DateTime), N'M', N'Biberon', CAST(N'2024-11-06T09:15:00.000' AS DateTime), 10, 10, N'Sano', N'pat Bebe', NULL, N'Termino', 1, 1, N'ape mam', N'Nom mam', 12345678, N'dom madre', N'loc madre', 1234567, N'lug emb', 1, 1, 1, CAST(N'2024-11-14T09:15:00.000' AS DateTime), 1, 1, 1, 1, 1, N'', 1, 1, 1, 1, 1, N'resp', N'rol', N'null', CAST(N'2024-11-14T09:15:00.000' AS DateTime), CAST(N'2024-11-14T09:15:00.000' AS DateTime), N'')
INSERT [dbo].[Muestra] ([IdMuestra], [IdResultado], [InstitucionNacimiento], [IdHospitalMuestra], [ApellidoBebe], [NombreBebe], [FechaHoraNacimiento], [FechaHoraExtraccion], [Sexo], [Alimentacion], [FechaIngestaLeche], [SemanasGestacion], [Peso], [CondicionRN], [PatologiaBase], [Patologia], [Parto], [EmbarazoMultiple], [EmbarazoGemelar], [ApellidoMama], [NombreMama], [Documento], [Domicilio], [Localidad], [Telefono], [LugarControlEmbarazo], [Antibioticos], [DesinfectantesYodados], [Transfusion], [FechaTransfusion], [Dopamina], [Dobutamina], [CorticoidesMadre], [CorticoidesBebe], [Tiroidepatias], [Otras], [RepiteMuestra], [Prematuro], [MalaMuestra], [ResultadoAlterado], [Analitico], [Responsable], [RolResponsable], [FirmaSello], [FechaEnvio], [FechaLlegada], [Observaciones]) VALUES (10, NULL, N'italiano', 1, N'Ape Bebe', N'Nom Bebe', CAST(N'2024-10-30T09:18:00.000' AS DateTime), CAST(N'2024-11-18T09:18:00.000' AS DateTime), N'M', N'Biberon', CAST(N'2024-11-13T09:19:00.000' AS DateTime), 10, 10, N'Sano', N'pat Bebe', NULL, N'Termino', 1, 1, N'ape mam', N'Nom mam', 12345678, N'dom madre', N'loc madre', 1234567, N'lug emb', 1, 1, 1, CAST(N'2024-11-14T09:19:00.000' AS DateTime), 1, 1, 1, 1, 1, N'', 1, 1, 1, 1, 1, N'resp', N'rol', N'null', CAST(N'2024-11-12T09:19:00.000' AS DateTime), CAST(N'2024-11-12T09:19:00.000' AS DateTime), N'')
INSERT [dbo].[Muestra] ([IdMuestra], [IdResultado], [InstitucionNacimiento], [IdHospitalMuestra], [ApellidoBebe], [NombreBebe], [FechaHoraNacimiento], [FechaHoraExtraccion], [Sexo], [Alimentacion], [FechaIngestaLeche], [SemanasGestacion], [Peso], [CondicionRN], [PatologiaBase], [Patologia], [Parto], [EmbarazoMultiple], [EmbarazoGemelar], [ApellidoMama], [NombreMama], [Documento], [Domicilio], [Localidad], [Telefono], [LugarControlEmbarazo], [Antibioticos], [DesinfectantesYodados], [Transfusion], [FechaTransfusion], [Dopamina], [Dobutamina], [CorticoidesMadre], [CorticoidesBebe], [Tiroidepatias], [Otras], [RepiteMuestra], [Prematuro], [MalaMuestra], [ResultadoAlterado], [Analitico], [Responsable], [RolResponsable], [FirmaSello], [FechaEnvio], [FechaLlegada], [Observaciones]) VALUES (11, NULL, N'italiano', 1, N'Ape Bebe', N'Nom Bebe', CAST(N'2024-10-31T09:30:00.000' AS DateTime), CAST(N'2024-11-13T09:30:00.000' AS DateTime), N'M', N'Biberon', CAST(N'2024-11-13T09:30:00.000' AS DateTime), 10, 10, N'Sano', N'pat Bebe', NULL, N'Termino', 1, 1, N'ape mam', N'Nom mam', 12345678, N'dom madre', N'loc madre', 1234567, N'lug emb', 1, 1, 1, CAST(N'2024-11-06T09:30:00.000' AS DateTime), 1, 1, 1, 1, 1, N'', 1, 1, 1, 1, 1, N'resp', N'rol', N'null', CAST(N'2024-11-06T09:30:00.000' AS DateTime), CAST(N'2024-11-06T09:30:00.000' AS DateTime), N'')
INSERT [dbo].[Muestra] ([IdMuestra], [IdResultado], [InstitucionNacimiento], [IdHospitalMuestra], [ApellidoBebe], [NombreBebe], [FechaHoraNacimiento], [FechaHoraExtraccion], [Sexo], [Alimentacion], [FechaIngestaLeche], [SemanasGestacion], [Peso], [CondicionRN], [PatologiaBase], [Patologia], [Parto], [EmbarazoMultiple], [EmbarazoGemelar], [ApellidoMama], [NombreMama], [Documento], [Domicilio], [Localidad], [Telefono], [LugarControlEmbarazo], [Antibioticos], [DesinfectantesYodados], [Transfusion], [FechaTransfusion], [Dopamina], [Dobutamina], [CorticoidesMadre], [CorticoidesBebe], [Tiroidepatias], [Otras], [RepiteMuestra], [Prematuro], [MalaMuestra], [ResultadoAlterado], [Analitico], [Responsable], [RolResponsable], [FirmaSello], [FechaEnvio], [FechaLlegada], [Observaciones]) VALUES (12, NULL, N'italiano', 1, N'Ape Bebe', N'Nom Bebe', CAST(N'2024-10-31T09:32:00.000' AS DateTime), CAST(N'2024-11-21T09:32:00.000' AS DateTime), N'M', N'Biberon', CAST(N'2024-11-08T09:32:00.000' AS DateTime), 10, 10, N'Sano', N'pat Bebe', NULL, N'Termino', 1, 1, N'ape mam', N'Nom mam', 12345678, N'dom madre', N'loc madre', 1234567, N'lug emb', 1, 1, 1, CAST(N'2024-11-07T09:32:00.000' AS DateTime), 1, 1, 1, 1, 1, N'', 1, 1, 1, 1, 1, N'resp', N'rol', N'null', CAST(N'2024-11-09T09:32:00.000' AS DateTime), CAST(N'2024-11-09T09:32:00.000' AS DateTime), N'')
INSERT [dbo].[Muestra] ([IdMuestra], [IdResultado], [InstitucionNacimiento], [IdHospitalMuestra], [ApellidoBebe], [NombreBebe], [FechaHoraNacimiento], [FechaHoraExtraccion], [Sexo], [Alimentacion], [FechaIngestaLeche], [SemanasGestacion], [Peso], [CondicionRN], [PatologiaBase], [Patologia], [Parto], [EmbarazoMultiple], [EmbarazoGemelar], [ApellidoMama], [NombreMama], [Documento], [Domicilio], [Localidad], [Telefono], [LugarControlEmbarazo], [Antibioticos], [DesinfectantesYodados], [Transfusion], [FechaTransfusion], [Dopamina], [Dobutamina], [CorticoidesMadre], [CorticoidesBebe], [Tiroidepatias], [Otras], [RepiteMuestra], [Prematuro], [MalaMuestra], [ResultadoAlterado], [Analitico], [Responsable], [RolResponsable], [FirmaSello], [FechaEnvio], [FechaLlegada], [Observaciones]) VALUES (13, NULL, N'italiano', 1, N'Ape Bebe', N'Nom Bebe', CAST(N'2024-11-08T09:36:00.000' AS DateTime), CAST(N'2024-11-15T09:36:00.000' AS DateTime), N'M', N'Biberon', CAST(N'2024-11-08T09:36:00.000' AS DateTime), 10, 10, N'Sano', N'pat Bebe', NULL, N'Termino', 1, 1, N'ape mam', N'Nom mam', 12345678, N'dom madre', N'loc madre', 1234567, N'lug emb', 1, 1, 1, CAST(N'2024-11-04T09:36:00.000' AS DateTime), 1, 1, 1, 1, 1, N'', 1, 1, 1, 1, 1, N'resp', N'rol', N'null', CAST(N'2024-11-14T09:36:00.000' AS DateTime), CAST(N'2024-11-14T09:36:00.000' AS DateTime), N'')
INSERT [dbo].[Muestra] ([IdMuestra], [IdResultado], [InstitucionNacimiento], [IdHospitalMuestra], [ApellidoBebe], [NombreBebe], [FechaHoraNacimiento], [FechaHoraExtraccion], [Sexo], [Alimentacion], [FechaIngestaLeche], [SemanasGestacion], [Peso], [CondicionRN], [PatologiaBase], [Patologia], [Parto], [EmbarazoMultiple], [EmbarazoGemelar], [ApellidoMama], [NombreMama], [Documento], [Domicilio], [Localidad], [Telefono], [LugarControlEmbarazo], [Antibioticos], [DesinfectantesYodados], [Transfusion], [FechaTransfusion], [Dopamina], [Dobutamina], [CorticoidesMadre], [CorticoidesBebe], [Tiroidepatias], [Otras], [RepiteMuestra], [Prematuro], [MalaMuestra], [ResultadoAlterado], [Analitico], [Responsable], [RolResponsable], [FirmaSello], [FechaEnvio], [FechaLlegada], [Observaciones]) VALUES (14, NULL, N'italiano', 1, N'Ape Bebe', N'Nom Bebe', CAST(N'2024-11-01T09:40:00.000' AS DateTime), CAST(N'2024-11-08T09:40:00.000' AS DateTime), N'M', N'Biberon', CAST(N'2024-10-31T09:40:00.000' AS DateTime), 10, 10, N'Sano', N'pat Bebe', NULL, N'Termino', 1, 1, N'ape mam', N'Nom mam', 12345678, N'dom madre', N'loc madre', 1234567, N'lug emb', 1, 1, 1, CAST(N'2024-11-08T09:40:00.000' AS DateTime), 1, 1, 1, 1, 1, N'', 1, 1, 1, 1, 1, N'resp', N'rol', N'null', CAST(N'2024-11-08T09:40:00.000' AS DateTime), CAST(N'2024-11-08T09:40:00.000' AS DateTime), N'')
INSERT [dbo].[Muestra] ([IdMuestra], [IdResultado], [InstitucionNacimiento], [IdHospitalMuestra], [ApellidoBebe], [NombreBebe], [FechaHoraNacimiento], [FechaHoraExtraccion], [Sexo], [Alimentacion], [FechaIngestaLeche], [SemanasGestacion], [Peso], [CondicionRN], [PatologiaBase], [Patologia], [Parto], [EmbarazoMultiple], [EmbarazoGemelar], [ApellidoMama], [NombreMama], [Documento], [Domicilio], [Localidad], [Telefono], [LugarControlEmbarazo], [Antibioticos], [DesinfectantesYodados], [Transfusion], [FechaTransfusion], [Dopamina], [Dobutamina], [CorticoidesMadre], [CorticoidesBebe], [Tiroidepatias], [Otras], [RepiteMuestra], [Prematuro], [MalaMuestra], [ResultadoAlterado], [Analitico], [Responsable], [RolResponsable], [FirmaSello], [FechaEnvio], [FechaLlegada], [Observaciones]) VALUES (15, NULL, N'italiano', 1, N'Ape Bebe', N'Nom Bebe', CAST(N'2024-11-06T09:59:00.000' AS DateTime), CAST(N'2024-11-13T09:59:00.000' AS DateTime), N'M', N'Biberon', CAST(N'2024-11-14T09:59:00.000' AS DateTime), 10, 10, N'Sano', N'pat Bebe', NULL, N'Termino', 1, 1, N'ape mam', N'Nom mam', 12345678, N'dom madre', N'loc madre', 1234567, N'lug emb', 1, 1, 1, CAST(N'2024-11-15T10:00:00.000' AS DateTime), 1, 1, 1, 1, 1, N'', 1, 1, 1, 1, 1, N'resp', N'rol', N'5JAABB2XEROUPKI5U4QTKJ46AE.jpg', CAST(N'2024-11-13T10:00:00.000' AS DateTime), CAST(N'2024-11-13T10:00:00.000' AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[Muestra] OFF
GO
SET IDENTITY_INSERT [dbo].[MuestraResultado] ON 

INSERT [dbo].[MuestraResultado] ([IdResultado], [IdMuestra], [TshNeonatal], [MetodologiaTsh], [Fenilanina], [MetodologiaFenilanina], [IrtNeonatal], [MetodologiaIrt], [Galactosa], [MetodologiaGalactosa], [Hidroxiprogesterona], [MetodologiaHidro], [Biotinidasa], [MetodologiaBiotinidasa], [NormalidadTsh], [NormalidadFenilanina], [NormalidadIrt], [NormalidadGalactosa], [NormalidadHidro], [NormalidadBiotinidasa], [Observaciones]) VALUES (1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[MuestraResultado] ([IdResultado], [IdMuestra], [TshNeonatal], [MetodologiaTsh], [Fenilanina], [MetodologiaFenilanina], [IrtNeonatal], [MetodologiaIrt], [Galactosa], [MetodologiaGalactosa], [Hidroxiprogesterona], [MetodologiaHidro], [Biotinidasa], [MetodologiaBiotinidasa], [NormalidadTsh], [NormalidadFenilanina], [NormalidadIrt], [NormalidadGalactosa], [NormalidadHidro], [NormalidadBiotinidasa], [Observaciones]) VALUES (2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[MuestraResultado] ([IdResultado], [IdMuestra], [TshNeonatal], [MetodologiaTsh], [Fenilanina], [MetodologiaFenilanina], [IrtNeonatal], [MetodologiaIrt], [Galactosa], [MetodologiaGalactosa], [Hidroxiprogesterona], [MetodologiaHidro], [Biotinidasa], [MetodologiaBiotinidasa], [NormalidadTsh], [NormalidadFenilanina], [NormalidadIrt], [NormalidadGalactosa], [NormalidadHidro], [NormalidadBiotinidasa], [Observaciones]) VALUES (3, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[MuestraResultado] ([IdResultado], [IdMuestra], [TshNeonatal], [MetodologiaTsh], [Fenilanina], [MetodologiaFenilanina], [IrtNeonatal], [MetodologiaIrt], [Galactosa], [MetodologiaGalactosa], [Hidroxiprogesterona], [MetodologiaHidro], [Biotinidasa], [MetodologiaBiotinidasa], [NormalidadTsh], [NormalidadFenilanina], [NormalidadIrt], [NormalidadGalactosa], [NormalidadHidro], [NormalidadBiotinidasa], [Observaciones]) VALUES (4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[MuestraResultado] ([IdResultado], [IdMuestra], [TshNeonatal], [MetodologiaTsh], [Fenilanina], [MetodologiaFenilanina], [IrtNeonatal], [MetodologiaIrt], [Galactosa], [MetodologiaGalactosa], [Hidroxiprogesterona], [MetodologiaHidro], [Biotinidasa], [MetodologiaBiotinidasa], [NormalidadTsh], [NormalidadFenilanina], [NormalidadIrt], [NormalidadGalactosa], [NormalidadHidro], [NormalidadBiotinidasa], [Observaciones]) VALUES (5, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[MuestraResultado] ([IdResultado], [IdMuestra], [TshNeonatal], [MetodologiaTsh], [Fenilanina], [MetodologiaFenilanina], [IrtNeonatal], [MetodologiaIrt], [Galactosa], [MetodologiaGalactosa], [Hidroxiprogesterona], [MetodologiaHidro], [Biotinidasa], [MetodologiaBiotinidasa], [NormalidadTsh], [NormalidadFenilanina], [NormalidadIrt], [NormalidadGalactosa], [NormalidadHidro], [NormalidadBiotinidasa], [Observaciones]) VALUES (6, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[MuestraResultado] ([IdResultado], [IdMuestra], [TshNeonatal], [MetodologiaTsh], [Fenilanina], [MetodologiaFenilanina], [IrtNeonatal], [MetodologiaIrt], [Galactosa], [MetodologiaGalactosa], [Hidroxiprogesterona], [MetodologiaHidro], [Biotinidasa], [MetodologiaBiotinidasa], [NormalidadTsh], [NormalidadFenilanina], [NormalidadIrt], [NormalidadGalactosa], [NormalidadHidro], [NormalidadBiotinidasa], [Observaciones]) VALUES (7, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[MuestraResultado] ([IdResultado], [IdMuestra], [TshNeonatal], [MetodologiaTsh], [Fenilanina], [MetodologiaFenilanina], [IrtNeonatal], [MetodologiaIrt], [Galactosa], [MetodologiaGalactosa], [Hidroxiprogesterona], [MetodologiaHidro], [Biotinidasa], [MetodologiaBiotinidasa], [NormalidadTsh], [NormalidadFenilanina], [NormalidadIrt], [NormalidadGalactosa], [NormalidadHidro], [NormalidadBiotinidasa], [Observaciones]) VALUES (8, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[MuestraResultado] ([IdResultado], [IdMuestra], [TshNeonatal], [MetodologiaTsh], [Fenilanina], [MetodologiaFenilanina], [IrtNeonatal], [MetodologiaIrt], [Galactosa], [MetodologiaGalactosa], [Hidroxiprogesterona], [MetodologiaHidro], [Biotinidasa], [MetodologiaBiotinidasa], [NormalidadTsh], [NormalidadFenilanina], [NormalidadIrt], [NormalidadGalactosa], [NormalidadHidro], [NormalidadBiotinidasa], [Observaciones]) VALUES (9, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[MuestraResultado] ([IdResultado], [IdMuestra], [TshNeonatal], [MetodologiaTsh], [Fenilanina], [MetodologiaFenilanina], [IrtNeonatal], [MetodologiaIrt], [Galactosa], [MetodologiaGalactosa], [Hidroxiprogesterona], [MetodologiaHidro], [Biotinidasa], [MetodologiaBiotinidasa], [NormalidadTsh], [NormalidadFenilanina], [NormalidadIrt], [NormalidadGalactosa], [NormalidadHidro], [NormalidadBiotinidasa], [Observaciones]) VALUES (10, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[MuestraResultado] ([IdResultado], [IdMuestra], [TshNeonatal], [MetodologiaTsh], [Fenilanina], [MetodologiaFenilanina], [IrtNeonatal], [MetodologiaIrt], [Galactosa], [MetodologiaGalactosa], [Hidroxiprogesterona], [MetodologiaHidro], [Biotinidasa], [MetodologiaBiotinidasa], [NormalidadTsh], [NormalidadFenilanina], [NormalidadIrt], [NormalidadGalactosa], [NormalidadHidro], [NormalidadBiotinidasa], [Observaciones]) VALUES (11, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[MuestraResultado] ([IdResultado], [IdMuestra], [TshNeonatal], [MetodologiaTsh], [Fenilanina], [MetodologiaFenilanina], [IrtNeonatal], [MetodologiaIrt], [Galactosa], [MetodologiaGalactosa], [Hidroxiprogesterona], [MetodologiaHidro], [Biotinidasa], [MetodologiaBiotinidasa], [NormalidadTsh], [NormalidadFenilanina], [NormalidadIrt], [NormalidadGalactosa], [NormalidadHidro], [NormalidadBiotinidasa], [Observaciones]) VALUES (12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[MuestraResultado] ([IdResultado], [IdMuestra], [TshNeonatal], [MetodologiaTsh], [Fenilanina], [MetodologiaFenilanina], [IrtNeonatal], [MetodologiaIrt], [Galactosa], [MetodologiaGalactosa], [Hidroxiprogesterona], [MetodologiaHidro], [Biotinidasa], [MetodologiaBiotinidasa], [NormalidadTsh], [NormalidadFenilanina], [NormalidadIrt], [NormalidadGalactosa], [NormalidadHidro], [NormalidadBiotinidasa], [Observaciones]) VALUES (13, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[MuestraResultado] ([IdResultado], [IdMuestra], [TshNeonatal], [MetodologiaTsh], [Fenilanina], [MetodologiaFenilanina], [IrtNeonatal], [MetodologiaIrt], [Galactosa], [MetodologiaGalactosa], [Hidroxiprogesterona], [MetodologiaHidro], [Biotinidasa], [MetodologiaBiotinidasa], [NormalidadTsh], [NormalidadFenilanina], [NormalidadIrt], [NormalidadGalactosa], [NormalidadHidro], [NormalidadBiotinidasa], [Observaciones]) VALUES (14, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[MuestraResultado] ([IdResultado], [IdMuestra], [TshNeonatal], [MetodologiaTsh], [Fenilanina], [MetodologiaFenilanina], [IrtNeonatal], [MetodologiaIrt], [Galactosa], [MetodologiaGalactosa], [Hidroxiprogesterona], [MetodologiaHidro], [Biotinidasa], [MetodologiaBiotinidasa], [NormalidadTsh], [NormalidadFenilanina], [NormalidadIrt], [NormalidadGalactosa], [NormalidadHidro], [NormalidadBiotinidasa], [Observaciones]) VALUES (15, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[MuestraResultado] OFF
GO
SET IDENTITY_INSERT [dbo].[Perfil] ON 

INSERT [dbo].[Perfil] ([IdPerfil], [Nombre], [Apellido], [Email], [Telefono], [IdHospital], [LecturaPermiso], [EdicionPermiso], [ImpresionPermiso], [Contrasena], [MantenerActivo]) VALUES (2, N'Santiago', N'Butler', N'sanbutler@gmail.com', 68954821, 1, 1, 1, 1, N'abc', 1)
INSERT [dbo].[Perfil] ([IdPerfil], [Nombre], [Apellido], [Email], [Telefono], [IdHospital], [LecturaPermiso], [EdicionPermiso], [ImpresionPermiso], [Contrasena], [MantenerActivo]) VALUES (3, N'Micaela', N'Riccardi', N'micaela@gmail.com', 49217796, 1, 1, 1, 1, N'def', 1)
INSERT [dbo].[Perfil] ([IdPerfil], [Nombre], [Apellido], [Email], [Telefono], [IdHospital], [LecturaPermiso], [EdicionPermiso], [ImpresionPermiso], [Contrasena], [MantenerActivo]) VALUES (4, N'Leonardo', N'Kristal', N'leonardo.kristal@ort.edu.ar', 33334444, 27, 1, 1, 1, N'ghi', 0)
INSERT [dbo].[Perfil] ([IdPerfil], [Nombre], [Apellido], [Email], [Telefono], [IdHospital], [LecturaPermiso], [EdicionPermiso], [ImpresionPermiso], [Contrasena], [MantenerActivo]) VALUES (5, N'Ezequiel', N'Binker', N'ezebinker@gmail.com', 55556666, 33, 0, 0, 0, N'jkl', 0)
INSERT [dbo].[Perfil] ([IdPerfil], [Nombre], [Apellido], [Email], [Telefono], [IdHospital], [LecturaPermiso], [EdicionPermiso], [ImpresionPermiso], [Contrasena], [MantenerActivo]) VALUES (6, N'Tobias', N'Granovsky', N'tobias.granovsky@gmail.com', 22223333, 43, 0, 0, 0, N'mno', 0)
SET IDENTITY_INSERT [dbo].[Perfil] OFF
GO
ALTER TABLE [dbo].[Muestra]  WITH CHECK ADD  CONSTRAINT [FK_Muestra_Hospital] FOREIGN KEY([IdHospitalMuestra])
REFERENCES [dbo].[Hospital] ([IdHospital])
GO
ALTER TABLE [dbo].[Muestra] CHECK CONSTRAINT [FK_Muestra_Hospital]
GO
ALTER TABLE [dbo].[Muestra]  WITH CHECK ADD  CONSTRAINT [FK_Muestra_MuestraResultado] FOREIGN KEY([IdResultado])
REFERENCES [dbo].[MuestraResultado] ([IdResultado])
GO
ALTER TABLE [dbo].[Muestra] CHECK CONSTRAINT [FK_Muestra_MuestraResultado]
GO
ALTER TABLE [dbo].[MuestraResultado]  WITH CHECK ADD  CONSTRAINT [FK_MuestraResultado_Muestra] FOREIGN KEY([IdMuestra])
REFERENCES [dbo].[Muestra] ([IdMuestra])
GO
ALTER TABLE [dbo].[MuestraResultado] CHECK CONSTRAINT [FK_MuestraResultado_Muestra]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Paciente_Muestra] FOREIGN KEY([IdMuestra])
REFERENCES [dbo].[Muestra] ([IdMuestra])
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [FK_Paciente_Muestra]
GO
ALTER TABLE [dbo].[Perfil]  WITH CHECK ADD  CONSTRAINT [FK_Perfil_Hospital] FOREIGN KEY([IdHospital])
REFERENCES [dbo].[Hospital] ([IdHospital])
GO
ALTER TABLE [dbo].[Perfil] CHECK CONSTRAINT [FK_Perfil_Hospital]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarMuestra]    Script Date: 22/11/2024 12:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Actualizar muestra*/
CREATE PROCEDURE [dbo].[ActualizarMuestra]
    @IdMuestra INT,
    @IdResultado INT,
    @FechaEnvio DATETIME,
    @FechaLlegada DATETIME,
    @Observaciones VARCHAR(1000)

AS
BEGIN
    UPDATE Muestra
    SET IdResultado = @IdResultado,
        FechaEnvio = @FechaEnvio,
        FechaLlegada = @FechaLlegada,
        Observaciones = @Observaciones
    WHERE IdMuestra = @IdMuestra;
END;

GO
/****** Object:  StoredProcedure [dbo].[ActualizarMuestraFirma]    Script Date: 22/11/2024 12:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Actualizar muestra*/
CREATE PROCEDURE [dbo].[ActualizarMuestraFirma]
    @IdMuestra INT,
    @FirmaSello VARCHAR(1000)

AS
BEGIN
    UPDATE Muestra
    SET FirmaSello = @FirmaSello
    WHERE IdMuestra = @IdMuestra;
END;
GO
/****** Object:  StoredProcedure [dbo].[ActualizarResultado]    Script Date: 22/11/2024 12:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ActualizarResultado]
    @IdMuestra INT,
    @TshNeonatal VARCHAR(1000) = NULL,
    @MetodologiaTsh VARCHAR(1000) = NULL,
    @Fenilanina VARCHAR(1000) = NULL,
    @MetodologiaFenilanina VARCHAR(1000) = NULL,
    @IrtNeonatal VARCHAR(1000) = NULL,
    @MetodologiaIrt VARCHAR(1000) = NULL,
    @Galactosa VARCHAR(1000) = NULL,
    @MetodologiaGalactosa VARCHAR(1000) = NULL,
    @Hidroxiprogesterona VARCHAR(1000) = NULL,
    @MetodologiaHidro VARCHAR(1000) = NULL,
    @Biotinidasa VARCHAR(1000) = NULL,
    @MetodologiaBiotinidasa VARCHAR(1000) = NULL,
    @NormalidadTsh VARCHAR(1000) = NULL,
    @NormalidadFenilanina VARCHAR(1000) = NULL,
    @NormalidadIrt VARCHAR(1000) = NULL,
    @NormalidadGalactosa VARCHAR(1000) = NULL,
    @NormalidadHidro VARCHAR(1000) = NULL,
    @NormalidadBiotinidasa VARCHAR(1000) = NULL,
    @ObservacionesResultado VARCHAR(1000) = NULL
AS
BEGIN
    -- Verificar si el IdMuestra existe antes de actualizar
    IF EXISTS (SELECT 1 FROM MuestraResultado WHERE IdMuestra = @IdMuestra)
    BEGIN
        -- Realizar el UPDATE en MuestraResultado
        UPDATE MuestraResultado
        SET 
            TshNeonatal = ISNULL(@TshNeonatal, TshNeonatal),
            MetodologiaTsh = ISNULL(@MetodologiaTsh, MetodologiaTsh),
            Fenilanina = ISNULL(@Fenilanina, Fenilanina),
            MetodologiaFenilanina = ISNULL(@MetodologiaFenilanina, MetodologiaFenilanina),
            IrtNeonatal = ISNULL(@IrtNeonatal, IrtNeonatal),
            MetodologiaIrt = ISNULL(@MetodologiaIrt, MetodologiaIrt),
            Galactosa = ISNULL(@Galactosa, Galactosa),
            MetodologiaGalactosa = ISNULL(@MetodologiaGalactosa, MetodologiaGalactosa),
            Hidroxiprogesterona = ISNULL(@Hidroxiprogesterona, Hidroxiprogesterona),
            MetodologiaHidro = ISNULL(@MetodologiaHidro, MetodologiaHidro),
            Biotinidasa = ISNULL(@Biotinidasa, Biotinidasa),
            MetodologiaBiotinidasa = ISNULL(@MetodologiaBiotinidasa, MetodologiaBiotinidasa),
            NormalidadTsh = ISNULL(@NormalidadTsh, NormalidadTsh),
            NormalidadFenilanina = ISNULL(@NormalidadFenilanina, NormalidadFenilanina),
            NormalidadIrt = ISNULL(@NormalidadIrt, NormalidadIrt),
            NormalidadGalactosa = ISNULL(@NormalidadGalactosa, NormalidadGalactosa),
            NormalidadHidro = ISNULL(@NormalidadHidro, NormalidadHidro),
            NormalidadBiotinidasa = ISNULL(@NormalidadBiotinidasa, NormalidadBiotinidasa),
            Observaciones = ISNULL(@ObservacionesResultado, Observaciones)
        WHERE IdMuestra = @IdMuestra;

    END
END;
GO
/****** Object:  StoredProcedure [dbo].[BuscarMuestraPorFiltros]    Script Date: 22/11/2024 12:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Selecionar muestra por filtrado*/
CREATE PROCEDURE [dbo].[BuscarMuestraPorFiltros]
    @Provincia VARCHAR(1000),
    @Hospital VARCHAR(1000),
    @Apellido VARCHAR(1000),
    @FechaRegistroDesde DATETIME,
    @FechaRegistroHasta DATETIME
AS
BEGIN
    SELECT *
    FROM Muestra m
    WHERE (m.IdHospitalMuestra = (SELECT IdHospital FROM Hospital WHERE Provincia = @Provincia OR @Provincia = '')
           OR @Provincia = '')
    AND (m.ApellidoBebe = @Apellido OR @Apellido = '')
    AND (m.FechaHoraExtraccion BETWEEN @FechaRegistroDesde AND @FechaRegistroHasta)
    AND (m.IdHospitalMuestra = (SELECT IdHospital FROM Hospital WHERE NombreHospital = @Hospital OR @Hospital = '')
           OR @Hospital = '');
END;
GO
/****** Object:  StoredProcedure [dbo].[CrearPerfil]    Script Date: 22/11/2024 12:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CrearPerfil] 

	 @idPerfil INT,
	 @nombre VARCHAR(1000),
	 @apellido VARCHAR(1000),
	 @email VARCHAR(1000),
	 @telefono INT, 
	 @idHospital INT, 
	 @lecturaPermiso BIT, 
	 @edicionPermiso BIT, 
	 @impresionPermiso BIT,
	 @contrasena VARCHAR(15), 
	 @mantenerActivo BIT
AS
BEGIN
	INSERT INTO Perfil (Nombre, Apellido, Email, Telefono, IdHospital, LecturaPermiso, EdicionPermiso, ImpresionPermiso, Contrasena, MantenerActivo)
		VALUES(@nombre, @apellido, @email, @telefono, @idHospital, @lecturaPermiso, @edicionPermiso, @impresionPermiso, @contrasena, @mantenerActivo)
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarHospital]    Script Date: 22/11/2024 12:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*Borrar hospital*/
CREATE PROCEDURE [dbo].[EliminarHospital]
    @IdHospital int
AS
BEGIN
    DELETE FROM Hospital WHERE IdHospital = @IdHospital
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarMuestra]    Script Date: 22/11/2024 12:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*Eliminar muestra*/
CREATE PROCEDURE [dbo].[EliminarMuestra]
    @IdMuestra INT
AS
BEGIN
    DELETE FROM Muestra
    WHERE IdMuestra = @IdMuestra;
END;
GO
/****** Object:  StoredProcedure [dbo].[EliminarMuestraYResultado]    Script Date: 22/11/2024 12:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Eliminar Muestra y Resultado*/
CREATE PROCEDURE [dbo].[EliminarMuestraYResultado]
    @IdMuestra INT
AS
BEGIN
    DELETE FROM MuestraResultado
    WHERE IdMuestra = @IdMuestra;

    DELETE FROM Muestra
    WHERE IdMuestra = @IdMuestra;
END;
GO
/****** Object:  StoredProcedure [dbo].[EliminarPaciente]    Script Date: 22/11/2024 12:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*Eliminar paciente*/
CREATE PROCEDURE [dbo].[EliminarPaciente]
    @IdPaciente INT
AS
BEGIN
    DELETE FROM Paciente
    WHERE IdPaciente = @IdPaciente;
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertarHospital]    Script Date: 22/11/2024 12:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarHospital]
    @NombreHospital varchar(1000),
    @Email1 varchar(1000),
    @Email2 varchar(1000) = NULL,
    @Email3 varchar(1000) = NULL,
    @Email4 varchar(1000) = NULL,
    @Email5 varchar(1000) = NULL,
    @Referente1 varchar(1000),
    @Referente2 varchar(1000) = NULL,
    @Referente3 varchar(1000) = NULL,
    @Referente4 varchar(1000) = NULL,
    @Referente5 varchar(1000) = NULL,
    @Tel1 bigint,
    @Tel2 bigint = NULL,
    @Tel3 bigint = NULL,
    @Tel4 bigint = NULL,
    @Tel5 bigint = NULL,
    @Direccion varchar(1000),
    @Localidad varchar(1000),
    @Provincia varchar(1000),
    @Telefono int,
    @Responsable varchar(1000),
    @Servicio varchar(1000)
AS
BEGIN
    INSERT INTO Hospital (NombreHospital, Email1, Email2, Email3, Email4, Email5, Referente1, Referente2, Referente3, Referente4, Referente5, Tel1, Tel2, Tel3, Tel4, Tel5, Direccion, Localidad, Provincia, Telefono, Responsable, Servicio)
    VALUES (@NombreHospital, @Email1, @Email2, @Email3, @Email4, @Email5, @Referente1, @Referente2, @Referente3, @Referente4, @Referente5, @Tel1, @Tel2, @Tel3, @Tel4, @Tel5, @Direccion, @Localidad, @Provincia, @Telefono, @Responsable, @Servicio)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertarMuestra]    Script Date: 22/11/2024 12:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertarMuestra]
    @InstitucionNacimiento VARCHAR(1000),
    @IdHospitalMuestra INT,
    @ApellidoBebe VARCHAR(1000),
    @NombreBebe VARCHAR(1000),
    @FechaHoraNacimiento DATETIME,
    @FechaHoraExtraccion DATETIME,
    @Sexo VARCHAR(1000),
    @Alimentacion VARCHAR(1000),
    @FechaIngestaLeche DATETIME,
    @SemanasGestacion INT,
    @Peso INT,
    @CondicionRN VARCHAR(1000),
    @PatologiaBase VARCHAR(1000),
	@Patologia VARCHAR(1000),
    @Parto VARCHAR(1000),
    @EmbarazoMultiple BIT,
    @EmbarazoGemelar BIT,
    @ApellidoMama VARCHAR(1000),
    @NombreMama VARCHAR(1000),
    @Documento INT,
    @Domicilio VARCHAR(1000),
    @Localidad VARCHAR(1000),
    @Telefono INT,
    @LugarControlEmbarazo VARCHAR(1000),
    @Antibioticos BIT,
    @DesinfectantesYodados BIT,
    @Transfusion BIT,
    @FechaTransfusion DATETIME,
    @Dopamina BIT,
    @Dobutamina BIT,
    @CorticoidesMadre BIT,
    @CorticoidesBebe BIT,
    @Tiroidepatias BIT,
    @Otras VARCHAR(1000),
    @RepiteMuestra BIT,
    @Prematuro BIT,
    @MalaMuestra BIT,
    @ResultadoAlterado BIT,
    @Analitico INT,
    @Responsable VARCHAR(1000),
    @RolResponsable VARCHAR(1000),
    @FirmaSello VARCHAR(1000),
    @FechaEnvio DATETIME,
    @FechaLlegada DATETIME,
    @ObservacionesMuestra VARCHAR(1000)
AS
BEGIN
    -- Insertar en la tabla Muestra
    INSERT INTO [dbo].[Muestra] (
        InstitucionNacimiento, IdHospitalMuestra, ApellidoBebe, NombreBebe, 
        FechaHoraNacimiento, FechaHoraExtraccion, Sexo, Alimentacion, FechaIngestaLeche,
        SemanasGestacion, Peso, CondicionRN, PatologiaBase, Patologia, Parto, EmbarazoMultiple,
        EmbarazoGemelar, ApellidoMama, NombreMama, Documento, Domicilio, Localidad,
        Telefono, LugarControlEmbarazo, Antibioticos, DesinfectantesYodados, Transfusion,
        FechaTransfusion, Dopamina, Dobutamina, CorticoidesMadre, CorticoidesBebe,
        Tiroidepatias, Otras, RepiteMuestra, Prematuro, MalaMuestra, ResultadoAlterado,
        Analitico, Responsable, RolResponsable, FirmaSello, FechaEnvio, FechaLlegada, Observaciones
    )
    VALUES (
        @InstitucionNacimiento, @IdHospitalMuestra, @ApellidoBebe, @NombreBebe, 
        @FechaHoraNacimiento, @FechaHoraExtraccion, @Sexo, @Alimentacion, @FechaIngestaLeche,
        @SemanasGestacion, @Peso, @CondicionRN, @PatologiaBase, @Patologia, @Parto, @EmbarazoMultiple,
        @EmbarazoGemelar, @ApellidoMama, @NombreMama, @Documento, @Domicilio, @Localidad,
        @Telefono, @LugarControlEmbarazo, @Antibioticos, @DesinfectantesYodados, @Transfusion,
        @FechaTransfusion, @Dopamina, @Dobutamina, @CorticoidesMadre, @CorticoidesBebe,
        @Tiroidepatias, @Otras, @RepiteMuestra, @Prematuro, @MalaMuestra, @ResultadoAlterado,
        @Analitico, @Responsable, @RolResponsable, @FirmaSello, @FechaEnvio, @FechaLlegada, @ObservacionesMuestra
    );

    -- Obtener el IdMuestra insertado
    DECLARE @IdMuestra INT;
    SET @IdMuestra = SCOPE_IDENTITY();
	DECLARE @ObservacionesResultado VARCHAR(1000),
    @TshNeonatal VARCHAR(1000) = NULL,
    @MetodologiaTsh VARCHAR(1000) = NULL,
    @Fenilanina VARCHAR(1000) = NULL,
    @MetodologiaFenilanina VARCHAR(1000) = NULL,
    @IrtNeonatal VARCHAR(1000) = NULL,
    @MetodologiaIrt VARCHAR(1000) = NULL,
    @Galactosa VARCHAR(1000) = NULL,
    @MetodologiaGalactosa VARCHAR(1000) = NULL,
    @Hidroxiprogesterona VARCHAR(1000) = NULL,
    @MetodologiaHidro VARCHAR(1000) = NULL,
    @Biotinidasa VARCHAR(1000) = NULL,
    @MetodologiaBiotinidasa VARCHAR(1000) = NULL,
    @NormalidadTsh VARCHAR(1000) = NULL,
    @NormalidadFenilanina VARCHAR(1000) = NULL,
    @NormalidadIrt VARCHAR(1000) = NULL,
    @NormalidadGalactosa VARCHAR(1000) = NULL,
    @NormalidadHidro VARCHAR(1000) = NULL,
    @NormalidadBiotinidasa VARCHAR(1000) = NULL;

    -- Insertar en la tabla MuestraResultado
    INSERT INTO [dbo].[MuestraResultado] (
        IdMuestra, TshNeonatal, MetodologiaTsh, Fenilanina, MetodologiaFenilanina,
        IrtNeonatal, MetodologiaIrt, Galactosa, MetodologiaGalactosa, Hidroxiprogesterona,
        MetodologiaHidro, Biotinidasa, MetodologiaBiotinidasa, NormalidadTsh, NormalidadFenilanina,
        NormalidadIrt, NormalidadGalactosa, NormalidadHidro, NormalidadBiotinidasa, Observaciones
    )
    VALUES (
        @IdMuestra, @TshNeonatal, @MetodologiaTsh, @Fenilanina, @MetodologiaFenilanina,
        @IrtNeonatal, @MetodologiaIrt, @Galactosa, @MetodologiaGalactosa, @Hidroxiprogesterona,
        @MetodologiaHidro, @Biotinidasa, @MetodologiaBiotinidasa, @NormalidadTsh, @NormalidadFenilanina,
        @NormalidadIrt, @NormalidadGalactosa, @NormalidadHidro, @NormalidadBiotinidasa, @ObservacionesResultado
    );

END;
GO
/****** Object:  StoredProcedure [dbo].[InsertarPaciente]    Script Date: 22/11/2024 12:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*Insertar paciente*/
CREATE PROCEDURE [dbo].[InsertarPaciente]
    @IdMuestra INT,
    @Acta INT,
    @Hc INT,
    @IdGarrahan INT NULL,
	@FechaEnvio datetime,
	@FechaLlegada datetime NULL
AS
BEGIN
    INSERT INTO Paciente (IdMuestra, Acta, Hc, IdGarrahan, FechaLlegada, FechaEnvio)
    VALUES (@IdMuestra, @Acta, @Hc, @IdGarrahan, @FechaLlegada, @FechaLlegada);
END;

GO
/****** Object:  StoredProcedure [dbo].[InsertarResultado]    Script Date: 22/11/2024 12:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*----------------PERFILES----------------*/

/*Insertar muestra y resultados*/
CREATE PROCEDURE [dbo].[InsertarResultado]
    @InstitucionNacimiento VARCHAR(1000),
    @IdHospitalMuestra INT,
    @ApellidoBebe VARCHAR(1000),
    @NombreBebe VARCHAR(1000),
    @FechaHoraNacimiento DATETIME,
    @FechaHoraExtraccion DATETIME,
    @Sexo VARCHAR(1000),
    @Alimentacion VARCHAR(1000),
    @FechaIngestaLeche DATETIME,
    @SemanasGestacion INT,
    @Peso INT,
    @CondicionRN VARCHAR(1000),
    @PatologiaBase VARCHAR(1000),
    @Parto VARCHAR(1000),
    @EmbarazoMultiple BIT,
    @EmbarazoGemelar BIT,
    @ApellidoMama VARCHAR(1000),
    @NombreMama VARCHAR(1000),
    @Documento INT,
    @Domicilio VARCHAR(1000),
    @Localidad VARCHAR(1000),
    @Telefono INT,
    @LugarControlEmbarazo VARCHAR(1000),
    @Antibioticos BIT,
    @DesinfectantesYodados BIT,
    @Transfusion BIT,
    @FechaTransfusion DATETIME,
    @Dopamina BIT,
    @Dobutamina BIT,
    @CorticoidesMadre BIT,
    @CorticoidesBebe BIT,
    @Tiroidepatias BIT,
    @Otras VARCHAR(1000),
    @RepiteMuestra BIT,
    @Prematuro BIT,
    @MalaMuestra BIT,
    @ResultadoAlterado BIT,
    @Analitico INT,
    @Responsable VARCHAR(1000),
    @RolResponsable VARCHAR(1000),
    @FirmaSello VARCHAR(1000),
    @FechaEnvio DATETIME,
    @FechaLlegada DATETIME,
    @Observaciones VARCHAR(1000),
    @TshNeonatal VARCHAR(1000),
    @MetodologiaTsh VARCHAR(1000),
    @Fenilanina VARCHAR(1000),
    @MetodologiaFenilanina VARCHAR(1000),
    @IrtNeonatal VARCHAR(1000),
    @MetodologiaIrt VARCHAR(1000),
    @Galactosa VARCHAR(1000),
    @MetodologiaGalactosa VARCHAR(1000),
    @Hidroxiprogesterona VARCHAR(1000),
    @MetodologiaHidro VARCHAR(1000),
    @Biotinidasa VARCHAR(1000),
    @MetodologiaBiotinidasa VARCHAR(1000),
    @NormalidadTsh VARCHAR(1000),
    @NormalidadFenilanina VARCHAR(1000),
    @NormalidadIrt VARCHAR(1000),
    @NormalidadGalactosa VARCHAR(1000),
    @NormalidadHidro VARCHAR(1000),
    @NormalidadBiotinidasa VARCHAR(1000),
    @ObservacionesResultado VARCHAR(1000)
AS
BEGIN
    DECLARE @IdMuestra INT;

    INSERT INTO Muestra (
        InstitucionNacimiento, IdHospitalMuestra, ApellidoBebe, NombreBebe, FechaHoraNacimiento,
        FechaHoraExtraccion, Sexo, Alimentacion, FechaIngestaLeche, SemanasGestacion, Peso,
        CondicionRN, PatologiaBase, Parto, EmbarazoMultiple, EmbarazoGemelar, ApellidoMama,
        NombreMama, Documento, Domicilio, Localidad, Telefono, LugarControlEmbarazo, Antibioticos,
        DesinfectantesYodados, Transfusion, FechaTransfusion, Dopamina, Dobutamina, CorticoidesMadre,
        CorticoidesBebe, Tiroidepatias, Otras, RepiteMuestra, Prematuro, MalaMuestra, ResultadoAlterado,
        Analitico, Responsable, RolResponsable, FirmaSello, FechaEnvio, FechaLlegada, Observaciones
    )
    VALUES (
        @InstitucionNacimiento, @IdHospitalMuestra, @ApellidoBebe, @NombreBebe, @FechaHoraNacimiento,
        @FechaHoraExtraccion, @Sexo, @Alimentacion, @FechaIngestaLeche, @SemanasGestacion, @Peso,
        @CondicionRN, @PatologiaBase, @Parto, @EmbarazoMultiple, @EmbarazoGemelar, @ApellidoMama,
        @NombreMama, @Documento, @Domicilio, @Localidad, @Telefono, @LugarControlEmbarazo, @Antibioticos,
        @DesinfectantesYodados, @Transfusion, @FechaTransfusion, @Dopamina, @Dobutamina, @CorticoidesMadre,
        @CorticoidesBebe, @Tiroidepatias, @Otras, @RepiteMuestra, @Prematuro, @MalaMuestra, @ResultadoAlterado,
        @Analitico, @Responsable, @RolResponsable, @FirmaSello, @FechaEnvio, @FechaLlegada, @Observaciones
    );

    SET @IdMuestra = SCOPE_IDENTITY();

    INSERT INTO MuestraResultado (
        IdMuestra, TshNeonatal, MetodologiaTsh, Fenilanina, MetodologiaFenilanina, IrtNeonatal,
        MetodologiaIrt, Galactosa, MetodologiaGalactosa, Hidroxiprogesterona, MetodologiaHidro,
        Biotinidasa, MetodologiaBiotinidasa, NormalidadTsh, NormalidadFenilanina, NormalidadIrt,
        NormalidadGalactosa, NormalidadHidro, NormalidadBiotinidasa, Observaciones
    )
    VALUES (
        @IdMuestra, @TshNeonatal, @MetodologiaTsh, @Fenilanina, @MetodologiaFenilanina, @IrtNeonatal,
        @MetodologiaIrt, @Galactosa, @MetodologiaGalactosa, @Hidroxiprogesterona, @MetodologiaHidro,
        @Biotinidasa, @MetodologiaBiotinidasa, @NormalidadTsh, @NormalidadFenilanina, @NormalidadIrt,
        @NormalidadGalactosa, @NormalidadHidro, @NormalidadBiotinidasa, @ObservacionesResultado
    );
END;
GO
/****** Object:  StoredProcedure [dbo].[SeleccionarEmailsPorHospital]    Script Date: 22/11/2024 12:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SeleccionarEmailsPorHospital]
	@idHospital int
AS
BEGIN
	SELECT Email1, Email2, Email3, Email4, Email5 FROM Hospital WHERE IdHospital = @idHospital;
END
GO
/****** Object:  StoredProcedure [dbo].[SeleccionarHospitales]    Script Date: 22/11/2024 12:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*Seleccionar Hospitales*/
CREATE PROCEDURE [dbo].[SeleccionarHospitales]
AS
BEGIN
    SELECT *
    FROM Hospital
END
GO
/****** Object:  StoredProcedure [dbo].[SeleccionarHospitalPorId]    Script Date: 22/11/2024 12:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*Seleccionar Hospital por Id*/
CREATE PROCEDURE [dbo].[SeleccionarHospitalPorId]
    @IdHospital int
AS
BEGIN
    SELECT *
    FROM Hospital
    WHERE IdHospital = @IdHospital
END
GO
/****** Object:  StoredProcedure [dbo].[SeleccionarHospitalPorNombre]    Script Date: 22/11/2024 12:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*Seleccionar Hospital por Nombre*/
CREATE PROCEDURE [dbo].[SeleccionarHospitalPorNombre]
    @NombreHospital varchar(1000)
AS
BEGIN
    SELECT *
    FROM Hospital
    WHERE NombreHospital = @NombreHospital
END
GO
/****** Object:  StoredProcedure [dbo].[SeleccionarMuestraPorId]    Script Date: 22/11/2024 12:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*Seleccionar muestra por id*/
CREATE PROCEDURE [dbo].[SeleccionarMuestraPorId]
    @IdMuestra INT
AS
BEGIN
    SELECT *
    FROM Muestra
    WHERE IdMuestra = @IdMuestra;
END;
GO
/****** Object:  StoredProcedure [dbo].[SeleccionarMuestraPorResultado]    Script Date: 22/11/2024 12:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SeleccionarMuestraPorResultado]
    @IdMuestra INT
AS
BEGIN
	
    -- Definir la consulta principal
    SELECT *
    FROM Muestra
	WHERE
	IdMuestra = @IdMuestra 
	
END
GO
/****** Object:  StoredProcedure [dbo].[SeleccionarMuestraResultadoPorFiltro]    Script Date: 22/11/2024 12:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SeleccionarMuestraResultadoPorFiltro]
    @Provincia varchar(100) = null,
    @Hospital varchar(100) = null,
    @ApellidoBebe varchar(100) = null,
    @ApellidoMama varchar(100) = null,
    @FechaDesde datetime = null,
    @FechaHasta datetime = null,
    @OrdenadoPor varchar(100) = null
AS
BEGIN
	
    -- Definir la consulta principal
    SELECT *
    FROM MuestraResultado
	INNER JOIN Muestra ON Muestra.IdMuestra = MuestraResultado.IdMuestra
	WHERE
	Localidad = @provincia 
    AND IdHospitalMuestra = (SELECT IdHospital FROM Hospital WHERE NombreHospital = @hospital) 
    AND ApellidoBebe = @apellidoBebe 
    AND ApellidoMama = @apellidoMama 
    AND FechaEnvio >= @fechaDesde 
    AND FechaLlegada <= @fechaHasta
	ORDER BY
        CASE
            WHEN @ordenadoPor = 'ApellidoBebe' THEN Convert(varchar, ApellidoBebe)
            WHEN @ordenadoPor = 'ApellidoMama' THEN Convert(varchar, ApellidoMama)
            WHEN @ordenadoPor = 'FechaHoraExtraccion' THEN Convert(varchar, FechaHoraExtraccion)
            ELSE Convert(varchar, IdHospitalMuestra)
		END
		DESC
END
GO
/****** Object:  StoredProcedure [dbo].[SeleccionarPacientesPorFiltros]    Script Date: 22/11/2024 12:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Seleccionar paciente por filtrado*/
CREATE PROCEDURE [dbo].[SeleccionarPacientesPorFiltros]
    @Provincia VARCHAR(1000),
    @Hospital VARCHAR(1000),
    @Apellido VARCHAR(1000),
    @Nombre VARCHAR(1000),
    @FechaRegistroDesde DATETIME,
    @FechaRegistroHasta DATETIME
AS
BEGIN
    SELECT p.*
    FROM Paciente p
    INNER JOIN Muestra m ON p.IdMuestra = m.IdMuestra
    INNER JOIN Hospital h ON m.IdHospitalMuestra = h.IdHospital
    WHERE (h.Provincia = @Provincia OR @Provincia = '')
        AND (h.NombreHospital = @Hospital OR @Hospital = '')
        AND (m.ApellidoBebe = @Apellido OR @Apellido = '')
        AND (m.NombreBebe = @Nombre OR @Nombre = '')
        AND (m.FechaHoraExtraccion BETWEEN @FechaRegistroDesde AND @FechaRegistroHasta);
END;
GO
/****** Object:  StoredProcedure [dbo].[SeleccionarPerfiles]    Script Date: 22/11/2024 12:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SeleccionarPerfiles]

AS
BEGIN
    SELECT *
    FROM Perfil
END;
GO
/****** Object:  StoredProcedure [dbo].[SeleccionarPerfilPorId]    Script Date: 22/11/2024 12:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SeleccionarPerfilPorId]
    @IdPerfil INT
AS
BEGIN
    SELECT *
    FROM Perfil
    WHERE IdPerfil = @IdPerfil
END;
GO
/****** Object:  StoredProcedure [dbo].[SeleccionarReferentesPorHospital]    Script Date: 22/11/2024 12:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SeleccionarReferentesPorHospital]
	@idHospital int
AS
BEGIN
	SELECT Referente1, Referente2, Referente3, Referente4, Referente5 FROM Hospital WHERE IdHospital = @idHospital;
END
GO
/****** Object:  StoredProcedure [dbo].[ValidarUsuario]    Script Date: 22/11/2024 12:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ValidarUsuario]
@Email varchar(1000),
@Contrasena varchar(15)
AS
BEGIN
	SELECT * FROM Perfil
	WHERE Email = @Email  AND Contrasena = @Contrasena;
END
GO
USE [master]
GO
ALTER DATABASE [MedLife] SET  READ_WRITE 
GO
