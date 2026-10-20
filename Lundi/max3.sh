#!/bin/bash

# On stock chaque parametre dans des variables a b c
a=$1 b=$2 c=$3
# on présume que le plus grand nombre est par defaut a
# on le stock donc dans max
max=$a

# On verifie ensuite si b est plus grand que max (donc de a)
if (( b > max ));then 
    # Si c'est le cas, alors on remplace la valeur de max par la valeur de b
    max=$b
fi

# Dernière condition, on verifie si c est plus grand que max
if (( c > max ));then 
    # Si oui, alors on remplace la valeur de max par celle de c
    max=$c
fi


echo "Le plus grand chiffre est $max"