echo "==========================================================="
echo "EJERCICIO QUE LEE EL ARCHIVO NotasSO.txt."
echo "MOSTRANDO NOMBRE Y NOTA ORDENADO DE MANERA DESCENDENTE."
echo "ANTE IGUALDAD EN LA NOTA POR ORDEN ALFABÉTICO."
echo "==========================================================="
echo "EL CONTENIDO ORIGINAL DEL ARCHIVO ES EL SIGUIENTE:"
echo "==========================================================="

echo -n > archivo2.txt 
if [ ! -r NotasSO.txt ]
then
echo "Archivo inexistente o sin permiso de lectura." 
else

while read -r linea
do
    echo $linea

done < NotasSO.txt
echo "==========================================================="
echo "TRAS EL ORDENAMIENTO NOS QUEDA LO SIGUIENTE:"
echo "==========================================================="

while read -r linea
do
    echo $linea | cut -d ';' -f1,3  >> archivo2.txt

done < NotasSO.txt

sort -t ';' -k2,2r -k1,1 archivo2.txt

fi
echo "==========================================================="