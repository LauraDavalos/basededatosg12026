/*================================================
DQL (Date Query Lenguaje) en SQLServer

Archivo: 05-basic-queries.sql

Descripcion: Se realizan consultas basicas con SELECT
================================================*/

USE comercial_db;
GO

-- Uso de SELECT *

/* sintaxis 
SELECT * 
FROM nombre_tabla;

Nota: El * significa todas las COLUMNAS de la tabla 

No se recomienda utilizarla siempre:

1) Reduce la claridad de la consulta
2) Puede aumentar el consumo de recursos
3) Puede afectar aplicaciones futuras 
*/

SELECT *
FROM productos;
GO


--Proyeccion de la tabla productos
SELECT 
	nombre,
	codigo,
	precio
FROM productos;
GO

SELECT 
	codigo,
	nombre,
	precio
FROM productos;
GO

-- Alias de columna (Sobrenombre que se le pone a un campo)

SELECT 
	codigo AS codigo_producto,
	nombre AS nombre_producto,
	precio AS precio_unitario
FROM productos;
GO

-- Alias con espacios

SELECT 
	codigo AS [codigo producto],
	nombre AS [nombre producto],
	precio AS [precio unitario]
FROM productos;
GO

SELECT 
	codigo AS 'codigo producto',
	nombre AS 'nombre producto',
	precio AS 'precio unitario'
FROM productos;
GO

-- Alias sin la estruccion AS (No recomendado)

SELECT 
	codigo codigo_producto,
	nombre nombre_producto,
	precio precio_unitario
FROM productos;

SELECT 
	codigo [codigo producto],
	nombre [nombre producto],
	precio precio_unitario
FROM productos;

-- Alias de tablas 
-- (Es útil en los joins y en los nombres ambiguos)

SELECT 
	p.nombre,
	p.codigo,
	p.precio
FROM productos AS p;
GO

SELECT categorias.id_categoria,
	categorias.nombre,
	productos.id_producto,
	productos.nombre,
	productos.precio
FROM categorias
INNER JOIN
productos
ON categorias.id_categoria = productos.id_categoria;
GO

SELECT c.id_categoria,
	c.nombre,
	p.id_producto,
	p.nombre,
	p.precio
FROM categorias AS c
INNER JOIN
productos AS p
ON c.id_categoria = p.id_categoria;
GO

SELECT 
	p.nombre,
	p.codigo,
	p.precio
FROM productos p;
GO

-- Combinacion de alias 
SELECT 
	p.nombre AS Código,
	p.codigo AS [Nombre Producto],
	p.precio AS 'Precio unitario'
FROM productos AS p;
GO

-- Columnas Calculadas,
-- Campos Calculados y E-R (Atributo Derivado)

-- Seleccionar el codigo, nombre, precio, existencia
-- y el valor del inventario 

SELECT 
	p.codigo AS codigo_producto,
	p.nombre AS nombre_producto,
	p.precio AS precio_unitario,
	p.existencia,
	(p.existencia * p.precio) AS precio_inventario
FROM productos AS p; 

-- TODO: Operadores Aritméticos y mas ejercicios de 
-- campos calculados
/*
	+ Suma
	- Resta
	* Multiplicación
	/ División
	% Modulo o Residuo de la división
*/

