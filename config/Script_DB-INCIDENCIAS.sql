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
	WHERE name='ESTADO' and xtype = 'u') )
BEGIN
	DROP TABLE dbo.ESTADO;
END;
GO

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
	WHERE name='ESCALA' and xtype = 'u') )
BEGIN
	DROP TABLE dbo.ESCALA;
END;
GO

IF( EXISTS ( SELECT 1 FROM sys.sysobjects 
	WHERE name='CIERRE' and xtype = 'u') )
BEGIN
	DROP TABLE dbo.ALUMNO;
END;
GO

-- ======================================================
-- CREACION DE TABLAS 
-- ======================================================

CREATE TABLE dbo.ESTADO
(
	 EST_codigo INT IDENTITY(1,1),
	 EST_nombre VARCHAR(15) NOT NULL,
	 CONSTRAINT pk_EST_codigo PRIMARY KEY(EST_codigo)
);
GO

INSERT INTO dbo.ESTADO(EST_nombre) VALUES ('Activo');
INSERT INTO dbo.ESTADO(EST_nombre) VALUES ('Inactivo');
INSERT INTO dbo.ESTADO(EST_nombre) VALUES ('Abierto');
INSERT INTO dbo.ESTADO(EST_nombre) VALUES ('Cerrado');

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

INSERT INTO dbo.PERSONA(PER_dni,PER_nombres,PER_apellidoPaterno,PER_apellidoMaterno,PER_celular,PER_email) VALUES
('70555740','Jhonatan','Mantilla','Miñano', '950212903','jhonatanmm.1995@gmail.com');
INSERT INTO dbo.PERSONA(PER_dni,PER_nombres,PER_apellidoPaterno,PER_apellidoMaterno,PER_celular,PER_email) VALUES
('70555742','Gustavo','Mantilla','Miñano', '950212913','gammgush@gmail.com');


CREATE TABLE dbo.USUARIO
(
	USU_codigo INT IDENTITY(1,1),
	USU_usuario VARCHAR(15) NOT NULL,
	USU_password VARCHAR(15) NOT NULL,
	USU_estado INT NOT NULL,
	PER_codigo INT NOT NULL,
	ROL_codigo INT NOT NULL,
	CONSTRAINT pk_USU_codigo PRIMARY KEY (USU_codigo),
	CONSTRAINT uq_USU_usuario UNIQUE (USU_usuario),
	CONSTRAINT fk_ROL_USUARIO FOREIGN KEY (ROL_codigo)
	REFERENCES dbo.ROL (ROL_codigo)
		ON DELETE NO ACTION
		ON UPDATE CASCADE,
	CONSTRAINT fk_PERSONA_USUARIO FOREIGN KEY (PER_codigo)
	REFERENCES dbo.PERSONA (PER_codigo)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
);
GO

INSERT INTO dbo.USUARIO(USU_usuario,USU_password,USU_estado,PER_codigo,ROL_codigo) VALUES ('GAMM95','123456',1,1,1);
INSERT INTO dbo.USUARIO(USU_usuario,USU_password,USU_estado,PER_codigo,ROL_codigo) VALUES ('GUSH98','123456',1,2,2);

CREATE TABLE dbo.AREA
(
	ARE_codigo INT IDENTITY(1,1),
	ARE_nombre VARCHAR(100) NOT NULL,
	CONSTRAINT pk_ARE_codigo PRIMARY KEY(ARE_codigo),
	CONSTRAINT uq_ARE_nombre UNIQUE(ARE_nombre)
);
GO

INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Subgerencia de Informatica y Sistemas');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Gerencia Municipal');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Subgerencia de Contabilidad');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Alcaldia');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Subgerencia de Tesoreria');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Seccion de Almacen');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Subgerencia de Abastecimientos y Control Patrimonial');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Unidad de Control Patrimonial');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Caja General');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Gerencia de Recursos Humanos');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Gerencia de Desarrollo Econòmico Local');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Area de Liquidaciòn de Obras');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Subgerencia de Habilitaciones Urbanas y Catrasto');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Subgerencia de Escalafon');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Secretaria General');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Programa del Vaso de Leche - Provale');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Demuna');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Omaped');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Subgerencia de Salud');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Gerencia de Administracion Tributaria');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Servicio Social');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Unidad de Relaciones Publicas y Comunicaciones');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Gerencia de Gestion Ambiental');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Gerencia de Asesoria Juridica');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Sub Gerencia De Planificacion  Y Modernizacion Institucional');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Subgerencia de Gestion y Desarrollo de Recursos Humanos');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Gerencia de Desarrollo Social');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Subgerencia de Educacion');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Subgerencia de Programas Sociales');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Subgerencia de Licencias');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Policia Municipal');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Registro Civil');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Subgerencia de Mantenimiento de Obras Publicas');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Gerencia de Desarrollo Urbano');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Ejecutoria Coactiva');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Subgerencia de Estudios y Proyectos');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Subgerencia de Obras');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Procuraduría Pública Municipal');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Gerencia de Administracion y Finanzas');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Subgerencia de Defensa Civil');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Subgerencia de Juventud, Deporte y Cultura');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Subgerencia de Áreas Verdes');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Subgerencia de Seguridad Ciudadana');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Órgano de Control Institucional');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Unidad Local de Empadronamiento (ULE)');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Unidad de Atención al Usuario y Trámite Documentario');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Gerencia de Seguridad Ciudadana');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Subgerencia de Aabstecimiento');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Participación Vecinal');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Gerencia De Planeamiento, Presupuesto Y Modernización');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Subgerencia de Transporte');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Archivo Central');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Equipo Mecánico y Maestranza');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Subgerencia de Limpieza Pública');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Bienestar social');
INSERT INTO dbo.AREA(ARE_nombre) VALUES ('Orientacion Tributaria');

