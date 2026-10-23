#!/bin/bash
# ============================================================
# M7 — Supprimer les doublons (mardi, niveau 3)
# Usage : ./M07_doublons.sh 4 2 4 7 2 9 4      → 4 2 7 9
# On garde l'ordre de première apparition.
# ============================================================

resultat=()
for v in "$@"; do
    # Est-ce que v est déjà dans le résultat ?
    deja=0
    for r in "${resultat[@]}"; do
        if [[ $r == "$v" ]]; then
            deja=1
            break        # trouvé : inutile de regarder la suite
        fi
    done
    # Pas encore vu : on l'ajoute
    if (( deja == 0 )); then
        resultat+=("$v")
    fi
done

echo "${resultat[*]}"

# Remarque : deux boucles imbriquées. Pour 1000 valeurs, on peut
# faire jusqu'à 1000 x 1000 comparaisons.
