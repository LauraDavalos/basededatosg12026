```
-- Crear la base de datos
CREATE DATABASE ControlAcademico;
GO

-- Posicionarse en la base de datos
USE ControlAcademico;
GO

-- Crear la tabla principal: Profesor
CREATE TABLE Profesor (
    claveProfesor INT IDENTITY(1,1) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50) NULL,
    Especialidad VARCHAR(100) NULL, -- Declarada como FK según el diagrama
    
    CONSTRAINT PK_Profesor PRIMARY KEY (claveProfesor)
);
GO

-- Crear la tabla dependiente: Curso (Relación 1 a N con Profesor)
CREATE TABLE Curso (
    Idcurso INT IDENTITY(1,1) NOT NULL,
    nombreCurso VARCHAR(100) NOT NULL,
    creditos INT NOT NULL,
    claveProfesor INT NOT NULL,
    
    CONSTRAINT PK_Curso PRIMARY KEY (Idcurso),
    CONSTRAINT FK_Curso_Profesor FOREIGN KEY (claveProfesor) 
        REFERENCES Profesor(claveProfesor)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
GO
```
## Diagrama final
![controlAcademico](/images/controlAcademico.png)