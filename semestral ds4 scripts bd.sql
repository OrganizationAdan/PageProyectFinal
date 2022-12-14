USE [master]
GO
/****** Object:  Database [veterinaria_Nelo]    Script Date: 11/29/2022 8:39:52 p. m. ******/
CREATE DATABASE [veterinaria_Nelo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'veterinaria_Nelo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\veterinaria_Nelo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'veterinaria_Nelo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\veterinaria_Nelo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [veterinaria_Nelo] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [veterinaria_Nelo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [veterinaria_Nelo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [veterinaria_Nelo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [veterinaria_Nelo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [veterinaria_Nelo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [veterinaria_Nelo] SET ARITHABORT OFF 
GO
ALTER DATABASE [veterinaria_Nelo] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [veterinaria_Nelo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [veterinaria_Nelo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [veterinaria_Nelo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [veterinaria_Nelo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [veterinaria_Nelo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [veterinaria_Nelo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [veterinaria_Nelo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [veterinaria_Nelo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [veterinaria_Nelo] SET  ENABLE_BROKER 
GO
ALTER DATABASE [veterinaria_Nelo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [veterinaria_Nelo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [veterinaria_Nelo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [veterinaria_Nelo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [veterinaria_Nelo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [veterinaria_Nelo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [veterinaria_Nelo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [veterinaria_Nelo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [veterinaria_Nelo] SET  MULTI_USER 
GO
ALTER DATABASE [veterinaria_Nelo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [veterinaria_Nelo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [veterinaria_Nelo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [veterinaria_Nelo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [veterinaria_Nelo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [veterinaria_Nelo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [veterinaria_Nelo] SET QUERY_STORE = OFF
GO
USE [veterinaria_Nelo]
GO
/****** Object:  Table [dbo].[personal]    Script Date: 11/29/2022 8:39:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personal](
	[p_cedula] [varchar](13) NOT NULL,
	[p_nombre] [varchar](10) NULL,
	[p_apellido] [varchar](10) NULL,
	[direccion] [varchar](50) NULL,
	[telefono] [varchar](9) NULL,
	[salario] [decimal](10, 2) NULL,
	[cargo] [varchar](50) NULL,
	[cod_sucursal] [varchar](5) NULL,
 CONSTRAINT [personal_p_cedula_pk] PRIMARY KEY CLUSTERED 
(
	[p_cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[servicios]    Script Date: 11/29/2022 8:39:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[servicios](
	[cod_servicios] [varchar](2) NOT NULL,
	[servicios] [varchar](50) NULL,
	[costo] [decimal](5, 2) NULL,
 CONSTRAINT [servicios_cod_servicios_pk] PRIMARY KEY CLUSTERED 
(
	[cod_servicios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mascota]    Script Date: 11/29/2022 8:39:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mascota](
	[cod_mascota] [int] IDENTITY(1,1) NOT NULL,
	[nombre_mascota] [varchar](20) NULL,
	[peso_kg] [decimal](5, 2) NULL,
	[tamaño] [varchar](10) NULL,
	[fecha_nacimiento] [date] NULL,
	[genero] [char](1) NULL,
	[cl_cedula] [varchar](13) NULL,
	[cod_raza] [int] NULL,
	[foto] [varchar](200) NULL,
 CONSTRAINT [mascota_cod_mascota_pk] PRIMARY KEY CLUSTERED 
(
	[cod_mascota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[servicios_salud]    Script Date: 11/29/2022 8:39:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[servicios_salud](
	[cod_servicios] [varchar](2) NOT NULL,
	[cod_mascota] [int] NOT NULL,
	[p_cedula] [varchar](13) NULL,
	[fecha] [date] NULL,
	[diagnostico] [varchar](30) NULL,
	[tratamiento] [varchar](30) NULL,
 CONSTRAINT [servicios_salud_cod_servicios_cod_mascota_pk] PRIMARY KEY CLUSTERED 
(
	[cod_servicios] ASC,
	[cod_mascota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[servicios_estetica]    Script Date: 11/29/2022 8:39:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[servicios_estetica](
	[cod_servicios] [varchar](2) NOT NULL,
	[cod_mascota] [int] NOT NULL,
	[p_cedula] [varchar](13) NULL,
	[fecha] [date] NULL,
 CONSTRAINT [servicios_estetica_cod_servicios_cod_mascota_pk] PRIMARY KEY CLUSTERED 
(
	[cod_servicios] ASC,
	[cod_mascota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[servicios_atendidos]    Script Date: 11/29/2022 8:39:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[servicios_atendidos]
as
select nombre_mascota, servicios ,
p_nombre +' '+p_apellido as nombre, fecha, foto
from servicios_estetica as se
join servicios as s
on s.cod_servicios = se.cod_servicios
join Mascota as m
on m.cod_mascota = se.cod_mascota
join personal as p
on p.p_cedula= se.p_cedula

union

select nombre_mascota, servicios ,
p_nombre +' '+p_apellido as nombre, fecha,foto
from servicios_salud as se
join servicios as s
on s.cod_servicios = se.cod_servicios
join Mascota as m
on m.cod_mascota = se.cod_mascota
join personal as p
on p.p_cedula= se.p_cedula
GO
/****** Object:  Table [dbo].[Animal]    Script Date: 11/29/2022 8:39:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animal](
	[cod_animal] [char](2) NOT NULL,
	[nombre_animal] [varchar](20) NULL,
 CONSTRAINT [Animal_cod_animal_pk] PRIMARY KEY CLUSTERED 
(
	[cod_animal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 11/29/2022 8:39:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[cl_cedula] [varchar](13) NOT NULL,
	[cl_nombre] [varchar](15) NULL,
	[cl_apellido] [varchar](15) NULL,
	[cl_direccion] [varchar](30) NULL,
	[cl_correo] [varchar](30) NULL,
 CONSTRAINT [clientes_cl_cedula_pk] PRIMARY KEY CLUSTERED 
(
	[cl_cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[equipo]    Script Date: 11/29/2022 8:39:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[equipo](
	[equipo_id] [int] IDENTITY(1,1) NOT NULL,
	[e_nombre] [varchar](20) NULL,
	[e_alias] [varchar](20) NULL,
	[e_desc] [varchar](400) NULL,
	[e_foto] [varchar](200) NULL,
 CONSTRAINT [equipo_equipo_id_pk] PRIMARY KEY CLUSTERED 
(
	[equipo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mascota_celos]    Script Date: 11/29/2022 8:39:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mascota_celos](
	[cod_mascota] [int] NOT NULL,
	[fecha_celo] [date] NOT NULL,
 CONSTRAINT [Mascota_celos_cod_mascota_pk] PRIMARY KEY CLUSTERED 
(
	[cod_mascota] ASC,
	[fecha_celo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[perros]    Script Date: 11/29/2022 8:39:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[perros](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[raza] [varchar](30) NULL,
	[foto] [varchar](300) NULL,
	[descripcion] [varchar](300) NULL,
 CONSTRAINT [perros_id_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Raza]    Script Date: 11/29/2022 8:39:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Raza](
	[cod_raza] [int] IDENTITY(1000,1) NOT NULL,
	[cod_animal] [char](2) NULL,
	[Raza] [varchar](35) NOT NULL,
 CONSTRAINT [raza_cod_raza_PK] PRIMARY KEY CLUSTERED 
(
	[cod_raza] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[registro]    Script Date: 11/29/2022 8:39:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[registro](
	[correo] [varchar](40) NOT NULL,
	[usuario] [varchar](40) NULL,
	[contrasenia] [varchar](20) NULL,
 CONSTRAINT [registro_correo_pk] PRIMARY KEY CLUSTERED 
(
	[correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sucursal]    Script Date: 11/29/2022 8:39:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sucursal](
	[cod_sucursal] [varchar](5) NOT NULL,
	[ubicacion] [varchar](100) NULL,
	[nombre] [varchar](25) NULL,
 CONSTRAINT [sucursal_cod_sucursal_pk] PRIMARY KEY CLUSTERED 
(
	[cod_sucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tabal_s]    Script Date: 11/29/2022 8:39:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tabal_s](
	[nombre_mascota] [varchar](20) NULL,
	[servicios] [varchar](50) NULL,
	[nombre] [varchar](21) NULL,
	[fecha] [date] NULL,
	[foto] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[telefono_cl]    Script Date: 11/29/2022 8:39:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[telefono_cl](
	[cl_cedula] [varchar](13) NOT NULL,
	[telefono] [varchar](9) NOT NULL,
 CONSTRAINT [telefono_cl_cl_cedula_pk] PRIMARY KEY CLUSTERED 
(
	[cl_cedula] ASC,
	[telefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Mascota]  WITH CHECK ADD  CONSTRAINT [mascota_cl_cedula_fk] FOREIGN KEY([cl_cedula])
REFERENCES [dbo].[clientes] ([cl_cedula])
GO
ALTER TABLE [dbo].[Mascota] CHECK CONSTRAINT [mascota_cl_cedula_fk]
GO
ALTER TABLE [dbo].[Mascota]  WITH CHECK ADD  CONSTRAINT [mascota_cod_raza_fk] FOREIGN KEY([cod_raza])
REFERENCES [dbo].[Raza] ([cod_raza])
GO
ALTER TABLE [dbo].[Mascota] CHECK CONSTRAINT [mascota_cod_raza_fk]
GO
ALTER TABLE [dbo].[Mascota_celos]  WITH CHECK ADD  CONSTRAINT [Mascota_celos_cod_mascota_fk] FOREIGN KEY([cod_mascota])
REFERENCES [dbo].[Mascota] ([cod_mascota])
GO
ALTER TABLE [dbo].[Mascota_celos] CHECK CONSTRAINT [Mascota_celos_cod_mascota_fk]
GO
ALTER TABLE [dbo].[personal]  WITH CHECK ADD  CONSTRAINT [personal_cod_sucursal_fk] FOREIGN KEY([cod_sucursal])
REFERENCES [dbo].[sucursal] ([cod_sucursal])
GO
ALTER TABLE [dbo].[personal] CHECK CONSTRAINT [personal_cod_sucursal_fk]
GO
ALTER TABLE [dbo].[Raza]  WITH CHECK ADD  CONSTRAINT [raza_cod_animal_FK] FOREIGN KEY([cod_animal])
REFERENCES [dbo].[Animal] ([cod_animal])
GO
ALTER TABLE [dbo].[Raza] CHECK CONSTRAINT [raza_cod_animal_FK]
GO
ALTER TABLE [dbo].[servicios_estetica]  WITH CHECK ADD  CONSTRAINT [servicios_estetica_cod_mascota_fk] FOREIGN KEY([cod_mascota])
REFERENCES [dbo].[Mascota] ([cod_mascota])
GO
ALTER TABLE [dbo].[servicios_estetica] CHECK CONSTRAINT [servicios_estetica_cod_mascota_fk]
GO
ALTER TABLE [dbo].[servicios_estetica]  WITH CHECK ADD  CONSTRAINT [servicios_estetica_cod_servicio_fk] FOREIGN KEY([cod_servicios])
REFERENCES [dbo].[servicios] ([cod_servicios])
GO
ALTER TABLE [dbo].[servicios_estetica] CHECK CONSTRAINT [servicios_estetica_cod_servicio_fk]
GO
ALTER TABLE [dbo].[servicios_estetica]  WITH CHECK ADD  CONSTRAINT [servicios_estetica_p_cedula_fk] FOREIGN KEY([p_cedula])
REFERENCES [dbo].[personal] ([p_cedula])
GO
ALTER TABLE [dbo].[servicios_estetica] CHECK CONSTRAINT [servicios_estetica_p_cedula_fk]
GO
ALTER TABLE [dbo].[servicios_salud]  WITH CHECK ADD  CONSTRAINT [servicios_salud_cod_mascota_fk] FOREIGN KEY([cod_mascota])
REFERENCES [dbo].[Mascota] ([cod_mascota])
GO
ALTER TABLE [dbo].[servicios_salud] CHECK CONSTRAINT [servicios_salud_cod_mascota_fk]
GO
ALTER TABLE [dbo].[servicios_salud]  WITH CHECK ADD  CONSTRAINT [servicios_salud_cod_servicio_fk] FOREIGN KEY([cod_servicios])
REFERENCES [dbo].[servicios] ([cod_servicios])
GO
ALTER TABLE [dbo].[servicios_salud] CHECK CONSTRAINT [servicios_salud_cod_servicio_fk]
GO
ALTER TABLE [dbo].[servicios_salud]  WITH CHECK ADD  CONSTRAINT [servicios_salud_p_cedula_fk] FOREIGN KEY([p_cedula])
REFERENCES [dbo].[personal] ([p_cedula])
GO
ALTER TABLE [dbo].[servicios_salud] CHECK CONSTRAINT [servicios_salud_p_cedula_fk]
GO
ALTER TABLE [dbo].[telefono_cl]  WITH CHECK ADD  CONSTRAINT [telefono_cl_cl_cedula_fk] FOREIGN KEY([cl_cedula])
REFERENCES [dbo].[clientes] ([cl_cedula])
GO
ALTER TABLE [dbo].[telefono_cl] CHECK CONSTRAINT [telefono_cl_cl_cedula_fk]
GO
ALTER TABLE [dbo].[clientes]  WITH CHECK ADD  CONSTRAINT [clientes_cl_cedula_ck] CHECK  (([cl_cedula] like '[0][1-9]-[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9][0-9]' OR [cl_cedula] like '[1][0-3]-[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9][0-9]' OR [cl_cedula] like '[0][A-Z]-[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9][0-9]' OR [cl_cedula] like '[A-Z][A-Z]-[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[clientes] CHECK CONSTRAINT [clientes_cl_cedula_ck]
GO
ALTER TABLE [dbo].[clientes]  WITH CHECK ADD  CONSTRAINT [clientes_cl_correo_ck] CHECK  (([cl_correo] like '%@%'))
GO
ALTER TABLE [dbo].[clientes] CHECK CONSTRAINT [clientes_cl_correo_ck]
GO
ALTER TABLE [dbo].[Mascota]  WITH CHECK ADD  CONSTRAINT [mascota_genero_ck] CHECK  (([genero]='H' OR [genero]='M'))
GO
ALTER TABLE [dbo].[Mascota] CHECK CONSTRAINT [mascota_genero_ck]
GO
ALTER TABLE [dbo].[Mascota]  WITH CHECK ADD  CONSTRAINT [mascota_peso_kg_ck] CHECK  (([peso_kg]>(0)))
GO
ALTER TABLE [dbo].[Mascota] CHECK CONSTRAINT [mascota_peso_kg_ck]
GO
ALTER TABLE [dbo].[Mascota]  WITH CHECK ADD  CONSTRAINT [mascota_tamaño_ck] CHECK  (([tamaño]='Grande' OR [tamaño]='Pequeño' OR [tamaño]='Mini'))
GO
ALTER TABLE [dbo].[Mascota] CHECK CONSTRAINT [mascota_tamaño_ck]
GO
ALTER TABLE [dbo].[personal]  WITH CHECK ADD  CONSTRAINT [personal_p_cedula_ck] CHECK  (([p_cedula] like '[0][1-9]-[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9][0-9]' OR [p_cedula] like '[1][0-3]-[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9][0-9]' OR [p_cedula] like 'E-[1-9]-[0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[personal] CHECK CONSTRAINT [personal_p_cedula_ck]
GO
ALTER TABLE [dbo].[personal]  WITH CHECK ADD  CONSTRAINT [personal_salario_ck] CHECK  (([salario]>(0)))
GO
ALTER TABLE [dbo].[personal] CHECK CONSTRAINT [personal_salario_ck]
GO
ALTER TABLE [dbo].[personal]  WITH CHECK ADD  CONSTRAINT [personal_telefono_ck] CHECK  (([telefono] like '[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]' OR [telefono] like '[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[personal] CHECK CONSTRAINT [personal_telefono_ck]
GO
ALTER TABLE [dbo].[servicios]  WITH CHECK ADD  CONSTRAINT [servicios_cod_servicios_ck] CHECK  (([cod_servicios] like '[S][1-9]' OR [cod_servicios] like '[E][1-9]'))
GO
ALTER TABLE [dbo].[servicios] CHECK CONSTRAINT [servicios_cod_servicios_ck]
GO
ALTER TABLE [dbo].[servicios]  WITH CHECK ADD  CONSTRAINT [servicios_costo_ck] CHECK  (([costo]>(0)))
GO
ALTER TABLE [dbo].[servicios] CHECK CONSTRAINT [servicios_costo_ck]
GO
ALTER TABLE [dbo].[sucursal]  WITH CHECK ADD  CONSTRAINT [sucursal_cod_sucursal_ck] CHECK  (([cod_sucursal] like '[0][1-9]-S[1-9]' OR [cod_sucursal] like '[1][0-3]-S[1-9]'))
GO
ALTER TABLE [dbo].[sucursal] CHECK CONSTRAINT [sucursal_cod_sucursal_ck]
GO
ALTER TABLE [dbo].[telefono_cl]  WITH CHECK ADD  CONSTRAINT [telefono_cl_cl_cedula_ck] CHECK  (([telefono] like '[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]' OR [telefono] like '[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[telefono_cl] CHECK CONSTRAINT [telefono_cl_cl_cedula_ck]
GO
/****** Object:  StoredProcedure [dbo].[buscar_consultas]    Script Date: 11/29/2022 8:39:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[buscar_consultas]
@fecha1 date, @fecha2 date
as
select c.cl_nombre +' '+ c.cl_apellido as nom, c.cl_correo, m.cod_raza, m.nombre_mascota, fecha
into #tabla_temp
from servicios_salud as ss
full join Mascota as m
on ss.cod_mascota = m.cod_mascota
full join clientes as c
on m.cl_cedula = c.cl_cedula
where fecha >= @fecha1 and fecha <= @fecha2

union all

select c.cl_nombre +' '+ c.cl_apellido as nom, c.cl_correo, m.cod_raza, m.nombre_mascota, fecha
from servicios_estetica as se
full join Mascota as m
on se.cod_mascota = m.cod_mascota
full join clientes as c
on m.cl_cedula = c.cl_cedula
where fecha >= @fecha1 and fecha <= @fecha2
order by nom

DECLARE buscar_consultas_cursor CURSOR
for select * from #tabla_temp

open buscar_consultas_cursor

declare @codigoanimal varchar(20),
		@fecha date,
		@nombre varchar(40),
		@mascotanom varchar(40),
		@correo varchar(40),
		@contador int,
		@nombreant varchar(40),
		@contadortotal int

fetch next from buscar_consultas_cursor into @nombre, @correo, @codigoanimal, @mascotanom, @fecha
set @nombreant = @nombre
set @contador = 0
set @contadortotal = 0

while @@FETCH_STATUS = 0
begin

	select @contador = COUNT(nom) from #tabla_temp
	where nom = @nombre
	print ' '
	print '------------------------------------------------'
	print @nombre +'      ' + @correo + '     '+CAST(@contador as varchar)
	print '------------------------------------------------'
	set @nombreant = @nombre
	set @contadortotal += @contador

	while @nombre = @nombreant and @@FETCH_STATUS = 0
	begin
		print @codigoanimal +'  ' + @mascotanom +'  '+ CAST(@fecha  as varchar(20))
		set @nombreant = @nombre
		fetch next from buscar_consultas_cursor into @nombre, @correo, @codigoanimal, @mascotanom,@fecha
	end
	
end
print '    '
print 'TOTAL DE MASCOTAS ATENDIDAS uwu : '+ CAST(@contadortotal as varchar)

close buscar_consultas_cursor
deallocate buscar_consultas_cursor
drop table #tabla_temp
return
GO
/****** Object:  StoredProcedure [dbo].[buscar_raza]    Script Date: 11/29/2022 8:39:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROBLEMA 1
CREATE PROC [dbo].[buscar_raza] 
@animalDeseado varchar(20)
as

declare	@codigoAnimal varchar(2)

select @codigoAnimal = cod_animal
from Animal
where nombre_animal = @animalDeseado

select Raza
from raza
where cod_animal = @codigoAnimal

return

GO
USE [master]
GO
ALTER DATABASE [veterinaria_Nelo] SET  READ_WRITE 
GO
