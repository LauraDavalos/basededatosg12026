```
-- Crear la base de datos

CREATE DATABASE ControlMedico;
GO
-- Usar la Base de datos
USE ControlMedico;
GO

CREATE TABLE Paciente (
    Idpaciente INT IDENTITY(1,1) NOT NULL,
    fechaNacimiento DATE NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50) NULL,
    
    CONSTRAINT PK_Paciente PRIMARY KEY (Idpaciente)
);
GO

CREATE TABLE Expediente (
    numExpediente INT IDENTITY(1,1) NOT NULL,
    fechaApertura DATE NOT NULL,
    tipoSangre VARCHAR(5) NOT NULL,
    idPaciente INT NOT NULL,
    CONSTRAINT PK_Expediente PRIMARY KEY (numExpediente),
    CONSTRAINT FK_Expediente_Paciente FOREIGN KEY (idPaciente) 
        REFERENCES Paciente(Idpaciente)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
   
    CONSTRAINT UQ_Expediente_idPaciente UNIQUE (idPaciente)
);
GO
```
# Diagrama final
![hospital](/images/hospital.png)


