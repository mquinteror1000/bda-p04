--@Autor:          Jorge A. Rodriguez C
--@Fecha creación:  dd/mm/yyyy
--@Descripción:     Validador Práctica 04

--Modificar las siguientes variables en caso de ser necesario.
--En scripts reales no deben incluirse passwords. Solo se hace para
--propósitos de pruebas y evitar escribirlos cada vez que se quiera ejecutar
--el proceso de validación de la práctica (propósitos académicos).

--
-- Nombre del alumno empleado como prefijo para crear usuarios en la BD
--
define p_nombre='martin'

---
---Nombre de la PDB
---
define p_pdb='mqrbda_s1'

--
-- Password del usuario system. Empleado para crear objetos del validador.
--
define p_system_password='system1'

--- ============= Las siguientes configuraciones ya no requieren cambiarse====
set verify off
set feedback off
define p_spool='p04-sql-output.txt'
spool &p_spool

Prompt =========================================================
Prompt Iniciando validador - Práctica 04
Prompt =========================================================

Prompt Creando procedimientos para validar.

connect system/&&p_system_password@&p_pdb
set serveroutput on
set linesize window

define p_script_fx='sv-00-fx.plb'
define p_script_validador='sv-07.plb'

@&p_script_fx
@&p_script_validador

declare
  v_ok boolean;
begin
  vcore.init('bda', vcore.calculate_semester, '04');
  vutils.valida_os_user_no_privilegiado;
  valida_ejercicios('&&p_nombre');
  v_ok := vcore.finalize;
end;
/

prompt ==> Limpiando objetos de validación en CDB$ROOT...
begin
null;
 -- vcore.cleanup_validation;
end;
/

drop package if exists vutils;
drop package if exists vcore;

spool off
!c=$(sha256sum &p_spool | awk '{print $1}'); printf 'CHK:%s\n' "$(printf '%s' "$c" | rev)">>&p_spool
exit
