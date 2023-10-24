/*
*
Empresa        :  Municipalidad Distrital de La Esperanza
Software       :  Sistema de Consultas de Transportes
DBMS           :  SQL Server
Base de Datos  :  INCIDENCIAS
Script         :  creacion de base de datos
*
*/


-- ======================================================
-- CREA LA BASE DE DATOS
-- ======================================================

USE master;
GO

IF( NOT EXISTS ( SELECT 1 FROM sys.sysdatabases WHERE name='INCIDENCIAS' ) )
BEGIN
	CREATE DATABASE INCIDENCIAS;
END;
GO

USE INCIDENCIAS;
GO

-- ======================================================
-- ELIMINA TABLA
-- ======================================================

IF( EXISTS ( SELECT 1 FROM sys.sysobjects 
	WHERE name='ROL' and xtype = 'u') )
BEGIN
	DROP TABLE dbo.EMPLEADO;
END;
GO

IF( EXISTS ( SELECT 1 FROM sys.sysobjects 
	WHERE name='PERSONA' and xtype = 'u') )
BEGIN
	DROP TABLE dbo.PAGO;
END;
GO

IF( EXISTS ( SELECT 1 FROM sys.sysobjects 
	WHERE name='USUARIO' and xtype = 'u') )
BEGIN
	DROP TABLE dbo.MATRICULA;
END;
GO

IF( EXISTS ( SELECT 1 FROM sys.sysobjects 
	WHERE name='ROL_USUARIO' and xtype = 'u') )
BEGIN
	DROP TABLE dbo.CURSO;
END;
GO

IF( EXISTS ( SELECT 1 FROM sys.sysobjects 
	WHERE name='AREA' and xtype = 'u') )
BEGIN
	DROP TABLE dbo.CURSO;
END;
GO

IF( EXISTS ( SELECT 1 FROM sys.sysobjects 
	WHERE name='PRIORIDAD' and xtype = 'u') )
BEGIN
	DROP TABLE dbo.ALUMNO;
END;
GO

IF( EXISTS ( SELECT 1 FROM sys.sysobjects 
	WHERE name='CATEGORIA' and xtype = 'u') )
BEGIN
	DROP TABLE dbo.ALUMNO;
END;
GO

IF( EXISTS ( SELECT 1 FROM sys.sysobjects 
	WHERE name='INCIDENCIA' and xtype = 'u') )
BEGIN
	DROP TABLE dbo.ALUMNO;
END;
GO

IF( EXISTS ( SELECT 1 FROM sys.sysobjects 
	WHERE name='CIERRE' and xtype = 'u') )
BEGIN
	DROP TABLE dbo.ALUMNO;
END;
GO

-- ======================================================
-- CREACION TABLA ROL
-- ======================================================

CREATE TABLE dbo.ROL
(
	ROL_codigo INT IDENTITY(1,1),
	ROL_nombre VARCHAR(15) NOT NULL,
	CONSTRAINT pk_ROL_codigo PRIMARY KEY(ROL_codigo)
);
GO

INSERT INTO dbo.ROL(ROL_nombre) VALUES ('Administrador');
INSERT INTO dbo.ROL(ROL_nombre) VALUES ('Trabajador');

CREATE TABLE dbo.PERSONA 
(
	PER_codigo INT IDENTITY(1,1),
	PER_dni CHAR(8) NOT NULL,
	PER_nombres VARCHAR(20) NOT NULL,
	PER_apellidoPaterno VARCHAR(15) NOT NULL,
	PER_apellidoMaterno VARCHAR(15) NOT NULL,
	PER_celular CHAR(9) NULL,
	PER_email VARCHAR(45) NOT NULL,
	CONSTRAINT pk_PER_codigo PRIMARY KEY (PER_codigo),
	CONSTRAINT uq_PER_dni UNIQUE (PER_dni),
	CONSTRAINT PER_celular UNIQUE (PER_celular),
	CONSTRAINT PER_email UNIQUE (PER_email)
);
GO



