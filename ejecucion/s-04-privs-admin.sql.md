## s-04-privs-admin.sql

Ejecución

```shellsession
i[alicia@h1-bda-agn container]$ sqlplus /nolog @s-04-privs-admin.sql 

SQL*Plus: Release 23.0.0.0.0 - Production on Fri Oct 9 15:24:06 2026
Version 23.8.0.25.04

Copyright (c) 1982, 2025, Oracle.  All rights reserved.

Connected.
old   1: DROP USER IF EXISTS &usuario1. CASCADE
new   1: DROP USER IF EXISTS alicia0402 CASCADE

User dropped.

old   1: DROP USER IF EXISTS &usuario2. CASCADE
new   1: DROP USER IF EXISTS alicia0403 CASCADE

User dropped.

old   1: DROP USER IF EXISTS &usuario3. CASCADE
new   1: DROP USER IF EXISTS alicia0404 CASCADE

User dropped.

old   1: CREATE USER &usuario1. IDENTIFIED BY "&password1."
new   1: CREATE USER alicia0402 IDENTIFIED BY "alicia"

User created.

old   1: CREATE USER &usuario2. IDENTIFIED BY "&password2."
new   1: CREATE USER alicia0403 IDENTIFIED BY "alicia"

User created.

old   1: CREATE USER &usuario3. IDENTIFIED BY "&password3."
new   1: CREATE USER alicia0404 IDENTIFIED BY "alicia"

User created.

old   1: GRANT CREATE SESSION, CREATE TABLE TO &usuario1., &usuario2., &usuario3.
new   1: GRANT CREATE SESSION, CREATE TABLE TO alicia0402, alicia0403, alicia0404

Grant succeeded.

old   1: GRANT SYSDBA TO &usuario1.
new   1: GRANT SYSDBA TO alicia0402

Grant succeeded.

old   1: GRANT SYSOPER TO &usuario2.
new   1: GRANT SYSOPER TO alicia0403

Grant succeeded.

old   1: GRANT SYSBACKUP TO &usuario3.
new   1: GRANT SYSBACKUP TO alicia0404

Grant succeeded.

old   1: DROP USER IF EXISTS &usuario_admin. CASCADE
new   1: DROP USER IF EXISTS alicia04_admin CASCADE

User dropped.

old   1: CREATE USER &usuario_admin. IDENTIFIED BY "&password_admin." QUOTA UNLIMITED ON users
new   1: CREATE USER alicia04_admin IDENTIFIED BY "alicia" QUOTA UNLIMITED ON users

User created.

old   1: GRANT CREATE SESSION, CREATE TABLE TO &usuario_admin.
new   1: GRANT CREATE SESSION, CREATE TABLE TO alicia04_admin

Grant succeeded.

old   1: DROP TABLE IF EXISTS &usuario_admin..t01_bitacora CASCADE CONSTRAINTS
new   1: DROP TABLE IF EXISTS alicia04_admin.t01_bitacora CASCADE CONSTRAINTS

Table dropped.

old   1: CREATE TABLE &usuario_admin..t01_bitacora (
new   1: CREATE TABLE alicia04_admin.t01_bitacora (

Table created.

Connected.
old   1: GRANT SELECT, INSERT, UPDATE ON t01_bitacora TO &usuario1., &usuario2., &usuario3.
new   1: GRANT SELECT, INSERT, UPDATE ON t01_bitacora TO alicia0402, alicia0403, alicia0404

Grant succeeded.

Connected.
old   1: INSERT INTO &usuario_admin..t01_bitacora ( id, usuario, esquema, rol, fecha_registro )
new   1: INSERT INTO alicia04_admin.t01_bitacora ( id, usuario, esquema, rol, fecha_registro )

1 row created.


Commit complete.

Connected.
old   1: INSERT INTO &usuario_admin..t01_bitacora ( id, usuario, esquema, rol, fecha_registro )
new   1: INSERT INTO alicia04_admin.t01_bitacora ( id, usuario, esquema, rol, fecha_registro )

1 row created.


Commit complete.

Connected.
old   1: INSERT INTO &usuario_admin..t01_bitacora ( id, usuario, esquema, rol, fecha_registro )
new   1: INSERT INTO alicia04_admin.t01_bitacora ( id, usuario, esquema, rol, fecha_registro )

1 row created.


Commit complete.

Connected.
old   1: INSERT INTO &usuario_admin..t01_bitacora ( id, usuario, esquema, rol, fecha_registro )
new   1: INSERT INTO alicia04_admin.t01_bitacora ( id, usuario, esquema, rol, fecha_registro )

1 row created.


Commit complete.

Connected.
old   1: INSERT INTO &usuario_admin..t01_bitacora ( id, usuario, esquema, rol, fecha_registro )
new   1: INSERT INTO alicia04_admin.t01_bitacora ( id, usuario, esquema, rol, fecha_registro )

1 row created.


Commit complete.

Connected.
old   1: INSERT INTO &usuario_admin..t01_bitacora ( id, usuario, esquema, rol, fecha_registro )
new   1: INSERT INTO alicia04_admin.t01_bitacora ( id, usuario, esquema, rol, fecha_registro )

1 row created.


Commit complete.

Disconnected from Oracle Database 23ai Free Release 23.0.0.0.0 - Develop, Learn, and Run for Free
Version 23.8.0.25.04

```
