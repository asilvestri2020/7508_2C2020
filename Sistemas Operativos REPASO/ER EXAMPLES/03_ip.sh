#! /bin/bash
# ******************************************************************
# 3 IP
# Realizar un shell script que reciba por parámetro una ip (EJ: 192.168.1.1) e indique si es válida o
# no.
# {} [] /\ ^$
# ******************************************************************

#Creeo archivo input
echo "Ejercicio 03 IP."

echo $1

echo $1 | grep -c '\([1-2][0-9][0-9]\).\([1-2][0-9][0-9]\).\([0-9]\).\([0-9]\)$' | sed 's-1-valido-g' | sed 's-0-invalido-g'

echo "Fin ejercicio 03 IP."