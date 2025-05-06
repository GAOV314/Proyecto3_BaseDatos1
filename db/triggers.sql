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
        SELECT id_empleado FROM empleado_turno WHERE id_empleado_turno = NEW.id_empleado_turno
        UNION
        SELECT id_empleado FROM empleado_turno WHERE id_empleado_turno = OLD.id_empleado_turno
    );
    RETURN NULL;
END;
$BODY$;

ALTER FUNCTION public.actualizar_horas_semanales()
    OWNER TO postgres;

-- Trigger para la función actualizar_horas_semanales
CREATE OR REPLACE TRIGGER tr_actualizar_horas_semanales
    AFTER INSERT OR UPDATE OR DELETE
    ON empleado_turno
    FOR EACH ROW
    EXECUTE FUNCTION public.actualizar_horas_semanales();

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
            'Actualización automática',
            NULL
        );
    END IF;
    RETURN NEW;
END;
$BODY$;

ALTER FUNCTION public.registrar_cambio_salario()
    OWNER TO postgres;

-- Trigger para la función registrar_cambio_salario
CREATE OR REPLACE TRIGGER tr_registrar_cambio_salario
    AFTER UPDATE 
    ON empleado
    FOR EACH ROW
    EXECUTE FUNCTION public.registrar_cambio_salario();

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
        RAISE EXCEPTION 'El salario del empleado no está dentro del rango permitido para su puesto';
    END IF;
    RETURN NEW;
END;
$BODY$;

ALTER FUNCTION public.validar_salario_empleado()
    OWNER TO postgres;

-- Trigger para la función validar_salario_empleado
CREATE OR REPLACE TRIGGER tr_validar_salario_empleado
    BEFORE INSERT OR UPDATE 
    ON empleado
    FOR EACH ROW
    EXECUTE FUNCTION public.validar_salario_empleado();