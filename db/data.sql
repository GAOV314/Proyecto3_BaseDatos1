--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-05-05 01:48:01

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4896 (class 0 OID 17222)
-- Dependencies: 218
-- Data for Name: departamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departamento (id_departamento, nombre_departamento, ubicacion, presupuesto_anual, id_jefe) FROM stdin;
45	Urgencias	Edificio D, Planta Baja	1800000.00	\N
49	Dermatolog¡a	Edificio A, Piso 1	550000.00	\N
50	Oftalmolog¡a	Edificio B, Piso 1	600000.00	\N
51	Otorrinolaringolog¡a	Edificio C, Piso 2	580000.00	\N
52	Urolog¡a	Edificio A, Piso 3	720000.00	\N
53	Endocrinolog¡a	Edificio E, Piso 2	680000.00	\N
54	Nefrolog¡a	Edificio D, Piso 2	890000.00	\N
55	Hematolog¡a	Edificio B, Piso 4	770000.00	\N
56	Cirug¡a General	Edificio D, Piso 3	1400000.00	\N
57	Medicina Interna	Edificio C, Piso 4	1100000.00	\N
58	Anestesiolog¡a	Edificio D, Piso 1	900000.00	\N
59	Radiolog¡a	Edificio F, Planta Baja	1300000.00	\N
60	Laboratorio Cl¡nico	Edificio F, Piso 1	1250000.00	\N
41	Cardiolog¡a	Edificio A, Piso 2	1200000.00	26
43	Pediatr¡a	Edificio C, Piso 1	800000.00	27
42	Neurolog¡a	Edificio B, Piso 3	950000.00	36
44	Oncolog¡a	Edificio A, Piso 4	1500000.00	37
46	Ginecolog¡a	Edificio B, Piso 2	750000.00	38
47	Traumatolog¡a	Edificio C, Piso 3	850000.00	39
48	Psiquiatr¡a	Edificio E, Piso 1	650000.00	40
61	Neumologia	Edificio F, Piso 2	670000.00	\N
62	Alergologia	Edificio G, Piso 1	520000.00	\N
63	Reumatologia	Edificio G, Piso 2	580000.00	\N
64	Cirugia Plastica	Edificio H, Piso 1	1100000.00	\N
65	Medicina Nuclear	Edificio F, Piso 3	950000.00	\N
66	Genetica Medica	Edificio G, Piso 3	720000.00	\N
67	Medicina del Dolor	Edificio H, Piso 2	830000.00	\N
68	Medicina del Sueno	Edificio G, Piso 4	610000.00	\N
69	Medicina Deportiva	Edificio H, Piso 3	590000.00	\N
70	Patologia	Edificio F, Piso 4	880000.00	\N
\.


--
-- TOC entry 4898 (class 0 OID 17232)
-- Dependencies: 220
-- Data for Name: puesto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.puesto (id_puesto, nombre_puesto, descripcion, salario_min, salario_max, riesgo_laboral) FROM stdin;
51	M‚dico Especialista	M‚dico con especialidad certificada	8000.00	15000.00	Medio
52	M‚dico General	M‚dico sin especialidad	6000.00	9000.00	Medio
53	Enfermero/a Jefe	Responsable de supervisar al equipo de enfermer¡a	5000.00	7500.00	Medio
54	Enfermero/a	Personal de enfermer¡a general	3500.00	5500.00	Alto
55	Auxiliar de Enfermer¡a	Asistente de enfermer¡a	2800.00	4200.00	Alto
56	T‚cnico de Laboratorio	Encargado de realizar an lisis cl¡nicos	3200.00	5000.00	Alto
57	T‚cnico de Radiolog¡a	Responsable de equipos radiol¢gicos	3400.00	5200.00	Alto
58	Fisioterapeuta	Especialista en rehabilitaci¢n f¡sica	3800.00	6000.00	Bajo
59	Administrativo	Personal de oficina y gesti¢n	2600.00	4000.00	Bajo
60	Recepcionista	Atenci¢n al p£blico y gesti¢n de citas	2400.00	3600.00	Bajo
61	Director de Departamento	Responsable m ximo de un departamento	10000.00	18000.00	Bajo
62	Jefe de Residentes	Coordina a los m‚dicos residentes	7000.00	9500.00	Medio
63	M‚dico Residente	M‚dico en formaci¢n especializada	4000.00	6000.00	Medio
64	Psic¢logo Cl¡nico	Profesional de salud mental	4500.00	7000.00	Bajo
65	Nutricionista	Especialista en alimentaci¢n hospitalaria	3600.00	5800.00	Bajo
66	Trabajador Social	Gesti¢n de aspectos sociales de pacientes	3400.00	5500.00	Bajo
67	Farmac‚utico	Responsable de farmacia hospitalaria	5000.00	8000.00	Medio
68	T‚cnico de Farmacia	Asistente en farmacia hospitalaria	2800.00	4500.00	Medio
69	Personal de Limpieza	Encargado de higiene hospitalaria	2200.00	3000.00	Alto
70	Personal de Seguridad	Vigilancia y control de accesos	2400.00	3400.00	Medio
71	T‚cnico de Mantenimiento	Responsable del mantenimiento de instalaciones	2600.00	4200.00	Alto
72	Conductor de Ambulancia	Transporte sanitario urgente	2800.00	4500.00	Muy alto
73	Camillero	Traslado de pacientes dentro del hospital	2300.00	3200.00	Alto
74	T‚cnico de Inform tica	Soporte t‚cnico inform tico	3200.00	5500.00	Bajo
75	Secretario/a M‚dico	Asistente administrativo de m‚dicos	2700.00	4300.00	Bajo
77	Cardi¢logo	Especialista en enfermedades cardiovasculares	5000.00	12000.00	Medio
78	Pediatra	Especialista en atenci¢n m‚dica de ni¤os	4800.00	10000.00	Bajo
79	Neur¢logo	Especialista en enfermedades neurol¢gicas	8500.00	14000.00	Medio
80	Onc¢logo	Especialista en tratamiento del c ncer	9000.00	15000.00	Medio
81	Ginec¢logo	Especialista en salud femenina	8200.00	13000.00	Medio
82	Traumat¢logo	Especialista en sistema musculoesquel‚tico	8300.00	13500.00	Medio
83	Psiquiatra	Especialista en salud mental	8000.00	13000.00	Bajo
84	Neumologo	Especialista en enfermedades respiratorias	8200.00	13500.00	Medio
85	Alergologo	Especialista en alergias e inmunologia	8000.00	13000.00	Bajo
86	Reumatologo	Especialista en enfermedades reumaticas	8100.00	13200.00	Bajo
87	Cirujano Plastico	Especialista en cirugia reconstructiva y estetica	9500.00	18000.00	Medio
88	Especialista en Medicina Nuclear	Experto en diagnostico por imagen molecular	8500.00	15000.00	Alto
89	Genetista Medico	Especialista en enfermedades geneticas	8300.00	14000.00	Bajo
90	Especialista en Dolor	Manejo del dolor cronico	7800.00	12500.00	Bajo
91	Especialista en Sueno	Trastornos del sueno	7600.00	12000.00	Bajo
92	Medico Deportivo	Salud y rendimiento deportivo	7400.00	11500.00	Bajo
93	Patologo	Diagnostico de enfermedades mediante muestras	8000.00	14000.00	Alto
\.


