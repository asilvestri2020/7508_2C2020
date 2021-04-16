#! /bin/bash
# ******************************************************************
# Universidad de Buenos Aires
# Facultad de Ingenieria
#
# 75.08 Sistemas Operativos
# Catedra Ing. Osvaldo Clua
#
#
#
# Ejemplo de utilizacion de funciones
#
# Autor: Lic. Adrian Muccio
#
# ******************************************************************


# Funcion que muestra el uso de variables locales
function con_locales
{
declare local l_parametro1

echo
echo Inicio de function con_locales
echo

l_parametro1=$1-modificado
g_dos="Otro valor"

echo "    con_locales l_parametro1=$l_parametro1"
echo "    con_locales g_dos=$g_dos"

echo
echo Fin de function con_locales
echo

return 0
}

# Cuerpo Principal
echo
echo Inicio del cuerpo principal
echo

g_uno="valor 1"
g_dos="valor 2"
echo ppal g_uno=$g_uno
echo ppal g_dos=$g_dos 

con_locales "$g_uno"

echo ppal l_parametro1=$l_parametro1
echo ppal g_uno=$g_uno
echo ppal g_dos=$g_dos 

echo fin invocacion
exit 0

