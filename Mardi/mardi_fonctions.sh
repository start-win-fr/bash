#!/bin/bash

# Déclaration de la fonction qui s'appelle "saluer"
saluer() {
    # Cette fonction affiche Salut et l'argument donné lors de l'appel
    echo "Salut $1 !"
}

saluer "Robin"
saluer "Jonathan"
saluer "Loubna"
saluer "Richard"
saluer "Rigobert"

majeur() {
    if (( $1 >= 18 ));  then
        echo "Cette personne est majeur car elle à $1 ans"
    else
        echo "Cette personne est mineur car elle à $1 ans"
    fi
}

majeur 18
majeur 15
majeur 99
majeur 38
majeur 8

carre() {
    # Les variables locales ne sont disponible qu'a l'intérieur de la fonction ou elles sont déclarées
    local nombre=$1
    # echo $(( nombre ** 2 ))
    echo $(( nombre * nombre ))
}

carre 5