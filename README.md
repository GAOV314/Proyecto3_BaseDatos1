# Proyecto3_BaseDatos1
Proyecto#3 del curso de Base de datos 1 - Hospital Personal Management System

Sistema de reportes de personal hospitalario desarrollado con **FastAPI**, **PostgreSQL** y **Docker**. Permite generar reportes de empleados, salarios, licencias y más, con exportación a CSV/Excel/PDF.

---

## Características Principales
- Generación de reportes por departamento, salario promedio, distribución de género, riesgo laboral y licencias.
- Exportación de datos a formatos CSV, Excel y PDF.
- Base de datos inicializada con datos de prueba (DDL + DML + TRIGGERS).
- Arquitectura modular y escalable usando Docker.

---

## Requisitos
- [Docker](https://www.docker.com/) y [Docker Compose](https://docs.docker.com/compose/)
- Git (para clonar el repositorio)

---

## Instalación y Uso

### 1. Clonar el repositorio
```bash
git clone https://github.com/tu-usuario/hospital-personal-management.git
cd hospital-personal-management
```

### 2. Iniciar los contenedores
```bash
docker-compose up --build
```
> Esto iniciará:
- **FastAPI** en `http://localhost:8000`
- **PostgreSQL** con datos iniciales (`ddl.sql`, `dml.sql` y `triggers.sql`)

### 3. Detener los contenedores
```bash
docker-compose down
```

---

## 📊 Endpoints Disponibles

### Mostrar Datos (JSON)
| Endpoint | Descripción |
|---------|-------------|
| `GET /api/empleados-departamento` | Empleados por departamento |
| `GET /api/salario-promedio` | Salario promedio por puesto |
| `GET /api/distribucion-genero` | Distribución de género |
| `GET /api/empleados-riesgo-laboral` | Empleados por riesgo laboral |
| `GET /api/presupuesto-vs-empleados` | Presupuesto vs empleados |
| `GET /api/licencias-por-tipo?year=2023` | Licencias por tipo (ej: `year=2023`) |
| `GET /test` | Verificar que el servidor esté activo |

---

##  Estructura del Proyecto
```
Proyecto3_BaseDatos1/
├── backend/
│   ├── app.py              # Código principal de FastAPI
│   ├── requirements.txt    # Dependencias de Python
│   ├── Dockerfile          # Definición del entorno FastAPI
│   └── reportes/           # Archivos exportados (CSV, Excel, PDF)
├── db/
│   ├── ddl.sql             # Script para crear tablas
│   ├── dml.sql             # Datos iniciales
│   └── triggers.sql        # Triggers principales para las tablas
├── docs/
│   ├── Reflexión (Daniel).pdf   # Reflexion del Proyecto de Daniel Chet - 231177
│   ├── Reflexión (Dulce).pdf    # Reflexion del Proyecto de Dulce Ambrosio - 231143
│   ├── Reflexión (Gadiel).pdf   # Reflexion del Proyecto de Gadiel Ocaña - 231270
│   └── Proyecto3_BD1.pdf        # Informe del Proyecto con el modelo ER
├── frontend/
├── gui/
│   └── gui_app.py             # Interfaz grafica para poder comprobar los reportes y exportaciones de los mismos
```

---


### Notas
- **No incluyas la carpeta `venv` en el repositorio**. Usa Docker para gestionar dependencias.
- Los archivos generados (CSV/PDF) se pueden guardar en la carpeta `backend/reportes/`, pero tambien tienes opcion de decidir donde los quieres.
- Asegúrate de tener permisos para ejecutar Docker.
- La carpeta frontend logra generar ciertos reportes pero recomendamos luego de levantar el entorno con Docker correr el archivo gui_app.py, para poder ver todos los reportes y sus exportaciones sin complicaciones :D.

---
