DROP TABLE EMPRESAS CASCADE CONSTRAINTS ;

CREATE TABLE EMPRESAS
  (
    NIT    VARCHAR2 (25),
    NOMBRE VARCHAR2 (100)
  ) ;

ALTER TABLE EMPRESAS ADD CONSTRAINT EMPRESAS_PK PRIMARY KEY ( NIT ) ;
ALTER TABLE EMPRESAS ADD CONSTRAINT EMPRESAS_NOMBRE_NN CHECK (NOMBRE IS NOT NULL) ;
