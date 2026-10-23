#!/bin/bash
# ============================================================
# Exercice 8 du vendredi — Le tri à bulles (niveau 3)
# Usage : ./8_bulles.sh
# On compare chaque nombre avec son voisin de droite et on les
# échange s'ils sont dans le mauvais ordre. Après chaque passe,
# le plus grand restant « remonte » au bout, comme une bulle.
# ============================================================

nombres=(29 10 14 37 13 5)
n=${#nombres[@]}

echo "Avant : ${nombres[*]}"

# Boucle extérieure : on répète la passe n - 1 fois
for (( passe = 1; passe < n; passe++ )); do
    echange=0       # bonus : aucun échange pour l'instant

    # Une passe : j va jusqu'à l'AVANT-DERNIÈRE case (j < n - 1).
    # Avec j < n, nombres[j+1] n'existerait pas à la dernière case
    # et une case vide apparaîtrait dans le tableau.
    for (( j = 0; j < n - 1; j++ )); do
        if (( nombres[j] > nombres[j+1] )); then
            # Échange avec une variable temporaire,
            # comme pour échanger deux verres il en faut un troisième
            tmp=${nombres[j]}
            nombres[j]=${nombres[j+1]}
            nombres[j+1]=$tmp
            echange=1
        fi
    done
    echo "Passe $passe : ${nombres[*]}"

    # Bonus : une passe sans aucun échange = tableau déjà trié
    if (( echange == 0 )); then
        echo "Aucun échange : c'est trié, on s'arrête."
        break
    fi
done

echo "Trié : ${nombres[*]}"
