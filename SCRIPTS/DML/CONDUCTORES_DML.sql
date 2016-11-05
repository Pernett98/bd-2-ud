INSERT INTO CONDUCTORES (ID_CONDUCTOR, NOMBRE, APELLIDO_1, APELLIDO_2, ID_VOLQUETA) VALUES (980872, 'Carlos', 'Pointer', 'Maximus', 'zzz-123') ;
INSERT INTO CONDUCTORES (ID_CONDUCTOR, NOMBRE, APELLIDO_1, APELLIDO_2, ID_VOLQUETA) VALUES (213123, 'Marlon', 'Square', 'Kille', 'qwe-123') ;
INSERT INTO CONDUCTORES (ID_CONDUCTOR, NOMBRE, APELLIDO_1, APELLIDO_2, ID_VOLQUETA) VALUES (112213, 'Jaroll', 'Dominic', 'Praga', 'asd-123') ;


SELECT CONDUCTORES.ID_CONDUCTOR, CONDUCTORES.NOMBRE, CONDUCTORES.APELLIDO_1, CONDUCTORES.APELLIDO_2, CONDUCTORES.ID_VOLQUETA AS PLACA, EMPRESAS.NOMBRE AS EMPRESAS
FROM CONDUCTORES
INNER JOIN VOLQUETAS ON (CONDUCTORES.ID_VOLQUETA = VOLQUETAS.PLACA)
INNER JOIN EMPRESAS ON (VOLQUETAS.ID_EMPRESA = EMPRESAS.NIT);
--
UPDATE CONDUCTORES SET APELLIDO_1 = 'Grey' WHERE ID_CONDUCTOR = 980872;

SELECT CONDUCTORES.ID_CONDUCTOR, CONDUCTORES.NOMBRE, CONDUCTORES.APELLIDO_1, CONDUCTORES.APELLIDO_2, CONDUCTORES.ID_VOLQUETA AS PLACA, EMPRESAS.NOMBRE AS EMPRESAS
FROM CONDUCTORES
INNER JOIN VOLQUETAS ON (CONDUCTORES.ID_VOLQUETA = VOLQUETAS.PLACA)
INNER JOIN EMPRESAS ON (VOLQUETAS.ID_EMPRESA = EMPRESAS.NIT);

--
DELETE FROM CONDUCTORES WHERE ID_CONDUCTOR = 3 ;

SELECT CONDUCTORES.ID_CONDUCTOR, CONDUCTORES.NOMBRE, CONDUCTORES.APELLIDO_1, CONDUCTORES.APELLIDO_2, CONDUCTORES.ID_VOLQUETA AS PLACA, EMPRESAS.NOMBRE AS EMPRESAS
FROM CONDUCTORES
INNER JOIN VOLQUETAS ON (CONDUCTORES.ID_VOLQUETA = VOLQUETAS.PLACA)
INNER JOIN EMPRESAS ON (VOLQUETAS.ID_EMPRESA = EMPRESAS.NIT);
