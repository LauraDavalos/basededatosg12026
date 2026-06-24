CREATE DATABASE bdconstraint;
GO

USE bdconstraint;
GO

CREATE TABLE paci(
Idpaciente INT NOT NULL,
Nombre VARCHAR (40) NOT NULL,
Apellido1 VARCHAR (20) NOT NULL,
Apellido2 VARCHAR (20) NULL,
Fechanaci DATE NOT NULL
CONSTRAINT pk_paciente
PRIMARY KEY (Idpaciente)
);
GO

CREATE TABLE expediente(
Idexp INT NOT NULL PRIMARY KEY,
Fechaapertura DATE NOT NULL,
Tiposangre char (3) NULL,
Idpaciente INT NOT NULL,
CONSTRAINT unique_idpacinete
FOREIGN KEY (Idpaciente)
REFERENCES paciente(Idpaciente)
);
GO

DROP TABLE expediente
GO

-- Datos para las tablas

INSERT INTO paciente
VALUES(1, 'José Domingo' , 'Perez',
'Hernandez' , '1995-03-21');

INSERT INTO paciente
VALUES(2, 'José Luis' , 'Herrera',
	'Gallardo' , '1978-04-06');

	INSERT INTO paciente
VALUES(3, 'Laura Lucero' , 'Mendoza',
	'Davalos' , '1995-07-28');

		INSERT INTO paciente
VALUES(4, 'Pamela' , 'Mendoza',
	'Ceron' , '1995-03-21');

	
	USE bdconstraint;
	GO
	SELECT*FROM paciente
