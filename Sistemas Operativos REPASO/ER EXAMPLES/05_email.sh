#! /bin/bash
# ******************************************************************
# 5 EMAIL
# Realizar un shell script que reciba por parámetro un email e indique si es válido o no.
# {} [] /\ ^$ hola@gmail.com
# ******************************************************************

#Creeo archivo input
echo "Ejercicio 05 EMAIL."

echo $1

echo $1 | grep -c '^[^@][^@]*@[^@.][^@.]*\.[^@][^@]*$' | sed 's-1-valido-g' | sed 's-0-invalido-g'

echo "Fin ejercicio 05 EMAIL."