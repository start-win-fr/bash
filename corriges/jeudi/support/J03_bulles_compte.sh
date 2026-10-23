#!/bin/bash
# ============================================================
# J3 — Compter les comparaisons du tri à bulles (niveau 2)
# Usage : ./J03_bulles_compte.sh 100
# ============================================================

taille=${1:-10}

# Un tableau de nombres au hasard entre 0 et 999
t=()
for (( i = 0; i < taille; i++ )); do
    t+=( $(( RANDOM % 1000 )) )
done

comparaisons=0
n=${#t[@]}
for (( passe = 0; passe < n - 1; passe++ )); do
    # À chaque passe, le plus grand restant arrive au bout :
    # inutile de revenir sur les cases déjà placées (- passe)
    for (( j = 0; j < n - 1 - passe; j++ )); do
        (( comparaisons++ ))
        if (( t[j] > t[j+1] )); then
            tmp=${t[j]}; t[j]=${t[j+1]}; t[j+1]=$tmp
        fi
    done
done

echo "$taille éléments : $comparaisons comparaisons"

# Le calcul : (n-1) + (n-2) + ... + 1 = n(n-1)/2
# 10 → 45, 100 → 4950, 200 → 19900.
# Doubler n multiplie le travail par 4 environ : c'est du O(n²).
# Le nombre ne dépend pas des valeurs, seulement de la taille.
