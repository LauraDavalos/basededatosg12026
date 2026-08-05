```
-- Crear la base de datos
CREATE DATABASE ControlVentass;
GO

-- Seleccionar la base de datos
USE ControlVentass;
GO

-- Crear la tabla: Cliente
CREATE TABLE Cliente (
    idCliente INT IDENTITY(1,1) NOT NULL,
    Empresa VARCHAR(100) NOT NULL,
    Rfc VARCHAR(15) NOT NULL,
    
    CONSTRAINT PK_Cliente PRIMARY KEY (idCliente),
    CONSTRAINT UQ_Cliente_Rfc UNIQUE (Rfc)
);
GO

-- Crear la tabla: Pedido (Relación 1:N con Cliente)
CREATE TABLE Pedido (
    idPedido INT IDENTITY(1,1) NOT NULL,
    fechaPedido DATE NOT NULL DEFAULT GETDATE(),
    idCliente INT NOT NULL,
    
    CONSTRAINT PK_Pedido PRIMARY KEY (idPedido),
    CONSTRAINT FK_Pedido_Cliente FOREIGN KEY (idCliente) 
        REFERENCES Cliente(idCliente)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
GO

-- Crear la tabla: Producto
CREATE TABLE Producto (
    numProducto INT IDENTITY(1,1) NOT NULL,
    nombreProducto VARCHAR(100) NOT NULL,
    Precio DECIMAL(10,2) NOT NULL,
    
    CONSTRAINT PK_Producto PRIMARY KEY (numProducto)
);
GO

-- Crear la tabla intermedia: Tiene (Relación M:N entre Pedido y Producto)
CREATE TABLE Tiene (
    idPedido INT NOT NULL,
    numProducto INT NOT NULL,
    PrecioVneta DECIMAL(10,2) NOT NULL, -- Precio de venta al momento del pedido
    Cantidad INT NOT NULL DEFAULT 1,
    
    -- Clave Primaria Compuesta
    CONSTRAINT PK_Tiene PRIMARY KEY (idPedido, numProducto),
    
    -- Claves Foráneas (FK)
    CONSTRAINT FK_Tiene_Pedido FOREIGN KEY (idPedido) 
        REFERENCES Pedido(idPedido)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
        
    CONSTRAINT FK_Tiene_Producto FOREIGN KEY (numProducto) 
        REFERENCES Producto(numProducto)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
GO
```
## Diagrama Final
![ControlVentas](/images/ControlVentass.png)