--
-- TOC entry 4900 (class 0 OID 17247)
-- Dependencies: 222
-- Data for Name: empleado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.empleado (id_empleado, id_puesto, id_departamento, nombre, apellido, fecha_nacimiento, genero, direccion, telefono, email, fecha_contratacion, salario_base, activo, horas_semanales) FROM stdin;
26	51	41	Carlos	Rodr¡guez	1975-05-15	M	Av. Principal 123	+34612345678	carlos.rodriguez@hospital.com	2015-03-10	12000.00	t	40
27	78	43	Ana	Garc¡a	1980-07-22	F	Calle Nueva 45	+34623456789	ana.garcia@hospital.com	2017-06-15	9000.00	t	40
28	54	45	Miguel	Fern ndez	1988-12-03	M	Plaza Mayor 8	+34645678901	miguel.fernandez@hospital.com	2019-04-22	4500.00	t	40
29	61	44	Luc¡a	Mart¡nez	1972-09-18	F	Paseo del Prado 27	+34656789012	lucia.martinez@hospital.com	2010-11-05	16000.00	t	40
30	56	60	David	L¢pez	1990-02-25	M	Calle Ancha 12	+34667890123	david.lopez@hospital.com	2020-01-15	3800.00	t	40
31	53	42	Patricia	S nchez	1983-11-19	F	Calle del Sol 34	+34623456790	patricia.sanchez@hospital.com	2016-08-22	6500.00	t	40
32	55	47	Antonio	G¢mez	1992-03-07	M	Avenida Central 15	+34634567891	antonio.gomez@hospital.com	2019-11-05	3800.00	t	40
33	54	45	Elena	D¡az	1985-06-12	F	Calle Mayor 45	+34645678902	elena.diaz@hospital.com	2018-02-15	4800.00	t	40
34	64	48	Roberto	Hern ndez	1978-09-23	M	Plaza Espa¤a 9	+34656789013	roberto.hernandez@hospital.com	2014-07-20	6200.00	t	40
35	67	46	Carmen	Torres	1981-12-30	F	Avenida Libertad 28	+34667890124	carmen.torres@hospital.com	2013-05-18	6800.00	t	40
36	79	42	Sof¡a	Ram¡rez	1976-04-18	F	Calle del R¡o 23	+34678901235	sofia.ramirez@hospital.com	2014-09-12	11000.00	t	40
37	80	44	Javier	Ortega	1979-08-25	M	Avenida del Parque 56	+34689012346	javier.ortega@hospital.com	2015-03-22	12500.00	t	40
38	81	46	Marina	Vargas	1982-11-30	F	Calle Luna 12	+34690123457	marina.vargas@hospital.com	2018-07-15	10500.00	t	40
39	82	47	Ricardo	Molina	1977-02-14	M	Plaza del Sol 8	+34701234568	ricardo.molina@hospital.com	2016-11-08	11500.00	t	40
40	83	48	Beatriz	Silva	1980-05-09	F	Calle Estrella 45	+34712345679	beatriz.silva@hospital.com	2019-02-20	10200.00	t	40
41	54	45	Oscar	Castro	1991-07-22	M	Avenida Norte 78	+34723456780	oscar.castro@hospital.com	2020-06-10	4200.00	t	40
42	55	47	Natalia	Romero	1993-03-15	F	Calle Sur 34	+34734567891	natalia.romero@hospital.com	2021-01-18	3200.00	t	40
43	56	60	Hugo	Navarro	1989-09-28	M	Paseo del Mar 67	+34745678902	hugo.navarro@hospital.com	2019-08-05	4000.00	t	40
44	57	59	Claudia	Iglesias	1987-12-05	F	Calle del Monte 9	+34756789013	claudia.iglesias@hospital.com	2018-04-12	4500.00	t	40
45	58	42	Fernando	Santos	1984-06-19	M	Avenida del Bosque 23	+34767890124	fernando.santos@hospital.com	2017-10-30	4800.00	t	40
46	84	61	Raul	Mendez	1975-03-22	M	Calle del Viento 45	+34912345678	raul.mendez@hospital.com	2016-05-14	11500.00	t	40
47	85	62	Isabel	Cortes	1980-07-18	F	Avenida del Lago 12	+34923456789	isabel.cortes@hospital.com	2017-08-22	10500.00	t	40
48	86	63	Alberto	Rojas	1978-11-30	M	Plaza del Parque 8	+34934567890	alberto.rojas@hospital.com	2015-10-05	11000.00	t	40
49	87	64	Silvia	Paredes	1973-09-15	F	Calle del Roble 23	+34945678901	silvia.paredes@hospital.com	2014-03-12	15000.00	t	40
50	88	65	Jorge	Campos	1976-12-08	M	Avenida del Rio 56	+34956789012	jorge.campos@hospital.com	2018-07-19	12500.00	t	40
51	89	66	Lucia	Vega	1982-04-25	F	Calle del Sol 67	+34967890123	lucia.vega@hospital.com	2019-02-28	11800.00	t	40
52	90	67	Pablo	Fuentes	1979-06-17	M	Paseo de la Fuente 34	+34978901234	pablo.fuentes@hospital.com	2017-11-15	9800.00	t	40
53	91	68	Elena	Miranda	1981-01-29	F	Avenida Central 89	+34989012345	elena.miranda@hospital.com	2016-09-10	9200.00	t	40
54	92	69	Daniel	Cordero	1983-08-12	M	Calle del Monte 56	+34990123456	daniel.cordero@hospital.com	2020-04-05	8500.00	t	40
55	93	70	Adriana	Lagos	1977-05-03	F	Plaza Mayor 14	+34901234567	adriana.lagos@hospital.com	2015-12-20	13000.00	t	40
\.

