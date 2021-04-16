#! /bin/bash
# ******************************************************************
# 7 DECIMALES
# Realizar un shell script que busque dentro del archivo datos.txt los números decimales mayores a
# 7.534
# ejemplo línea datos.txt
# 1:Juan Perez:9.321
# 2:Juan Paso:3.321
# 3:Matias Perez:7.534
# 4:Fernando Poso:7.999
# {} [] /\ ^$
# ******************************************************************


#Creeo archivo input
echo "Ejercicio 07 DECIMALES."
echo ""

sed 's/\([0-9]:..*:\)\([0-9]\)\.\([0-999]\)/\1\2\3/g' 07_decimales.dat \
| grep '^[0-9]:..*753[4-9]\|75[4-9][0-9]\|7[6-9][0-9][0-9]\|8[0-9][0-9][0-9]\|9[0-9][0-9][0-9]$' \
| sed 's/\([0-9]:..*:\)\([0-9]\)\([0-999]\)/\1\2.\3/g'

echo ""
echo "Fin ejercicio 07 DECIMALES."