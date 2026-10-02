-- @Autor Quintero Rubio Martin
-- @Fecha 26/09/2026
-- obtiene informacion de la CDB consultando vistas del diccionario y la guarda en una tabla
-- EDITAR
DEFINE pdb = 'mqrbda_s1'
DEFINE sys_password = 'system1_p4'
DEFINE usuario = martin0401
DEFINE password = martin

WHENEVER SQLERROR EXIT SQL.SQLCODE
CONNECT sys/"&sys_password."@&pdb. AS SYSDBA

-- 1 y 2. Borramos el usuario en cascada si es que existe (Natividad 23ai)
DROP USER IF EXISTS &usuario. CASCADE;

-- 3. Lo creamos desde cero y asignamos permisos
CREATE USER &usuario. IDENTIFIED BY "&password.";
GRANT CONNECT, RESOURCE TO &usuario.;
ALTER USER &usuario. QUOTA UNLIMITED ON USERS;

-- 4. Creamos la tabla (al borrar el usuario en cascada previamente, garantizamos que no existe)
-- sale con_id = 0 
CREATE TABLE &usuario..t01_diagnostico AS 
SELECT
    pcv.product,
    pcv.version_full,
    i.instance_name,
    TO_CHAR(i.startup_time, 'dd-mm-yyyy hh24:mi:ss') as startup_time,
    TO_NUMBER(SYS_CONTEXT('USERENV', 'CON_ID')) AS con_id
FROM
    product_component_version pcv
    CROSS JOIN v$instance i
WHERE
    pcv.product LIKE 'Oracle Database%';

EXIT
