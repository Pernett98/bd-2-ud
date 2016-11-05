DROP SEQUENCE SEQ_ENTRADAS;

CREATE SEQUENCE SEQ_ENTRADAS
increment by 1
start with 1
nocache
nocycle;

CREATE OR REPLACE TRIGGER TR_MENTRADAS
BEFORE INSERT ON ENTRADAS
FOR EACH ROW
BEGIN
  SELECT SEQ_ENTRADAS.nextval
  INTO :new.ID_ENTRADA
  FROM dual;
END;
/
