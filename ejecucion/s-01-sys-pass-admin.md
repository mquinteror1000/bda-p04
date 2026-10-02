# s-01-sys-pass-admin.sh

**modificar**

```bash
usuarioOs=$(whoami)
#EDITAR
INICIALES=mqr
```

**Ejecutar**

```shellsession
[martin@h1-bda-mqr 04]$ sh s-01-sys-pass-admin.sh 
[sudo] password for martin: 

User altered.

[sqlplus]: Password de sys actualizado correctamente

USER
--------------------------------------------------------------------------------
SYS

[sqlplus]: conexion de sys por archivo de passwords exitosa

USER
--------------------------------------------------------------------------------
SYS


CON_NAME
------------------------------
MQRBDA_S1
[sqlplus]: conexion de sys en mqrbda_s1 exitosa
:w
 
```