INSERT INTO empleado (
    id_empleado, id_puesto, id_departamento, nombre, apellido, fecha_nacimiento, genero,
    direccion, telefono, email, fecha_contratacion, salario_base, activo, horas_semanales
)
VALUES
(101, 52, 45, 'David', 'Méndez', '1985-03-12', 'M', 'Zona 3, Ciudad de Guatemala', '5024891234', 'david.mendez@empresa.com', '2022-01-10', 4600.00, TRUE, 40),
(102, 54, 49, 'Karla', 'Estrada', '1991-11-05', 'F', 'Zona 8, Ciudad de Guatemala', '5024761823', 'karla.estrada@empresa.com', '2021-05-23', 4800.00, TRUE, 40),
(103, 56, 50, 'Luis', 'Pérez', '1989-07-24', 'M', 'Mixco, Guatemala', '5024819372', 'luis.perez@empresa.com', '2020-09-12', 5100.00, TRUE, 40),
(104, 53, 51, 'Andrea', 'Gómez', '1993-06-18', 'F', 'Zona 16, Ciudad de Guatemala', '5024892763', 'andrea.gomez@empresa.com', '2023-03-02', 4950.00, TRUE, 40),
(105, 58, 52, 'Roberto', 'Ruiz', '1978-12-29', 'M', 'Villa Nueva, Guatemala', '5024956732', 'roberto.ruiz@empresa.com', '2019-10-10', 5300.00, TRUE, 40),
(106, 55, 53, 'María', 'Delgado', '1986-02-17', 'F', 'Zona 5, Ciudad de Guatemala', '5024987136', 'maria.delgado@empresa.com', '2018-07-01', 4700.00, TRUE, 40),
(107, 57, 54, 'Carlos', 'Hernández', '1990-09-09', 'M', 'San Cristóbal, Mixco', '5024891267', 'carlos.hernandez@empresa.com', '2020-04-15', 5000.00, TRUE, 40),
(108, 56, 55, 'Lucía', 'Chacón', '1995-04-21', 'F', 'Zona 7, Ciudad de Guatemala', '5024928731', 'lucia.chacon@empresa.com', '2022-12-01', 4600.00, TRUE, 40),
(109, 51, 56, 'Fernando', 'Reyes', '1982-10-13', 'M', 'Zona 18, Ciudad de Guatemala', '5024819234', 'fernando.reyes@empresa.com', '2017-03-05', 5200.00, TRUE, 40),
(110, 52, 57, 'Pamela', 'Morales', '1996-01-08', 'F', 'Villa Canales, Guatemala', '5024891223', 'pamela.morales@empresa.com', '2021-09-19', 4750.00, TRUE, 40),
(111, 57, 58, 'Esteban', 'Carranza', '1987-08-03', 'M', 'Zona 14, Ciudad de Guatemala', '5024957832', 'esteban.carranza@empresa.com', '2016-11-25', 5250.00, TRUE, 40),
(112, 59, 59, 'Natalia', 'Lopez', '1994-12-14', 'F', 'Zona 6, Ciudad de Guatemala', '5024989123', 'natalia.lopez@empresa.com', '2023-06-11', 4900.00, TRUE, 40),
(113, 67, 60, 'Jorge', 'Arias', '1983-05-17', 'M', 'San Miguel Petapa', '5024856723', 'jorge.arias@empresa.com', '2015-04-30', 5400.00, TRUE, 40),
(114, 84, 61, 'Gabriela', 'Perdomo', '1992-07-07', 'F', 'Zona 11, Ciudad de Guatemala', '5024871234', 'gabriela.perdomo@empresa.com', '2020-08-20', 5100.00, TRUE, 40),
(115, 85, 62, 'Rodolfo', 'Santizo', '1988-03-25', 'M', 'Santa Catarina Pinula', '5024827384', 'rodolfo.santizo@empresa.com', '2019-02-28', 4950.00, TRUE, 40);

INSERT INTO empleado (
    id_empleado, id_puesto, id_departamento, nombre, apellido, fecha_nacimiento, genero,
    direccion, telefono, email, fecha_contratacion, salario_base, activo, horas_semanales
)
VALUES
(116, 59, 63, 'Ana', 'Ramírez', '1990-05-14', 'F', 'Zona 9, Ciudad de Guatemala', '5024897412', 'ana.ramirez@empresa.com', '2021-07-12', 4800.00, TRUE, 40),
(117, 60, 64, 'Javier', 'Martínez', '1981-02-19', 'M', 'Zona 2, Ciudad de Guatemala', '5024918273', 'javier.martinez@empresa.com', '2020-02-20', 5000.00, TRUE, 40),
(118, 53, 65, 'Sandra', 'Velásquez', '1989-11-03', 'F', 'Amatitlán, Guatemala', '5024971834', 'sandra.velasquez@empresa.com', '2019-06-25', 4700.00, TRUE, 40),
(119, 52, 66, 'Pedro', 'Lemus', '1979-04-30', 'M', 'Zona 13, Ciudad de Guatemala', '5024983746', 'pedro.lemus@empresa.com', '2018-03-10', 5100.00, TRUE, 40),
(120, 55, 67, 'Ingrid', 'Salazar', '1996-12-11', 'F', 'Zona 10, Ciudad de Guatemala', '5024848271', 'ingrid.salazar@empresa.com', '2022-10-01', 4600.00, TRUE, 40),
(121, 56, 68, 'Alfredo', 'García', '1983-09-25', 'M', 'Zona 17, Ciudad de Guatemala', '5024837265', 'alfredo.garcia@empresa.com', '2017-01-22', 5200.00, TRUE, 40),
(122, 58, 69, 'Verónica', 'Juárez', '1991-08-08', 'F', 'Mixco, Guatemala', '5024901874', 'veronica.juarez@empresa.com', '2021-11-15', 4700.00, TRUE, 40),
(123, 57, 70, 'Tomás', 'López', '1987-06-18', 'M', 'Villa Nueva, Guatemala', '5024952731', 'tomas.lopez@empresa.com', '2016-12-05', 5050.00, TRUE, 40),
(124, 67, 70, 'Mónica', 'Barrios', '1995-03-10', 'F', 'Zona 4, Ciudad de Guatemala', '5024861253', 'monica.barrios@empresa.com', '2023-05-18', 4800.00, TRUE, 40),
(125, 84, 65, 'René', 'Corado', '1982-07-14', 'M', 'Zona 1, Ciudad de Guatemala', '5024873145', 'rene.corado@empresa.com', '2015-09-01', 5300.00, TRUE, 40),
(126, 85, 45, 'Paola', 'Navarro', '1988-10-02', 'F', 'Santa Catarina Pinula', '5024923847', 'paola.navarro@empresa.com', '2020-06-07', 4900.00, TRUE, 40),
(127, 52, 60, 'Edgar', 'Cano', '1992-01-29', 'M', 'Zona 18, Ciudad de Guatemala', '5024897651', 'edgar.cano@empresa.com', '2021-03-14', 4750.00, TRUE, 40),
(128, 59, 50, 'Flor', 'Estrada', '1994-04-04', 'F', 'Zona 6, Ciudad de Guatemala', '5024903762', 'flor.estrada@empresa.com', '2022-08-28', 4650.00, TRUE, 40),
(129, 55, 53, 'Henry', 'Vásquez', '1990-06-21', 'M', 'Zona 11, Ciudad de Guatemala', '5024810293', 'henry.vasquez@empresa.com', '2019-01-09', 5000.00, TRUE, 40),
(130, 56, 47, 'Gloria', 'Mejía', '1986-05-06', 'F', 'Zona 15, Ciudad de Guatemala', '5024936182', 'gloria.mejia@empresa.com', '2018-04-27', 5100.00, TRUE, 40);

