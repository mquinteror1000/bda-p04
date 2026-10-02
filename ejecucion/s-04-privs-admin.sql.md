## s-04-privs-admin.sql

Ejecución

```shellsession
[martin@h1-bda-mqr 04]$ sqlplus /nolog @s-04-privs-admin.sql 

SQL*Plus: Release 23.0.0.0.0 - Production on Fri Oct 2 12:35:02 2026
Version 23.8.0.25.04

Copyright (c) 1982, 2025, Oracle.  All rights reserved.

Connected.
old   1: DROP USER IF EXISTS &usuario1. CASCADE
new   1: DROP USER IF EXISTS martin0402 CASCADE

User dropped.

old   1: DROP USER IF EXISTS &usuario2. CASCADE
new   1: DROP USER IF EXISTS martin0403 CASCADE

User dropped.

old   1: DROP USER IF EXISTS &usuario3. CASCADE
new   1: DROP USER IF EXISTS martin0404 CASCADE

User dropped.

old   1: CREATE USER &usuario1. IDENTIFIED BY "&password1."
new   1: CREATE USER martin0402 IDENTIFIED BY "martin"

User created.

old   1: CREATE USER &usuario2. IDENTIFIED BY "&password2."
new   1: CREATE USER martin0403 IDENTIFIED BY "martin"

User created.

old   1: CREATE USER &usuario3. IDENTIFIED BY "&password3."
new   1: CREATE USER martin0404 IDENTIFIED BY "martin"

User created.

old   1: GRANT CREATE SESSION, CREATE TABLE TO &usuario1., &usuario2., &usuario3.
new   1: GRANT CREATE SESSION, CREATE TABLE TO martin0402, martin0403, martin0404

Grant succeeded.

old   1: GRANT SYSDBA TO &usuario1.
new   1: GRANT SYSDBA TO martin0402

Grant succeeded.

old   1: GRANT SYSOPER TO &usuario2.
new   1: GRANT SYSOPER TO martin0403

Grant succeeded.

old   1: GRANT SYSBACKUP TO &usuario3.
new   1: GRANT SYSBACKUP TO martin0404

Grant succeeded.

old   1: DROP USER IF EXISTS &usuario_admin. CASCADE
new   1: DROP USER IF EXISTS martin04_admin CASCADE

User dropped.

old   1: CREATE USER &usuario_admin. IDENTIFIED BY "&password_admin." QUOTA UNLIMITED ON users
new   1: CREATE USER martin04_admin IDENTIFIED BY "martin" QUOTA UNLIMITED ON users

User created.

old   1: GRANT CREATE SESSION, CREATE TABLE TO &usuario_admin.
new   1: GRANT CREATE SESSION, CREATE TABLE TO martin04_admin

Grant succeeded.

old   1: DROP TABLE IF EXISTS &usuario_admin..t01_bitacora CASCADE CONSTRAINTS
new   1: DROP TABLE IF EXISTS martin04_admin.t01_bitacora CASCADE CONSTRAINTS

Table dropped.

old   1: CREATE TABLE &usuario_admin..t01_bitacora (
new   1: CREATE TABLE martin04_admin.t01_bitacora (

Table created.

Connected.
old   1: GRANT SELECT, INSERT, UPDATE ON t01_bitacora TO &usuario1., &usuario2., &usuario3.
new   1: GRANT SELECT, INSERT, UPDATE ON t01_bitacora TO martin0402, martin0403, martin0404

Grant succeeded.

Connected.
old   1: INSERT INTO &usuario_admin..t01_bitacora ( id, usuario, esquema, rol, fecha_registro )
new   1: INSERT INTO martin04_admin.t01_bitacora ( id, usuario, esquema, rol, fecha_registro )

1 row created.


Commit complete.

Connected.
old   1: INSERT INTO &usuario_admin..t01_bitacora ( id, usuario, esquema, rol, fecha_registro )
new   1: INSERT INTO martin04_admin.t01_bitacora ( id, usuario, esquema, rol, fecha_registro )

1 row created.


Commit complete.

Connected.
old   1: INSERT INTO &usuario_admin..t01_bitacora ( id, usuario, esquema, rol, fecha_registro )
new   1: INSERT INTO martin04_admin.t01_bitacora ( id, usuario, esquema, rol, fecha_registro )

1 row created.


Commit complete.

Connected.
old   1: INSERT INTO &usuario_admin..t01_bitacora ( id, usuario, esquema, rol, fecha_registro )
new   1: INSERT INTO martin04_admin.t01_bitacora ( id, usuario, esquema, rol, fecha_registro )

1 row created.


Commit complete.

Connected.
old   1: INSERT INTO &usuario_admin..t01_bitacora ( id, usuario, esquema, rol, fecha_registro )
new   1: INSERT INTO martin04_admin.t01_bitacora ( id, usuario, esquema, rol, fecha_registro )

1 row created.


Commit complete.

Connected.
old   1: INSERT INTO &usuario_admin..t01_bitacora ( id, usuario, esquema, rol, fecha_registro )
new   1: INSERT INTO martin04_admin.t01_bitacora ( id, usuario, esquema, rol, fecha_registro )

1 row created.


Commit complete.

Disconnected from Oracle Database 23ai Free Release 23.0.0.0.0 - Develop, Learn, and Run for Free
Version 23.8.0.25.04
```

**Opcional**, verificar que exista la tabla

Entrar a sqlplus con el usuario admin **nombre**04_admin  y password **nombre**

```shellsession
[martin@h1-bda-mqr ~]$ sqlplus martin04_admin/martin@mqrbda_s1
```

Dentro de sqlplus ejecutar

```sql
column usuario format a10
column esquema format a10
column rol format a10
select * from t01_bitacora order by id asc;
```

ejemplo

```shellsession
martin04_admin@mqrbda_s1> column usuario format a10
martin04_admin@mqrbda_s1> column esquema format a10
martin04_admin@mqrbda_s1> column rol format a10
martin04_admin@mqrbda_s1> select * from t01_bitacora order by id asc;

    ID USUARIO    ESQUEMA     ROL        FECHA_REGISTRO
---------- ---------- ---------- ---------- ------------------
     1 MARTIN0402 MARTIN0402 ordinario  02-OCT-26
     2 SYS          SYS     sysdba     02-OCT-26
     3 MARTIN0403 MARTIN0403 ordinario  02-OCT-26
     4 PUBLIC     PUBLIC     sysoper    02-OCT-26
     5 MARTIN0404 MARTIN0404 ordinario  02-OCT-26
     6 SYSBACKUP  SYS     sysbackup  02-OCT-26

6 rows selected.

martin04_admin@mqrbda_s1> 
```

salir  de SQLplus
