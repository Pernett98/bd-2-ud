DROP TABLE USUARIOS CASCADE CONSTRAINTS;

CREATE TABLE USUARIOS
  (
    ID_USUARIO NUMBER (10) ,
    NOMBRE     VARCHAR2 (50) ,
    APELLIDO_1 VARCHAR2 (50) ,
    APELLIDO_2 VARCHAR2 (50) ,
    CONTRASENA VARCHAR2 (30)
  ) ;

ALTER TABLE USUARIOS ADD CONSTRAINT USUARIOS_PK PRIMARY KEY ( ID_USUARIO ) ;
ALTER TABLE USUARIOS ADD CONSTRAINT USUARIOS_NOMBRE_NN CHECK ( NOMBRE IS NOT NULL ) ;
ALTER TABLE USUARIOS ADD CONSTRAINT USUARIOS_APELLIDO_1_NN CHECK ( APELLIDO_1 IS NOT NULL ) ;
ALTER TABLE USUARIOS ADD CONSTRAINT USUARIOS_CONTRASENA_NN CHECK ( CONTRASENA IS NOT NULL )  
