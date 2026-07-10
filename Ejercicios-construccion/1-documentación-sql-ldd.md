## Construccion de Base de Datos con SQL-LDD

SQL (Structure Query Languaje) se divide en 5 grandes categorias:

1. DDL(Data Definition Languaje)
2. DML(Data Manipulation Languaje)
3. DQL(Data Query Languaje)
4. DCL(Data Control Languaje)
5. TCL(Transaction Control Lenguaje)

# SQL--DDL

**Lenguaje de definición de datos**
Se utiliza para **crear o modificar** la estructura de una base de datos con DDL

Trabajamos sobre los objetos de la base de datos:
- Base de datos
- Tablas
- Vistas
- Índices
- Restricciones
- Esquemas
- Store procedures
- trigger
- Fuction

**Comandos principales**
| Comando | Función |
|--------|-------------|
| CREATE | Crea objetos |
| ALTER | Modifica objetos |
| DROP | Elimina objetos |
| TRUNCATE | Vaciar tabla|

## SQL-DML
 **Lenguaje de Manipulación de datos**
 Sirve para trabajar con la información almacenada
 Aquí no cambia la estructura, si no los registros

 **Comandos principales**
 | Comando | Función |
|--------|-------------|
| INSERT| Insertar registros |
| UPDATE | Actualizar registros |
| DELETE | Eliminar registros|

## SQL-DQL
**Lenguaje de consulta de datos**
Su función es consultar información

**Comando principal**
| Comando | Función |
|--------|-------------|
| SELECT| Consultar Información|

Generalmente se combina con:
- WHERE
- URDER BY
- GROUP BY
- HAVING
- JOIN (LEFT,RIGTH,INNER,CROSS Y FULL)
- DISTINCT
- TOP/LIMIT
- Funciones de agregado(SUM,AVG,MAS,MIN,COUNT)
- Funciones de renta(Window Fuction)

**Nomenclatura snake_case**
**snake_case** es la convención más recomendada de ahora si se busca una nomenclatura moderna, portable y alineada con buenas practicas de distintos motores de Base de Datos.

La razón es que la función de forma consistente en **SQLServer y MySQL** y especialmente en **postgresSQL**. Con snake_case se evitan problemas de máyusculas y hace que las consultas sean más legibles.


**Estandar de construcción**
| | Campo FK |Referencia|
| :--- | :--- | :--- |
|  Alumno| id_carrera | Carrera(id_carrera) |