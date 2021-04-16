#! /bin/bash
# ******************************************************************
# 1 Capicúas
# Se tiene un archivo con números enteros de 3 dígitos, se desea generar otro archivo con los
# capicúas de cada uno de los números
# {} [] /\ ^$
# ******************************************************************

#Creeo archivo input

echo "Ejercicio SHELL VALIDAR ARCHIVOS."
DIR_PROC="./DATAS/"
DIR_PROC_OK="./DATAS/OK/"
DIR_PROC_ERR="./DATAS/ERROR/"
REGISTROS="./02_shell_validar_archivos.dat"
NOMBRE_ARCHIVO=""
REGISTROS_CORRECTOS=0
REGISTROS_ERRONEOS=0
DELIMITADOR=""
CANTIDAD_CAMPOS=0
for ARCHIVO in $(ls $DIR_PROC)
do 
    echo $ARCHIVO
    DELIMITADOR=""
    CANTIDAD_CAMPOS=0
    REGISTROS_ERRONEOS=0
    REGISTROS_CORRECTOS=0
    VALIDO=$(echo $ARCHIVO | grep -c "[^\.]*\..*")
    if [[ $VALIDO -eq 0 ]]
    then
        echo "CARPETA O ARCHIVO SIN EXTENSIÓN."
        continue
    else 
        echo "NOMBRE DE ARCHIVO VALIDO." 
        cp $DIR_PROC$ARCHIVO $DIR_PROC_OK
        EXTENSION=$(echo $ARCHIVO | sed "s-\([^\.]*\.\)\([^\.]*\)-\2-g")
        echo $EXTENSION
        echo $REGISTROS
        while read -r TIPO
        do
            echo $TIPO
            echo "HOlA"
            VALIDO=$(echo $TIPO | grep -c "$EXTENSION")
            if [[ $VALIDO -eq 0 ]]
            then
                echo "EL FORMATO NO SE ENCUENTRA."
                cp $DIR_PROC$ARCHIVO $DIR_PROC_ERROR
            else
                echo "EL FORMATO SI SE ENCUENTRA."
                DELIMITADOR=$(echo $TIPO | cut -d "|" -f2)
                echo $DELIMITADOR
                CANTIDAD_CAMPOS=$(echo $TIPO | cut -d "|" -f3)
                echo $CANTIDAD_CAMPOS
                while read -r LINEA
                do
                    CANTIDAD=$(echo $LINEA | grep -o "$DELIMITADOR" | wc -w)
                    CANTIDAD=$((CANTIDAD + 1))
                    echo $CANTIDAD
                    if [[ $CANTIDAD -eq $CANTIDAD_CAMPOS ]]
                    then
                        REGISTROS_ERRONEOS=$((REGISTROS_ERRONEOS + 1))
                        echo $LINEA >> $DIR_PROC_ERR"error.dat"
                    else
                        REGISTROS_CORRECTOS=$((REGISTROS_CORRECTOS + 1))
                        echo $LINEA >> $DIR_PROC_OK"ok.dat"
                    fi
                done < $DIR_PROC$ARCHIVO
                echo "REGISTROS ERRONEOS: "$REGISTROS_ERRONEOS
                echo "REGISTROS CORRECTOS: "$REGISTROS_CORRECTOS
            fi
        done < $REGISTROS
    fi
done

echo "Fin ejercicio SHELL VALIDAR ARCHIVOS."