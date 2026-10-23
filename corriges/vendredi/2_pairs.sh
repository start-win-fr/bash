#!/bin/bash
# ============================================================
# Exercice 2 du vendredi — Pair ou impair (niveau 1)
# Usage : ./2_pairs.sh
# ============================================================

nombres=(4 7 10 13 22 35)

# Deux compteurs, créés AVANT la boucle
pairs=0
impairs=0

for n in "${nombres[@]}"; do
    # Pair = le reste de la division par 2 vaut 0.
    # == pour comparer : avec un seul =, bash répond
    # « attempted assignment to non-variable ».
    if (( n % 2 == 0 )); then
        echo "$n : pair"
        (( pairs++ ))
    else
        echo "$n : impair"
        (( impairs++ ))
    fi
done

echo "$pairs pairs, $impairs impairs"
