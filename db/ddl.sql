CREATE DATABASE HospitalPersonalDB;

-- Tabla: puesto
CREATE TABLE puesto (
    id_puesto SERIAL PRIMARY KEY,
    nombre_puesto VARCHAR(100) NOT NULL,
    descripcion TEXT,
    salario_min DECIMAL(10,2),
    salario_max DECIMAL(10,2),
    riesgo_laboral VARCHAR(50)
);

-- Tabla: departamento
CREATE TABLE departamento (
    id_departamento SERIAL PRIMARY KEY,
    nombre_departamento VARCHAR(100) NOT NULL,
    ubicacion VARCHAR(100),
    presupuesto_anual DECIMAL(12,2)
);

-- Tabla: empleado
CREATE TABLE empleado (
    id_empleado SERIAL PRIMARY KEY,
    id_puesto INT NOT NULL,
    id_departamento INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    genero CHAR(1) NOT NULL,
    direccion VARCHAR(200),
    telefono VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL,
    fecha_contratacion DATE NOT NULL,
    salario_base DECIMAL(10,2) NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    horas_semanales INT DEFAULT 40,
    CONSTRAINT fk_puesto FOREIGN KEY (id_puesto) REFERENCES puesto(id_puesto),
    CONSTRAINT fk_departamento FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento)
);


-- Tabla: turno
CREATE TABLE turno (
    id_turno SERIAL PRIMARY KEY,
    nombre_turno VARCHAR(50) NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    tipo_turno VARCHAR(20) NOT NULL,
    pago_extra DECIMAL(5,2) DEFAULT 0.0
);

-- Tabla: empleado_turno
CREATE TABLE empleado_turno (
    id_empleado_turno SERIAL PRIMARY KEY,
    id_empleado INT NOT NULL,
    id_turno INT NOT NULL,
    fecha_asignacion DATE NOT NULL,
    fecha_fin DATE,
    activo BOOLEAN DEFAULT TRUE,
    horas_asignadas INT DEFAULT 0,
    CONSTRAINT fk_empleado_turno_empleado FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    CONSTRAINT fk_empleado_turno_turno FOREIGN KEY (id_turno) REFERENCES turno(id_turno)
);

-- Tabla: especialidad
CREATE TABLE especialidad (
    id_especialidad SERIAL PRIMARY KEY,
    nombre_especialidad VARCHAR(100) NOT NULL,
    descripcion TEXT,
    años_formacion INT DEFAULT 0
);

-- Tabla: empleado_especialidad
CREATE TABLE empleado_especialidad (
    id_empleado_especialidad SERIAL PRIMARY KEY,
    id_empleado INT NOT NULL,
    id_especialidad INT NOT NULL,
    fecha_obtencion DATE NOT NULL,
    institucion VARCHAR(100),
    certificado BOOLEAN DEFAULT FALSE,
    CONSTRAINT fk_empleado_especialidad_empleado FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    CONSTRAINT fk_empleado_especialidad_especialidad FOREIGN KEY (id_especialidad) REFERENCES especialidad(id_especialidad)
);

-- Tabla: licencia
CREATE TABLE licencia (
    id_licencia SERIAL PRIMARY KEY,
    id_empleado INT NOT NULL,
    tipo_licencia VARCHAR(50) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    motivo TEXT,
    aprobada BOOLEAN DEFAULT FALSE,
    dias_totales INT,
    CONSTRAINT fk_licencia_empleado FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
);

-- Tabla: asistencia
CREATE TABLE asistencia (
    id_asistencia SERIAL PRIMARY KEY,
    id_empleado INT NOT NULL,
    fecha DATE NOT NULL,
    hora_entrada TIME,
    hora_salida TIME,
    estado VARCHAR(20) NOT NULL,
    horas_trabajadas INT,
    CONSTRAINT fk_asistencia_empleado FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
);

-- Tabla: contacto_emergencia
CREATE TABLE contacto_emergencia (
    id_contacto SERIAL PRIMARY KEY,
    id_empleado INT NOT NULL,
    nombre_contacto VARCHAR(100) NOT NULL,
    relacion VARCHAR(50) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    principal BOOLEAN DEFAULT FALSE,
    CONSTRAINT fk_contacto_empleado FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
);

-- Tabla: historial_salario
CREATE TABLE historial_salario (
    id_historial SERIAL PRIMARY KEY,
    id_empleado INT NOT NULL,
    salario_anterior DECIMAL(10,2),
    salario_nuevo DECIMAL(10,2) NOT NULL,
    fecha_cambio DATE NOT NULL,
    motivo VARCHAR(200),
    autorizado_por INT,
    CONSTRAINT fk_historial_empleado FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    CONSTRAINT fk_historial_autorizador FOREIGN KEY (autorizado_por) REFERENCES empleado(id_empleado)
);