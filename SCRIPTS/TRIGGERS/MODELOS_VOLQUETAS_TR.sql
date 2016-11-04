DROP SEQUENCE SEQ_MODELOS_VOLQUETAS;

CREATE SEQUENCE SEQ_MODELOS_VOLQUETAS
increment by 1
start with 1
nocache
nocycle;

CREATE OR REPLACE TRIGGER TR_MODELOS_VOLQUETAS
BEFORE INSERT ON MODELOS_VOLQUETAS
FOR EACH ROW
BEGIN
  SELECT SEQ_MODELOS_VOLQUETAS.nextval
  INTO :new.ID_MODELO
  FROM dual;
END;
/