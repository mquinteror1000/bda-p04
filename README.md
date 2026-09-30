# Practica 4 BDA

### Privilegios de administración, roles y mecanismos de autenticación

## Iniciar y levantar

Iniciar la instancia con  y levantar con **launch**

[Salida: Levantar la instancia](ejecucion/levanta-con-launch.md)

## s-01-sys-pass-admin.sh

Este script 

1. Modifica el password de **sys** a system1_p4

2. autentica sys por archivo de passwords en **pdb$root**

3. autentica sy por archivo de passwords en **INICIALESbda_s1**

modificar las iniciales

```bash
usuarioOs=$(whoami)
#EDITAR
INICIALES=mqr
```

ejecutarlo con el usuario aministrador 

```shellsession
[martin@h1-bda-mqr 04]$ sh s-01-sys-pass-admin.sh
```

[Salida: ejecutar s-01-sys-pass-admin.md](ejecucion/s-01-sys-pass-admin.md)

## s-02-diagnostico-bd.sql

Crea una tabla **NOMBRE_0401.t01_diagnostico** con la información 

| campo       | product                   | version_full              | instance_name | startup_time | con_id    |
| ----------- | ------------------------- | ------------------------- | ------------- | ------------ | --------- |
| De la vista | product_component_version | product_component_version | v$instance    | v$nstance    | v$version |

Editar

```bash
DEFINE pdb = 'mqrbda_s1'
DEFINE sys_password = 'system1_p4'
DEFINE usuario = 'MARTIN_0401'
```

Ejecutar

```shellsession
[martin@h1-bda-mqr 04]$ sqlplus /nolog

SQL*Plus: Release 23.0.0.0.0 - Production on Tue Sep 29 19:32:27 2026
Version 23.8.0.25.04

Copyright (c) 1982, 2025, Oracle.  All rights reserved.

idle> @s-02-diagnostico-bd.sql
```

[Ejecucion s-02-diagnostico-bd.sql ](ejecucion/s-02-diagnostico-bd.sql.md)