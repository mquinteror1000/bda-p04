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
[martin@h1-bda-mqr 04]$ sqlplus /nolog @s-02-diagnostico-bd.sql 
```

[Ejecucion s-02-diagnostico-bd.sql ](ejecucion/s-02-diagnostico-bd.sql.md)

## s-03-roles.sql

Crea un rol **p04_dev_role** le otorga privilegios, los modifica y asigna el rol a sol usuarios **MARTIN_DEV_01** y **MARTIN_DEV_02** y comprueba el resultado con una consulta

editar

```sql
-- EDITAR 
DEFINE pdb = mqrbda_s1
DEFINE sys_password = system1_p4
DEFINE usuario1 = martin04_dev_01
DEFINE usuario2 = martin04_dev_02
DEFINE password1 = martin
DEFINE password2 = martin

```

ejecutar

```shellsession
[martin@h1-bda-mqr 04]$ sqlplus /nolog @s-03-roles.sql
```

[salida: s-03-roles.sql](ejecucion/s-03-roles.sql.md)

## s-04-privs-admin.sql

Este script crea un usuario dueño de la tabla bitacora y tres usuarios mas que escribiran registros en estas usando firerentes privilegios de aministracion

Tabla de usuarios y privilegios

| #   | usuario        | esquema asignado | priv/usuario con que autentica | requiere permisos para insertar |
| --- | -------------- | ---------------- | ------------------------------ | ------------------------------- |
| 1   | **nombre**0402 | nombre0402       | ordinario                      | si                              |
| 2   | sys            | sys              | sysdba                         | no                              |
| 3   | **nombre**0403 | nombre0403       | ordinario                      | si                              |
| 4   | public         | public           | sysoper                        | si                              |
| 5   | **nombre**0404 | nombre0404       | ordinario                      | si                              |
| 6   | sysbackup      | sys              | sysbackup                      | si                              |

Editar

```sql
-- EDITAR 
DEFINE pdb = mqrbda_s1
DEFINE sys_password = system1_p4
DEFINE usuario1 = martin0402
DEFINE usuario2 = martin0403
DEFINE usuario3 = martin0404
DEFINE usuario_admin = martin04_admin
DEFINE password1 = martin
DEFINE password2 = martin
DEFINE password3 = martin
DEFINE password_admin = martin
```

ejecutar

```shellsession
[martin@h1-bda-mqr 04]$ sql /nolog @s-04-privs-admin.sql
```

[salida: s-04-privs-admin.sql](ejecucion/s-04-privs-admin.sql.md)

## s-05-archivo-passwords-oracle.sh

Este scrip simula la perdida del archvo de passwords y la posterior recuperacion del mismo con el password **Hola1234***

Como oracle no tiene permisos para escribir en esta carpeta, antes de ejecutar el scrip damos permisos de escritura a otros usuarios en esta carpeta

```shellsession
martin@pc-bda-mqr:/unam/bda/practicas/04$ chmod o+w .
martin@pc-bda-mqr:/unam/bda/practicas/04$ 
```

**Editar**

No hace fata editar

**Ejecutar**

Ahora si ejecutamos el script siendo **oracle**

```shellsession
[oracle@h1-bda-mqr 04]$ sh s-05-archivo-passwords-oracle.sh 
[container] ya existe [ /unam/bda/practicas/04/orapwfree.backup] , se omite su copia
[container] el archivo de passwords se ha eliminado, press ENTER para iniciar su recuperacion: 
[container] se ha generado correctamente el nuevo archivo de passwords: Vuelve a proporcionar privilegios a los demas usuarios desde sqlplus
```

[Salida: s-05-archivo-passwords-oracle.sh](ejecucion/s-05-archivo-passwords-oracle.sh.md)

En este momento el password de sys pasa a ser **Hola1234***



## s-06-actualiza-archivo-passwords.sql

Devuelve el password de sys a **system1** partiendo de un archivo de passwords recien recuperado con el password **Hola1234***

Tambien restarua los **privilegios de tres usuarios** que al borrar y recuperar el arvhivo ya no están, por lo tanto han perdido sus privilegios

**Editar**

```sql
-- EDITAR 
DEFINE pdb = mqrbda_s1
DEFINE sys_password = Hola1234*
DEFINE new_sys_password = system1
DEFINE usuario1 = martin0402
DEFINE usuario2 = martin0403
DEFINE usuario3 = martin0404
DEFINE usuario_admin = martin04_admin
DEFINE password1 = martin
DEFINE password2 = martin
DEFINE password3 = martin
DEFINE password_admin = martin
```

**Ejecutar** con el usuario **oracle**

```shellsession
[oracle@h1-bda-mqr 04]$ sqlplus /nolog @s-06-actualiza-archivo-passwords.sql
```

Despues de esto el password de sys es **system1** como al principio

[salida: s-06-actualiza-archivo-passwords.sql](ejecucion/s-06-actualiza-archivo-passwords.sql.md)



## Antes del validador

Tuve una mala experiencia al ejecutar el validador, todo parecia perdido y no entendía que fallaba.

- El validador usa el usuario **system** "chalan de sys" para ejecutar los script

- El validador necesita que **system** compile los scripts del validador que usara en su proceso, para lo cual necesita privilegios para usar modulos de oracle

**Editar**

```sql
-- EDITAR
DEFINE pdb = mqrbda_s1
DEFINE sys_password = system1
DEFINE system_password = system1
```

**Ejecutar**

```shellsession
[martin@h1-bda-mqr 04]$ sqlplus /nolog @s-07-system-privs-on-pdb.sql
```

[Salida: ](ejecucion/s-07-system-privs-on-pdb.sql.md)

## Validador

Que miedo

Otorgar permisos de ejecucion a todo .sh

```shellsession
[martin@h1-bda-mqr 04]$ chmod 755 *.sh
```

Ejecutar el sv-08-min.sql

```shellsession
[martin@h1-bda-mqr 04]$ sqlplus /nolog @sv-08-main.sql
```

[Salida Validador](ejecucion/sv-08-main.sql.md)