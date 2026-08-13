/* ==========================================================
DQL(DATA QUERY LANGUAGE) en SQLSERVER

Archivo:06-filtrado-registros-where.sql

Descripción: Se recuperan unicamente las filas que cumplen detenidamente 
condiciones mediante la clausula

ORDEN SINTACTICO DE LA CONSULTA                 
- SELECT/ TOP/ DISTINC
FROM
JOINS/ON
WHERE
ORDER BY
HAVING
ORDER BY

ORDEN DE EJECUCIÓN
FROM/JOINS (INNER,KEFT,RIGTH,CROSS,FULL,SELF)
WHERE
GROUP BY

OPERADORES 
Aridmeticos () * / % + -

Relacionales 
=: igual que
<: menor que
>: mayor que
>=: mayor o igual que
<=: menor o igual que
<>: diferente que
!=: diferente que

Lógicos
NOT
AND 
OR

Tabla de verdad AND
TRUE TRUE = T
FALSE TRUE = F
TRUE  FALSE = F
FALSE FALSE = F

Tabla OR
T T = T
F T = T
T F = T
F F = F

Tabla NOT
T = F
F = T
=============================================================*/
/*=================================================
Sintaxis

SELECT 
columna_1,
co,umna_2
columna_n

FROM nombre_tabla
WHERE condición;

Nota: Condición puede ser relacional y la combinación de esta con  lógica
Nota: El SELECT no filtra registros 
===================================================*/

-- Seleccionar el proiducto cuyo precio es $200
SELECT 
p.codigo AS [Codigo],
p.nombre AS [Producto],
p.precio AS [Precio]
FROM productos AS p

WHERE precio = 200;

-- Seleccionar cliente cuyo identificador es 25
SELECT 
    c.id_cliente,
    CONCAT(c.nombre, ' ', c.apeliido_paterno, ' ', c.apellido_materno) AS nombre_completo,
    c.correo
FROM clientes AS c
WHERE c.id_cliente = 25;

-- Comparación de cadenas de texto
-- Los valores de texto deben escribirse entree comillas simples 

SELECT 
    c.nombre AS [Categoria]
FROM categorias AS c
WHERE c.nombre = 'Cómputo';

-- Selecccionar los datos del cliente con nombre Cliente 1


-- Seleccionar los datos del empleado que no pertenezca al departamento 1
SELECT 
    e.id_empleado,
    e.nombre,
    e.id_departamento,
    e.salario
FROM empleado AS e
WHERE id_departamento = 1;
-- Seleccionar los datos de los productos donde el precio sea superior a $490

SELECT * FROM productos WHERE precio > 490;
-- Seleccionar los datos de los productos con existencia critica inferior a 10 unidades
SELECT * FROM productos WHERE existencia < 10;
-- Seleccionar los datos de los empleados donde su salario sea de $30,00 en adelante
SELECT * FROM empleado WHERE salario >= 30000;
-- Seleccionar los datos de los mproductos donde sus precios sean de $10 o menos 
SELECT * FROM productos WHERE precio <= 10;

--

--Seleccionar las ventas anteriores al 1 de febrero del 2025
-- Muestrame los sexos
SELECT DISTINCT
    productos
SELECT 
FROM clientes;

SELECT DISTINCT
id_ciudad
FROM ciudades;

-- seleccionar los descuentos ùnicos que se aplican

-- top: Limita la cantidad de filas devueltas por una consulta

-- seleccionar los datos de los productos mostrando el código y el valor del inventario
-- del inventario, donde el valor del inventario sea mayor

SELECT
p.codigo AS codigo_producto,
p.existencia as EXISTENCIA
p.precio AS precio,
(p.precio*p.existencia) AS valor_inventario
FROM producto AS P;

WHERE valor_inventario>50000;

--mostrar los productos con precio que este entre $200 y $300 que además que tengan

SELECT
p.codigo AS codigo_producto,
p.existencia as EXISTENCIA
p.precio AS precio,
(p.precio*p.existencia) AS valor_inventario
FROM producto AS p;
WHERE precio<=200 AND precio<=300

-- Instrucción between 
SELECT
p.codigo AS codigo_producto,
p.existencia as EXISTENCIA
p.precio AS precio,
(p.precio*p.existencia) AS valor_inventario
FROM producto AS P;
WHERE precio BETWEEN 200 AND 300;



