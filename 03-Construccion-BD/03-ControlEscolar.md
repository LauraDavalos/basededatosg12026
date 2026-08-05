```
--  Crear la base de datos
CREATE DATABASE ControlEscolar1;
GO

-- Seleccionar la base de datos
USE ControlEscolar1;
GO

-- Crear la tabla: Alumnos
CREATE TABLE Alumnos (
    idAlumno INT IDENTITY(1,1) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50) NULL,
    semestre INT NOT NULL,
    matricula VARCHAR(20) NOT NULL,
    
    CONSTRAINT PK_Alumnos PRIMARY KEY (idAlumno),
    -- Hacemos la matrícula única para usarla correctamente como FK
    CONSTRAINT UQ_Alumnos_matricula UNIQUE (matricula)
);
GO

-- Crear la tabla: Materias
CREATE TABLE Materias (
    claveMateria INT IDENTITY(1,1) NOT NULL,
    nombreMateria VARCHAR(100) NOT NULL,
    creditos INT NOT NULL,
    
    CONSTRAINT PK_Materias PRIMARY KEY (claveMateria)
);
GO

-- Crear la tabla intermedia: Inscribe (Relación M:N)
CREATE TABLE Inscribe (
    matricula VARCHAR(20) NOT NULL,
    claveMateria INT NOT NULL, -- Corresponde a la relación con Materias
    calif DECIMAL(4,2) NULL,
    fechaInscripcion DATE NOT NULL DEFAULT GETDATE(),
    
    -- Clave Primaria Compuesta (matricula + claveMateria)
    CONSTRAINT PK_Inscribe PRIMARY KEY (matricula, claveMateria),
    
    -- Claves Foráneas (FK)
    CONSTRAINT FK_Inscribe_Alumnos FOREIGN KEY (matricula) 
        REFERENCES Alumnos(matricula)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
        
    CONSTRAINT FK_Inscribe_Materias FOREIGN KEY (claveMateria) 
        REFERENCES Materias(claveMateria)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
GO
```
## Diagrama final
![ControlEscolar](/images/controlescolar.png)