DROP TABLESPACE ts_manantial
including contents and datafiles;


CREATE TABLESPACE ts_manantial LOGGING
DATAFILE 'manantial.dbf' size 1M
extent management local segment space management auto;

ALTER TABLESPACE ts_manantial ADD DATAFILE '/home/sebastian/Documentos/Poli/BD2/DATAFILE/manantial.dbf' SIZE 1M;

DROP USER us_manantial CASCADE;

CREATE USER us_manantial profile default
identified by 12345
default tablespace ts_manantial
temporary tablespace temp
account unlock;

--permisos

GRANT connect, resource,dba to us_manantial;

connect us_manantial/12345

show user;
