echo "$1"
##
##Fecha de Notificación
##Fecha de Creación
##Aplicación
##Módulo
##Operación
##Código de Error                     #Este el campo que nos interesa 
##Mensaje
##Severidad
##Estado

## EJEMPLO: 11/11/2020;11/11/2020;Aplicacion;Modulo;Operacion;CODIGO;Mensaje;Severidad;Estado
#sed ‘s-\(*\);\(*\);\(*\);\(*\);\(*\);\(*\);\(*\);\(*\);\(*\)-\1-g’ "$1"
#VAR="CODIGO1"

#TIPO_ERROR=$(grep "^$VAR" ClasesDeErrores.dat | sed "s-\($VAR.\)\(.*\)-\2-g")
POSICION=9
CODIGOS="GRUPO;DIRINST;DIRBIN;DIRMAE;DIRIN;DIRRECH;DIRPROC;DIROUT;INSTALACION"
codigo_error=$(echo $CODIGOS | sed 's-\(.*\);\(.*\);\(.*\);\(.*\);\(.*\);\(.*\);\(.*\);\(.*\);\(.*\)-\'"$POSICION"'-g')
echo "$codigo_error"

exit 0