#!/bin/bash
# ============================================================
# Exercice 3 du vendredi — La somme de 1 à n (niveau 1)
# Usage : ./3_somme.sh 10
# ============================================================

n=$1
somme=0

# Version 1 : la boucle. Elle fait n tours.
for (( i = 1; i <= n; i++ )); do
    (( somme += i ))
done
echo "Somme de 1 à $n : $somme"

# Version 2 : la formule de Gauss. Une seule opération, quel que soit n.
# On la retrouve en écrivant la somme deux fois, une à l'endroit,
# une à l'envers : chaque paire fait n + 1, et il y a n paires.
echo "Avec la formule : $(( n * (n + 1) / 2 ))"

# À essayer : time ./3_somme.sh 1000000
# La boucle met plusieurs secondes, la formule est instantanée.