INSERT INTO empleado (
    id_empleado, id_puesto, id_departamento, nombre, apellido, fecha_nacimiento, genero,
    direccion, telefono, email, fecha_contratacion, salario_base, activo, horas_semanales
)
VALUES
(131, 61, 45, 'Lorena', 'Aguilar', '1993-02-11', 'F', 'Zona 8, Ciudad de Guatemala', '5024873124', 'lorena.aguilar@empresa.com', '2023-01-03', 4600.00, TRUE, 40),
(132, 62, 46, 'Carlos', 'Pineda', '1984-07-22', 'M', 'Mixco, Guatemala', '5024918233', 'carlos.pineda@empresa.com', '2021-09-10', 5200.00, TRUE, 40),
(133, 63, 47, 'Jessica', 'Morales', '1990-10-14', 'F', 'Zona 12, Ciudad de Guatemala', '5024847932', 'jessica.morales@empresa.com', '2020-05-14', 4750.00, TRUE, 40),
(134, 64, 48, 'Mauricio', 'Orellana', '1987-01-08', 'M', 'Villa Nueva, Guatemala', '5024983742', 'mauricio.orellana@empresa.com', '2019-03-25', 5050.00, TRUE, 40),
(135, 65, 49, 'Rebeca', 'Castañeda', '1995-05-19', 'F', 'Santa Catarina Pinula', '5024927811', 'rebeca.castaneda@empresa.com', '2022-06-15', 4550.00, TRUE, 40),
(136, 66, 50, 'Luis', 'De León', '1986-12-03', 'M', 'Zona 7, Ciudad de Guatemala', '5024901823', 'luis.deleon@empresa.com', '2018-08-28', 5150.00, TRUE, 40),
(137, 67, 51, 'Tatiana', 'Rodríguez', '1991-03-16', 'F', 'Zona 5, Ciudad de Guatemala', '5024891233', 'tatiana.rodriguez@empresa.com', '2021-04-11', 4700.00, TRUE, 40),
(138, 68, 52, 'Wilmer', 'Gómez', '1983-09-07', 'M', 'Amatitlán, Guatemala', '5024962713', 'wilmer.gomez@empresa.com', '2017-02-19', 5300.00, TRUE, 40),
(139, 69, 53, 'María', 'Escobar', '1989-08-29', 'F', 'Zona 14, Ciudad de Guatemala', '5024839271', 'maria.escobar@empresa.com', '2020-07-07', 4600.00, TRUE, 40),
(140, 70, 54, 'Héctor', 'Rosales', '1982-11-23', 'M', 'San Miguel Petapa', '5024951832', 'hector.rosales@empresa.com', '2016-10-30', 5250.00, TRUE, 40),
(141, 71, 55, 'Patricia', 'Santos', '1996-01-25', 'F', 'Zona 6, Ciudad de Guatemala', '5024862711', 'patricia.santos@empresa.com', '2023-09-20', 4500.00, TRUE, 40),
(142, 72, 56, 'Esteban', 'Lara', '1988-05-05', 'M', 'Zona 1, Ciudad de Guatemala', '5024893841', 'esteban.lara@empresa.com', '2022-03-13', 4800.00, TRUE, 40),
(143, 73, 57, 'Karina', 'Paz', '1994-06-30', 'F', 'Zona 3, Ciudad de Guatemala', '5024914722', 'karina.paz@empresa.com', '2020-11-04', 4700.00, TRUE, 40),
(144, 74, 58, 'Pablo', 'Chávez', '1980-10-17', 'M', 'Zona 13, Ciudad de Guatemala', '5024847382', 'pablo.chavez@empresa.com', '2015-12-01', 5400.00, TRUE, 40),
(145, 75, 59, 'Camila', 'Bonilla', '1992-09-02', 'F', 'Villa Canales, Guatemala', '5024932841', 'camila.bonilla@empresa.com', '2021-02-07', 4650.00, TRUE, 40);


INSERT INTO empleado (
    id_empleado, id_puesto, id_departamento, nombre, apellido, fecha_nacimiento, genero,
    direccion, telefono, email, fecha_contratacion, salario_base, activo, horas_semanales
)
VALUES
(146, 70, 60, 'Daniel', 'Alvarado', '1991-04-10', 'M', 'Zona 15, Ciudad de Guatemala', '5024810001', 'daniel.alvarado@empresa.com', '2022-10-01', 4700.00, TRUE, 40),
(147, 77, 61, 'Rosa', 'Menéndez', '1985-09-18', 'F', 'Zona 11, Ciudad de Guatemala', '5024810002', 'rosa.menendez@empresa.com', '2019-08-10', 4900.00, TRUE, 40),
(148, 78, 62, 'José', 'Estrada', '1988-06-02', 'M', 'Zona 6, Ciudad de Guatemala', '5024810003', 'jose.estrada@empresa.com', '2020-02-15', 5100.00, TRUE, 40),
(149, 79, 63, 'Verónica', 'Guzmán', '1992-03-27', 'F', 'Mixco, Guatemala', '5024810004', 'veronica.guzman@empresa.com', '2021-05-23', 4600.00, TRUE, 40),
(150, 80, 64, 'Ricardo', 'López', '1983-12-11', 'M', 'Villa Nueva, Guatemala', '5024810005', 'ricardo.lopez@empresa.com', '2018-11-12', 5300.00, TRUE, 40),
(151, 81, 65, 'Andrea', 'Chacón', '1994-08-08', 'F', 'Zona 3, Ciudad de Guatemala', '5024810006', 'andrea.chacon@empresa.com', '2022-03-05', 4750.00, TRUE, 40),
(152, 82, 66, 'Jorge', 'Samayoa', '1990-02-21', 'M', 'Santa Catarina Pinula', '5024810007', 'jorge.samayoa@empresa.com', '2020-01-18', 5000.00, TRUE, 40),
(153, 83, 67, 'Natalia', 'García', '1987-07-13', 'F', 'Amatitlán, Guatemala', '5024810008', 'natalia.garcia@empresa.com', '2017-06-22', 5200.00, TRUE, 40),
(154, 84, 68, 'David', 'Cabrera', '1989-05-09', 'M', 'Zona 5, Ciudad de Guatemala', '5024810009', 'david.cabrera@empresa.com', '2021-07-30', 4950.00, TRUE, 40),
(155, 85, 69, 'Marina', 'Salguero', '1995-01-30', 'F', 'Zona 10, Ciudad de Guatemala', '5024810010', 'marina.salguero@empresa.com', '2023-04-19', 4550.00, TRUE, 40),
(156, 86, 70, 'Iván', 'Hernández', '1986-11-25', 'M', 'San Miguel Petapa', '5024810011', 'ivan.hernandez@empresa.com', '2016-09-14', 5400.00, TRUE, 40),
(157, 87, 45, 'Carolina', 'de León', '1993-06-16', 'F', 'Villa Canales, Guatemala', '5024810012', 'carolina.deleon@empresa.com', '2019-12-01', 4700.00, TRUE, 40),
(158, 88, 46, 'Manuel', 'Martínez', '1991-10-03', 'M', 'Zona 13, Ciudad de Guatemala', '5024810013', 'manuel.martinez@empresa.com', '2018-05-17', 5200.00, TRUE, 40),
(159, 89, 47, 'Tatiana', 'Pérez', '1984-03-05', 'F', 'Zona 2, Ciudad de Guatemala', '5024810014', 'tatiana.perez@empresa.com', '2020-06-20', 4900.00, TRUE, 40),
(160, 90, 48, 'Andrés', 'Cifuentes', '1982-08-20', 'M', 'Zona 9, Ciudad de Guatemala', '5024810015', 'andres.cifuentes@empresa.com', '2015-01-09', 5500.00, TRUE, 40);

