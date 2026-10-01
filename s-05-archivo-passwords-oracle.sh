#! /bin/sh
# @Author Martin Quintero Rubio
# Fecha 02-octubre-2026
# simular la perdida del archivo de passwords
archivoPwd="${ORACLE_HOME}/dbs/orapwfree"
practicaDir="/unam/bda/practicas/04"
archivoRespaldo="${practicaDir}/orapwfree.backup"

if [ ${USER} != "oracle" ]; then
    echo "[container] este script debe ejecutarse con el usuario oracle"
    exit 1
fi

