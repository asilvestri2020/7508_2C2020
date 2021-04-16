#! /bin/bash
# ******************************************************************
# 4 FECHA
# Realizar un shell script que tome por entrada std una fecha (formato YYYY-MM-DD) e indique si
# es válida o no.
# {} [] /\ ^$
# ******************************************************************

#Creeo archivo input
echo "Ejercicio 04 FECHA."

echo "1944-12-31" | grep -c '^[0-9][0-9][0-9][0-9]-[0-1][0-9]-[0-3][0-9]$' | sed 's-1-valido-g' | sed 's-0-invalido-g'

echo "Fin ejercicio 04 FECHA."