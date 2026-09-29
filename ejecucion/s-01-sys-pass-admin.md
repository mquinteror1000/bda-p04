# s-01-sys-pass-admin.sh

**modificar**

```bash
usuarioOs=$(whoami)
#EDITAR
INICIALES=mqr
```

**Ejecutar**

```shellsession
martin@pc-bda-mqr:/unam/bda/practicas/04$ dockerBda1
c1-bda-mqr
bash-5.1# launch 
Verificando el listener...
Iniciando el listener...

LSNRCTL for Linux: Version 23.0.0.0.0 - Production on 28-SEP-2026 22:15:14

Copyright (c) 1991, 2025, Oracle.  All rights reserved.

Starting /opt/oracle/product/23ai/dbhomeFree/bin/tnslsnr: please wait...

TNSLSNR for Linux: Version 23.0.0.0.0 - Production
System parameter file is /opt/oracle/product/23ai/dbhomeFree/network/admin/listener.ora
Log messages written to /opt/oracle/diag/tnslsnr/h1-bda-mqr/listener/alert/log.xml
Listening on: (DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=h1-bda-mqr.fi.unam)(PORT=1521)))
Listening on: (DESCRIPTION=(ADDRESS=(PROTOCOL=ipc)(KEY=EXTPROC1521)))

Connecting to (DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=h1-bda-mqr.fi.unam)(PORT=1521)))
STATUS of the LISTENER
------------------------
Alias                     LISTENER
Version                   TNSLSNR for Linux: Version 23.0.0.0.0 - Production
Start Date                28-SEP-2026 22:15:15
Uptime                    0 days 0 hr. 0 min. 0 sec
Trace Level               off
Security                  ON: Local OS Authentication
SNMP                      OFF
Listener Parameter File   /opt/oracle/product/23ai/dbhomeFree/network/admin/listener.ora
Listener Log File         /opt/oracle/diag/tnslsnr/h1-bda-mqr/listener/alert/log.xml
Listening Endpoints Summary...
  (DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=h1-bda-mqr.fi.unam)(PORT=1521)))
  (DESCRIPTION=(ADDRESS=(PROTOCOL=ipc)(KEY=EXTPROC1521)))
The listener supports no services
The command completed successfully
Verificando el estado de la instancia...
Iniciando la instancia...
ORACLE instance started.

Total System Global Area 1603287928 bytes
Fixed Size            4922232 bytes
Variable Size          402653184 bytes
Database Buffers     1191182336 bytes
Redo Buffers            4530176 bytes
Database mounted.
Database opened.
Cambiando al usuario admin
Last login: Mon Sep 28 22:14:17 CST 2026 on pts/0
[martin@h1-bda-mqr ~]$ cd /unam/bda/practicas/04/
[martin@h1-bda-mqr 04]$ sh s-01-sys-pass-admin.sh 
[sistema operativo]: Intentado actualizar password de sys autenticando via s.o
[sudo] password for martin: 

User altered.

[sqlplus]: Password de sys actualizado correctamente
[sistema operativo]: Intentando utenticar con sys usando archivo de passwords

USER
--------------------------------------------------------------------------------
SYS

[sqlplus]: conexion de sys por archivo de passwords exitosa
[sqlplus]: mira si puelo leer tus iniciales:  mqr
[sistema operativo]: Intentando utencat con sys en mqrbda_s1

USER
--------------------------------------------------------------------------------
SYS


CON_NAME
------------------------------
MQRBDA_S1
[sqlplus]: conexion de sys en mqrbda_s1 exitosa
[martin@h1-bda-mqr 04]$ 
```
