#! /bin/bash
# ******************************************************************
# Universidad de Buenos Aires
# Facultad de Ingenieria
#
# 75.08 Sistemas Operativos
# Catedra Ing. Osvaldo Clua
# ******************************************************************

# "10/10/2020;10/10/2020;Aplicacion;Modulo;Operacion;CodigoDeError;Mensaje;Severidad;EStado"


log_message() {
	echo "\"$(date -R)\"-\"$1\"-\"$2\"-\"$3\"-\"$USER\"" >> "$PATH_LOG_INICIALIZACION"
}

CODIGO=$(echo $1 | sed 's-\(.*;.*;.*;.*;.*;\)\(.*\)\(;.*;.*;.*\)-\2-g')
echo "$CODIGO"

# TIPO=$(sed -n "s-\(.*\*${CODIGO}\*\)\(.*\)-\2-p" "ClasesDeErrores.dat")
LINEA_ERROR=$(grep "^.*\*${CODIGO}\*.*$" "ClasesDeErrores.dat") 
TIPO=$(echo $LINEA_ERROR | sed "s-\(.*\*.*\*\)\(.*\)-\2-g")
echo "$TIPO"

#VALOR=$(sed -n "s-\(${TIPO},\)\(.*\)-\2-p" "Monitor.dat")
LINEA_VALOR=$(grep "^${TIPO},.*$" "Monitor.dat")
VALOR=$(echo $LINEA_VALOR | sed "s-\(.*,\)\(.*\)-\2-g")
echo "$VALOR"

VALOR_NUM=$(($VALOR + 1))
echo "$VALOR_NUM"

sed -i "s-${TIPO},${VALOR}-${TIPO},${VALOR_NUM}-g" "Monitor.dat"

FECHA="10/05/2020"
echo "$FECHA"
#[]
INVERSA=$(echo $FECHA | sed "s-\([0-1][0-9]\)/\([0-3][0-9]\)/\([0-9]\{4\}\)-\2/\1/\3-g")
echo "$INVERSA"

date -d "2020-50-20" +%Y-%m-%d > /dev/null 2> /dev/null
RESULTADO=$(echo "$?")
if 
echo "$RESULTADO"

exit 0