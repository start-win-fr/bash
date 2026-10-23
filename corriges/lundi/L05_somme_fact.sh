#!/bin/bash
# ============================================================
# L5 — Somme et factorielle (lundi, niveau 2)
# Usage : ./L05_somme_fact.sh 5
# somme = 1 + 2 + ... + n      factorielle = 1 x 2 x ... x n
# ============================================================

n=$1

# Une somme démarre à 0 (0 ne change rien quand on additionne)
somme=0
# Un produit démarre à 1 (1 ne change rien quand on multiplie)
fact=1

# Une seule boucle suffit pour calculer les deux
for (( i = 1; i <= n; i++ )); do
    (( somme += i ))    # même chose que somme=$(( somme + i ))
    (( fact *= i ))     # même chose que fact=$(( fact * i ))
done

echo "Somme de 1 à $n : $somme"
echo "$n! = $fact"

# La question de l'énoncé : pourquoi 21 donne un nombre négatif ?
# Bash range les entiers sur 64 bits. Le plus grand possible est
# 9 223 372 036 854 775 807. 20! tient encore, 21! dépasse :
# le calcul « fait le tour » et repart dans les négatifs.
