-- otorga a system los privilegios necesarios para que el validador del profe
-- pueda compilar sus cosas
-- EDITAR
DEFINE pdb = mqrbda_s1
DEFINE sys_password = system1
DEFINE system_password = system1

WHENEVER SQLERROR EXIT SQL.SQLCODE

-- actualizar pass de system
CONNECT sys/"&sys_password." as sysdba
ALTER USER system IDENTIFIED BY "&system_password." CONTAINER=ALL;


-- otorgar privilegios para compilar sus cosas en la PDB
CONNECT sys/"&sys_password."@&pdb. as sysdba

GRANT EXECUTE ON SYS.DBMS_CRYPTO TO SYSTEM;
GRANT SELECT ON SYS.DBA_SYS_PRIVS TO SYSTEM;
GRANT SELECT ON SYS.DBA_ROLES TO SYSTEM;
GRANT SELECT ON SYS.DBA_ROLE_PRIVS TO SYSTEM;
GRANT SELECT ON SYS.V_$PWFILE_USERS TO SYSTEM;

EXIT
