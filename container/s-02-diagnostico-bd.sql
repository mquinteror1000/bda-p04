-- obtiene informacion de la CDB consultando vistas del diccionario y la guarda en la tabla diagnostico
-- EDITAR
DEFINE pdb = 'mqrbda_s1'
DEFINE sys_password = 'system1_p4'
DEFINE usuario = martin0401
DEFINE password = martin

WHENEVER SQLERROR EXIT SQL.SQLCODE
CONNECT sys/"&sys_password."@&pdb. AS SYSDBA

-- 1 y 2. borrar usuario si existe 
DROP USER IF EXISTS &usuario. CASCADE;

-- 3. Lo creamos desde cero y asignamos permisos
CREATE USER &usuario. IDENTIFIED BY "&password.";
GRANT CONNECT, RESOURCE TO &usuario.;
ALTER USER &usuario. QUOTA UNLIMITED ON USERS;

-- 4. Creamos la tabla diagnostico
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
