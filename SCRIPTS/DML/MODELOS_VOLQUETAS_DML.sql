INSERT INTO MODELOS_VOLQUETAS (DESCRIPCION_MODELO, ID_MARCA) VALUES ('C-1', 1) ;
INSERT INTO MODELOS_VOLQUETAS (DESCRIPCION_MODELO, ID_MARCA) VALUES ('A-1', 2) ;
INSERT INTO MODELOS_VOLQUETAS (DESCRIPCION_MODELO, ID_MARCA) VALUES ('H-1', 4) ;
INSERT INTO MODELOS_VOLQUETAS (DESCRIPCION_MODELO, ID_MARCA) VALUES ('F-1', 5) ;


SELECT * FROM MODELOS_VOLQUETAS;
--
UPDATE MODELOS_VOLQUETAS SET DESCRIPCION_MODELO = 'H-2' WHERE ID_MODELO = 4;
SELECT * FROM MODELOS_VOLQUETAS;

--
DELETE FROM MODELOS_VOLQUETAS WHERE ID_MODELO = 3 ;
SELECT * FROM MODELOS_VOLQUETAS;