CREATE TABLE dbo.USUARIO
(
	USU_codigo INT IDENTITY(1,1),
	USU_usuario VARCHAR(15) NOT NULL,
	USU_password VARCHAR(15) NOT NULL,
	USU_estado VARCHAR(15) NOT NULL,
	PER_codigo INT,
	CONSTRAINT pk_USU_codigo PRIMARY KEY (USU_codigo),
	CONSTRAINT uq_USU_usuario UNIQUE (USU_usuario),
	CONSTRAINT fk_PERSONA_USUARIO FOREIGN KEY (PER_codigo)
	REFERENCES dbo.PERSONA (PER_codigo)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
);
GO

CREATE TABLE dbo.ROL_USUARIO
(
	ROL_codigo INT,
	USU_codigo INT,
	CONSTRAINT pfk_ROL_ROL_USUARIO FOREIGN KEY (ROL_codigo)
	REFERENCES dbo.ROL (ROL_codigo)
		ON DELETE NO ACTION
		ON UPDATE CASCADE,
	CONSTRAINT pfk_USUARIO_ROL_USUARIO FOREIGN KEY (USU_codigo)
	REFERENCES dbo.USUARIO (USU_codigo)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
);
GO

CREATE TABLE dbo.AREA
(
	ARE_codigo INT IDENTITY(1,1),
	ARE_nombre VARCHAR(100) NOT NULL,
	CONSTRAINT pk_ARE_codigo PRIMARY KEY(ARE_codigo),
	CONSTRAINT uq_ARE_nombre UNIQUE(ARE_nombre)
);
GO

CREATE TABLE dbo.PRIORIDAD
(
	PRI_codigo INT IDENTITY(1,1),
	PRI_descripcion VARCHAR(15) NOT NULL,
	CONSTRAINT pk_PRI_codigo PRIMARY KEY(PRI_codigo),
	CONSTRAINT uq_PRI_descripcion UNIQUE (PRI_descripcion)
);
GO

CREATE TABLE dbo.CATEGORIA
(
	CAT_codigo INT IDENTITY(1,1),
	CAT_descripcion VARCHAR(20) NOT NULL,
	CONSTRAINT pk_CAT_codigo PRIMARY KEY(CAT_codigo),
	CONSTRAINT uq_CAT_descripcion UNIQUE (CAT_descripcion)
);
GO

CREATE TABLE dbo.INCIDENCIA
(
	INC_codigo INT IDENTITY(1,1),
	INC_fecha DATE NOT NULL,
	INC_asunto VARCHAR(500) NOT NULL,
	INC_codigoPatrimonial VARCHAR(50) NOT NULL,
	INC_documento VARCHAR(500) NOT NULL,
	INC_descripcion VARCHAR(5000) NOT NULL,
	INC_estado VARCHAR (15) NOT NULL,
	CAT_codigo INT,
	PRI_codigo INT,
	ARE_codigo INT,
	CONSTRAINT pk_INC_codigo PRIMARY KEY (INC_codigo),
	CONSTRAINT fk_INCIDENCIA_CATEGORIA FOREIGN KEY (CAT_codigo)
	REFERENCES dbo.CATEGORIA (CAT_codigo)
		ON DELETE NO ACTION
		ON UPDATE CASCADE,
	CONSTRAINT fk_INCIDENCIA_PRIORIDAD FOREIGN KEY (PRI_codigo)
	REFERENCES dbo.PRIORIDAD (PRI_codigo)
		ON DELETE NO ACTION
		ON UPDATE CASCADE,
	CONSTRAINT fk_INCIDENCIA_AREA FOREIGN KEY (ARE_codigo)
	REFERENCES dbo.AREA (ARE_codigo)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
)
GO

CREATE TABLE dbo.CIERRE
(
	CIE_codigo INT IDENTITY(1,1),
	CIE_fecha DATE NOT NULL,
	CIE_diagnostico VARCHAR(500) NOT NULL,
	CIE_escala VARCHAR(50) NOT NULL,
	CIE_documento VARCHAR(500) NOT NULL,
	USU_codigo INT,
	INC_codigo INT,
	CONSTRAINT pk_CIE_codigo PRIMARY KEY (CIE_codigo),
	CONSTRAINT fk_CIERRE_USUARIO FOREIGN KEY (USU_codigo)
	REFERENCES dbo.USUARIO (USU_codigo)
		ON DELETE NO ACTION
		ON UPDATE CASCADE,
	CONSTRAINT fk_CIERRE_INCIDENCIA FOREIGN KEY (INC_codigo)
	REFERENCES dbo.INCIDENCIA (INC_codigo)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
);
GO




