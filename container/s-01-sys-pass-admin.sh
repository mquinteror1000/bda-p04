#!/bin/sh
# Autentica como oracle por S.O y modifica el password de sys a system1_p04
# Verifica que el cambio fue aplicado autenticando por archivo de passwords
OS_USER=$(whoami)
#EDITAR
INICIALES=mqr

if [ "${OS_USER}" = "oracle" ] || [ "${OS_USER}" = "root" ]; then
	echo "[container] Ejecutar como usaurio administrador, no orace o root" 
exit 1
fi

## A) Actualizar el password de sys autenticando por SO y desde admin_user@HOST
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
sqlplus -s /nolog <<EOF
whenever sqlerror exit sql.sqlcode
connect sys/system1_p4 as sysdba
select user from dual;
prompt [sqlplus]: conexion de sys por archivo de passwords exitosa;
exit
EOF

## en caso de error al autenticar por archivo de passwords
if [ $? -ne 0 ]; then
    echo "[sistema operativo]: El intento autenticar a sys por archivo de passwords fracaso "
    exit 1
fi

## probar conexion a INICIALESbda_s1
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


