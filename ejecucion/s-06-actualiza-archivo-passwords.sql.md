## s-06-actualiza-archivo-passwords.sql

SAlida

```shellsession
[oracle@h1-bda-mqr 04]$ sqlplus /nolog @s-06-actualiza-archivo-passwords.sql

SQL*Plus: Release 23.0.0.0.0 - Production on Fri Oct 2 13:04:04 2026
Version 23.8.0.25.04

Copyright (c) 1982, 2025, Oracle.  All rights reserved.

Connected.
old   1: ALTER USER SYS IDENTIFIED BY "&new_sys_password." ACCOUNT UNLOCK CONTAINER=ALL
new   1: ALTER USER SYS IDENTIFIED BY "system1" ACCOUNT UNLOCK CONTAINER=ALL

User altered.

Connected.
old   1: GRANT SYSDBA TO &usuario1.
new   1: GRANT SYSDBA TO martin0402

Grant succeeded.

old   1: GRANT SYSOPER TO &usuario2.
new   1: GRANT SYSOPER TO martin0403

Grant succeeded.

old   1: GRANT SYSBACKUP TO &usuario3.
new   1: GRANT SYSBACKUP TO martin0404

Grant succeeded.


USERNAME	     SYSDB SYSOP SYSBA SYSKM SYSDG     CON_ID
-------------------- ----- ----- ----- ----- ----- ----------
SYS		     TRUE  TRUE  FALSE FALSE FALSE	    0
MARTIN0403	     FALSE TRUE  FALSE FALSE FALSE	    3
MARTIN0402	     TRUE  FALSE FALSE FALSE FALSE	    3
MARTIN0404	     FALSE FALSE TRUE  FALSE FALSE	    3

Disconnected from Oracle Database 23ai Free Release 23.0.0.0.0 - Develop, Learn, and Run for Free
Version 23.8.0.25.04

```