INSERT INTO empleado (
    id_empleado, id_puesto, id_departamento, nombre, apellido, fecha_nacimiento, genero,
    direccion, telefono, email, fecha_contratacion, salario_base, activo, horas_semanales
)
VALUES
(161, 51, 49, 'Gabriel', 'Sánchez', '1986-09-09', 'M', 'Zona 7, Ciudad de Guatemala', '5024810016', 'gabriel.sanchez@empresa.com', '2021-03-20', 5000.00, TRUE, 40),
(162, 56, 50, 'Ximena', 'Córdova', '1993-04-28', 'F', 'Zona 12, Ciudad de Guatemala', '5024810017', 'ximena.cordova@empresa.com', '2022-01-17', 4700.00, TRUE, 40),
(163, 63, 51, 'Luis', 'Navarro', '1989-07-14', 'M', 'Mixco, Guatemala', '5024810018', 'luis.navarro@empresa.com', '2019-09-09', 5200.00, TRUE, 40),
(164, 53, 52, 'Marcela', 'Rosales', '1987-02-12', 'F', 'Zona 6, Ciudad de Guatemala', '5024810019', 'marcela.rosales@empresa.com', '2018-06-11', 5100.00, TRUE, 40),
(165, 93, 53, 'Roberto', 'Calderón', '1991-11-05', 'M', 'Villa Nueva, Guatemala', '5024810020', 'roberto.calderon@empresa.com', '2023-02-14', 4600.00, TRUE, 40),
(166, 73, 54, 'Lorena', 'Reyes', '1995-03-21', 'F', 'Santa Catarina Pinula', '5024810021', 'lorena.reyes@empresa.com', '2022-07-25', 4800.00, TRUE, 40),
(167, 60, 55, 'Juan', 'Vásquez', '1984-12-16', 'M', 'Zona 1, Ciudad de Guatemala', '5024810022', 'juan.vasquez@empresa.com', '2017-04-03', 5500.00, TRUE, 40),
(168, 80, 56, 'Estela', 'Domínguez', '1990-06-01', 'F', 'Zona 4, Ciudad de Guatemala', '5024810023', 'estela.dominguez@empresa.com', '2020-10-29', 4950.00, TRUE, 40),
(169, 91, 57, 'César', 'Molina', '1983-05-08', 'M', 'Zona 10, Ciudad de Guatemala', '5024810024', 'cesar.molina@empresa.com', '2016-02-20', 5300.00, TRUE, 40),
(170, 89, 58, 'Vivian', 'Ruano', '1994-01-12', 'F', 'Zona 18, Ciudad de Guatemala', '5024810025', 'vivian.ruano@empresa.com', '2021-08-16', 4750.00, TRUE, 40),
(171, 88, 59, 'Mario', 'Estrada', '1988-09-27', 'M', 'Villa Canales, Guatemala', '5024810026', 'mario.estrada@empresa.com', '2018-03-15', 5100.00, TRUE, 40),
(172, 72, 60, 'Jess', 'Martinez', '1992-05-17', 'F', 'Amatitlán, Guatemala', '5024810027', 'jess.mar@empresa.com', '2020-01-11', 4900.00, TRUE, 40),
(173, 73, 61, 'Álvaro', 'García', '1985-08-24', 'M', 'Zona 3, Ciudad de Guatemala', '5024810028', 'alvaro.garcia@empresa.com', '2019-07-30', 5200.00, TRUE, 40),
(174, 77, 62, 'Tatiana', 'Cifuentes', '1996-10-10', 'F', 'Zona 13, Ciudad de Guatemala', '5024810029', 'tatiana.cifuentes@empresa.com', '2023-03-12', 4600.00, TRUE, 40),
(175, 59, 63, 'Héctor', 'Rodríguez', '1981-11-19', 'M', 'Zona 9, Ciudad de Guatemala', '5024810030', 'hector.rodriguez@empresa.com', '2015-12-05', 5400.00, TRUE, 40);

--
-- TOC entry 4910 (class 0 OID 17348)
-- Dependencies: 232
-- Data for Name: asistencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asistencia (id_asistencia, id_empleado, fecha, hora_entrada, hora_salida, estado) FROM stdin;
22	26	2025-05-03	08:00:00	16:00:00	Presente
23	27	2025-05-03	08:00:00	16:00:00	Presente
24	28	2025-05-03	16:00:00	23:59:00	Presente
25	29	2025-05-02	08:00:00	16:00:00	Presente
26	30	2025-05-02	16:00:00	23:59:00	Presente
27	36	2025-05-03	08:00:00	16:00:00	Presente
28	37	2025-05-03	08:05:00	16:10:00	Presente
29	38	2025-05-03	16:00:00	23:58:00	Presente
30	39	2025-05-03	00:05:00	08:00:00	Presente
31	40	2025-05-03	08:10:00	16:15:00	Presente
32	41	2025-05-03	16:05:00	23:55:00	Presente
33	42	2025-05-03	00:10:00	08:05:00	Presente
34	43	2025-05-03	06:00:00	14:00:00	Presente
35	44	2025-05-03	14:00:00	22:00:00	Presente
36	45	2025-05-03	08:00:00	20:00:00	Presente
\.

INSERT INTO asistencia (id_empleado, fecha, hora_entrada, hora_salida, estado) VALUES
(101, '2025-05-05', '08:00:00', '16:00:00', 'Presente'),
(102, '2025-05-05', '16:00:00', '23:59:00', 'Presente'),
(103, '2025-05-05', '08:05:00', '16:05:00', 'Presente'),
(104, '2025-05-05', '16:05:00', '23:55:00', 'Presente'),
(105, '2025-05-05', '08:10:00', '16:10:00', 'Presente'),
(106, '2025-05-05', '16:10:00', '23:50:00', 'Presente'),
(107, '2025-05-05', '08:15:00', '16:15:00', 'Presente'),
(108, '2025-05-05', '16:15:00', '23:45:00', 'Presente'),
(109, '2025-05-05', '08:20:00', '16:20:00', 'Presente'),
(110, '2025-05-05', '16:20:00', '23:40:00', 'Presente');


INSERT INTO asistencia (id_empleado, fecha, hora_entrada, hora_salida, estado) VALUES
(111, '2025-05-06', '00:00:00', '08:00:00', 'Presente'),   -- Turno nocturno
(112, '2025-05-06', '06:00:00', '14:00:00', 'Presente'),   -- Turno mixto 1
(113, '2025-05-06', '14:00:00', '22:00:00', 'Presente'),   -- Turno mixto 2
(114, '2025-05-06', '08:00:00', '20:00:00', 'Presente'),   -- Turno festivo
(115, '2025-05-06', '08:00:00', '20:00:00', 'Presente'),   -- Guardia 1
(116, '2025-05-06', '8:00:00', '20:00:00', 'Presente'),   -- Guardia 2
(117, '2025-05-06', '08:00:00', '20:00:00', 'Presente'),   -- Fin de semana
(118, '2025-05-06', '08:00:00', '12:00:00', 'Presente'),   -- Turno partido 1
(119, '2025-05-06', '16:00:00', '20:00:00', 'Presente'),   -- Turno partido 2
(120, '2025-05-06', '07:00:00', '15:00:00', 'Presente');   -- Urgencias 1
--
-- TOC entry 4912 (class 0 OID 17366)
-- Dependencies: 234
-- Data for Name: contacto_emergencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacto_emergencia (id_contacto, id_empleado, nombre_contacto, relacion, telefono, principal) FROM stdin;
6	26	Mar¡a Rodr¡guez	C¢nyuge	+34678901234	t
7	27	Juan Garc¡a	Hermano/a	+34689012345	t
8	28	Laura Fern ndez	C¢nyuge	+34690123456	t
9	29	Pedro Mart¡nez	Hijo/a	+34701234567	t
10	30	Elena L¢pez	Madre	+34712345678	t
11	36	Alejandro Ram¡rez	C¢nyuge	+34778901234	t
12	37	Isabel Ortega	Madre	+34789012345	t
13	38	Manuel Vargas	Padre	+34790123456	f
14	38	Teresa Vargas	C¢nyuge	+34801234567	t
15	39	Elena Molina	Hijo/a	+34812345678	t
16	40	Jorge Silva	Hermano/a	+34823456789	t
17	41	Luisa Castro	Madre	+34834567890	t
18	42	Pablo Romero	C¢nyuge	+34845678901	t
19	43	Adriana Navarro	C¢nyuge	+34856789012	t
20	44	Daniel Iglesias	Hijo/a	+34867890123	t
21	45	Marta Santos	C¢nyuge	+34878901234	t
\.

