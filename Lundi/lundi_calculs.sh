#!/bin/bash

a=17
b=5
echo "Somme : $(( a + b ))"
echo "Produit : $(( a * b ))"
# division entière
echo "Quotient : $(( a / b ))" 
# le modulo, très utile
echo "Reste : $(( a % b ))" 
echo "Puissance : $(( a ** 2 ))"
# (( )) sans $ : on calcule sans afficher
# a++ permet de faire a=((a + 1))
(( a++ )) 
echo "a vaut maintenant $a"
