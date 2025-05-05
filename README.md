# Proyecto3_BaseDatos1
Proyecto#3 del curso de Base de datos 1

# 🏥 Hospital Personal Management System

Sistema de gestión de personal hospitalario desarrollado con **FastAPI**, **PostgreSQL** y **Docker**. Permite generar reportes de empleados, salarios, licencias y más, con exportación a CSV/Excel/PDF.

---

## 📌 Características Principales
- Generación de reportes por departamento, salario promedio, distribución de género, riesgo laboral y licencias.
- Exportación de datos a formatos CSV, Excel y PDF.
- Base de datos inicializada con datos de prueba (DDL + DML).
- Arquitectura modular y escalable usando Docker.

---

## 🧰 Requisitos
- [Docker](https://www.docker.com/) y [Docker Compose](https://docs.docker.com/compose/)
- Git (para clonar el repositorio)

---

## 🚀 Instalación y Uso

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
- **PostgreSQL** con datos iniciales (`ddl.sql` y `dml.sql`)

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

### Exportar Datos (CSV/Excel/PDF)
| Endpoint | Descripción |
|---------|-------------|
| `GET /api/exportar/empleados-departamento` | Exportar reporte de empleados por departamento |
| `GET /api/exportar/salario-promedio` | Exportar salario promedio por puesto |
| `GET /api/exportar/licencias-por-tipo?year=2023` | Exportar licencias por tipo |

---

## 🗂️ Estructura del Proyecto
```
hospital-personal-management/
├── docker-compose.yml      # Configuración de contenedores
├── Dockerfile              # Definición del entorno FastAPI
├── ddl.sql                 # Script para crear tablas
├── dml.sql                 # Datos iniciales
├── backend/
│   ├── app.py              # Código principal de FastAPI
│   ├── requirements.txt    # Dependencias de Python
│   └── reportes/           # Archivos exportados (CSV, Excel, PDF)
```

---

## 🤝 Contribuir
¡Las contribuciones son bienvenidas! Si encuentras errores o quieres mejorar el sistema:
1. Crea un fork del repositorio.
2. Haz tus cambios y envía un Pull Request.

---

## 📄 Licencia
Este proyecto está bajo la [Licencia MIT](LICENSE).  
Copyright © 2025 [Tu Nombre]

---

### 💡 Notas
- **No incluyas la carpeta `venv` en el repositorio**. Usa Docker para gestionar dependencias.
- Los archivos generados (CSV/PDF) se guardan en la carpeta `backend/reportes/`.
- Asegúrate de tener permisos para ejecutar Docker.

---

Con este README, cualquier persona podrá entender tu proyecto, instalarlo y usarlo sin problemas. ¡Perfecto para compartir en GitHub! 🚀
