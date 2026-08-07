-- LAURA LUCERO MENDOZA DAVALOS 3DSM G1

CREATE DATABASE proyecto

GO

USE proyecto
GO

--  Esta es tabla cliente_proyecto
CREATE TABLE cliente_proyecto (
    cliente_id INT IDENTITY(1,1),
    rfc VARCHAR(13) NOT NULL,
    nombre NVARCHAR(140) NOT NULL,
    correo VARCHAR(120) NOT NULL,
    telefono VARCHAR(20) NULL,
    fecha_registro DATETIME2 NOT NULL CONSTRAINT DF_cliente_fecha_registro DEFAULT GETDATE(),
    
    CONSTRAINT PK_cliente_proyecto PRIMARY KEY (cliente_id),
    CONSTRAINT UQ_cliente_rfc UNIQUE (rfc),
    CONSTRAINT UQ_cliente_correo UNIQUE (correo)
);

-- arquitecto
CREATE TABLE arquitecto (
    arquitecto_id INT IDENTITY(1,1),
    clave_empleado CHAR(8) NOT NULL,
    cedula_profesional VARCHAR(20) NOT NULL,
    nombre NVARCHAR(120) NOT NULL,
    correo VARCHAR(120) NOT NULL,
    activo BIT NOT NULL CONSTRAINT DF_arquitecto_activo DEFAULT 1,
    
    CONSTRAINT PK_arquitecto PRIMARY KEY (arquitecto_id),
    CONSTRAINT UQ_arquitecto_clave UNIQUE (clave_empleado),
    CONSTRAINT UQ_arquitecto_cedula UNIQUE (cedula_profesional)
);
GO

--  proyecto
CREATE TABLE proyecto (
    proyecto_id INT IDENTITY(1,1),
    codigo VARCHAR(16) NOT NULL,
    cliente_id INT NOT NULL,
    nombre NVARCHAR(140) NOT NULL,
    descripcion NVARCHAR(250) NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NULL,
    presupuesto DECIMAL(12,2) NOT NULL,
    estado VARCHAR(15) NOT NULL,
    
    CONSTRAINT PK_proyecto PRIMARY KEY (proyecto_id),
    CONSTRAINT UQ_proyecto_codigo UNIQUE (codigo),
    CONSTRAINT FK_proyecto_cliente FOREIGN KEY (cliente_id) 
        REFERENCES cliente_proyecto (cliente_id) 
        ON DELETE NO ACTION, 
  
);

--  participacion_proyecto 
CREATE TABLE participacion_proyecto (
    proyecto_id INT NOT NULL,
    arquitecto_id INT NOT NULL,
    rol VARCHAR(30) NOT NULL,
    porcentaje_participacion DECIMAL(5,2) NOT NULL,
    horas_estimadas DECIMAL(7,2) NOT NULL,
    es_lider BIT NOT NULL CONSTRAINT DF_participacion_es_lider DEFAULT 0,
    
    CONSTRAINT PK_participacion_proyecto PRIMARY KEY (proyecto_id, arquitecto_id),
    CONSTRAINT FK_participacion_proyecto FOREIGN KEY (proyecto_id) 
        REFERENCES proyecto (proyecto_id) 
        ON DELETE CASCADE, 
    CONSTRAINT FK_participacion_arquitecto FOREIGN KEY (arquitecto_id) 
        REFERENCES arquitecto (arquitecto_id) 
        ON DELETE NO ACTION, 
    CONSTRAINT CK_participacion_porcentaje CHECK (porcentaje_participacion BETWEEN 0 AND 100),
    CONSTRAINT CK_participacion_horas CHECK (horas_estimadas > 0)
);

--  entregable
CREATE TABLE entregable (
    entregable_id INT IDENTITY(1,1),
    proyecto_id INT NOT NULL,
    aprobado_por_arquitecto_id INT NULL,
    nombre NVARCHAR(140) NOT NULL,
    fecha_programada DATE NOT NULL,
    fecha_entrega DATE NULL,
    estado VARCHAR(12) NOT NULL,
    referencia_temporal VARCHAR(40) NULL,
    
   
); 
GO
 
 -- LAURA LUCERO MENDOZA DAVALOS 3 DSM G1