INSERT INTO contacto_emergencia (id_empleado, nombre_contacto, relacion, telefono, principal) VALUES
(111, 'Marta Carranza', 'Madre', '5024957833', false),
(111, 'Julia Carranza', 'Hijo/a', '5024957834', true),
(112, 'Roberto Lopez', 'Padre', '5024989124', true),
(113, 'Luisa Arias', 'Hijo/a', '5024856724', true),
(114, 'Carlos Perdomo', 'Hijo/a', '5024871235', false),
(114, 'Sara Perdomo', 'Hijo/a', '5024871236', true),
(115, 'Ana Santizo', 'Madre', '5024827385', true),
(116, 'Jorge Ramirez', 'Hijo/a', '5024897413', true),
(117, 'Maria Martinez', 'Madre', '5024918274', false),
(118, 'Juan Velasquez', 'Hijo/a', '5024971835', true);

INSERT INTO contacto_emergencia (id_empleado, nombre_contacto, relacion, telefono, principal) VALUES
(101, 'Maria Mendez', 'Hijo/a', '5024891235', true),
(102, 'Juan Estrada', 'Padre', '5024761824', true),
(103, 'Ana Perez', 'Hijo/a', '5024819373', true),
(104, 'Carlos Gomez', 'Hijo/a', '5024892764', true),
(105, 'Luisa Ruiz', 'Madre', '5024956733', true),
(106, 'Jose Delgado', 'Padre', '5024987137', true),
(107, 'Marta Hernandez', 'Otro', '5024891268', true),
(108, 'Pedro Chacon', 'Hijo/a', '5024928732', true),
(109, 'Sofia Reyes', 'Madre', '5024819235', true),
(110, 'Raul Morales', 'Padre', '5024891224', true);
--
-- TOC entry 4904 (class 0 OID 17296)
-- Dependencies: 226
-- Data for Name: especialidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.especialidad (id_especialidad, nombre_especialidad, descripcion, "a¤os_formacion") FROM stdin;
61	Cardiolog¡a	Especialista en enfermedades del coraz¢n	4
62	Neurolog¡a	Especialista en enfermedades del sistema nervioso	4
63	Pediatr¡a	Especialista en salud infantil	3
64	Oncolog¡a	Especialista en tratamiento del c ncer	4
65	Ginecolog¡a	Especialista en salud femenina	4
66	Traumatolog¡a	Especialista en lesiones ¢seas y musculares	4
67	Psiquiatr¡a	Especialista en salud mental	4
68	Dermatolog¡a	Especialista en enfermedades de la piel	3
69	Oftalmolog¡a	Especialista en enfermedades oculares	3
70	Otorrinolaringolog¡a	Especialista en o¡do, nariz y garganta	3
71	Urolog¡a	Especialista en sistema urinario	3
72	Endocrinolog¡a	Especialista en sistema endocrino	3
73	Nefrolog¡a	Especialista en enfermedades renales	3
74	Hematolog¡a	Especialista en enfermedades de la sangre	3
75	Cirug¡a General	Especialista en procedimientos quir£rgicos	5
76	Medicina Interna	Especialista en diagn¢stico y tratamiento no quir£rgico	4
77	Anestesiolog¡a	Especialista en anestesia y control del dolor	3
78	Radiolog¡a	Especialista en diagn¢stico por imagen	3
79	Gastroenterolog¡a	Especialista en sistema digestivo	3
80	Neumolog¡a	Especialista en sistema respiratorio	3
81	Reumatolog¡a	Especialista en enfermedades reum ticas	3
82	Medicina Familiar	Atenci¢n primaria integral	3
83	Medicina de Urgencias	Especialista en atenci¢n urgente	3
84	Geriatr¡a	Especialista en salud del adulto mayor	3
85	Cuidados Intensivos	Especialista en pacientes cr¡ticos	4
86	Medicina Preventiva	Especialista en prevenci¢n de enfermedades	3
87	Cirug¡a Card¡aca	Especialista en cirug¡a del coraz¢n	6
88	Neurocirug¡a	Especialista en cirug¡a del sistema nervioso	6
89	Cirug¡a Pl stica	Especialista en reconstrucci¢n y est‚tica	5
90	Infectolog¡a	Especialista en enfermedades infecciosas	3
92	Cardiolog¡a Intervencionista	Especialidad en procedimientos card¡acos invasivos	4
93	Pediatr¡a Neonatal	Especialidad en atenci¢n a reci‚n nacidos	3
94	Alergolog¡a	Especialista en alergias e inmunolog¡a	3
95	Cardiolog¡a Pedi trica	Especialista en coraz¢n de ni¤os	4
96	Cirug¡a Tor cica	Especialista en cirug¡a del t¢rax	5
97	Gen‚tica M‚dica	Especialista en enfermedades gen‚ticas	4
98	Medicina del Deporte	Especialista en salud deportiva	3
\.


--
-- TOC entry 4906 (class 0 OID 17309)
-- Dependencies: 228
-- Data for Name: empleado_especialidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.empleado_especialidad (id_empleado_especialidad, id_empleado, id_especialidad, fecha_obtencion, institucion, certificado) FROM stdin;
4	26	61	2010-06-20	Universidad Complutense de Madrid	t
5	27	63	2012-09-15	Universidad Aut¢noma de Barcelona	t
6	29	64	2008-11-30	Universidad de Navarra	t
7	36	62	2011-05-20	Universidad de Barcelona	t
8	37	64	2012-08-15	Universidad Aut¢noma de Madrid	t
9	38	65	2010-11-30	Universidad de Valencia	t
10	39	66	2009-07-22	Universidad de Salamanca	t
11	40	67	2013-03-18	Universidad de Sevilla	t
12	41	83	2018-06-10	Hospital Central	t
13	42	83	2019-09-15	Hospital General	t
14	43	78	2017-12-05	Instituto de Ciencias M‚dicas	t
\.

