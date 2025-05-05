CREATE DATABASE HospitalPersonalDB;


CREATE TABLE departamento (
    id_departamento SERIAL PRIMARY KEY,
    nombre_departamento VARCHAR(100) NOT NULL UNIQUE,
    ubicacion VARCHAR(100) NOT NULL,
    presupuesto_anual DECIMAL(12,2) CHECK (presupuesto_anual >= 0),
    id_jefe INT NULL
);

CREATE TABLE puesto (
    id_puesto SERIAL PRIMARY KEY,
    nombre_puesto VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT NULL,
    salario_min DECIMAL(10,2) NOT NULL CHECK (salario_min > 0),
    salario_max DECIMAL(10,2) NOT NULL CHECK (salario_max >= salario_min),
    riesgo_laboral VARCHAR(50) DEFAULT 'Bajo' CHECK (riesgo_laboral IN ('Bajo', 'Medio', 'Alto', 'Muy alto'))
);

CREATE TABLE empleado (
    id_empleado SERIAL PRIMARY KEY,
    id_puesto INT NOT NULL,
    id_departamento INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL CHECK (fecha_nacimiento < CURRENT_DATE),
    genero CHAR(1) NOT NULL CHECK (genero IN ('M', 'F', 'O')),
    direccion VARCHAR(200) NULL,
    telefono VARCHAR(15) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE CHECK (email ~* '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$'),
    fecha_contratacion DATE NOT NULL DEFAULT CURRENT_DATE,
    salario_base DECIMAL(10,2) NOT NULL CHECK (salario_base > 0),
    activo BOOLEAN DEFAULT TRUE,
    horas_semanales INT DEFAULT 40 CHECK (horas_semanales BETWEEN 20 AND 60),
    CONSTRAINT FK_Empleado_Puesto FOREIGN KEY (id_puesto) REFERENCES puesto(id_puesto),
    CONSTRAINT FK_Empleado_Departamento FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento)
);

ALTER TABLE departamento
ADD CONSTRAINT FK_Departamento_Jefe FOREIGN KEY (id_jefe) REFERENCES empleado(id_empleado);

CREATE TABLE turno (
    id_turno SERIAL PRIMARY KEY,
    nombre_turno VARCHAR(50) NOT NULL UNIQUE,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    tipo_turno VARCHAR(20) NOT NULL CHECK (tipo_turno IN ('Matutino', 'Vespertino', 'Nocturno', 'Mixto', 'Festivo')),
    pago_extra DECIMAL(5,2) DEFAULT 0.0 CHECK (pago_extra BETWEEN 0 AND 100),
    CONSTRAINT CHK_HoraFinMayor CHECK (hora_fin > hora_inicio)
);

-- Dentro de db/ddl.sql

CREATE TABLE empleado_turno (
  id_empleado_turno SERIAL PRIMARY KEY,
  id_empleado INT NOT NULL,
  id_turno INT NOT NULL,
  fecha_asignacion DATE NOT NULL DEFAULT CURRENT_DATE,
  fecha_fin DATE NULL CHECK (fecha_fin IS NULL OR fecha_fin >= fecha_asignacion),
  activo BOOLEAN DEFAULT TRUE,
  horas_asignadas INT DEFAULT 0 CHECK (horas_asignadas >= 0),
  CONSTRAINT FK_EmpleadoTurno_Empleado FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
  CONSTRAINT FK_EmpleadoTurno_Turno    FOREIGN KEY (id_turno)   REFERENCES turno(id_turno)
);

-- Índice único sólo para filas activas
CREATE UNIQUE INDEX UQ_EmpleadoTurnoActivo 
  ON empleado_turno(id_empleado, id_turno)
  WHERE activo = TRUE;


CREATE TABLE especialidad (
    id_especialidad SERIAL PRIMARY KEY,
    nombre_especialidad VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT NULL,
    años_formacion INT DEFAULT 0 CHECK (años_formacion >= 0)
);

