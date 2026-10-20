#!/bin/bash


# 0 => b
# 1 => o
# 2 => n
# 3 => j
# 4 => o
# 5 => u
# 6 => r
# 7 => 
# bonjour
# ruojnob

inverser() {
    local string=$1
    local reverse=""

    for (( i = ${#string} - 1; i >= 0 ;i-- )); do
        # Permet de récupérer une lettre à partir de la position i dans la chaine de caractere 
        # Par exemple :
        # ${string:3:1} en imaginant que string = algorithme
        # ${string:3:1} = o
        # echo ${#string}
        # echo ${string:i:1}
        reverse+=${string:i:1}
    done

    echo "$reverse"
}

inverser bonjour