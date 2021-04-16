#! /bin/bash
# ******************************************************************
# 1 Capicúas
# Se tiene un archivo con números enteros de 3 dígitos, se desea generar otro archivo con los
# capicúas de cada uno de los números
# {} [] /\ ^$
# ******************************************************************

#Creeo archivo input
echo "Ejercicio SHELL FACTURAS."
DIR_PROC="./DATAS/FACTURAS/"
DIR_ERROR="./DATAS/ERROR/"
DIR_PROV="./DATAS/provema.txt"
DIR_PROD="./DATAS/productos.txt"
DIR_OK="./DATAS/OK/facturas."
DIR_ERROR_FILE="./DATAS/ERROR/facturas.error."

for ARCHIVO in $(ls $DIR_PROC)
do 
    VAL_NOM_ARCH=$(echo $ARCHIVO | grep -c "^[^\.]*.[0-9][0-9][0-9][0-9][0-1][0-9][0-3][0-9].dat$")
    echo $VAL_NOM_ARCH
    if [[ $VAL_NOM_ARCH -eq 0 ]]
    then
        mv $DIR_PROC$ARCHIVO $DIR_ERROR
        continue
    else
        COD_PROV=$(echo $ARCHIVO | sed 's-^\([^\.]*\).[0-9][0-9][0-9][0-9][0-1][0-9][0-3][0-9].dat-\1-g')
        echo $COD_PROV
        AAAAMM=$(echo $ARCHIVO | sed 's-^[^\.]*.\([0-9][0-9][0-9][0-9][0-1][0-9]\)[0-3][0-9].dat$-\1-g') 
        echo $AAAAMM
        VAL_NOM_PROV=$(grep -c "$COD_PROV" "$DIR_PROV")
        echo $VAL_NOM_PROV
        if [[ $VAL_NOM_PROV -eq 0 ]]
        then
            mv $DIR_PROC$ARCHIVO $DIR_ERROR
            continue
        else
            while read -r LINEA
            do
                if [ -z  $LINEA ]
                then
                    echo $LINEA >> $DIR_ERROR_FILE$AAAAMM".err"
                else
                    echo $LINEA 
                    NRO_FACTURA=$(echo $LINEA | cut -d "," -f1)
                    echo $NRO_FACTURA 
                    COD_PRODUCTO=$(echo $LINEA | cut -d "," -f2)
                    echo $COD_PRODUCTO 
                    CANTIDAD=$(echo $LINEA | cut -d "," -f3)
                    echo $CANTIDAD 
                    IMPORTE=$(echo $LINEA | cut -d "," -f4)
                    echo $IMPORTE 

                    TIPO_PRODUCTO=$(grep "$COD_PROV" "$DIR_PROV" | cut -d "," -f2)
                    echo $TIPO_PRODUCTO
                    COD_PROD_ARCHIVO=$(grep "$TIPO_PRODUCTO" "$DIR_PROD" | cut -d "," -f1)
                    echo $COD_PROD_ARCHIVO
                    echo $COD_PRODUCTO
                    if [[ ! $COD_PROD_ARCHIVO -eq $COD_PRODUCTO ]]
                    then
                        echo $LINEA >> $DIR_ERROR_FILE$AAAAMM".err"
                    else
                        echo $COD_PROV","$NRO_FACTURA","$COD_PRODUCTO","$CANTIDAD >> $DIR_OK$AAAAMM".txt"
                    fi
                fi
            done < $DIR_PROC$ARCHIVO
        fi

    fi

done

echo "Fin ejercicio SHELL FACTURAS."