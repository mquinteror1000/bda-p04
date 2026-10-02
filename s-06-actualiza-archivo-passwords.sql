-- Parte de un archivo de passwords recien creado con password de sys =Hola1234
-- lo devuelve al valor system1 y restara los priviledios de los 3 usuarios creados con el script s-04-privs-admin.sql
--SET VERIFY OFF si no se quieren ver las actualizaciones de cadenas
-- EDITAR 
DEFINE pdb = mqrbda_s1
DEFINE sys_password = Hola1234*
DEFINE new_sys_password = system1
DEFINE usuario1 = martin0402
DEFINE usuario2 = martin0403
DEFINE usuario3 = martin0404
DEFINE usuario_admin = martin04_admin
DEFINE password1 = martin
DEFINE password2 = martin
DEFINE password3 = martin
DEFINE password_admin = martin

WHENEVER SQLERROR EXIT SQL.SQLCODE

-- Conectarse como sysdba
CONNECT sys/"&sys_password." AS SYSDBA

-- A restaurar password de sys a systemi1
-- para tranquilidad, hacer esto no me sacara de la sesion
ALTER USER SYS IDENTIFIED BY "&new_sys_password." ACCOUNT UNLOCK CONTAINER=ALL;

-- B volver a asignar privilegios administrativos a los usuarios
-- para esto es necesario conectar pero ahora a la pdb
CONNECT sys/"&new_sys_password."@&pdb. AS sysdba
GRANT SYSDBA TO &usuario1.;
GRANT SYSOPER TO &usuario2.;
GRANT SYSBACKUP TO &usuario3.;

-- C Consultar vista v$pwfile_users para verificar que esten en el archivo de passwords
COL USERNAME FORMAT A20
SELECT username, sysdba, sysoper, sysbackup, syskm, sysdg, con_id
FROM v$pwfile_users;

EXIT
