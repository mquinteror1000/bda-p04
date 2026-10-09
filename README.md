# Practica 4 BDA

### ALICIA

### Privilegios de administración, roles y mecanismos de autenticación

Todas las actividades de esta practica se realizan en el contenedor

## Iniciar y levantar

Iniciar la instancia con  y levantar con **launch**

```shellsession
martin@pc-bdx-mqr:~$ agnDockerBda1
c1-bda-agn
bash-5.1# launch 
```

# CONTAINER

## s-01-sys-pass-ADMIN.s

ejecutarlo con el usuario aministrador 

```shellsession
[alicia@h1-bda-agn container]$ sh s-01-sys-pass-ADMIN.sh 
```

## s-02-diagnostico-bd.sql

Crea una tabla **NOMBRE_0401.t01_diagnostico** con la información 

| campo       | product                   | version_full              | instance_name | startup_time | con_id    |
| ----------- | ------------------------- | ------------------------- | ------------- | ------------ | --------- |
| De la vista | product_component_version | product_component_version | v$instance    | v$nstance    | v$version |

Ejecutar

```shellsession
[martin@h1-bda-mqr 04]$ sqlplus /nolog @s-02-diagnostico-bd.sql 
```

## s-03-roles.sql

Crea un rol **p04_dev_role** le otorga privilegios, los modifica y asigna el rol a sol usuarios **MARTIN_DEV_01** y **MARTIN_DEV_02** y comprueba el resultado con una consulta

ejecutar

```shellsession
[alicia@h1-bda-agn container]$ sqlplus /nolog @s-03-roles.sql 
```

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

ejecutar

```shellsession
[alicia@h1-bda-agn container]$ sqlplus /nolog s-04-privs-admin.sql 
```

## s-05-archivo-passwords-ORACLE.sh

Este scrip simula la perdida del archvo de passwords y la posterior recuperacion del mismo con el password **Hola1234***

Como oracle no tiene permisos para escribir en esta carpeta, antes de ejecutar el scrip damos permisos de escritura a otros usuarios en esta carpeta

```shellsession
martin@pc-bda-mqr:/unam/bda/practicas/04$ chmod o+w .
martin@pc-bda-mqr:/unam/bda/practicas/04$ 
```

**Ejecutar**

Ahora si ejecutamos el script siendo **oracle**

```shellsession
[oracle@h1-bda-mqr 04]$ sh s-05-archivo-passwords-oracle.sh 
[container] ya existe [ /unam/bda/practicas/04/orapwfree.backup] , se omite su copia
[container] el archivo de passwords se ha eliminado, press ENTER para iniciar su recuperacion: 
[container] se ha generado correctamente el nuevo archivo de passwords: Vuelve a proporcionar privilegios a los demas usuarios desde sqlplus
```

## s-06-actualiza-archivo-passwords.sql

Devuelve el password de sys a **system1** partiendo de un archivo de passwords recien recuperado con el password **Hola1234***

Tambien restarua los **privilegios de tres usuarios** que al borrar y recuperar el arvhivo ya no están, por lo tanto han perdido sus privilegios

**Editar**

**Ejecutar** con el usuario **oracle**

```shellsession
[oracle@h1-bda-agn container]$ sqlplus /nolog @s-06-actualiza-archivo-passwords.sql 
```

Despues de esto el password de sys es **system1** como al principio

## s-07-system-privs-on-pdb.sql

Antes de ejecutar el validador otorgar los permisos necesarios a sys 

- El validador usa el usuario **system** "chalan de sys" para ejecutar los script

- El validador necesita que **system** compile los scripts del validador que usara en su proceso, para lo cual necesita privilegios para usar modulos de oracle

Ejecutar

```shellsession
[oracle@h1-bda-agn container]$ sqlplus /nolog @s-07-system-privs-on-pdb.sql 
```

# VALIDADOR

## sv-08-main.sql

Ejecutar el script auxiliar runval.sh

```shellsession
[alicia@h1-bda-agn 04]$ sh runval.sh 
```

O bien Directamente

Ejecutar el sv-08-main.sql

```shellsession
[martin@h1-bda-mqr 04]$ sqlplus /nolog @sv-08-main.sql
```

[Salida Validador](ejecucion/sv-08-main.sql.md)