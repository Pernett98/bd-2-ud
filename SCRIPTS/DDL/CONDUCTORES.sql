DROP TABLE CONDUCTORES CASCADE CONSTRAINTS;

CREATE TABLE CONDUCTORES
  (
    ID_CONDUCTOR     VARCHAR2 (20) NOT NULL ,
    NOMBRE           VARCHAR2 (50) NOT NULL ,
    APELLIDO_1 VARCHAR2 (50) NOT NULL ,
    APELLIDO_2 VARCHAR2 (50) ,
    ID_VOLQUETA      VARCHAR2 (10) NOT NULL
  ) ;
ALTER TABLE CONDUCTORES ADD CONSTRAINT CONDUCTORES_PK PRIMARY KEY ( ID_CONDUCTOR ) ;
ALTER TABLE CONDUCTORES ADD CONSTRAINT CONDUCTORES_NOMBRE_NN CHECK ( NOMBRE IS NOT NULL ) ;
ALTER TABLE CONDUCTORES ADD CONSTRAINT CONDUCTORES_APELLIDO_NN CHECK ( APELLIDO_1 IS NOT NULL ) ;
ALTER TABLE CONDUCTORES ADD CONSTRAINT CONDUCTORES_ID_VOLQUETA_FK FOREIGN KEY ( ID_VOLQUETA ) REFERENCES VOLQUETAS ( PLACA ) ;
ALTER TABLE CONDUCTORES ADD CONSTRAINT CONDUCTORES_ID_VOLQUETA_NN CHECK ( ID_VOLQUETA IS NOT NULL ) ;
