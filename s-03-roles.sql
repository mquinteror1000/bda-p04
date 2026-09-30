-- @Autor Quintero Rubio Martin
-- @Fecha 26/09/2026
-- obtiene informacion de la CDB consultando vistas del diccionario y la guarda en una tabla
-- nombres de usuario en MAYUSCULAS
-- EDITAR 
DEFINE pdb = mqrbda_s1
DEFINE sys_password = system1_p4
DEFINE usuario1 = MARTIN_DEV_01
DEFINE usuario2 = MARTIN_DEV_02
DEFINE password1 = MARTIN
DEFINE password2 = MARTIN

WHENEVER SQLERROR EXIT SQL.SQLCODE
CONNECT sys/&sys_password@&pdb AS SYSDBA

-- Eliminar usuarios si existieran (Sintaxis válida en Oracle 23ai)
DROP USER IF EXISTS &usuario1. CASCADE;
DROP USER IF EXISTS &usuario2. CASCADE;

-- Crear los usuarios
CREATE USER &usuario1. IDENTIFIED BY "&password1." QUOTA UNLIMITED ON users;
CREATE USER &usuario2. IDENTIFIED BY "&password2." QUOTA UNLIMITED ON users;

-- Crear rol p04_dev_role
DROP ROLE IF EXISTS p04_dev_role;
CREATE ROLE p04_dev_role;
GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW, CREATE PROCEDURE TO p04_dev_role;

-- Retirar el privilegio de crear procedimientos y agregar el de crear secuencias
REVOKE CREATE PROCEDURE FROM p04_dev_role;
GRANT CREATE SEQUENCE TO p04_dev_role;

-- Asignar el rol a los usuarios
GRANT p04_dev_role TO &usuario1., &usuario2.;

-- Comprobar los resultados: Roles asignados a los usuarios
COL grantee FORMAT a20
COL granted_role FORMAT a50
SET LINESIZE window
SELECT grantee, granted_role 
FROM dba_role_privs
WHERE grantee IN ( UPPER('&usuario1.'), UPPER('&usuario2.') )
ORDER BY 1, 2;

-- Comprobar los resultados: Privilegios del sistema asignados al rol
COL privilege FORMAT a30
SELECT grantee, privilege 
FROM dba_sys_privs 
WHERE grantee = 'P04_DEV_ROLE'
ORDER BY 2;

EXIT
