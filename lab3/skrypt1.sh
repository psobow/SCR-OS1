#!/bin/bash

# $# = Zmienna bash'a wbudowana reprezentuję ilość argumentów przekazanych do skryptu.

# -ne = not equal to

if [[ "$#" -ne 3 ]] ;       
then                
    echo "Uzyj: $0 <dni-od-ostatniej-modyfikacji> <szukana-nazwa> <nazwa-archiwum>"
else
    find -name "$2" -mtime -$1 -exec tar -rvf "$3" {} \;
fi

# tar -r = append files to the end of archive
# example usage: bash ./skrypt1.sh 1 *.txt arc1.tar