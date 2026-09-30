SET SERVEROUTPUT ON;
-- editar el usuario
define usuario='MARTIN_0401'
define password='password_0401'
DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM dba_users
    WHERE username = '&usuario.'; 

    IF v_count > 0 THEN
        -- como existe eliminarlo
        EXECUTE IMMEDIATE 'DROP USER &usuario. CASCADE';
        DBMS_OUTPUT.PUT_LINE('[sqlplus] se ha eliminado &usuario. porque ya existia');
    ELSE
        EXECUTE IMMEDIATE 'CREATE USER &usuario. IDENTIFIED BY "&password."';
        EXECUTE IMMEDIATE 'GRANT CONNECT, RESOURCE TO &usuario.';
        execute immediate 'alter user &usuario. quota unlimited on users'
        
        DBMS_OUTPUT.PUT_LINE('[sqlplus] se ha creado &usuario.');
    END IF;
END;
/
