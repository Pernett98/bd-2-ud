DROP SEQUENCE SEQ_ENTRADAS;

set serveroutput on;


CREATE SEQUENCE SEQ_ENTRADAS
increment by 1
start with 1
nocache
nocycle;

CREATE OR REPLACE TRIGGER TR_ENTRADAS
FOR INSERT OR UPDATE ON ENTRADAS
COMPOUND TRIGGER
  CANT_ENT_REG NUMBER;
  CANT_ENT_VEN NUMBER;
  COUNTER NUMBER := 0;
  CANTIDAD_ENTRADAS_E EXCEPTION;
  FECHA_VENTA_E EXCEPTION;
  NO_EDITAR_ENTRADAS EXCEPTION;

  CURSOR cr_entradas (ID_VENTA NUMBER) IS
    SELECT *
    FROM ENTRADAS
    WHERE ID_VENTA = ID_VENTA;

BEFORE STATEMENT IS
  BEGIN
  IF UPDATING THEN
    RAISE NO_EDITAR_ENTRADAS;
  END IF;
  EXCEPTION
  WHEN NO_EDITAR_ENTRADAS THEN
    raise_application_error(-20004, 'No se puede editar una entrada');

END BEFORE STATEMENT;

BEFORE EACH ROW IS
  BEGIN
  FOR ap_entradas in cr_entradas(:new.ID_VENTA) loop
    COUNTER := COUNTER + 1;
  end loop;

  CANT_ENT_REG := COUNTER;
    IF (:new.FECHA_ENTRADA > SYSDATE) THEN
      RAISE FECHA_VENTA_E;
    END IF;
    IF INSERTING THEN

      SELECT (CANTIDAD_ENTRADAS)
      INTO CANT_ENT_VEN
      FROM VENTAS_ENTRADAS
      WHERE ID_VENTA = :new.ID_VENTA;

      IF (CANT_ENT_REG >= CANT_ENT_VEN) THEN
        RAISE CANTIDAD_ENTRADAS_E;
      END IF;

      SELECT SEQ_ENTRADAS.nextval
      INTO :new.ID_ENTRADA
      FROM dual;
    END IF;
  EXCEPTION
    WHEN CANTIDAD_ENTRADAS_E THEN
      raise_application_error(-20000,'No se puede registrar la entrada, lo volqueta no tiene mas cupos de entradas');
    WHEN FECHA_VENTA_E THEN
      raise_application_error(-20002,'La fecha de la entrada no puede ser mayor a la fecha actual');
  END BEFORE EACH ROW;
END TR_ENTRADAS;
/

CREATE OR REPLACE PROCEDURE BORR_VEN_VIEJ_SIN_ENTR IS
  CURSOR cr_venta IS SELECT * FROM VENTAS_ENTRADAS;
  CURSOR cr_entradas (ID_VENTA_C NUMBER) IS SELECT * FROM ENTRADAS WHERE ID_VENTA = ID_VENTA_C;
  TIENE_REGISTROS BOOLEAN := FALSE;
  REGISTROS_ELIMINADOS NUMBER := 0;
BEGIN
  FOR ap_venta IN cr_venta LOOP
    TIENE_REGISTROS := FALSE;
    FOR ap_entradas IN cr_entradas(ap_venta.ID_VENTA) LOOP
      TIENE_REGISTROS := TIENE_REGISTROS OR TRUE;
    END LOOP;
    IF TIENE_REGISTROS = FALSE THEN
      IF (SYSDATE - ap_venta.FECHA_VENTA) > 365 THEN
        dbms_output.put_line('la venta con id: ' || ap_venta.ID_VENTA || ' se eliminará por que es un registro con más de una año de existencía y no se ha utilizado');
        DELETE FROM VENTAS_ENTRADAS WHERE ID_VENTA = ap_venta.ID_VENTA ;
        REGISTROS_ELIMINADOS := REGISTROS_ELIMINADOS + 1;
      END IF;
    END IF;
  END LOOP;
  dbms_output.put_line('La cantidad de registros eliminados es: ' || REGISTROS_ELIMINADOS);
END;
/

CREATE OR REPLACE FUNCTION CONTAR_ENTRADAS (ID_VENTA IN NUMBER) RETURN NUMBER IS
  CANT_ENT_VEN NUMBER := 0;
  CANT_ENT_REG NUMBER := 0;
  CURSOR cr_entradas (ID_VENTA_C NUMBER) IS
    SELECT *
    FROM ENTRADAS
    WHERE ID_VENTA = ID_VENTA_C;
BEGIN

FOR ap_entradas in cr_entradas(ID_VENTA) loop
  CANT_ENT_VEN := CANT_ENT_VEN + 1;
end loop;
  RETURN CANT_ENT_VEN;
END;
/
--
-- DECLARE
--   cdv number;
-- BEGIN
--    dbms_output.put_line(CONTAR_ENTRADAS(2));
--    SELECT COUNT(*) INTO cdv FROM ENTRADAS E WHERE E.ID_VENTA = 1;
--    dbms_output.put_line(cdv);
-- END;
-- /
--
-- BEGIN
--    dbms_output.put_line(CONTAR_ENTRADAS(2));
-- END;
-- /
