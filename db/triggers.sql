-- FUNCTION: public.actualizar_horas_semanales()

-- DROP FUNCTION IF EXISTS public.actualizar_horas_semanales();

CREATE OR REPLACE FUNCTION public.actualizar_horas_semanales()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
BEGIN
    UPDATE empleado
    SET horas_semanales = (
        SELECT COALESCE(SUM(horas_asignadas), 0)
        FROM empleado_turno
        WHERE id_empleado = empleado.id_empleado AND activo = TRUE
    )
    WHERE id_empleado IN (
        SELECT id_empleado FROM NEW
        UNION
        SELECT id_empleado FROM OLD
    );
    RETURN NULL;
END;
$BODY$;

ALTER FUNCTION public.actualizar_horas_semanales()
    OWNER TO postgres;


-- FUNCTION: public.registrar_cambio_salario()

-- DROP FUNCTION IF EXISTS public.registrar_cambio_salario();

CREATE OR REPLACE FUNCTION public.registrar_cambio_salario()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
BEGIN
    IF NEW.salario_base <> OLD.salario_base THEN
        INSERT INTO historial_salario (
            id_empleado, 
            salario_anterior, 
            salario_nuevo, 
            fecha_cambio, 
            motivo,
            autorizado_por
        ) VALUES (
            NEW.id_empleado,
            OLD.salario_base,
            NEW.salario_base,
            CURRENT_DATE,
            'Actualizaci¢n autom tica',
            NULL
        );
    END IF;
    RETURN NEW;
END;
$BODY$;

ALTER FUNCTION public.registrar_cambio_salario()
    OWNER TO postgres;

-- FUNCTION: public.validar_salario_empleado()

-- DROP FUNCTION IF EXISTS public.validar_salario_empleado();

CREATE OR REPLACE FUNCTION public.validar_salario_empleado()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM puesto
        WHERE id_puesto = NEW.id_puesto
        AND (NEW.salario_base < salario_min OR NEW.salario_base > salario_max)
    ) THEN
        RAISE EXCEPTION 'El salario del empleado no est  dentro del rango permitido para su puesto';
    END IF;
    RETURN NEW;
END;
$BODY$;

ALTER FUNCTION public.validar_salario_empleado()
    OWNER TO postgres;
