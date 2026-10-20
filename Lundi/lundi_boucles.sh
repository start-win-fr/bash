#!/bin/bash

# {1..5} permet de creer une liste qui va de 1 à 5
# Donc dans cette boucle, i prendra la valeur de 1, puis 2 jusqu'a 5
for i in {1..5}; do
    # le -n permet de ne pas ajouter de retour à la ligne
    echo -n "$i "
done

echo -e "\n"

# (( point de départ; condition d'arret ; incrémentation ))
for (( i = 1; i <= 10; i++ )); do
    echo "$i"
done

i=10
n=7
resultat=70
printf "%d x %d = %d " "$i" "$n" "$resultat"

# 7 x 1  = 7
# 7 x 2  = 14
# 7 x 3  = 21
# 7 x 4  = 28
# 7 x 5  = 35
# 7 x 6  = 42
# 7 x 7  = 49
# 7 x 8  = 56
# 7 x 9  = 63
# 7 x 10 = 70

# 10 x 1  = 10
# 10 x 2  = 20
# 10 x 3  = 30
# 10 x 4  = 40
# 10 x 5  = 50
# 10 x 6  = 60
# 10 x 7  = 70
# 10 x 8  = 80
# 10 x 9  = 90
# 10 x 10 = 100
