# Ejercicio 1
En un hospitl se registra información de sus pacientes
# De cada paciente se desea almacenar
- Algo que lo identifique
- Nombre
- Fecha de Nacimiento

# De un expediente médico se almacena
- Numero de expediente
- Fecha de apertura
- Tipo Sangre

# Regla de negocio
1. 
2. 
3. 
4. 




# Ejercicio 2
Una universidad se administran profesores y cuersos
> Cada profesor almacena:

- Clave profesor
- Nombre
- Especialidad

> De cada curso se almacena:

- Identificación del curso
- Nombre del curso
- Créditos

> Reglas del negocio:

1. Un profesor puede impartir varios cursos.
2. Un curso solamente puede ser impartido por un profesor. 
3. Puede existir un profesor que actualmente no imparta cursos. 
4. Todo curso debe ser asignado a un profesor.

Se debe realizar lo siguiente:
- Entidades 
- Identificar la relación 
**IMPARTE**
- Determinar la cardinalidad
- Determinar la participaación 

# Ejercicio 3

Una escuela administra Alumnos y Materias
> De cada alumno se almacena:
- Matricula
- Nombre
- Semestre

> De cada materia se almacena:
- Clave de la materia
- Nombre de la materia
- Créditos

> Reglas del negocio:
1. Un alumno puede inscribirse en varias materias
2. Una materia puede tener muchos alumnos inscritos
3. Puede existir una materia sin alumnos inscritos
4. Todo alumno debe estar inscrito en al menos una materia
5. De cada inscripción se debe almacenar:
    - Fecha de inscripción 
    - Calificación final

   Relacion: **INSCRIBE**

# Ejercicio 4
Una empresa encargada en realizar ventas de productos:
> De cada cliente se almacena:
- Número de cliente que lo identifique
- Nombre de cliente el cual es una persona moral
- RFC

> La empresa realiza pedido en los cuales almacena:
- Número de pedido
- Fecha

> La empresa también almacena productos de los cuales registra los siguientes:

- Número de producto
- Nombre del producto
- Precio

> Al realizar los pedidos deben registrar la cantidad de productos y su precio

> Reglas del negocio:
1. Un cliente puede realizar muchos pedidos. 
2. Cada pedido pertenece a un solo cliente.
3. Un pedido puede contener varios productos.
4. Un producto puede aparecer en muchos pedidos.
5. Un pedido debe contener al menos un producto 
6. Un producto puede no haber sido vendido.
7. El detalle del pedido no existe sin pedido.
8. El detalle de pedido no existe sin producto.
9. El detalle almacena cantidad y precio de venta.
