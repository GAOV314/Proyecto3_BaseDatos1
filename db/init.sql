-- init.sql
-- Script maestro para inicializar la base de datos

-- Crear las tablas
\i ddl.sql

-- Insertar los datos iniciales
\i data.sql

-- Crear funciones, triggers y restricciones adicionales
\i triggers.sql
