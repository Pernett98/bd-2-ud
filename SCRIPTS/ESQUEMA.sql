DROP TABLESPACE ts_manantial
including contents and datafiles;

drop user us_manantial;

CREATE TABLESPACE ts_manantial LOGGING
DATAFILE 'manantial.dbf' size 1M
extent management local segment space management auto;

create user us_manantial profile default
identified by 12345
default tablespace ts_manantial
temporary tablespace temp
account unlock;

--permisos

grant connect, resource,dba to us_manantial;

connect us_manantial/12345

show user;
