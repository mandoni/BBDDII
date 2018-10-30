CREATE DATABASE [PRegistroAcademico] ON PRIMARY
(NAME = 'PRegistroAcademicoData', FILENAME = 'C:\BBDD\DATA\RegistroAcademico_Data_P.mdf', SIZE = 1024MB, FILEGROWTH = 128MB)
LOG ON 
(NAME = 'PRegistroAcademicoLogs', FILENAME = 'C:\BBDD\LOGS\RegistroAcademio_Logs_P.ldf', SIZE = 1024MB, FILEGROWTH = 128MB )
GO
--==========================================================================

USE [PRegistroAcademico]
GO

--==========================================================================
IF OBJECT_ID('dbo.Estudiante') IS NOT NULL
	DROP TABLE DBO.ESTUDIANTE
CREATE TABLE Estudiante (
	carnet int NOT NULL, 
	nombres varchar(50) NOT NULL,
	apellidos varchar (50) not null)

ALTER TABLE estudiante add constraint [PK_Estudiante] PRIMARY KEY (Carnet)
--==========================================================================
IF OBJECT_ID('dbo.CuentaCorriente') IS NOT NULL
	DROP TABLE DBO.CuentaCorriente
CREATE TABLE CuentaCorriente (
	id_cuentaCorriente int NOT NULL, 
	carnet int NOT NULL,
	saldo decimal (6, 2) NOT NULL,
	mora bit NOT NULL 
	)

ALTER TABLE CuentaCorriente ADD CONSTRAINT [PK_CuentaCorriente] PRIMARY KEY (id_cuentaCorriente)
ALTER TABLE CuentaCorriente ADD CONSTRAINT [FK_cuenta_de_estudiante] FOREIGN KEY (carnet) REFERENCES [ESTUDIANTE](CARNET)
--============================================================================
IF OBJECT_ID('dbo.Facultad') IS NOT NULL
	DROP TABLE DBO.Facultad
CREATE TABLE Facultad (
	id_facultad int NOT NULL,
	nombre varchar(50) NOT NULL
	)
ALTER TABLE Facultad ADD CONSTRAINT [PK_Facultad] PRIMARY KEY (id_facultad)
--============================================================================
IF OBJECT_ID('dbo.Carrera') IS NOT NULL
	DROP TABLE DBO.Carrera
CREATE TABLE Carrera (
	id_carrera int NOT NULL,
	id_facultad int NOT NULL,
	nombre varchar(50) not null 
	)
ALTER TABLE CARRERA ADD CONSTRAINT [PK_carrera] PRIMARY KEY (ID_CARRERA)
ALTER TABLE CARRERA ADD CONSTRAINT [FK_carreraFacultad] FOREIGN KEY (ID_FACULTAD) REFERENCES [FACULTAD](ID_FACULTAD)
--============================================================================
IF OBjecT_ID('dbo.Ciclo') IS NOT NULL
	DROP TABLE DBO.Ciclo
CREATE TABLE Ciclo (
	id_ciclo int not null,
	nombre varchar (25) not null,
	inicio datetime not null,
	fin datetime not null
	)
ALTER TABLE CICLO ADD CONSTRAINT [PK_ciclo] PRIMARY KEY (ID_CICLO)
--============================================================================
IF OBJECT_ID('dbo.HorarioVIP') IS NOT NULL
	DROP TABLE DBO.HorarioVIP
CREATE TABLE HorarioVIP (
	id_horario int not null,
	id_facultad int not null,
	id_ciclo int not null
	)
ALTER TABLE HorarioVIP ADD CONSTRAINT [PK_HorarioVIP] PRIMARY KEY (ID_HORARIO) 
ALTER TABLE HorarioVIP ADD CONSTRAINT [FK_horarioFacultad] FOREIGN KEY (ID_FACULTAD) REFERENCES [FACULTAD](ID_FACULTAD)
ALTER TABLE HorarioVIP ADD CONSTRAINT [FK_cicloHorario] FOREIGN KEY (ID_CICLO) REFERENCES [CICLO](ID_CICLO)
--============================================================================
IF OBJECT_ID('dbo.Curso') IS NOT NULL
	DROP TABLE DBO.Curso
CREATE TABLE Curso (
	id_curso int NOT NULL, 
	Nombre varchar(50) NOT NULL, 
	laboratorio bit not null)
ALTER TABLE curso add constraint [PK_Curso] PRIMARY KEY (id_curso)
--============================================================================
IF OBJECT_ID('dbo.CursoCarrera') IS NOT NULL
	DROP TABLE DBO.CursoCarrera
CREATE TABLE CursoCarrera (
	id_cursoCarrera int NOT NULL, 
	id_carrera int not null,
	nombre varchar(50) NOT NULL)
ALTER TABLE CURSOCARRERA add constraint [PK_CursoCarrera] PRIMARY KEY (id_cursoCarrera)
--========================================================================================================================================================
--========================================================================================================================================================
--========================================================================================================================================================
--========================================================================================================================================================
IF OBJECT_ID('dbo.CuentaCorriente') IS NOT NULL
	DROP TABLE DBO.CuentaCorriente
CREATE TABLE CuentaCorriente (
	id_cuentaCorriente int NOT NULL, 
	carnet int NOT NULL,
	saldo decimal (6, 2) NOT NULL,
	mora bit NOT NULL 
	)

ALTER TABLE CuentaCorriente ADD CONSTRAINT [PK_CuentaCorriente] PRIMARY KEY (id_cuentaCorriente)
ALTER TABLE CuentaCorriente ADD CONSTRAINT [FK_cuenta_de_estudiante] FOREIGN KEY (carnet) REFERENCES [ESTUDIANTE](CARNET)
--============================================================================
IF OBJECT_ID('dbo.Credenciales') IS NOT NULL
	DROP TABLE DBO.Credenciales
CREATE TABLE Credenciales (
	id_cuentaCorriente int NOT NULL, 
	carnet int NOT NULL,
	contrasena varchar (100) NOT NULL 
	)

ALTER TABLE CuentaCorriente ADD CONSTRAINT [PK_CuentaCorriente] PRIMARY KEY (id_cuentaCorriente)
ALTER TABLE CuentaCorriente ADD CONSTRAINT [FK_cuenta_de_estudiante] FOREIGN KEY (carnet) REFERENCES [ESTUDIANTE](CARNET)
--============================================================================

--============================================================================
--============================================================================
--============================================================================
--============================================================================
--============================================================================