INSERT INTO empleado_especialidad (id_empleado, id_especialidad, fecha_obtencion, institucion, certificado) VALUES
(101, 61, '2018-06-15', 'Universidad de San Carlos', true),
(102, 68, '2019-09-20', 'Universidad Mariano Galvez', true),
(103, 69, '2017-11-25', 'Universidad Rafael Landivar', true),
(104, 70, '2020-07-18', 'Universidad del Valle', true),
(105, 71, '2019-03-12', 'Hospital General', true),
(106, 72, '2021-08-30', 'Instituto de Salud', true),
(107, 73, '2020-05-22', 'Universidad Galileo', true),
(108, 74, '2021-10-15', 'Hospital Roosevelt', true),
(109, 75, '2018-02-10', 'Centro Medico', true),
(110, 76, '2019-12-05', 'Hospital Herrera Llerandi', true);


INSERT INTO empleado_especialidad (id_empleado, id_especialidad, fecha_obtencion, institucion, certificado) VALUES
(111, 77, '2015-04-20', 'Hospital Nacional', true),     -- Anestesiología
(112, 78, '2017-08-15', 'Instituto Radiológico', true), -- Radiología
(113, 79, '2016-03-10', 'Clínica Digestiva', true),     -- Gastroenterología
(114, 80, '2018-11-25', 'Hospital Pulmonar', true),     -- Neumología
(115, 81, '2019-05-12', 'Centro Reumatológico', true),  -- Reumatología
(116, 82, '2020-02-18', 'Clínica Familiar', true),      -- Medicina Familiar
(117, 83, '2017-07-30', 'Hospital de Emergencias', true), -- Medicina de Urgencias
(118, 84, '2018-09-15', 'Geriatric Center', true),      -- Geriatría
(119, 85, '2019-12-20', 'Unidad de Cuidados Intensivos', true), -- Cuidados Intensivos
(120, 86, '2021-01-05', 'Instituto de Salud Pública', true); -- Medicina Preventiva
--
-- TOC entry 4902 (class 0 OID 17283)
-- Dependencies: 224
-- Data for Name: turno; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.turno (id_turno, nombre_turno, hora_inicio, hora_fin, tipo_turno, pago_extra) FROM stdin;
19	Ma¤ana	08:00:00	16:00:00	Matutino	0.00
22	Tarde	16:00:00	23:59:00	Vespertino	15.00
23	Noche	00:00:00	08:00:00	Nocturno	25.00
24	Mixto 1	06:00:00	14:00:00	Mixto	10.00
25	Mixto 2	14:00:00	22:00:00	Mixto	15.00
26	Festivo	08:00:00	20:00:00	Festivo	50.00
27	Guardia 1	08:00:00	20:00:00	Mixto	30.00
28	Guardia 2	20:00:00	24:00:00	Nocturno	40.00
29	Fin de Semana	08:00:00	20:00:00	Festivo	50.00
30	Turno Partido 1	08:00:00	12:00:00	Matutino	5.00
31	Turno Partido 2	16:00:00	20:00:00	Vespertino	10.00
32	Urgencias 1	07:00:00	15:00:00	Matutino	15.00
33	Urgencias 2	15:00:00	23:00:00	Vespertino	20.00
34	Urgencias 3	18:00:00	23:00:00	Nocturno	25.00
35	Administrativo	09:00:00	17:00:00	Matutino	0.00
36	Tecnico	10:00:00	18:00:00	Vespertino	5.00
\.

INSERT INTO empleado_turno (id_empleado, id_turno, fecha_asignacion, horas_asignadas) VALUES
(111, 23, '2025-05-06', 40),  -- Turno nocturno
(112, 24, '2025-05-06', 35),  -- Turno mixto 1
(113, 25, '2025-05-06', 35),  -- Turno mixto 2
(114, 26, '2025-05-06', 45),  -- Turno festivo
(115, 27, '2025-05-06', 48),  -- Guardia 1
(116, 28, '2025-05-06', 48),  -- Guardia 2
(117, 29, '2025-05-06', 48),  -- Fin de semana
(118, 30, '2025-05-06', 20),  -- Turno partido 1
(119, 31, '2025-05-06', 20),  -- Turno partido 2
(120, 32, '2025-05-06', 40);  -- Urgencias 1

--
-- TOC entry 4916 (class 0 OID 17738)
-- Dependencies: 238
-- Data for Name: empleado_turno; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.empleado_turno (id_empleado_turno, id_empleado, id_turno, fecha_asignacion, fecha_fin, activo, horas_asignadas) FROM stdin;
6	26	19	2025-05-03	\N	t	40
7	27	19	2025-05-03	\N	t	40
8	28	22	2025-05-03	\N	t	40
9	29	19	2025-05-03	\N	t	40
10	30	22	2025-05-03	\N	t	40
11	36	19	2025-05-03	\N	t	40
12	37	19	2025-05-03	\N	t	40
13	38	22	2025-05-03	\N	t	40
14	39	23	2025-05-03	\N	t	40
15	40	19	2025-05-03	\N	t	40
16	41	22	2025-05-03	\N	t	40
17	42	23	2025-05-03	\N	t	40
18	43	24	2025-05-03	\N	t	40
19	44	25	2025-05-03	\N	t	40
20	45	26	2025-05-03	\N	t	40
21	46	27	2025-05-04	\N	t	48
22	47	28	2025-05-04	\N	t	48
23	48	29	2025-05-04	\N	t	48
24	49	30	2025-05-04	\N	t	20
25	49	31	2025-05-04	\N	t	20
26	50	32	2025-05-04	\N	t	40
27	51	33	2025-05-04	\N	t	40
28	52	34	2025-05-04	\N	t	40
29	53	35	2025-05-04	\N	t	35
30	54	36	2025-05-04	\N	t	35
\.

INSERT INTO empleado_turno (id_empleado, id_turno, fecha_asignacion, horas_asignadas) VALUES
(101, 19, '2025-05-05', 40),
(102, 22, '2025-05-05', 40),
(103, 19, '2025-05-05', 40),
(104, 22, '2025-05-05', 40),
(105, 19, '2025-05-05', 40),
(106, 22, '2025-05-05', 40),
(107, 19, '2025-05-05', 40),
(108, 22, '2025-05-05', 40),
(109, 19, '2025-05-05', 40),
(110, 22, '2025-05-05', 40);
--
-- TOC entry 4914 (class 0 OID 17380)
-- Dependencies: 236
-- Data for Name: historial_salario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.historial_salario (id_historial, id_empleado, salario_anterior, salario_nuevo, fecha_cambio, motivo, autorizado_por) FROM stdin;
25	26	10000.00	12000.00	2024-11-03	Aumento por desempe¤o	29
26	29	14000.00	16000.00	2025-02-03	Promoci¢n a Director de Departamento	\N
27	28	4000.00	4500.00	2025-03-03	Ajuste anual	29
28	36	10000.00	11000.00	2024-12-15	Ajuste por antiguedad	29
29	37	11500.00	12500.00	2025-01-10	Promocion a jefe de area	29
30	38	9500.00	10500.00	2024-11-20	Aumento por especializacion	29
31	41	3800.00	4200.00	2025-03-15	Aumento anual	36
32	44	4200.00	4500.00	2025-02-18	Ajuste salarial	37
\.

