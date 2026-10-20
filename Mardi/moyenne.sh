#!/bin/bash

# note=(10 20 15 17 2 8 13 19 0 3 7 6 5)
# ./moyenne.sh 10 20 15 17 2 8 13 19 0 3 7 6 5

moyenne() {
    notes=("$@")
    somme=0
    for n in "${notes[@]}";do
        # (( somme = somme + n ))
        (( somme += n ))
    done
    echo "Somme : $somme"
    echo "Moyenne : $(( somme / ${#notes[@]} ))"
}

moyenne 10 20 15 17 2 8 13 19 0 3 7 6 5
moyenne 10 20 15
moyenne 10 0 5
