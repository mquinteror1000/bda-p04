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
