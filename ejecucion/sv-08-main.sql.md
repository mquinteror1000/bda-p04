## sv-08-main.sql

Salida del validador

```shellsession
[martin@h1-bda-mqr 04]$ sqlplus /nolog @sv-08-main.sql 

SQL*Plus: Release 23.0.0.0.0 - Production on Fri Oct 2 13:37:49 2026
Version 23.8.0.25.04

Copyright (c) 1982, 2025, Oracle.  All rights reserved.

=========================================================
Iniciando validador - Práctica 04
=========================================================
Creando procedimientos para validar.
Connected.
No errors.
No errors.
No errors.
No errors.
No errors.
No errors.
No errors.
No errors.
No errors.


========================================================
Validación de resultados 📋 (Tomar captura desde aquí).
========================================================
Fecha .................... 2026-10-02 13:37:49
Usuario OS ............... martin
Usuario BD ............... SYSTEM
Hostname ................. h1-bda-mqr.fi.unam
Contenedor ............... MQRBDA_S1
Asignatura ............... bda
Semestre .................. 2027-1
Práctica .................. 04
========================================================
✅ [PASS] 01 - Usuario del sistema operativo distinto a root y oracle: Usuario de ejecución: martin
✅ [PASS] 02 - Producto de la BD (t01_diagnostico.product): product: Oracle Database 23ai Free
✅ [PASS] 03 - Versión completa de la BD (t01_diagnostico.version_full): version_full: 23.8.0.25.04
✅ [PASS] 04 - Nombre de instancia (t01_diagnostico.instance_name): instance_name: free
✅ [PASS] 05 - Instante de arranque (t01_diagnostico.startup_time): startup_time: 02-10-2026 10:43:59
✅ [PASS] 06 - con_id > 1, conexión realizada desde una pdb (t01_diagnostico.con_id): con_id: 3
✅ [PASS] 07 - Rol P04_DEV_ROLE registrado: Rol encontrado
✅ [PASS] 08 - Rol P04_DEV_ROLE asignado a martin04_DEV_01: Rol asignado
✅ [PASS] 09 - Privilegio CREATE SEQUENCE asignado a martin04_DEV_01 vía el rol: Privilegio válido: CREATE SEQUENCE
✅ [PASS] 10 - Privilegio CREATE VIEW asignado a martin04_DEV_01 vía el rol: Privilegio válido: CREATE VIEW
✅ [PASS] 11 - Privilegio CREATE TABLE asignado a martin04_DEV_01 vía el rol: Privilegio válido: CREATE TABLE
✅ [PASS] 12 - Privilegio CREATE SESSION asignado a martin04_DEV_01 vía el rol: Privilegio válido: CREATE SESSION
✅ [PASS] 13 - Número de privilegios asignados a martin04_DEV_01 vía el rol: 4 privilegios encontrados
✅ [PASS] 14 - Rol P04_DEV_ROLE registrado: Rol encontrado
✅ [PASS] 15 - Rol P04_DEV_ROLE asignado a martin04_DEV_02: Rol asignado
✅ [PASS] 16 - Privilegio CREATE SEQUENCE asignado a martin04_DEV_02 vía el rol: Privilegio válido: CREATE SEQUENCE
✅ [PASS] 17 - Privilegio CREATE VIEW asignado a martin04_DEV_02 vía el rol: Privilegio válido: CREATE VIEW
✅ [PASS] 18 - Privilegio CREATE TABLE asignado a martin04_DEV_02 vía el rol: Privilegio válido: CREATE TABLE
✅ [PASS] 19 - Privilegio CREATE SESSION asignado a martin04_DEV_02 vía el rol: Privilegio válido: CREATE SESSION
✅ [PASS] 20 - Número de privilegios asignados a martin04_DEV_02 vía el rol: 4 privilegios encontrados
✅ [PASS] 21 - Usuario SYS en archivo de passwords (SYSDBA=TRUE, SYSOPER=TRUE): 1 registros obtenidos
✅ [PASS] 22 - Usuario MARTIN0402 en archivo de passwords (SYSDBA=TRUE): 1 registros obtenidos
✅ [PASS] 23 - Usuario MARTIN0403 en archivo de passwords (SYSOPER=TRUE): 1 registros obtenidos
✅ [PASS] 24 - Usuario MARTIN0404 en archivo de passwords (SYSBACKUP=TRUE): 1 registros obtenidos
✅ [PASS] 25 - Bitácora - renglón 1 (usuario: MARTIN0402, rol: ORDINARIO): 1 registro(s) encontrados
✅ [PASS] 26 - Bitácora - renglón 2 (usuario: SYS, rol: SYSDBA): 1 registro(s) encontrados
✅ [PASS] 27 - Bitácora - renglón 3 (usuario: MARTIN0403, rol: ORDINARIO): 1 registro(s) encontrados
✅ [PASS] 28 - Bitácora - renglón 4 (usuario: PUBLIC, rol: SYSOPER): 1 registro(s) encontrados
✅ [PASS] 29 - Bitácora - renglón 5 (usuario: MARTIN0404, rol: ORDINARIO): 1 registro(s) encontrados
✅ [PASS] 30 - Bitácora - renglón 6 (usuario: SYSBACKUP, esquema: SYS, rol: SYSBACKUP): 1 registro(s) encontrados


🏆 RESUMEN: 30/30 validaciones correctas
FVH: 48c223408d55b8d72d158fefd110294e780c89c401e198760c2e2005dfc37da1
==============: Fin de captura :=======================


==> Limpiando objetos de validación en CDB$ROOT...

Disconnected from Oracle Database 23ai Free Release 23.0.0.0.0 - Develop, Learn, and Run for Free
Version 23.8.0.25.04

```


