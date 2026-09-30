## s-02-diagnostico-bd.sql

Ejecución

```shellsession
[martin@h1-bda-mqr 04]$ sqlplus /nolog

SQL*Plus: Release 23.0.0.0.0 - Production on Tue Sep 29 20:03:23 2026
Version 23.8.0.25.04

Copyright (c) 1982, 2025, Oracle.  All rights reserved.

idle> @s-02-diagnostico-bd.sql
Connected.
old   1: DROP USER IF EXISTS &usuario. CASCADE
new   1: DROP USER IF EXISTS MARTIN_0401 CASCADE

User dropped.

old   1: CREATE USER &usuario. IDENTIFIED BY "&password."
new   1: CREATE USER MARTIN_0401 IDENTIFIED BY "password_0401"

User created.

old   1: GRANT CONNECT, RESOURCE TO &usuario.
new   1: GRANT CONNECT, RESOURCE TO MARTIN_0401

Grant succeeded.

old   1: ALTER USER &usuario. QUOTA UNLIMITED ON USERS
new   1: ALTER USER MARTIN_0401 QUOTA UNLIMITED ON USERS

User altered.

old   1: CREATE TABLE &usuario..t01_diagnostico AS
new   1: CREATE TABLE MARTIN_0401.t01_diagnostico AS

Table created.

Disconnected from Oracle Database 23ai Free Release 23.0.0.0.0 - Develop, Learn, and Run for Free
Version 23.8.0.25.04
[martin@h1-bda-mqr 04]$
```

### Comprobar que existe

La tabla efectivamente existe

```shellsession
[oracle@h1-bda-mqr ~]$ ORACLE_PDB_SID=mqrbda_s1 sqlplus / as sysdba

SQL*Plus: Release 23.0.0.0.0 - Production on Tue Sep 29 19:41:41 2026
Version 23.8.0.25.04

Copyright (c) 1982, 2025, Oracle.  All rights reserved.


Connected to:
Oracle Database 23ai Free Release 23.0.0.0.0 - Develop, Learn, and Run for Free
Version 23.8.0.25.04

sys@mqrbda_s1> select * from martin_0401.t01_diagnostico;

PRODUCT
--------------------------------------------------------------------------------
VERSION_FULL
--------------------------------------------------------------------------------
INSTANCE_NAME     STARTUP_TIME         CON_ID
---------------- ------------------- ----------
Oracle Database 23ai Free
23.8.0.25.04
free         29-09-2026 14:39:32          0


sys@mqrbda_s1>  
```

Que weba darle formato, mejor desde vscode

![](../images/2026-09-29-20-45-02-image.png)
