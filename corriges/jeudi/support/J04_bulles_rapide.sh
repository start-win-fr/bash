#!/bin/bash
# ============================================================
# J4 — Tri à bulles avec arrêt anticipé (niveau 2)
# Usage : ./J04_bulles_rapide.sh 1 2 3 4 5 6 7 8 9 10
# ============================================================

t=("$@")
n=${#t[@]}
comparaisons=0

for (( passe = 0; passe < n - 1; passe++ )); do
    echange=0       # aucun échange pour l'instant dans cette passe
    for (( j = 0; j < n - 1 - passe; j++ )); do
        (( comparaisons++ ))
        if (( t[j] > t[j+1] )); then
            tmp=${t[j]}; t[j]=${t[j+1]}; t[j+1]=$tmp
            echange=1
        fi
    done
    # Une passe complète sans aucun échange : tout est en ordre
    if (( echange == 0 )); then
        break
    fi
done

echo "${t[*]} ($comparaisons comparaisons)"

# Tableau déjà trié : une seule passe, n - 1 comparaisons.
# Tableau à l'envers : aucun gain, n(n-1)/2 comparaisons.
