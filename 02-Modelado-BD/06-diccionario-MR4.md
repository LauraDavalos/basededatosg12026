# Descripción del Sistema

El sistema administra la información de los clientes, productos y pedidos realizados. Además, controla los productos que contiene cada pedido, así como la cantidad y el precio de venta correspondiente.

---

# Catálogo de Restricciones Utilizadas

## Llaves Primarias

- Cliente(idCliente)
- Pedido(idPedido)
- Producto(numProducto)
- Tiene(idPedido, numProducto)

## Llaves Foráneas

- Pedido.idCliente → Cliente.idCliente
- Tiene.idPedido → Pedido.idPedido
- Tiene.numProducto → Producto.numProducto

## Restricciones UNIQUE

- Cliente.Rfc

## Restricciones CHECK

- Precio > 0
- PrecioVenta > 0
- Cantidad > 0

---

# Diccionario de Datos

## Tabla: Cliente

| Campo | Tipo | Descripción |
|--------|------|-------------|
| idCliente | INT | Identificador del cliente |
| Empresa | VARCHAR(100) | Nombre de la empresa |
| Rfc | VARCHAR(13) | Registro Federal de Contribuyentes |
| Campo3 | VARCHAR(100) | Información adicional del cliente |

---

## Tabla: Pedido

| Campo | Tipo | Descripción |
|--------|------|-------------|
| idPedido | INT | Identificador del pedido |
| fechaPedido | DATE | Fecha en que se realizó el pedido |
| Campo2 | VARCHAR(100) | Información adicional |
| Campo3 | VARCHAR(100) | Información adicional |

---

## Tabla: Producto

| Campo | Tipo | Descripción |
|--------|------|-------------|
| numProducto | INT | Identificador del producto |
| nombreProducto | VARCHAR(100) | Nombre del producto |
| Precio | DECIMAL(10,2) | Precio del producto |

---

## Tabla: Tiene

| Campo | Tipo | Descripción |
|--------|------|-------------|
| idPedido | INT | Pedido registrado |
| numProducto | INT | Producto incluido en el pedido |
| PrecioVenta | DECIMAL(10,2) | Precio de venta del producto |
| Cantidad | INT | Cantidad vendida |

---

# Relaciones en la Base de Datos

| Tabla Padre | Tabla Hija | Cardinalidad |
|--------------|------------|--------------|
| Cliente | Pedido | 1 : N |
| Pedido | Tiene | 1 : N |
| Producto | Tiene | 1 : N |

---

# Matriz de Claves Foráneas

| Tabla | Llave Foránea | Referencia |
|--------|---------------|------------|
| Pedido | idCliente | Cliente.idCliente |
| Tiene | idPedido | Pedido.idPedido |
| Tiene | numProducto | Producto.numProducto |

---

# Integridad Referencial

- No puede existir un pedido sin un cliente registrado.
- No puede existir un detalle de pedido sin un pedido existente.
- No puede existir un detalle de pedido con un producto inexistente.
- Un producto puede aparecer en varios pedidos.
- Un cliente puede realizar varios pedidos.

---

# Reglas de Negocio

1. Cada cliente puede realizar uno o varios pedidos.
2. Cada pedido pertenece únicamente a un cliente.
3. Un pedido puede contener uno o varios productos.
4. Un producto puede formar parte de diferentes pedidos.
5. La cantidad de productos vendida debe ser mayor que cero.
6. El precio de venta debe ser mayor que cero.
7. El precio del producto debe ser mayor que cero.
8. No se puede registrar un detalle de pedido sin que exista previamente el pedido.
9. No se puede registrar un detalle de pedido con un producto inexistente.
10. Un cliente puede realizar pedidos en diferentes fechas.

----


# Modelo Relacional
![Cliente](../img/E-R/ModeloRe4.jpg)