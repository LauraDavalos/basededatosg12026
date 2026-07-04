# Descripción del Sistema

El sistema administra la información de los profesores y los cursos que imparten. Permite registrar la especialidad de cada profesor, así como los cursos asignados y los créditos correspondientes.

---

# Catálogo de Restricciones Utilizadas

## Llaves Primarias

- Profesor(claveProfesor)
- Curso(idCurso)

## Llaves Foráneas

- Curso.claveProfesor → Profesor.claveProfesor

## Restricciones CHECK

- Créditos mayores que 0.

## Restricciones UNIQUE

- claveProfesor
- idCurso

---

# Diccionario de Datos

## Tabla: Profesor

| Campo | Tipo | Descripción |
|--------|------|-------------|
| claveProfesor | VARCHAR(15) | Identificador único del profesor |
| apellido1 | VARCHAR(50) | Primer apellido del profesor |
| apellido2 | VARCHAR(50) | Segundo apellido del profesor |
| Especialidad | VARCHAR(80) | Área de especialidad del profesor |

---

## Tabla: Curso

| Campo | Tipo | Descripción |
|--------|------|-------------|
| idCurso | INT | Identificador del curso |
| nombreCurso | VARCHAR(80) | Nombre del curso |
| creditos | INT | Número de créditos del curso |
| claveProfesor | VARCHAR(15) | Profesor encargado del curso |

---

# Relaciones en la Base de Datos

| Tabla Padre | Tabla Hija | Cardinalidad |
|--------------|------------|--------------|
| Profesor | Curso | 1 : N |

---

# Matriz de Claves Foráneas

| Tabla | Llave Foránea | Referencia |
|--------|---------------|------------|
| Curso | claveProfesor | Profesor.claveProfesor |

---

# Integridad Referencial

- Todo curso debe estar asignado a un profesor registrado.
- No puede existir un curso con un profesor inexistente.
- No se puede eliminar un profesor mientras tenga cursos asignados.
- Cada curso debe estar relacionado con un único profesor.

---

# Reglas de Negocio

1. Un profesor puede impartir uno o varios cursos.
2. Cada curso debe ser impartido por un solo profesor.
3. Los créditos del curso deben ser mayores que cero.
4. Cada profesor debe tener una clave única.
5. Cada curso debe tener un identificador único.
6. La especialidad del profesor debe estar registrada.
7. No puede existir un curso sin un profesor asignado.
8. Un profesor puede impartir cursos de acuerdo con su especialidad.
9. El nombre del curso debe ser único dentro del catálogo de cursos.
10. La relación entre profesor y curso es de uno a muchos (1:N).

----
# Modelo Relacional
![Cursos](../img/E-R/ModeloRe2.jpg)