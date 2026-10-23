#!/bin/bash
# ============================================================
# J5 — Tri par sélection (support du jeudi, niveau 2)
# Usage : ./J05_selection.sh 29 10 14 37 13 5
# Idée : on cherche le plus petit et on le met en 1re position,
#        puis le plus petit du reste en 2e position, etc.
# ============================================================

t=("$@")
n=${#t[@]}

for (( i = 0; i < n - 1; i++ )); do
    # Recherche de l'INDICE du minimum entre i et la fin
    imin=$i
    for (( j = i + 1; j < n; j++ )); do
        if (( t[j] < t[imin] )); then
            imin=$j
        fi
    done
    # On échange le minimum trouvé avec la case i
    if (( imin != i )); then
        tmp=${t[i]}; t[i]=${t[imin]}; t[imin]=$tmp
    fi
done

echo "${t[*]}"
