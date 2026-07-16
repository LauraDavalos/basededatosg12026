-- Creaci�n de la BD empresa_yoda
CREATE DATABASE empresa_yoda;
GO

USE empresa_yoda;
GO

CREATE TABLE categoria(
    categoria_id INT NOT NULL IDENTITY(1,1)
        CONSTRAINT pk_categoria PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL
        CONSTRAINT uq_categoria_nombre UNIQUE,
    activo BIT NOT NULL
        CONSTRAINT df_categoria_activo DEFAULT 1
);
GO

CREATE TABLE producto(
    producto_id INT NOT NULL,
    fabricante_id CHAR(3) NOT NULL,
    nombre VARCHAR(25) NOT NULL,
    existencia INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    activo BIT NOT NULL
        CONSTRAINT df_producto_activo DEFAULT 1,
    categoria_id INT NOT NULL,

    CONSTRAINT pk_producto PRIMARY KEY (producto_id, fabricante_id),
    CONSTRAINT uq_producto_nombre UNIQUE(nombre),
    CONSTRAINT ck_producto_existencia CHECK (existencia >= 0),
    CONSTRAINT ck_producto_precio CHECK (precio BETWEEN 1 AND 1000),
    CONSTRAINT fk_producto_categoria
        FOREIGN KEY (categoria_id)
        REFERENCES categoria(categoria_id)
);
GO

INSERT INTO categoria(nombre)
VALUES
('Frontend'),
('Backend'),
('Cloud');
GO

SELECT * FROM categoria;

INSERT INTO producto (producto_id, fabricante_id, nombre, precio, existencia, activo, categoria_id)
VALUES
(1, 'FF1', 'HTML', 45.00, 987, DEFAULT, 1);

INSERT INTO producto (producto_id, fabricante_id, nombre, precio, existencia, activo, categoria_id)
VALUES
(2, 'FF1', 'CSS', 24.00, 567, 0, 1);

INSERT INTO producto (producto_id, fabricante_id, nombre, precio, existencia, activo, categoria_id)
VALUES
(1, 'FF2', 'Azure', 12.00, 34, DEFAULT, 3);
GO

CREATE TABLE proveedor(
    proveedor_id INT NOT NULL
        CONSTRAINT pk_proveedor PRIMARY KEY,
    empresa VARCHAR(30) NOT NULL,
    direccion VARCHAR(60),
    limite_credito DECIMAL(10,2) NOT NULL
);
GO

