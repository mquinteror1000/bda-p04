# Practica 4 BDA

### Privilegios de administración, roles y mecanismos de autenticación

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

[Salida](ejecucion/s-01-sys-pass-admin.md)