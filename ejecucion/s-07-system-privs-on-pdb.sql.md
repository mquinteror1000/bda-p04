## s-07-system-privs-on-pdb.sql

Salida

```shellsession
[martin@h1-bda-mqr 04]$ sqlplus /nolog @s-07-system-privs-on-pdb.sql 

SQL*Plus: Release 23.0.0.0.0 - Production on Fri Oct 2 13:32:16 2026
Version 23.8.0.25.04

Copyright (c) 1982, 2025, Oracle.  All rights reserved.

Connected.
old   1: ALTER USER system IDENTIFIED BY "&system_password." CONTAINER=ALL
new   1: ALTER USER system IDENTIFIED BY "system1" CONTAINER=ALL

User altered.

Connected.

Grant succeeded.


Grant succeeded.


Grant succeeded.


Grant succeeded.


Grant succeeded.

Disconnected from Oracle Database 23ai Free Release 23.0.0.0.0 - Develop, Learn, and Run for Free
Version 23.8.0.25.04

```


