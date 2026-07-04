# Descripción del Sistema

El sistema administra la información de los pacientes y sus expedientes médicos. Permite registrar los datos personales del paciente, la fecha de apertura del expediente y el tipo de sangre correspondiente. Cada paciente cuenta con un único expediente médico.

---

# Catálogo de Restricciones Utilizadas

## Llaves Primarias

- Paciente(idPaciente)
- Expediente(numExpediente)

## Llaves Foráneas

- Expediente.idPaciente → Paciente.idPaciente

## Restricciones CHECK

- La fecha de apertura debe ser igual o posterior a la fecha de nacimiento del paciente.
- El tipo de sangre debe corresponder a un valor válido (A+, A-, B+, B-, AB+, AB-, O+, O-).

## Restricciones UNIQUE

- idPaciente
- numExpediente

---

# Diccionario de Datos

## Tabla: Paciente

| Campo | Tipo | Descripción |
|--------|------|-------------|
| idPaciente | INT | Identificador único del paciente |
| fechaNacimiento | DATE | Fecha de nacimiento del paciente |
| nombre | VARCHAR(50) | Nombre del paciente |
| apellido1 | VARCHAR(50) | Primer apellido del paciente |
| apellido2 | VARCHAR(50) | Segundo apellido del paciente |

---

## Tabla: Expediente

| Campo | Tipo | Descripción |
|--------|------|-------------|
| numExpediente | INT | Número único del expediente médico |
| fechaApertura | DATE | Fecha en que se abrió el expediente |
| tipoSangre | VARCHAR(5) | Tipo de sangre del paciente |
| idPaciente | INT | Paciente propietario del expediente |

---

# Relaciones en la Base de Datos

| Tabla Padre | Tabla Hija | Cardinalidad |
|--------------|------------|--------------|
| Paciente | Expediente | 1 : 1 |

---

# Matriz de Claves Foráneas

| Tabla | Llave Foránea | Referencia |
|--------|---------------|------------|
| Expediente | idPaciente | Paciente.idPaciente |

---

# Integridad Referencial

- No puede existir un expediente sin un paciente registrado.
- Cada expediente debe estar asociado a un único paciente.
- Un paciente solo puede tener un expediente médico.
- No se puede eliminar un paciente mientras tenga un expediente asociado.
- El identificador del paciente registrado en el expediente debe existir previamente en la tabla **Paciente**.

---

# Reglas de Negocio

1. Cada paciente debe tener un identificador único.
2. Cada expediente debe tener un número único.
3. Un paciente puede tener únicamente un expediente médico.
4. Cada expediente pertenece exclusivamente a un paciente.
5. La fecha de apertura del expediente debe ser igual o posterior a la fecha de nacimiento del paciente.
6. El tipo de sangre debe registrarse utilizando una clasificación válida.
7. No puede registrarse un expediente para un paciente inexistente.
8. No se puede eliminar un paciente sin antes eliminar o reasignar su expediente.
9. Toda la información del paciente debe registrarse antes de crear su expediente.
10. La relación entre **Paciente** y **Expediente** es de uno a uno (1:1).

----

# Modero Relacional
![Expedientes](../img/E-R/ModeloRe1.jpg)