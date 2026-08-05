--Crear la base de datos
CREATE DATABASE EmpresaGestion;
GO

USE EmpresaGestion;
GO

-- Tabla DEPARTAMENTO
CREATE TABLE Departamento (
    claveDepto INT IDENTITY(1,1) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    presupuesto DECIMAL(12,2) NOT NULL,
    ubicacion VARCHAR(100) NULL,
    
    CONSTRAINT PK_Departamento PRIMARY KEY (claveDepto)
);
GO

--  Tabla EMPLEADO (Incluye autorreferencia Jefe y FK a Departamento)
CREATE TABLE Empleado (
    numEmpl INT IDENTITY(1,1) NOT NULL,
    curp VARCHAR(18) NOT NULL,
    nombreP VARCHAR(50) NOT NULL,
    ap1 VARCHAR(50) NOT NULL,
    ap2 VARCHAR(50) NULL,
    fechanac DATE NOT NULL,
    claveDepto INT NOT NULL,  -- Relación PERTENECE (1:N)
    jefeNumEmpl INT NULL,     -- Autorreferencia TIENE (Jefe/Subordinado)
    
    CONSTRAINT PK_Empleado PRIMARY KEY (numEmpl),
    CONSTRAINT UQ_Empleado_curp UNIQUE (curp),
    CONSTRAINT FK_Empleado_Departamento FOREIGN KEY (claveDepto) 
        REFERENCES Departamento(claveDepto),
    CONSTRAINT FK_Empleado_Jefe FOREIGN KEY (jefeNumEmpl) 
        REFERENCES Empleado(numEmpl)
);
GO

-- Agregar la relación ADMINISTRAR (1:1 o 1:N - Administrador de Departamento)
ALTER TABLE Departamento
ADD managerNumEmpl INT NULL,
    CONSTRAINT FK_Departamento_Empleado FOREIGN KEY (managerNumEmpl) 
        REFERENCES Empleado(numEmpl);
GO

--  Tabla PUESTO
CREATE TABLE Puesto (
    clave INT IDENTITY(1,1) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    nivelJerarquic VARCHAR(50) NOT NULL,
    salarioMin DECIMAL(10,2) NOT NULL,
    salarioMax DECIMAL(10,2) NOT NULL,
    
    CONSTRAINT PK_Puesto PRIMARY KEY (clave)
);
GO

-- Tabla OTORGADO (Relación Puesto - Empleado)
CREATE TABLE Otorgado (
    numEmpl INT NOT NULL,
    clavePuesto INT NOT NULL,
    salarioReal DECIMAL(10,2) NOT NULL,
    
    CONSTRAINT PK_Otorgado PRIMARY KEY (numEmpl, clavePuesto),
    CONSTRAINT FK_Otorgado_Empleado FOREIGN KEY (numEmpl) 
        REFERENCES Empleado(numEmpl) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_Otorgado_Puesto FOREIGN KEY (clavePuesto) 
        REFERENCES Puesto(clave) ON DELETE CASCADE ON UPDATE CASCADE
);
GO

-- Tabla SUCURSAL
CREATE TABLE Sucursal (
    clave INT IDENTITY(1,1) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    
    CONSTRAINT PK_Sucursal PRIMARY KEY (clave)
);
GO

-- Tabla multivaluada: Telefono de Sucursal
CREATE TABLE Sucursal_Telefono (
    claveSucursal INT NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    
    CONSTRAINT PK_Sucursal_Telefono PRIMARY KEY (claveSucursal, telefono),
    CONSTRAINT FK_Telefono_Sucursal FOREIGN KEY (claveSucursal) 
        REFERENCES Sucursal(clave) ON DELETE CASCADE ON UPDATE CASCADE
);
GO

-- Tabla PROYECTO (Relación ASIGNADO 1:N con Sucursal)
CREATE TABLE Proyecto (
    clave INT IDENTITY(1,1) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    presupuesto DECIMAL(12,2) NOT NULL,
    fechaini DATE NOT NULL,
    fechatermino DATE NULL,
    claveSucursal INT NOT NULL,
    
    CONSTRAINT PK_Proyecto PRIMARY KEY (clave),
    CONSTRAINT FK_Proyecto_Sucursal FOREIGN KEY (claveSucursal) 
        REFERENCES Sucursal(clave) ON DELETE CASCADE ON UPDATE CASCADE
);
GO

-- Tabla PARTICIPA (Relación M:N Empleado - Proyecto)
CREATE TABLE Participa (
    numEmpl INT NOT NULL,
    claveProyecto INT NOT NULL,
    rol VARCHAR(50) NOT NULL,
    horas INT NOT NULL,
    fechaAsignacion DATE NOT NULL DEFAULT GETDATE(),
    
    CONSTRAINT PK_Participa PRIMARY KEY (numEmpl, claveProyecto),
    CONSTRAINT FK_Participa_Empleado FOREIGN KEY (numEmpl) 
        REFERENCES Empleado(numEmpl) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_Participa_Proyecto FOREIGN KEY (claveProyecto) 
        REFERENCES Proyecto(clave) ON DELETE CASCADE ON UPDATE CASCADE
);
GO

--  Tabla CAPACITACION
CREATE TABLE Capacitacion (
    claveCapacitacion INT IDENTITY(1,1) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    
    CONSTRAINT PK_Capacitacion PRIMARY KEY (claveCapacitacion)
);
GO

-- Tabla ASISTIO (Relación M:N Empleado - Capacitación)
CREATE TABLE Asistio (
    numEmpl INT NOT NULL,
    claveCapacitacion INT NOT NULL,
    calificacion DECIMAL(4,2) NULL,
    status VARCHAR(20) NOT NULL, -- ej. 'Aprobado', 'Pendiente'
    fechains DATE NOT NULL DEFAULT GETDATE(),
    
    CONSTRAINT PK_Asistio PRIMARY KEY (numEmpl, claveCapacitacion),
    CONSTRAINT FK_Asistio_Empleado FOREIGN KEY (numEmpl) 
        REFERENCES Empleado(numEmpl) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_Asistio_Capacitacion FOREIGN KEY (claveCapacitacion) 
        REFERENCES Capacitacion(claveCapacitacion) ON DELETE CASCADE ON UPDATE CASCADE
);
GO