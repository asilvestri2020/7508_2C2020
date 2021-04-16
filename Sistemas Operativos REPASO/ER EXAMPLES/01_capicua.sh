#! /bin/bash
# ******************************************************************
# 1 Capicúas
# Se tiene un archivo con números enteros de 3 dígitos, se desea generar otro archivo con los
# capicúas de cada uno de los números
# {} [] /\ ^$
# ******************************************************************

#Creeo archivo input
echo "Ejercicio 01 CAPICUA."

sed 's/\(.\)\(.\)\(.\)/\1\2\3\3\2\1/g' 01_capicua.dat > 01_capicua_F.dat

echo "Fin ejercicio 01 CAPICUA."