-- Datos de prueba para tabla 'departamento'
INSERT INTO departamento (nombre_departamento, ubicacion, presupuesto_anual) VALUES
('Urgencias', 'Edificio A, Planta 1', 500000.00),
('Pediatría', 'Edificio B, Planta 2', 300000.00),
('Cirugía', 'Edificio C, Planta 3', 750000.00),
('Administración', 'Edificio Central', 200000.00),
('Laboratorio', 'Edificio D, Planta 1', 150000.00);

-- Datos de prueba para tabla 'puesto'
INSERT INTO puesto (nombre_puesto, descripcion, salario_min, salario_max, riesgo_laboral) VALUES
('Médico', 'Atención a pacientes', 8000.00, 15000.00, 'Alto'),
('Enfermero/a', 'Asistencia médica', 3000.00, 6000.00, 'Medio'),
('Administrativo', 'Gestión documental', 2500.00, 4000.00, 'Bajo'),
('Técnico de Laboratorio', 'Análisis clínicos', 3500.00, 7000.00, 'Medio'),
('Jefe de Departamento', 'Supervisión de área', 10000.00, 20000.00, 'Bajo');

-- Datos de prueba para tabla 'empleado'
INSERT INTO empleado (id_puesto, id_departamento, nombre, apellido, fecha_nacimiento, genero, direccion, telefono, email, salario_base) VALUES
(1, 1, 'Ana', 'López', '1985-03-15', 'F', 'Calle Primavera 123', '+502 1234-5678', 'ana.lopez@hospital.com', 12000.00),
(2, 1, 'Carlos', 'Martínez', '1990-07-22', 'M', 'Avenida Central 456', '+502 8765-4321', 'carlos.martinez@hospital.com', 4500.00),
(5, 4, 'Luisa', 'García', '1978-11-30', 'F', 'Zona 5, Calle 8-90', '+502 5555-1234', 'luisa.garcia@hospital.com', 15000.00),
(3, 4, 'Mario', 'Rodríguez', '1988-05-10', 'M', 'Colonia Las Flores', '+502 9999-8888', 'mario.rodriguez@hospital.com', 3000.00),
(4, 5, 'Sofía', 'Hernández', '1995-02-14', 'F', 'Boulevard Los Álamos', '+502 3333-4444', 'sofia.hernandez@hospital.com', 5000.00);

-- Actualizar jefes de departamento
UPDATE departamento SET id_jefe = 3 WHERE id_departamento = 4;

-- Datos de prueba para tabla 'turno'
INSERT INTO turno (nombre_turno, hora_inicio, hora_fin, tipo_turno, pago_extra) VALUES
('Matutino', '07:00:00', '15:00:00', 'Matutino', 0.0),
('Vespertino', '15:00:00', '23:00:00', 'Vespertino', 10.0),
('Nocturno', '23:00:00', '24:00:00', 'Nocturno', 20.0),
('Festivo', '08:00:00', '16:00:00', 'Festivo', 25.0),
('Mixto', '10:00:00', '18:00:00', 'Mixto', 15.0);

-- Datos de prueba para tabla 'empleado_turno'
INSERT INTO empleado_turno (id_empleado, id_turno, fecha_asignacion, horas_asignadas) VALUES
(1, 1, '2023-10-01', 40),
(2, 2, '2023-10-01', 35),
(3, 3, '2023-10-01', 30),
(4, 4, '2023-10-01', 25),
(5, 5, '2023-10-01', 40);

-- Datos de prueba para tabla 'especialidad'
INSERT INTO especialidad (nombre_especialidad, descripcion, años_formacion) VALUES
('Cardiología', 'Especialidad en corazón', 5),
('Pediatría', 'Atención a niños', 4),
('Cirugía General', 'Operaciones quirúrgicas', 6),
('Anestesiología', 'Manejo del dolor', 4),
('Radiología', 'Diagnóstico por imágenes', 4);

-- Datos de prueba para tabla 'empleado_especialidad'
INSERT INTO empleado_especialidad (id_empleado, id_especialidad, fecha_obtencion, institucion, certificado) VALUES
(1, 1, '2015-05-20', 'Universidad Nacional', TRUE),
(2, 2, '2018-08-15', 'Instituto Técnico', TRUE),
(3, 3, '2010-10-10', 'Colegio Médico', TRUE),
(4, 4, '2020-03-05', 'Academia de Salud', FALSE),
(5, 5, '2019-11-12', 'Escuela de Radiología', TRUE);

-- Datos de prueba para tabla 'licencia'
INSERT INTO licencia (id_empleado, tipo_licencia, fecha_inicio, fecha_fin, motivo, aprobada) VALUES
(1, 'Vacaciones', '2023-12-01', '2023-12-15', 'Descanso anual', TRUE),
(2, 'Enfermedad', '2023-11-10', '2023-11-20', 'Gripe severa', TRUE),
(3, 'Personal', '2023-09-05', '2023-09-07', 'Asuntos familiares', FALSE),
(4, 'Estudio', '2023-10-20', '2023-10-25', 'Exámenes universitarios', TRUE),
(5, 'Maternidad', '2023-08-01', '2023-11-01', 'Licencia por embarazo', TRUE);

-- Datos de prueba para tabla 'asistencia'
INSERT INTO asistencia (id_empleado, fecha, hora_entrada, hora_salida, estado) VALUES
(1, '2023-10-01', '07:00:00', '15:00:00', 'Presente'),
(2, '2023-10-01', '15:05:00', '23:00:00', 'Tardanza'),
(3, '2023-10-01', NULL, NULL, 'Ausente'),
(4, '2023-10-01', '08:00:00', '16:00:00', 'Presente'),
(5, '2023-10-01', '10:00:00', '18:00:00', 'Presente');

-- Datos de prueba para tabla 'contacto_emergencia'
INSERT INTO contacto_emergencia (id_empleado, nombre_contacto, relacion, telefono, principal) VALUES
(1, 'Juan Pérez', 'Cónyuge', '+502 1111-2222', TRUE),
(2, 'María Gómez', 'Madre', '+502 2222-3333', TRUE),
(3, 'Roberto Sánchez', 'Padre', '+502 3333-4444', FALSE),
(4, 'Laura Ramírez', 'Hermano/a', '+502 4444-5555', TRUE),
(5, 'Pedro Castro', 'Cónyuge', '+502 5555-6666', TRUE);

-- Datos de prueba para tabla 'historial_salario'
INSERT INTO historial_salario (id_empleado, salario_anterior, salario_nuevo, fecha_cambio, motivo) VALUES
(1, 11000.00, 12000.00, '2023-06-01', 'Aumento por desempeño'),
(2, 4000.00, 4500.00, '2023-07-01', 'Ajuste salarial'),
(3, 14000.00, 15000.00, '2023-08-01', 'Promoción a jefe'),
(4, 2800.00, 3000.00, '2023-09-01', 'Incremento anual'),
(5, 4800.00, 5000.00, '2023-10-01', 'Certificación nueva');