CREATE TABLE empleado_especialidad (
    id_empleado_especialidad SERIAL PRIMARY KEY,
    id_empleado INT NOT NULL,
    id_especialidad INT NOT NULL,
    fecha_obtencion DATE NOT NULL CHECK (fecha_obtencion <= CURRENT_DATE),
    institucion VARCHAR(100) NOT NULL,
    certificado BOOLEAN DEFAULT FALSE,
    CONSTRAINT FK_EmpleadoEspecialidad_Empleado FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    CONSTRAINT FK_EmpleadoEspecialidad_Especialidad FOREIGN KEY (id_especialidad) REFERENCES especialidad(id_especialidad),
    CONSTRAINT UQ_EmpleadoEspecialidad UNIQUE (id_empleado, id_especialidad)
);

CREATE TABLE licencia (
    id_licencia SERIAL PRIMARY KEY,
    id_empleado INT NOT NULL,
    tipo_licencia VARCHAR(50) NOT NULL CHECK (tipo_licencia IN ('Enfermedad', 'Maternidad', 'Vacaciones', 'Personal', 'Estudio')),
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    motivo TEXT NULL,
    aprobada BOOLEAN DEFAULT FALSE,
    dias_totales INT GENERATED ALWAYS AS (fecha_fin - fecha_inicio + 1) STORED,
    CONSTRAINT FK_Licencia_Empleado FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    CONSTRAINT CHK_FechaLicencia CHECK (fecha_fin >= fecha_inicio)
);

CREATE TABLE asistencia (
    id_asistencia SERIAL PRIMARY KEY,
    id_empleado INT NOT NULL,
    fecha DATE NOT NULL DEFAULT CURRENT_DATE,
    hora_entrada TIME NULL,
    hora_salida TIME NULL,
    estado VARCHAR(20) NOT NULL CHECK (estado IN ('Presente', 'Ausente', 'Tardanza', 'Licencia', 'Vacaciones')),
    horas_trabajadas DECIMAL(5,2) GENERATED ALWAYS AS (
        CASE 
            WHEN hora_entrada IS NULL OR hora_salida IS NULL THEN 0
            ELSE EXTRACT(EPOCH FROM (hora_salida - hora_entrada))/3600
        END
    ) STORED,
    CONSTRAINT FK_Asistencia_Empleado FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    CONSTRAINT UQ_Asistencia_EmpleadoFecha UNIQUE (id_empleado, fecha),
    CONSTRAINT CHK_HorasAsistencia CHECK (
        (hora_entrada IS NULL AND hora_salida IS NULL) OR 
        (hora_entrada IS NOT NULL AND hora_salida IS NOT NULL AND hora_salida > hora_entrada)
    )
);

CREATE TABLE contacto_emergencia (
    id_contacto SERIAL PRIMARY KEY,
    id_empleado INT NOT NULL,
    nombre_contacto VARCHAR(100) NOT NULL,
    relacion VARCHAR(50) NOT NULL CHECK (relacion IN ('Padre', 'Madre', 'Hijo/a', 'Cónyuge', 'Hermano/a', 'Otro')),
    telefono VARCHAR(15) NOT NULL,
    principal BOOLEAN DEFAULT FALSE,
    CONSTRAINT FK_ContactoEmergencia_Empleado FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
);

CREATE TABLE historial_salario (
    id_historial SERIAL PRIMARY KEY,
    id_empleado INT NOT NULL,
    salario_anterior DECIMAL(10,2) NULL,
    salario_nuevo DECIMAL(10,2) NOT NULL CHECK (salario_nuevo > 0),
    fecha_cambio DATE NOT NULL DEFAULT CURRENT_DATE,
    motivo VARCHAR(200) NULL,
    autorizado_por INT NULL,
    CONSTRAINT FK_HistorialSalario_Empleado FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    CONSTRAINT FK_HistorialSalario_AutorizadoPor FOREIGN KEY (autorizado_por) REFERENCES empleado(id_empleado),
    CONSTRAINT CHK_SalarioCambio CHECK (salario_nuevo <> salario_anterior)
);

