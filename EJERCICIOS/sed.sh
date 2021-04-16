#!/bin/bash

cat ./archivo3.txt | while read line 
do

	echo "$line" | sed 's-\([0-9]\)\([0-9]\)\([0-9]\)-\1\2\3\2\1-g'

done