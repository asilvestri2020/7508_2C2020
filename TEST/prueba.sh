#!/bin/bash
#
#75.08 - 2C 2020 - GRUPO 3
#
#79979 - GONZALEZ, JUAN MANUEL (juagonzalez@fi.uba.ar)
#85881 - SILVESTRI, ANDRES (asilvestri@fi.uba.ar)
#91076 - PORRAS CARHUAMACA, SHERLY KATERIN (sporras@fi.uba.ar)
#97524 - PIZZINI, PATRICIO (ppizzini@fi.uba.ar)
#
#TP1 - frenaproceso

#nano /etc/environment

# Content of the environment file

export GLOBAL="This is a global variable"
export VARIABLE="HOLIS"
echo "$VARIABLE"
echo "$GLOBAL"
./prueba2.sh
exit 0