INSERT INTO historial_salario (id_empleado, salario_anterior, salario_nuevo, fecha_cambio, motivo, autorizado_por) VALUES
(101, 4500.00, 4600.00, '2024-01-15', 'Ajuste anual', 29),
(102, 4700.00, 4800.00, '2024-01-15', 'Ajuste anual', 29),
(103, 5000.00, 5100.00, '2024-01-15', 'Ajuste anual', 29),
(104, 4850.00, 4950.00, '2024-01-15', 'Ajuste anual', 29),
(105, 5200.00, 5300.00, '2024-01-15', 'Ajuste anual', 29),
(106, 4600.00, 4700.00, '2024-01-15', 'Ajuste anual', 29),
(107, 4900.00, 5000.00, '2024-01-15', 'Ajuste anual', 29),
(108, 4500.00, 4600.00, '2024-01-15', 'Ajuste anual', 29),
(109, 5100.00, 5200.00, '2024-01-15', 'Ajuste anual', 29),
(110, 4650.00, 4750.00, '2024-01-15', 'Ajuste anual', 29);

--
-- TOC entry 4908 (class 0 OID 17330)
-- Dependencies: 230
-- Data for Name: licencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.licencia (id_licencia, id_empleado, tipo_licencia, fecha_inicio, fecha_fin, motivo, aprobada) FROM stdin;
4	27	Vacaciones	2025-05-13	2025-05-27	Vacaciones de verano	t
5	28	Enfermedad	2025-04-28	2025-05-01	Gripe	t
6	30	Estudio	2025-05-18	2025-05-22	Congreso de t‚cnicas de laboratorio	t
7	36	Vacaciones	2025-06-15	2025-06-30	Vacaciones de verano	t
8	37	Estudio	2025-07-10	2025-07-15	Congreso de oncolog¡a	t
9	38	Maternidad	2025-08-01	2025-11-01	Licencia por maternidad	t
10	41	Enfermedad	2025-05-10	2025-05-12	Gripe estacional	f
11	44	Personal	2025-05-20	2025-05-21	Asuntos personales	t
\.

INSERT INTO licencia (id_empleado, tipo_licencia, fecha_inicio, fecha_fin, motivo, aprobada) VALUES
(101, 'Vacaciones', '2025-06-01', '2025-06-15', 'Descanso anual', true),
(102, 'Enfermedad', '2025-05-10', '2025-05-12', 'Gripe', true),
(103, 'Personal', '2025-05-20', '2025-05-21', 'Tramites personales', true),
(104, 'Estudio', '2025-07-15', '2025-07-19', 'Curso de capacitacion', true),
(105, 'Vacaciones', '2025-08-10', '2025-08-24', 'Viaje familiar', true),
(106, 'Maternidad', '2025-09-01', '2025-12-01', 'Licencia por maternidad', true),
(107, 'Enfermedad', '2025-05-15', '2025-05-18', 'Procedimiento medico', true),
(108, 'Personal', '2025-06-05', '2025-06-07', 'Asuntos familiares', true),
(109, 'Vacaciones', '2025-07-01', '2025-07-15', 'Descanso', true),
(110, 'Estudio', '2025-08-20', '2025-08-25', 'Seminario profesional', true);

INSERT INTO licencia (id_empleado, tipo_licencia, fecha_inicio, fecha_fin, motivo, aprobada) VALUES
(111, 'Vacaciones', '2025-09-01', '2025-09-15', 'Viaje familiar', true),
(112, 'Estudio', '2025-10-10', '2025-10-14', 'Congreso médico', true),
(113, 'Enfermedad', '2025-06-05', '2025-06-08', 'Cirugía menor', true),
(114, 'Personal', '2025-07-20', '2025-07-21', 'Trámites legales', false),
(115, 'Maternidad', '2025-11-01', '2026-02-01', 'Licencia por maternidad', true),
(116, 'Vacaciones', '2025-08-05', '2025-08-19', 'Descanso', true),
(117, 'Estudio', '2025-12-01', '2025-12-05', 'Certificación profesional', true),
(118, 'Enfermedad', '2025-05-25', '2025-05-27', 'Infección respiratoria', true),
(119, 'Personal', '2025-07-10', '2025-07-11', 'Asuntos personales', true),
(120, 'Vacaciones', '2025-10-20', '2025-11-03', 'Viaje internacional', false);

INSERT INTO historial_salario (id_empleado, salario_anterior, salario_nuevo, fecha_cambio, motivo, autorizado_por) VALUES
(111, 5000.00, 5250.00, '2024-06-10', 'Promocion a supervisor', 29),
(112, 4700.00, 4900.00, '2024-06-10', 'Aumento por desempenio', 29),
(113, 5200.00, 5400.00, '2024-06-10', 'Ajuste de categoria', 29),
(114, 4900.00, 5100.00, '2024-06-10', 'Responsabilidades adicionales', 29),
(115, 4750.00, 4950.00, '2024-06-10', 'Aumento por antiguedad', 29),
(116, 4600.00, 4800.00, '2024-06-10', 'Certificacion obtenida', 29),
(117, 4850.00, 5000.00, '2024-06-10', 'Ajuste salarial', 29),
(118, 4550.00, 4700.00, '2024-06-10', 'Evaluación positiva', 29),
(119, 5050.00, 5100.00, '2024-06-10', 'Ajuste menor', 29),
(120, 4500.00, 4600.00, '2024-06-10', 'Fin periodo prueba', 29);
--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 231
-- Name: asistencia_id_asistencia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asistencia_id_asistencia_seq', 36, true);


--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 233
-- Name: contacto_emergencia_id_contacto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacto_emergencia_id_contacto_seq', 21, true);


--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 217
-- Name: departamento_id_departamento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departamento_id_departamento_seq', 63, true);


--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 227
-- Name: empleado_especialidad_id_empleado_especialidad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.empleado_especialidad_id_empleado_especialidad_seq', 24, true);


--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 221
-- Name: empleado_id_empleado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.empleado_id_empleado_seq', 35, true);


--
-- TOC entry 4927 (class 0 OID 0)
-- Dependencies: 237
-- Name: empleado_turno_id_empleado_turno_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.empleado_turno_id_empleado_turno_seq', 30, true);


--
-- TOC entry 4928 (class 0 OID 0)
-- Dependencies: 225
-- Name: especialidad_id_especialidad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.especialidad_id_especialidad_seq', 93, true);


--
-- TOC entry 4929 (class 0 OID 0)
-- Dependencies: 235
-- Name: historial_salario_id_historial_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.historial_salario_id_historial_seq', 32, true);


--
-- TOC entry 4930 (class 0 OID 0)
-- Dependencies: 229
-- Name: licencia_id_licencia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.licencia_id_licencia_seq', 11, true);


--
-- TOC entry 4931 (class 0 OID 0)
-- Dependencies: 219
-- Name: puesto_id_puesto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.puesto_id_puesto_seq', 78, true);


--
-- TOC entry 4932 (class 0 OID 0)
-- Dependencies: 223
-- Name: turno_id_turno_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.turno_id_turno_seq', 22, true);


-- Completed on 2025-05-05 01:48:01

--
-- PostgreSQL database dump complete
--

