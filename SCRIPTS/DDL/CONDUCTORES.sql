DROP TABLE CONDUCTORES CASCADE CONSTRAINTS;

CREATE TABLE CONDUCTORES
  (
    ID_CONDUCTOR     NUMBER (10) ,
    OBJ_PER_CONDUCTOR OBJ_PERSONA,
    ID_VOLQUETA      VARCHAR2 (10)
  ) ;

ALTER TABLE CONDUCTORES ADD CONSTRAINT CONDUCTORES_PK PRIMARY KEY ( ID_CONDUCTOR ) ;
ALTER TABLE CONDUCTORES ADD CONSTRAINT CONDUCTORES_NOMBRE_NN CHECK ( OBJ_PER_CONDUCTOR.NOMBRE IS NOT NULL );
ALTER TABLE CONDUCTORES ADD CONSTRAINT CONDUCTORES_APELLIDO_NN CHECK ( OBJ_PER_CONDUCTOR.APELLIDO_1 IS NOT NULL );
ALTER TABLE CONDUCTORES ADD CONSTRAINT CONDUCTORES_ID_VOLQUETA_FK FOREIGN KEY ( ID_VOLQUETA ) REFERENCES VOLQUETAS ( PLACA ) ;
ALTER TABLE CONDUCTORES ADD CONSTRAINT CONDUCTORES_ID_VOLQUETA_NN CHECK ( ID_VOLQUETA IS NOT NULL ) ;
