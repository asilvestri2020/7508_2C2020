#! /bin/bash
# ******************************************************************
# 6 DEBITO
# Realizar un shell script que busque dentro del archivo debito-automatico.txt que solo contiene
# números de tarjetas de crédito de Visa (empiezan con 4 y tienen 16 dígitos), Mastercard (empiezan
# del 51 al 55 inclusive y tienen 16 dígitos), American Express (empiezan del 34 al 37 y tienen 15
# dígitos) y muestren por pantalla el número con su respectiva denominación.
# Ejemplo:
# 4312-4311-4311-4123:VISA
# 5123-1231-1231-1231:MASTERCARD
# 3423-1231-1231-123:AMERICANEXPRESS
# {} [] /\ ^$ hola@gmail.com
# ******************************************************************

#Creeo archivo input
echo "Ejercicio 06 DEBITO."

sed 's/\(4[0-9][0-9][0-9]\)-\([0-9][0-9][0-9][0-9]\)-\([0-9][0-9][0-9][0-9]\)-\([0-9][0-9][0-9][0-9]\)$/\1-\2-\3-\4:VISA/g' 06_debito.dat \
| sed 's/\([51-55][0-9][0-9]\)-\([0-9][0-9][0-9][0-9]\)-\([0-9][0-9][0-9][0-9]\)-\([0-9][0-9][0-9][0-9]\)$/\1-\2-\3-\4:MASTERCARD/g' \
| sed 's/\([3400-3799]\)-\([0-9][0-9][0-9][0-9]\)-\([0-9][0-9][0-9][0-9]\)-\([0-9][0-9][0-9]\)$/\1-\2-\3-\4:AMERICANEXPRESS/g'
echo ""
echo "Fin ejercicio 06 DEBITO."