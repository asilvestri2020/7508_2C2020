#! /bin/bash
# ******************************************************************
# 2 Reformatear Fecha
# Se tiene un archivo de texto en el que aparecen fechas con el siguiente formato
# mm/dd/aaaa se desea cambiarle el formato a dd/mm/aaaa
# {} [] /\
# ******************************************************************

#Creeo archivo input
echo "Ejercicio 02 FORMATEAR FECHAS."

sed -i 's-\([0-1][0-9]\)/\([0-3][0-9]\)/\([0-9]\{4\}\)-\2/\1/\3-g' 02_formatear_fecha.dat
 
echo "Fin ejercicio 02 FORMATEAR FECHAS."