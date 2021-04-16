#! /bin/bash
# ******************************************************************
# 9 CANCIONES
# Dado una duración de canción pasada por parámetro con el siguiente formato (hh:mm:ss) indicar si
# es mayor o menor al límite establecido:
# LIMITE="00:03:12"
# {} [] /\ ^$
# ******************************************************************

#Creeo archivo input
echo "Ejercicio 09 CANCIONES."
echo ""

LIMITE="00:03:12"
echo $1
echo $LIMITE

H0= echo $(echo $LIMITE | sed 's/\([0-9]\)[0-9]:\([0-9][0-9]\):\([0-9][0-9]\)/\1/g')
echo $H0
H1= echo $(echo $LIMITE | sed 's/[0-9]\([0-9]\):\([0-9][0-9]\):\([0-9][0-9]\)/\1/g')
echo $H1

M0= echo $(echo $LIMITE | sed 's/\([0-9][0-9]\):\([0-9]\)[0-9]:\([0-9][0-9]\)/\2/g')
echo $M0
M1= echo $(echo $LIMITE | sed 's/\([0-9][0-9]\):[0-9]\([0-9]\):\([0-9][0-9]\)/\2/g')
echo $M1

S0= echo $(echo $LIMITE | sed 's/\([0-9][0-9]\):\([0-9][0-9]\):\([0-9]\)[0-9]/\3/g')
echo $S0
S1= echo $(echo $LIMITE | sed 's/\([0-9][0-9]\):\([0-9][0-9]\):[0-9]\([0-9]\)/\3/g')
echo $S1

echo "Filtro:"
echo $1 | grep "[00-99]:[00-99]:[00-99]"

echo ""
echo "Fin ejercicio 09 CANCIONES."