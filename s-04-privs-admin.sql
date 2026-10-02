-- @Autor Quintero Rubio Martin
-- @Fecha 26/09/2026
-- obtiene informacion de la CDB consultando vistas del diccionario y la guarda en una tabla
-- EDITAR 
DEFINE pdb = mqrbda_s1
DEFINE sys_password = system1_p4
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
CONNECT sys/&sys_password.@&pdb. AS SYSDBA

-- B crear 3 usuarios
-- Eliminar usuarios si existieran (Sintaxis válida en Oracle 23ai)
DROP USER IF EXISTS &usuario1. CASCADE;
DROP USER IF EXISTS &usuario2. CASCADE;
DROP USER IF EXISTS &usuario3. CASCADE;
-- Crear los usuarios
CREATE USER &usuario1. IDENTIFIED BY "&password1.";
CREATE USER &usuario2. IDENTIFIED BY "&password2.";
CREATE USER &usuario3. IDENTIFIED BY "&password3.";


-- C Permitirles crear sesion a los usuarios
GRANT CREATE SESSION, CREATE TABLE TO &usuario1., &usuario2., &usuario3.;

-- D otorgar privilegios administrativos
GRANT SYSDBA TO &usuario1.;
GRANT SYSOPER TO &usuario2.;
GRANT SYSBACKUP TO &usuario3.;

-- E usuario admin con duenio de la tabla bitacora con almacenamiento en users
DROP USER IF EXISTS &usuario_admin. CASCADE;
CREATE USER &usuario_admin. IDENTIFIED BY "&password_admin." QUOTA UNLIMITED ON users;
GRANT CREATE SESSION, CREATE TABLE TO &usuario_admin.; 

-- F crear tabla para guardar los registros
DROP TABLE IF EXISTS &usuario_admin..t01_bitacora CASCADE CONSTRAINTS;
CREATE TABLE &usuario_admin..t01_bitacora (
    id NUMBER NOT NULL,
    usuario VARCHAR2(30) NOT NULL,
    esquema VARCHAR2(30) NOT NULL,
    rol VARCHAR2(20) NOT NULL,
    fecha_registro DATE NOT NULL
);

-- G pemitirle a los usuarios NOMBRE_0402...04 escribir en la tabla de MOMBRE_04ADMIN
-- cuandos entran sin usar privilegio: SYS
CONNECT &usuario_admin./&password_admin.@&pdb.
GRANT SELECT, INSERT, UPDATE ON t01_bitacora TO &usuario1., &usuario2., &usuario3.;
-- cuando entran con priv administrativo
GRANT SELECT, INSERT, UPDATE ON t01_bitacora TO sysbackup; -- sys no ocupa

-- H Realizar 6 inserciones en la tabla
-- usuario1
CONNECT &usuario1./&password1.@&pdb.
INSERT INTO &usuario_admin..t01_bitacora ( id, usuario, esquema, rol, fecha_registro )
VALUES(
    1,
    sys_context('USERENV', 'CURRENT_USER'),
    sys_context('USERENV', 'CURRENT_SCHEMA'),
    'ordinario',
    sysdate
);
COMMIT;

CONNECT &usuario1./&password1.@&pdb. as sysdba
INSERT INTO &usuario_admin..t01_bitacora ( id, usuario, esquema, rol, fecha_registro )
VALUES(
    2,
    sys_context('USERENV', 'CURRENT_USER'),
    sys_context('USERENV', 'CURRENT_SCHEMA'),
    'sysdba',
    sysdate
);
COMMIT;

-- usuario 2
CONNECT &usuario2./&password2.@&pdb.
INSERT INTO &usuario_admin..t01_bitacora ( id, usuario, esquema, rol, fecha_registro )
VALUES(
    3,
    sys_context('USERENV', 'CURRENT_USER'),
    sys_context('USERENV', 'CURRENT_SCHEMA'),
    'ordinario',
    sysdate
);
COMMIT;
-- esta insercion es mentira porque sysoper no puede escribir en tablas
CONNECT &usuario2./&password2.@&pdb.
INSERT INTO &usuario_admin..t01_bitacora ( id, usuario, esquema, rol, fecha_registro )
VALUES(
    4,
    sys_context('USERENV', 'CURRENT_USER'),
    sys_context('USERENV', 'CURRENT_SCHEMA'),
    'sysoper',
    sysdate
);
COMMIT;

-- usuario 3
CONNECT &usuario3./&password3.@&pdb.
INSERT INTO &usuario_admin..t01_bitacora ( id, usuario, esquema, rol, fecha_registro )
VALUES(
    5,
    sys_context('USERENV', 'CURRENT_USER'),
    sys_context('USERENV', 'CURRENT_SCHEMA'),
    'ordinario',
    sysdate
);
COMMIT;

CONNECT &usuario3./&password3.@&pdb. -- AS sysbackup -- al final no se pudo
INSERT INTO &usuario_admin..t01_bitacora ( id, usuario, esquema, rol, fecha_registro )
VALUES(
    6,
    sys_context('USERENV', 'CURRENT_USER'),
    sys_context('USERENV', 'CURRENT_SCHEMA'),
    'sysbackup',
    sysdate
);
COMMIT;


EXIT
