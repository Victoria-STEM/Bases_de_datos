# Instrucciones para Instalar las Bases de Datos en Windows

## Paso 1: Clonar el Repositorio de Bases de Datos
Antes de comenzar, asegúrate de tener el repositorio de Bases-De-Datos clonado en tu equipo. Este repositorio debe contener la carpeta `Databases`.

## Paso 2: Localizar la Ruta a la Carpeta `Databases`
Una vez clonado el repositorio, navega hasta la carpeta `Bases-De-Datos/Databases`. Toma nota de la ruta completa de la carpeta, ya que la necesitarás más adelante.

## Paso 3: Abrir una CMD como Administrador
1. Presiona `Win + R`, escribe `cmd` y presiona `Ctrl + Shift + Enter` para abrir una ventana de línea de comandos con permisos de administrador.
2. Acepta el mensaje de control de cuentas de usuario (UAC) si aparece.

## Paso 4: Acceder a la Carpeta `Databases`
En la ventana de `cmd`, usa el siguiente comando para cambiar al directorio donde se encuentra la carpeta `Databases` o la ruta que has guardado en el Paso 2:

```sh
cd "C:\Users\TuUsuario\Documents\GitHub\Bases-De-Datos\Databases"
```

## Paso 5: Ejecutar el Script de Configuración

### Nota importante:

Si tu contraseña de MySQL no es 1234, deberás modificar el archivo config.bat antes de ejecutarlo. 
Reemplaza 1234 por tu contraseña real en cada una de las líneas donde aparece.

Ejecuta el siguiente comando en la terminal para instalar las bases de datos:

```sh
.\config.bat
```
Ignora algunos warnings de la terminal. Si todo está correctamente configurado, el script creará las bases de datos y realizará las configuraciones necesarias en tu sistema.