CREATE TABLE dbo.PRIORIDAD
(
	PRI_codigo INT IDENTITY(1,1),
	PRI_nombre VARCHAR(15) NOT NULL,
	CONSTRAINT pk_PRI_codigo PRIMARY KEY(PRI_codigo),
	CONSTRAINT uq_PRI_descripcion UNIQUE (PRI_nombre)
);
GO

INSERT INTO dbo.PRIORIDAD(PRI_nombre) VALUES ('Baja');
INSERT INTO dbo.PRIORIDAD(PRI_nombre) VALUES ('Media');
INSERT INTO dbo.PRIORIDAD(PRI_nombre) VALUES ('Alta');

CREATE TABLE dbo.CATEGORIA
(
	CAT_codigo INT IDENTITY(1,1),
	CAT_nombre VARCHAR(60) NOT NULL,
	CONSTRAINT pk_CAT_codigo PRIMARY KEY(CAT_codigo),
	CONSTRAINT uq_CAT_nombre UNIQUE (CAT_nombre)
);
GO

INSERT INTO dbo.CATEGORIA (CAT_nombre) VALUES ('Red inaccesible');
INSERT INTO dbo.CATEGORIA (CAT_nombre) VALUES ('Asistencia técnica');
INSERT INTO dbo.CATEGORIA (CAT_nombre) VALUES ('Generacion de usuario');
INSERT INTO dbo.CATEGORIA (CAT_nombre) VALUES ('Fallo de equipo de computo');
INSERT INTO dbo.CATEGORIA (CAT_nombre) VALUES ('Inaccesibilidad a Impresora');
INSERT INTO dbo.CATEGORIA (CAT_nombre) VALUES ('Correo corporativo');
INSERT INTO dbo.CATEGORIA (CAT_nombre) VALUES ('Reportes varios de sistemas informaticos');
INSERT INTO dbo.CATEGORIA (CAT_nombre) VALUES ('Otros');
INSERT INTO dbo.CATEGORIA (CAT_nombre) VALUES ('Inaccesibilidad a Sistemas Informaticos');

CREATE TABLE dbo.INCIDENCIA
(
	INC_codigo INT IDENTITY(1,1),
	INC_fecha DATE NOT NULL,
	INC_asunto VARCHAR(200) NOT NULL,
	INC_codigoPatrimonial VARCHAR(50) NOT NULL,
	INC_documento VARCHAR(100) NOT NULL,
	INC_estado INT NOT NULL,
	CAT_codigo INT,
	PRI_codigo INT,
	ARE_codigo INT,
	USU_codigo INT,
	INC_observacion VARCHAR(500) NULL,
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
		ON UPDATE CASCADE,
	CONSTRAINT fk_USUARIO_INCIDENCIA FOREIGN KEY (USU_codigo)
	REFERENCES dbo.USUARIO (USU_codigo)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
)
GO

CREATE TABLE dbo.ESCALA
(
	ESC_codigo INT IDENTITY(1,1),
	ESC_nombre VARCHAR(20) NOT NULL,
	CONSTRAINT pk_ESCALA PRIMARY KEY (ESC_codigo)
);
GO

CREATE TABLE dbo.CIERRE
(
	CIE_codigo INT IDENTITY(1,1),
	CIE_fecha DATE NOT NULL,
	CIE_diagnostico VARCHAR(200) NOT NULL,
	CIE_documento VARCHAR(500) NOT NULL,
	USU_codigo INT NOT NULL,
	INC_codigo INT NOT NULL,
	ESC_codigo INT NULL,
	CIE_asunto VARCHAR(200) NOT NULL,
	CONSTRAINT pk_CIE_codigo PRIMARY KEY (CIE_codigo),
	CONSTRAINT fk_CIERRE_USUARIO FOREIGN KEY (USU_codigo)
	REFERENCES dbo.USUARIO (USU_codigo),
	CONSTRAINT fk_CIERRE_ESCALA FOREIGN KEY (ESC_codigo)
	REFERENCES dbo.ESCALA(ESC_codigo),
	CONSTRAINT fk_CIERRE_INCIDENCIA FOREIGN KEY (INC_codigo)
	REFERENCES dbo.INCIDENCIA (INC_codigo)

);
GO




