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

