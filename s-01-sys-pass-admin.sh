#!/bin/sh
# @Autor Quintero Rubio Martin
# @Fecha 26/09/2026
# @Descripcion Recuperacion del password de sys mediante autenticacion por sistema
# operativo a traves de sudo, sin conocer los passwords de sys ni de
# oracle. Ejecutado por el usuario administrador.
usuarioOs=$(whoami)
#EDITAR
INICIALES=mqr
## abortar si oracle o root
if [ "${usuarioOs}" = "oracle" ] || [ "${usuarioOs}" = "root" ]; then
	echo "ERROR: el script debe ser ejecutado por el usuario administrador (no oracle, no root)"
exit 1
fi

## A) Actualizar el password de sys autenticando por SO y desde admin_user@HOST
echo "[sistema operativo]: Intentado actualizar password de sys autenticando via s.o"

sudo -u oracle -i sqlplus -s /nolog <<EOF
whenever sqlerror exit sql.sqlcode
connect / as sysdba
alter user sys identified by "system1_p4";
prompt [sqlplus]: Password de sys actualizado correctamente;
exit
EOF

## en caso de error al actualizar el password
if [ $? -ne 0 ]; then
    echo "[sistema operativo]: El intento de actualizar el password de sys fracaso "
    exit 1
fi

## probar conexion con el nuevo password mediante archivo de passwords
echo "[sistema operativo]: Intentando utenticar con sys usando archivo de passwords"

sqlplus -s /nolog <<EOF
whenever sqlerror exit sql.sqlcode
connect sys/system1_p4 as sysdba
select user from dual;
prompt [sqlplus]: conexion de sys por archivo de passwords exitosa;
prompt [sqlplus]: mira si puelo leer tus iniciales:  ${INICIALES}
exit
EOF

## en caso de error al autenticar por archivo de passwords
if [ $? -ne 0 ]; then
    echo "[sistema operativo]: El intento autenticar a sys por archivo de passwords fracaso "
    exit 1
fi

## probar conexion a INICIALESbda_s1
echo "[sistema operativo]: Intentando utencat con sys en ${INICIALES}bda_s1"

sqlplus -s /nolog <<EOF
whenever sqlerror exit sql.sqlcode
connect sys/system1_p4@${INICIALES}bda_s1 as sysdba
select user from dual;
show con_name;
prompt [sqlplus]: conexion de sys en ${INICIALES}bda_s1 exitosa;
exit
EOF

## en caso de error al autenticar por archivo de passwords
if [ $? -ne 0 ]; then
    echo "[sistema operativo]: El intento de conectarse a ${INICIALES}bda_s1 fracaso "
    exit 1
fi


