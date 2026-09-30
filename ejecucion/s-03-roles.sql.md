# s-03-roles.sql

ejecución

```shell
[martin@h1-bda-mqr 04]$ sqlplus /nolog

SQL*Plus: Release 23.0.0.0.0 - Production on Tue Sep 29 21:05:43 2026
Version 23.8.0.25.04

Copyright (c) 1982, 2025, Oracle.  All rights reserved.

idle> @s-03-roles.sql
Connected.
old   1: DROP USER IF EXISTS &usuario1. CASCADE
new   1: DROP USER IF EXISTS MARTIN_DEV_01 CASCADE

User dropped.

old   1: DROP USER IF EXISTS &usuario2. CASCADE
new   1: DROP USER IF EXISTS MARTIN_DEV_02 CASCADE

User dropped.

old   1: CREATE USER &usuario1. IDENTIFIED BY "&password1." QUOTA UNLIMITED ON users
new   1: CREATE USER MARTIN_DEV_01 IDENTIFIED BY "MARTIN" QUOTA UNLIMITED ON users

User created.

old   1: CREATE USER &usuario2. IDENTIFIED BY "&password2." QUOTA UNLIMITED ON users
new   1: CREATE USER MARTIN_DEV_02 IDENTIFIED BY "MARTIN" QUOTA UNLIMITED ON users

User created.


Role dropped.


Role created.


Grant succeeded.


Revoke succeeded.


Grant succeeded.

old   1: GRANT p04_dev_role TO &usuario1., &usuario2.
new   1: GRANT p04_dev_role TO MARTIN_DEV_01, MARTIN_DEV_02

Grant succeeded.

old   3: WHERE grantee IN ( UPPER('&usuario1.'), UPPER('&usuario2.') )
new   3: WHERE grantee IN ( UPPER('MARTIN_DEV_01'), UPPER('MARTIN_DEV_02') )

GRANTEE          GRANTED_ROLE
-------------------- --------------------------------------------------
MARTIN_DEV_01         P04_DEV_ROLE
MARTIN_DEV_02         P04_DEV_ROLE


GRANTEE          PRIVILEGE
-------------------- ------------------------------
P04_DEV_ROLE         CREATE SEQUENCE
P04_DEV_ROLE         CREATE SESSION
P04_DEV_ROLE         CREATE TABLE
P04_DEV_ROLE         CREATE VIEW

Disconnected from Oracle Database 23ai Free Release 23.0.0.0.0 - Develop, Learn, and Run for Free
Version 23.8.0.25.04
```
