# Diccionario de datos de la BD de control escolar
1. Información General 

| Elemento| Valor |
| :--- | :--- |
| Elemento| Valor |
| Proyecto | Control Escolar |
| Fecha | Junio 2026 |
| Elaboro| Laura Lucero Mendoza Davalos|
| SGBD| SQL SERVER|
| Fecha | Junio 2026 |

2. Descripción del sistema de BD

El sistema administra:
- Carreras
- Alumnos
- Profesores
- Materias
- Grupos
- Inscripciones

Permite controlar la oferta académica y la inscripción de estudiantes

3. Catalogo de restricciones utilizadas

| Código| Significado |
| :--- | :--- |
| PK| Primary key |
| FK| Foreign key |
| NN| NOT NULL |
| UQ| UNIQUE |
| AI| Auto Increment |
| CK| Check|
| AI| Auto Increment |
| CK| Check|
| DF| Default |

4. Diccionario de datos

## Tabla: Carrera 

**Descripción**
Almacena las carreras ofertadas por las carreras de la universidad

## Tabla Alumno
**Descripción**
Almacena información de los estudiantes

| Campo| Tipo |Longitud| Restricciones |Descripción|
| :--- | :--- | :--- |:--- |:--- |
| id_alumno| INT |-|PK, AI, NN | Identificador único del alumno
| matricula | VARCHAR| 10 | UQ,NN | Matricula institucional
| nombre| VARCHAR | 30 | NN | Nombre del alumno
| apellido_paterno| VARCHAR| 50 | NN | Apellido paterno
| apellido_materno|VARCHAR| 50 | NN | Apellido paterno
| Correo| VARCHAR | 100 | UQ, NN | Fecha de nacimiento
| id_carrera | INT | - | FK, NN | Carrera a la que pertenece

5. Relaciones en la base de datos

| Campo| Tipo |Longitud|
| :--- | :--- | :--- |
| Carrera - Alumno | 1:N| Una carrera tiene muchos alumnos |
| Carrera - Materia | 1:N |Una carrera tiene muchas materias |
|Profesor - Grupo | 1:N | Un profesor puede impartir varios grupos |
|Materia - Grupo |1:N | Una materia puede abrirse en varios grupos
| Alumno - Inscripcion | 1:N | Un alumno puede tener varias inscripciones |
|Grupo-Inscripción| 1:N | Un grupo puede tener muchos alumnos

6. Matriz de claves Foraneas

| Tabla| Campo FK |Referencia|
| :--- | :--- | :--- |
|  Alumno| id_carrera | Carrera(id_carrera) |
|  Materia| id_carrera | Carrera(id_carrera)  |
|  Grupo| id_profesor | Profesor(id_profesor)  |
|  Inscripción| id_alumno | Alumno(id_alumno)  |
|  Inscripción| id_grupo | Grupo(id_grupo) |

7. Identidad diferencial

| Código| Regla |
| :--- | :--- |
|  IR-01| No se puede registrar un alumno con una carrera inexistente |
|  IR-02| No se puede crerar un grupo para una materia inexistente |
|  IR-03| No se puede crear un grupo para un profesor inexistente |
|  IR-04| No se puede inscribir un alumno en un grupo inexistente |
|  IR-05| No se puede eliminar una carrera que tenga alumnos asociados sin antes resignar o eliminarlos |

8. Reglas del negocio
 
 | Código| Regla |
| :--- | :--- |
|  RN-01| Un alumno pertenece a una sola carrera|
|  RN-02| Una carrera puede tener muchos alumnos|
|  RN-03| Una carrera puede tener muchas materias |
|  RN-04| Un profesor puede impartir varios grupos|
|  RN-05| Un grupo solo puede tener un profesor asignado |
|  RN-06| La calificacoión debe estar entre 0.0 y 10.0|











