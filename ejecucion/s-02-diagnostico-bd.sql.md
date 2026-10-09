## s-02-diagnostico-bd.sql

```shellsession
[alicia@h1-bda-agn container]$ sqlplus /nolog @s-02-diagnostico-bd.sql 

SQL*Plus: Release 23.0.0.0.0 - Production on Fri Oct 9 15:00:53 2026
Version 23.8.0.25.04

Copyright (c) 1982, 2025, Oracle.  All rights reserved.

Connected.
old   1: DROP USER IF EXISTS &usuario. CASCADE
new   1: DROP USER IF EXISTS alicia0401 CASCADE

User dropped.

old   1: CREATE USER &usuario. IDENTIFIED BY "&password."
new   1: CREATE USER alicia0401 IDENTIFIED BY "alicia"

User created.

old   1: GRANT CONNECT, RESOURCE TO &usuario.
new   1: GRANT CONNECT, RESOURCE TO alicia0401

Grant succeeded.

old   1: ALTER USER &usuario. QUOTA UNLIMITED ON USERS
new   1: ALTER USER alicia0401 QUOTA UNLIMITED ON USERS

User altered.

old   1: CREATE TABLE &usuario..t01_diagnostico AS
new   1: CREATE TABLE alicia0401.t01_diagnostico AS

Table created.

Disconnected from Oracle Database 23ai Free Release 23.0.0.0.0 - Develop, Learn, and Run for Free
Version 23.8.0.25.04
```
