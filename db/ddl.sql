<<<<<<< HEAD
-- Table: public.departamento

-- DROP TABLE IF EXISTS public.departamento;

CREATE TABLE IF NOT EXISTS public.departamento
(
    id_departamento integer NOT NULL DEFAULT nextval('departamento_id_departamento_seq'::regclass),
    nombre_departamento character varying(100) COLLATE pg_catalog."default" NOT NULL,
    ubicacion character varying(100) COLLATE pg_catalog."default" NOT NULL,
    presupuesto_anual numeric(12,2),
    id_jefe integer,
    CONSTRAINT departamento_pkey PRIMARY KEY (id_departamento),
    CONSTRAINT departamento_nombre_departamento_key UNIQUE (nombre_departamento),
    CONSTRAINT fk_departamento_jefe FOREIGN KEY (id_jefe)
        REFERENCES public.empleado (id_empleado) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT departamento_presupuesto_anual_check CHECK (presupuesto_anual >= 0::numeric)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.departamento
    OWNER to postgres;

-- Table: public.especialidad

-- DROP TABLE IF EXISTS public.especialidad;

CREATE TABLE IF NOT EXISTS public.especialidad
(
    id_especialidad integer NOT NULL DEFAULT nextval('especialidad_id_especialidad_seq'::regclass),
    nombre_especialidad character varying(100) COLLATE pg_catalog."default" NOT NULL,
    descripcion text COLLATE pg_catalog."default",
    "a¤os_formacion" integer DEFAULT 0,
    CONSTRAINT especialidad_pkey PRIMARY KEY (id_especialidad),
    CONSTRAINT especialidad_nombre_especialidad_key UNIQUE (nombre_especialidad),
    CONSTRAINT "especialidad_a¤os_formacion_check" CHECK ("a¤os_formacion" >= 0)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.especialidad
    OWNER to postgres; 

-- Table: public.puesto

-- DROP TABLE IF EXISTS public.puesto;

CREATE TABLE IF NOT EXISTS public.puesto
(
    id_puesto integer NOT NULL DEFAULT nextval('puesto_id_puesto_seq'::regclass),
    nombre_puesto character varying(100) COLLATE pg_catalog."default" NOT NULL,
    descripcion text COLLATE pg_catalog."default",
    salario_min numeric(10,2) NOT NULL,
    salario_max numeric(10,2) NOT NULL,
    riesgo_laboral character varying(50) COLLATE pg_catalog."default" DEFAULT 'Bajo'::character varying,
    CONSTRAINT puesto_pkey PRIMARY KEY (id_puesto),
    CONSTRAINT puesto_nombre_puesto_key UNIQUE (nombre_puesto),
    CONSTRAINT puesto_check CHECK (salario_max >= salario_min),
    CONSTRAINT puesto_riesgo_laboral_check CHECK (riesgo_laboral::text = ANY (ARRAY['Bajo'::character varying, 'Medio'::character varying, 'Alto'::character varying, 'Muy alto'::character varying]::text[])),
    CONSTRAINT puesto_salario_min_check CHECK (salario_min > 0::numeric)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.puesto
    OWNER to postgres;

-- Table: public.empleado

-- DROP TABLE IF EXISTS public.empleado;

CREATE TABLE IF NOT EXISTS public.empleado
(
    id_empleado integer NOT NULL DEFAULT nextval('empleado_id_empleado_seq'::regclass),
    id_puesto integer NOT NULL,
    id_departamento integer NOT NULL,
    nombre character varying(100) COLLATE pg_catalog."default" NOT NULL,
    apellido character varying(100) COLLATE pg_catalog."default" NOT NULL,
    fecha_nacimiento date NOT NULL,
    genero character(1) COLLATE pg_catalog."default" NOT NULL,
    direccion character varying(200) COLLATE pg_catalog."default",
    telefono character varying(15) COLLATE pg_catalog."default" NOT NULL,
    email character varying(100) COLLATE pg_catalog."default" NOT NULL,
    fecha_contratacion date NOT NULL DEFAULT CURRENT_DATE,
    salario_base numeric(10,2) NOT NULL,
    activo boolean DEFAULT true,
    horas_semanales integer DEFAULT 40,
    CONSTRAINT empleado_pkey PRIMARY KEY (id_empleado),
    CONSTRAINT empleado_email_key UNIQUE (email),
    CONSTRAINT empleado_telefono_key UNIQUE (telefono),
    CONSTRAINT fk_empleado_departamento FOREIGN KEY (id_departamento)
        REFERENCES public.departamento (id_departamento) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_empleado_puesto FOREIGN KEY (id_puesto)
        REFERENCES public.puesto (id_puesto) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT empleado_email_check CHECK (email::text ~* '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$'::text),
    CONSTRAINT empleado_fecha_nacimiento_check CHECK (fecha_nacimiento < CURRENT_DATE),
    CONSTRAINT empleado_genero_check CHECK (genero = ANY (ARRAY['M'::bpchar, 'F'::bpchar, 'O'::bpchar])),
    CONSTRAINT empleado_horas_semanales_check CHECK (horas_semanales >= 20 AND horas_semanales <= 60),
    CONSTRAINT empleado_salario_base_check CHECK (salario_base > 0::numeric)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.empleado
    OWNER to postgres;
-- Index: ix_empleado_departamento

-- DROP INDEX IF EXISTS public.ix_empleado_departamento;

CREATE INDEX IF NOT EXISTS ix_empleado_departamento
    ON public.empleado USING btree
    (id_departamento ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: ix_empleado_nombreapellido

-- DROP INDEX IF EXISTS public.ix_empleado_nombreapellido;

CREATE INDEX IF NOT EXISTS ix_empleado_nombreapellido
    ON public.empleado USING btree
    (nombre COLLATE pg_catalog."default" ASC NULLS LAST, apellido COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Trigger: tr_registrar_cambio_salario

-- DROP TRIGGER IF EXISTS tr_registrar_cambio_salario ON public.empleado;

CREATE OR REPLACE TRIGGER tr_registrar_cambio_salario
    AFTER UPDATE 
    ON public.empleado
    FOR EACH ROW
    EXECUTE FUNCTION public.registrar_cambio_salario();

ALTER TABLE public.empleado
    DISABLE TRIGGER tr_registrar_cambio_salario;

-- Trigger: tr_validar_salario_empleado

-- DROP TRIGGER IF EXISTS tr_validar_salario_empleado ON public.empleado;

CREATE OR REPLACE TRIGGER tr_validar_salario_empleado
    BEFORE INSERT OR UPDATE 
    ON public.empleado
    FOR EACH ROW
    EXECUTE FUNCTION public.validar_salario_empleado();

ALTER TABLE public.empleado
    DISABLE TRIGGER tr_validar_salario_empleado;



-- Table: public.asistencia

-- DROP TABLE IF EXISTS public.asistencia;

CREATE TABLE IF NOT EXISTS public.asistencia
(
    id_asistencia integer NOT NULL DEFAULT nextval('asistencia_id_asistencia_seq'::regclass),
    id_empleado integer NOT NULL,
    fecha date NOT NULL DEFAULT CURRENT_DATE,
    hora_entrada time without time zone,
    hora_salida time without time zone,
    estado character varying(20) COLLATE pg_catalog."default" NOT NULL,
    horas_trabajadas numeric(5,2) GENERATED ALWAYS AS (
CASE
    WHEN ((hora_entrada IS NULL) OR (hora_salida IS NULL)) THEN (0)::numeric
    ELSE (EXTRACT(epoch FROM (hora_salida - hora_entrada)) / (3600)::numeric)
END) STORED,
    CONSTRAINT asistencia_pkey PRIMARY KEY (id_asistencia),
    CONSTRAINT uq_asistencia_empleadofecha UNIQUE (id_empleado, fecha),
    CONSTRAINT fk_asistencia_empleado FOREIGN KEY (id_empleado)
        REFERENCES public.empleado (id_empleado) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT asistencia_estado_check CHECK (estado::text = ANY (ARRAY['Presente'::character varying, 'Ausente'::character varying, 'Tardanza'::character varying, 'Licencia'::character varying, 'Vacaciones'::character varying]::text[])),
    CONSTRAINT chk_horasasistencia CHECK (hora_entrada IS NULL AND hora_salida IS NULL OR hora_entrada IS NOT NULL AND hora_salida IS NOT NULL AND hora_salida > hora_entrada)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.asistencia
    OWNER to postgres;
-- Index: ix_asistencia_fecha

-- DROP INDEX IF EXISTS public.ix_asistencia_fecha;

CREATE INDEX IF NOT EXISTS ix_asistencia_fecha
    ON public.asistencia USING btree
    (fecha ASC NULLS LAST)
    TABLESPACE pg_default;

-- Table: public.contacto_emergencia

-- DROP TABLE IF EXISTS public.contacto_emergencia;

CREATE TABLE IF NOT EXISTS public.contacto_emergencia
(
    id_contacto integer NOT NULL DEFAULT nextval('contacto_emergencia_id_contacto_seq'::regclass),
    id_empleado integer NOT NULL,
    nombre_contacto character varying(100) COLLATE pg_catalog."default" NOT NULL,
    relacion character varying(50) COLLATE pg_catalog."default" NOT NULL,
    telefono character varying(15) COLLATE pg_catalog."default" NOT NULL,
    principal boolean DEFAULT false,
    CONSTRAINT contacto_emergencia_pkey PRIMARY KEY (id_contacto),
    CONSTRAINT fk_contactoemergencia_empleado FOREIGN KEY (id_empleado)
        REFERENCES public.empleado (id_empleado) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT contacto_emergencia_relacion_check CHECK (relacion::text = ANY (ARRAY['Padre'::character varying, 'Madre'::character varying, 'Hijo/a'::character varying, 'C¢nyuge'::character varying, 'Hermano/a'::character varying, 'Otro'::character varying]::text[]))
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.contacto_emergencia
    OWNER to postgres;



-- Table: public.empleado_especialidad

-- DROP TABLE IF EXISTS public.empleado_especialidad;

CREATE TABLE IF NOT EXISTS public.empleado_especialidad
(
    id_empleado_especialidad integer NOT NULL DEFAULT nextval('empleado_especialidad_id_empleado_especialidad_seq'::regclass),
    id_empleado integer NOT NULL,
    id_especialidad integer NOT NULL,
    fecha_obtencion date NOT NULL,
    institucion character varying(100) COLLATE pg_catalog."default" NOT NULL,
    certificado boolean DEFAULT false,
    CONSTRAINT empleado_especialidad_pkey PRIMARY KEY (id_empleado_especialidad),
    CONSTRAINT uq_empleadoespecialidad UNIQUE (id_empleado, id_especialidad),
    CONSTRAINT fk_empleadoespecialidad_empleado FOREIGN KEY (id_empleado)
        REFERENCES public.empleado (id_empleado) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_empleadoespecialidad_especialidad FOREIGN KEY (id_especialidad)
        REFERENCES public.especialidad (id_especialidad) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT empleado_especialidad_fecha_obtencion_check CHECK (fecha_obtencion <= CURRENT_DATE)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.empleado_especialidad
    OWNER to postgres;


-- Table: public.turno

-- DROP TABLE IF EXISTS public.turno;

CREATE TABLE IF NOT EXISTS public.turno
(
    id_turno integer NOT NULL DEFAULT nextval('turno_id_turno_seq'::regclass),
    nombre_turno character varying(50) COLLATE pg_catalog."default" NOT NULL,
    hora_inicio time without time zone NOT NULL,
    hora_fin time without time zone NOT NULL,
    tipo_turno character varying(20) COLLATE pg_catalog."default" NOT NULL,
    pago_extra numeric(5,2) DEFAULT 0.0,
    CONSTRAINT turno_pkey PRIMARY KEY (id_turno),
    CONSTRAINT turno_nombre_turno_key UNIQUE (nombre_turno),
    CONSTRAINT chk_horafinmayor CHECK (hora_fin > hora_inicio),
    CONSTRAINT turno_pago_extra_check CHECK (pago_extra >= 0::numeric AND pago_extra <= 100::numeric),
    CONSTRAINT turno_tipo_turno_check CHECK (tipo_turno::text = ANY (ARRAY['Matutino'::character varying, 'Vespertino'::character varying, 'Nocturno'::character varying, 'Mixto'::character varying, 'Festivo'::character varying]::text[]))
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.turno
    OWNER to postgres;

-- Table: public.empleado_turno

-- DROP TABLE IF EXISTS public.empleado_turno;

CREATE TABLE IF NOT EXISTS public.empleado_turno
(
    id_empleado_turno integer NOT NULL DEFAULT nextval('empleado_turno_id_empleado_turno_seq'::regclass),
    id_empleado integer NOT NULL,
    id_turno integer NOT NULL,
    fecha_asignacion date NOT NULL DEFAULT CURRENT_DATE,
    fecha_fin date,
    activo boolean DEFAULT true,
    horas_asignadas integer DEFAULT 0,
    CONSTRAINT empleado_turno_pkey PRIMARY KEY (id_empleado_turno),
    CONSTRAINT fk_empleadoturno_empleado FOREIGN KEY (id_empleado)
        REFERENCES public.empleado (id_empleado) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_empleadoturno_turno FOREIGN KEY (id_turno)
        REFERENCES public.turno (id_turno) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT empleado_turno_check CHECK (fecha_fin IS NULL OR fecha_fin >= fecha_asignacion),
    CONSTRAINT empleado_turno_horas_asignadas_check CHECK (horas_asignadas >= 0)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.empleado_turno
    OWNER to postgres;
-- Index: uq_empleadoturnoactivo

-- DROP INDEX IF EXISTS public.uq_empleadoturnoactivo;

CREATE UNIQUE INDEX IF NOT EXISTS uq_empleadoturnoactivo
    ON public.empleado_turno USING btree
    (id_empleado ASC NULLS LAST, id_turno ASC NULLS LAST)
    TABLESPACE pg_default
    WHERE activo = true;




-- Table: public.historial_salario

-- DROP TABLE IF EXISTS public.historial_salario;

CREATE TABLE IF NOT EXISTS public.historial_salario
(
    id_historial integer NOT NULL DEFAULT nextval('historial_salario_id_historial_seq'::regclass),
    id_empleado integer NOT NULL,
    salario_anterior numeric(10,2),
    salario_nuevo numeric(10,2) NOT NULL,
    fecha_cambio date NOT NULL DEFAULT CURRENT_DATE,
    motivo character varying(200) COLLATE pg_catalog."default",
    autorizado_por integer,
    CONSTRAINT historial_salario_pkey PRIMARY KEY (id_historial),
    CONSTRAINT fk_historialsalario_autorizadopor FOREIGN KEY (autorizado_por)
        REFERENCES public.empleado (id_empleado) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_historialsalario_empleado FOREIGN KEY (id_empleado)
        REFERENCES public.empleado (id_empleado) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT chk_salariocambio CHECK (salario_nuevo <> salario_anterior),
    CONSTRAINT historial_salario_salario_nuevo_check CHECK (salario_nuevo > 0::numeric)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.historial_salario
    OWNER to postgres;

-- Table: public.licencia

-- DROP TABLE IF EXISTS public.licencia;

CREATE TABLE IF NOT EXISTS public.licencia
(
    id_licencia integer NOT NULL DEFAULT nextval('licencia_id_licencia_seq'::regclass),
    id_empleado integer NOT NULL,
    tipo_licencia character varying(50) COLLATE pg_catalog."default" NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    motivo text COLLATE pg_catalog."default",
    aprobada boolean DEFAULT false,
    dias_totales integer GENERATED ALWAYS AS (((fecha_fin - fecha_inicio) + 1)) STORED,
    CONSTRAINT licencia_pkey PRIMARY KEY (id_licencia),
    CONSTRAINT fk_licencia_empleado FOREIGN KEY (id_empleado)
        REFERENCES public.empleado (id_empleado) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT chk_fechalicencia CHECK (fecha_fin >= fecha_inicio),
    CONSTRAINT licencia_tipo_licencia_check CHECK (tipo_licencia::text = ANY (ARRAY['Enfermedad'::character varying, 'Maternidad'::character varying, 'Vacaciones'::character varying, 'Personal'::character varying, 'Estudio'::character varying]::text[]))
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.licencia
    OWNER to postgres;


=======
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
>>>>>>> caf220163d964b1eb5dfc78205ecac53f190acca

