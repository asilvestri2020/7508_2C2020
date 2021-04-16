#! /bin/bash
# ******************************************************************
# 10 TEXTO
# Dado el siguiente archivo de texto:
# lipsum.txt
# "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
# Duis suscipit dictum urna et luctus. Ut non elementum urna, ac ultricies justo. Nulla a lacus
# rutrum, sollicitudin neque interdum, scelerisque mauris.
# Mauris tempor rhoncus tincidunt. Mauris dignissim venenatis risus, sit amet tincidunt risus
# laoreet vehicula.
# Etiam volutpat libero ac ipsum vestibulum elementum. Morbi eget diam non tellus mattis
# malesuada.
# Sed fermentum felis tempus nisi venenatis dictum.
# Nam suscipit lacinia nisl ut pulvinar. Proin id enim condimentum, ultrices leo quis, auctor
# tellus.
# Aliquam porttitor nibh felis. Integer pharetra elementum libero rhoncus egestas.
# Etiam at aliquet elit, ac feugiat nunc. Proin id lorem viverra mi consectetur tempus ut sed
# neque.
# Nullam scelerisque congue accumsan. Nunc tincidunt tellus odio, eu fermentum mi tempor
# at.
# 75.08 Guía de Ejercicios de la Práctica
# 10Etiam et ullamcorper elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra,
# per inceptos himenaeos."
# a. Realizar un shell script que busque dentro del archivo de texto palabras en latín pasadas
# por parámetro.
# b. Reemplace en las líneas que empiezan con E, la quinta palabra por el texto
# "ELIMINADO"
# c. Elimine las líneas que terminan tienen la palabra "sed"
# d Inserte comentarios con la siguiente notación: "#COMENTARIO: " al final de cada línea
# {} [] /\ ^$
# ******************************************************************


#Creeo archivo input
echo "Ejercicio 10 TEXTO."
echo ""

echo "A - Buscamos palabra pasada por parámetro."
grep "$1" "10_texto.txt"

# {} [] /\ ^$  | sed 's/ /;/g'
echo "B - Lineas que empiezan con E poner en la quinta palabra ELIMINADO."
grep "^E" "10_texto.txt" | sed 's/^\([^ ]* [^ ]* [^ ]* [^ ]* \)\([^ ]*\)\( .*\)$/\1ELIMINADO\3/g'

echo "C - Elimine las líneas que terminan tienen la palabra sed"
grep 'sed$' "10_texto.txt" | sed 's/..*/REEMPLAZO/g'

echo "D - Elimine las líneas que terminan tienen la palabra sed"
grep 'sed$' "10_texto.txt" | sed '/\(..*\)/a\#COMENTARIO: '

echo ""
echo "Fin ejercicio 10 TEXTO."