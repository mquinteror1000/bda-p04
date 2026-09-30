-- @Autor Quintero Rubio Martin
-- @Fecha 26/09/2026
-- obtiene informacion de la CDB consultando vistas del diccionario y la guarda en una tabla
-- EDITAR
DEFINE pdb = 'mqrbda_s1'
DEFINE sys_password = 'system1_p4'
DEFINE usuario = 'MARTIN_0401'
DEFINE password = 'password_0401'

-- definir usuario NOMBRE_0401

WHENEVER SQLERROR EXIT SQL.SQLCODE
CONNECT sys/&sys_password@&pdb AS SYSDBA

SET SERVEROUTPUT on;
DECLARE
    v_count NUMBER;
BEGIN
    -- 1. Buscamos si el usuario existe
    SELECT COUNT(*)
    INTO v_count
    FROM dba_users
    WHERE username = UPPER('&usuario.'); 

    -- 2. Si existe, lo borramos junto con todos sus objetos
    IF v_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP USER &usuario. CASCADE';
        DBMS_OUTPUT.PUT_LINE('[sqlplus] se ha eliminado &usuario. porque ya existia, preparando para recrear...');
    END IF;

    -- 3. SIEMPRE lo creamos desde cero (ya sea porque no existía, o porque lo acabamos de borrar)
    EXECUTE IMMEDIATE 'CREATE USER &usuario. IDENTIFIED BY "&password."';
    EXECUTE IMMEDIATE 'GRANT CONNECT, RESOURCE TO &usuario.';
    EXECUTE IMMEDIATE 'ALTER USER &usuario. QUOTA UNLIMITED ON USERS';
    
    DBMS_OUTPUT.PUT_LINE('[sqlplus] se ha creado &usuario. desde cero y con los permisos necesarios.');
    
    -- aqui
    -- eliminat table si existe
    EXECUTE IMMEDIATE 'CREATE TABLE &usuario..t01_diagnostico
    AS SELECT
        pcv.product,
        pcv.version_full,
        i.instance_name,
        to_char(i.startup_time,''dd-mm-yyyy hh24:mi:ss'') as startup_time,
        v.con_id
    from
        product_component_version pcv
        cross join v$instance i
        cross join v$version v
    where
    pcv.product like ''Oracle Database%''';
END;
/

EXIT
