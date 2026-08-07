-- 1. Crear la base de datos si no existe
    CREATE DATABASE comercial_db;
GO

USE comercial_db;
GO

-- 2. Limpieza de tablas previas (en orden por si existen)
IF OBJECT_ID('productos', 'U') IS NOT NULL DROP TABLE productos;
IF OBJECT_ID('clientes', 'U') IS NOT NULL DROP TABLE clientes;
IF OBJECT_ID('categorias', 'U') IS NOT NULL DROP TABLE categorias;
IF OBJECT_ID('empleado', 'U') IS NOT NULL DROP TABLE empleado;
GO

-- 3. Creación de tablas

-- Tabla Productos
CREATE TABLE productos (
    codigo INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    existencia INT NOT NULL DEFAULT 0
);

-- Tabla Clientes
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY, -- Sin IDENTITY para poder insertar libremente el ID 25
    nombre VARCHAR(50) NOT NULL,
    apeliido_paterno VARCHAR(50) NOT NULL, -- Conservamos el nombre con la falta de ortografía para compatibilidad con tu consulta
    apellido_materno VARCHAR(50) NULL,
    correo VARCHAR(100) NULL
);

-- Tabla Categorias
CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL
);

-- Tabla Empleado
CREATE TABLE empleado (
    id_empleado INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    id_departamento INT NOT NULL,
    salario DECIMAL(10,2) NOT NULL
);
GO

-- 4. Inserción de datos de prueba

-- Datos de Productos (incluye precio=200, precio>490, precio<=10 y existencia<10)
INSERT INTO productos (nombre, precio, existencia) VALUES
('Teclado Mecánico', 200.00, 15),
('Mouse Inalámbrico', 10.00, 5),
('Monitor 27 Pulgadas', 550.00, 8),
('Cable HDMI 2m', 8.50, 20),
('Silla Gamer Pro', 495.00, 3),
('Audífonos HD', 200.00, 12);

-- Datos de Clientes (incluye cliente con ID 25)
INSERT INTO clientes (id_cliente, nombre, apeliido_paterno, apellido_materno, correo) VALUES
(1, 'Cliente 1', 'Pérez', 'Gómez', 'cliente1@email.com'),
(25, 'Carlos', 'López', 'Hernández', 'carlos.lopez@email.com'),
(30, 'María', 'García', 'Rodríguez', 'maria.garcia@email.com');

-- Datos de Categorías (incluye categoría 'Cómputo')
INSERT INTO categorias (nombre) VALUES
('Cómputo'),
('Electrónica'),
('Accesorios');

-- Datos de Empleados (diferentes departamentos y salarios)
INSERT INTO empleado (nombre, id_departamento, salario) VALUES
('Ana Martínez', 1, 25000.00),
('Pedro Sánchez', 2, 35000.00),
('Laura Ruiz', 1, 30000.00),
('Jorge Torres', 3, 42000.00);
GO