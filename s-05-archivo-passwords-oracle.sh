#! /bin/sh
# Simula la perdida del archivo de passwords
# Lo recupera
# Vuelve a agregar privilegios administrativos a varios usuarios para que sean agregados arl archivo de passwords
## No es nesesario editar
. /etc/profile.d/99-custom-env.sh
PW_FILE="${ORACLE_HOME}/dbs/orapwfree"
PRACTICA_DIR="/unam/bda/practicas/04"
PW_FILE_BACKUP="${PRACTICA_DIR}/orapwfree.backup"

if [ "${USER}" != "oracle" ]; then
    echo "[container] este script debe ejecutarse con el usuario oracle"
    exit 1
fi

# verificar si ya fue respaldado
if [ -f "${PW_FILE_BACKUP}" ]; then 
    echo "[container] ya existe [ ${PW_FILE_BACKUP}] , se omite su copia"
else
    echo "[container] se copia archivo de passwords de  ${USER}"
    cp "${PW_FILE}" "${PW_FILE_BACKUP}"
fi

# validar que el respaldo se haya hecho de manera correcta
if [ ! -f "${PW_FILE_BACKUP}" ]; then
    echo "[container] archivo de respaldo [${PW_FILE_BACKUP}] no encontrado"
    exit 1
fi
# como existe el archivo, seguimos pues

# parte peligrosa
# Borrar el archivo de passwords
rm -f "${PW_FILE}"

# verificar que si se haya eliminado
if [ -f "${PW_FILE}" ]; then
    echo "[container] [${PW_FILE}] aun se encuentra en su ubicacion original"
    exit 1
fi

printf "[container] el archivo de passwords se ha eliminado, press ENTER para iniciar su recuperacion: " 
read -r DUMMY_INPUT

orapwd FILE="${PW_FILE}" \
FORMAT=12.2 \
PASSWORD='Hola1234*'

#verificar que exista el archivo de passwords
if [ ! -f "${PW_FILE}" ]; then
    echo "[container] no se encuentra el nuevo archivo de passwords"
    exit 1
fi

echo "[container] se ha generado correctamente el nuevo archivo de passwords: Vuelve a proporcionar privilegios a los demas usuarios desde sqlplus"
