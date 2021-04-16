#! /bin/bash
# ******************************************************************
# 1 Capicúas
# Se tiene un archivo con números enteros de 3 dígitos, se desea generar otro archivo con los
# capicúas de cada uno de los números
# {} [] /\ ^$
# ******************************************************************

comparar_fechas()
{
    FECHA_PEDIDO=$(echo $1 | cut -d "," -f2)
    FECHA_ENTREGA=$(echo $1 | cut -d "," -f5)

    D1=$(echo $FECHA_PEDIDO | sed 's-[0-9][0-9][0-9][0-9][0-9][0-9](\[0-9][0-9]\)-\1-g')
    M1=$(echo $FECHA_PEDIDO | sed 's-[0-9][0-9][0-9][0-9](\[0-9][0-9]\)[0-9][0-9]-\1-g')
    A1=$(echo $FECHA_PEDIDO | sed 's-(\[0-9][0-9][0-9][0-9]\)[0-9][0-9][0-9][0-9]-\1-g')
    D2=$(echo $FECHA_ENTREGA | sed 's-[0-9][0-9][0-9][0-9][0-9][0-9](\[0-9][0-9]\)-\1-g')
    M2=$(echo $FECHA_ENTREGA | sed 's-[0-9][0-9][0-9][0-9](\[0-9][0-9]\)[0-9][0-9]-\1-g')
    A2=$(echo $FECHA_ENTREGA | sed 's-(\[0-9][0-9][0-9][0-9]\)[0-9][0-9][0-9][0-9]-\1-g')

    if [[ A1 -gt A2 ]]
    then 
        echo $REGISTRO >> $DIR_PROC_ERR"error.dat"
    else
        if [[ A1 -eq A2 ]]
        then 
            if [[ M1 -gt M2 ]]
            then
                echo $REGISTRO >> $DIR_PROC_ERR"error.dat"
            else
                if [[ M1 -eq M2 ]]
                then
                    if [[ D1 -lt D2 ]]
                    then
                        echo $REGISTRO >> $DIR_PROC_ERR"OK.dat"
                    else
                        echo $REGISTRO >> $DIR_PROC_ERR"error.dat"
                    fi
                else
                    echo $REGISTRO >> $DIR_PROC_ERR"OK.dat"
                fi
            fi
            
        else
            echo $REGISTRO >> $DIR_PROC_ERR"OK.dat"
        fi
    fi

}

#Creeo archivo input
echo "Ejercicio SHELL PEDIDOS."
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
    VALIDO=$(echo $ARCHIVO | grep -c "[^\.]*\.[0-9][0-9]*.dat")
    if [[ $VALIDO -eq 0 ]]
    then
        echo "Archivo con formato incorrecto, no es procesado."
    else
        EMPRESA=$(echo $ARCHIVO | sed 's-\([^\.]*\)\.[0-9][0-9]*.dat-\1-g')
        echo "EMPRESA: "$EMPRESA
        SECUENCIA=$(echo $ARCHIVO | sed 's-[^\.]*\.\([0-9][0-9]*\).dat-\1-g')
        echo "SECUENCIA: "$SECUENCIA

        while read -r DATO 
        do
            EMPRESA_VALIDA=$(echo $DATO | cut -d "," -f1)
            SECUENCIA_VALIDA=$(echo $DATO | cut -d "," -f4)

                if [[ $EMPRESA_VALIDA == $EMPRESA ]]
                then
                    if [[ $SECUENCIA_VALIDA == $SECUENCIA ]]
                    then
                        while read -r REGISTRO 
                        do
                            PRODUCTO=$(echo $REGISTRO | cut -d "," -f3)
                            CANTIDAD=$(echo $REGISTRO | cut -d "," -f4)

                            while read -r PRODUCTO_REG
                            do
                                PRODUCTO_NOMBRE=$(echo $REGISTRO | cut -d "," -f1)
                                PRODUCTO_STOCK=$(echo $REGISTRO | cut -d "," -f4)

                                if [[ $EMPRESA_VALIDA == $EMPRESA ]]
                                then
                                    if [[ $CANTIDAD <= $PRODUCTO_STOCK ]]
                                    then
                                        comparar_fechas $REGISTRO
                                    else
                                        echo $REGISTRO >> $DIR_PROC_ERR"error.dat"
                                        continue
                                    fi
                                fi
                            done < "./PRODUCTOS.DAT"
                        done < $DIR_PROC$ARCHIVO
                        continue
                    else
                        echo "La secuencia del archivo "$ARCHIVO" es erronea." >> $DIR_PROC_ERR"error.dat"
                        continue
                    fi
                fi

        done < "./AGENCIA.dat"
    fi
done

echo "Fin ejercicio SHELL PEDIDOS."