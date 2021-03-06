DROP TABLE ENTRADAS CASCADE CONSTRAINTS ;

CREATE TABLE ENTRADAS
  (
    ID_ENTRADA    NUMBER (6) ,
    ID_VENTA      NUMBER (25) ,
    FECHA_ENTRADA DATE ,
    ID_USUARIO    NUMBER (10)
  ) ;

ALTER TABLE ENTRADAS ADD CONSTRAINT ENTRADAS_PK PRIMARY KEY ( ID_ENTRADA ) ;
ALTER TABLE ENTRADAS ADD CONSTRAINT ENTRADAS_ID_VEN_NN CHECK ( ID_VENTA IS NOT NULL ) ;
ALTER TABLE ENTRADAS ADD CONSTRAINT ENTRADAS_FECHA_ENTRADA CHECK ( FECHA_ENTRADA IS NOT NULL ) ;

ALTER TABLE ENTRADAS ADD CONSTRAINT ENTRADAS_VENTAS_ENTRADAS_FK FOREIGN KEY ( ID_VENTA ) REFERENCES VENTAS_ENTRADAS ( ID_VENTA ) ;
ALTER TABLE ENTRADAS ADD CONSTRAINT ENTRADAS_USUARIOS_FK FOREIGN KEY ( ID_USUARIO ) REFERENCES USUARIOS ( ID_USUARIO ) ;
