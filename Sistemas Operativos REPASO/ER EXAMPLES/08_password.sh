#! /bin/bash
# ******************************************************************
# 8 /ETC/PASSWD
# a. Mostrar los nombres de todos los usuarios de la máquina:
# b. Mostrar los nombres de los usuarios, pero sólo los que usan bash (/bin/bash):
# {} [] /\ ^$
# ******************************************************************


#Creeo archivo input
echo "Ejercicio 08 PASSWORD."
echo ""

echo "Todos los usuarios:"
echo ""
grep '.' "/etc/passwd" | sed 's-\(..*\):x:\(..*\)-\1-g'
echo ""
echo "Usuarios que usan bash:"
echo ""
grep '/bin/bash' "/etc/passwd" | sed 's-\(..*\):x:\(..*\)-\1-g'

echo ""
echo "Fin ejercicio 08 PASSWORD."