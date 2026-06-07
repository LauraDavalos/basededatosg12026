--Crear base de datos pruebag1

--Permite crear base de datos (SQL-LDD)
CREATE DATABASE pruebag1;

--Utilizar la base de datos
USE pruebag1;

--Crear una tabla (SQL-LDD)
CREATE TABLE alumno (
id INT NOT NULL,
nombre VARCHAR(20) NOT NULL,
edad INT not null,
matricula INT NOT NULL,
direccion VARCHAR (30) NULL,
CONSTRAINT pk_alumno
PRIMARY KEY (id),
CONSTRAINT unique_matricula
UNIQUE (matricula)
);


--AGREGAR DOS ALUMNOS(SQL-LMD)
INSERT INTO alumno (id, nombre, edad, matricula, direccion)
VALUES (1,  'ARCADIA' , 65, 123456, 'Calle del infierno'),
		(2, 'NARNIA', 19, 246810,  'Conocido barrio');

--Seleccionar alumno
SELECT*
FROM alumno;

-- Cambiar nombre de ARCADIA A MONICO

UPDATE alumno
SET nombre= 'MONICO'
WHERE id 1;