CREATE TABLE contacto_proveedor(
    contacto_id INT NOT NULL IDENTITY(1,1),
    nombre VARCHAR(20) NOT NULL,
    apellido_paterno VARCHAR(15) NOT NULL,
    apellido_materno VARCHAR(15),
    telefono VARCHAR(15) NOT NULL,
    proveedor_id INT,

    CONSTRAINT pk_contacto_proveedor PRIMARY KEY(contacto_id),
    CONSTRAINT fk_contacto_proveedor
        FOREIGN KEY(proveedor_id)
        REFERENCES proveedor(proveedor_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
GO

INSERT INTO proveedor(proveedor_id, empresa, direccion, limite_credito)
VALUES
(1, 'Microsoft', NULL, 67888.01),
(2, 'Google', NULL, 6463.01),
(3, 'Amazon', NULL, 8765.01),
(4, 'Oracle', NULL, 60948.01);
GO

INSERT INTO contacto_proveedor(nombre, apellido_paterno, apellido_materno, telefono, proveedor_id)
VALUES
('Juan', 'P�rez', 'L�pez', '12112123', 2),
('Mar�a', 'Garc�a', 'Hern�ndez', '1352567', 2),
('Carlos', 'Ram�rez', 'Torres', '1636533', 2),
('Laura', 'Mart�nez', 'Soto', '154573', 1);
GO

SELECT * FROM proveedor;
SELECT * FROM contacto_proveedor;

SELECT * FROM proveedor
WHERE proveedor_id = 2;

DELETE FROM proveedor
WHERE proveedor_id = 2;

SELECT * FROM contacto_proveedor;
SELECT * FROM proveedor;

UPDATE proveedor
SET proveedor_id = 18
WHERE proveedor_id = 2;

DROP TABLE contacto_proveedor;
DROP TABLE proveedor;
GO

-- Integridad referencial ON DELETE Y ON UPDATE CASCADE

CREATE TABLE proveedor(
    proveedor_id INT NOT NULL
        CONSTRAINT pk_proveedor PRIMARY KEY,
    empresa VARCHAR(30) NOT NULL,
    direccion VARCHAR(60),
    limite_credito DECIMAL(10,2) NOT NULL
);
GO

CREATE TABLE contacto_proveedor(
    contacto_id INT NOT NULL IDENTITY(1,1),
    nombre VARCHAR(20) NOT NULL,
    apellido_paterno VARCHAR(15) NOT NULL,
    apellido_materno VARCHAR(15),
    telefono VARCHAR(15) NOT NULL,
    proveedor_id INT,

    CONSTRAINT pk_contacto_proveedor PRIMARY KEY(contacto_id),
    CONSTRAINT fk_contacto_proveedor
        FOREIGN KEY(proveedor_id)
        REFERENCES proveedor(proveedor_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
GO

INSERT INTO proveedor(proveedor_id, empresa, direccion, limite_credito)
VALUES
(1, 'Microsoft', NULL, 67888.01),
(2, 'Google', NULL, 6463.01),
(3, 'Amazon', NULL, 8765.01),
(4, 'Oracle', NULL, 60948.01);
GO

INSERT INTO contacto_proveedor(nombre, apellido_paterno, apellido_materno, telefono, proveedor_id)
VALUES
('Juan', 'P�rez', 'L�pez', '12112123', 2),
('Mar�a', 'Garc�a', 'Hern�ndez', '1352567', 2),
('Carlos', 'Ram�rez', 'Torres', '1636533', 2),
('Laura', 'Mart�nez', 'Soto', '154573', 1);
GO

SELECT *
FROM proveedor AS p
INNER JOIN contacto_proveedor AS cp
ON p.proveedor_id = cp.proveedor_id;

DELETE FROM proveedor
WHERE proveedor_id = 2;

SELECT * FROM proveedor;
SELECT * FROM contacto_proveedor;

-- Integridad referencial ON DELETE Y ON UPDATE SET DEFAULT
--TODO: Realizar ejercicio completo de construcci�n de un diagrama relacional, aplicando las restricciones y se continua con ALTER Y DROP

## Alter table
Permite modificar una tabla existente
- Agregar tablas
- eliminar columnas
- modificar columnas
- agregar restricciones
- eliminar restricciones



-- Alter Table
-- Agregar una columna

USE pruebaatributos;
Go

SELECT *
FROM alumno;

TRUNCATE TABLE alumno;

-- Muestra los datos de una tabla
SELECT
COLUMN_NAME
DATA_TYPE

FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME='alumno'

-- Agregar una columna
ALTER TABLE alumno
ADD telefono VARCHAR(20) NOT NULL;
GO
-- Agregar mas de una columna
ALTER TABLE alumno
ADD
curp VARCHAR(18),
matricula VARCHAR(13) NOT NULL
-- Agregar mas de una columna
ALTER TABLE alumno
ADD
curp VARCHAR(18),
matricula VARCHAR(13) NOT NULL;

-- Modificar un tipo de dato
ALTER TABLE alumno
ALTER COLUMN telefono VARCHAR(30);
GO

--Agregar restricciones 
-- Primary key
SELECT TOP 8 *
INTO alumno2
FROM alumno;

SELECT *
o.name AS nombre_restriccion,
o.type_desc AS tipo_restriccion
FROM sys.objects AS o
WHERE o.parent_object_id=OBJECT_ID('alumno2')
AND o.type IN ('PK','F','UQ','C','D')
ORDER BY o.type_desc;
