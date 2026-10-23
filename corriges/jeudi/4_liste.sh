#!/bin/bash
# ============================================================
# Exercice 4 du jeudi — Chercher un prénom
# Usage : ./4_liste.sh chloe
# C'est une recherche linéaire : on regarde les cases une par une.
# ============================================================

prenoms=(alice bob chloe david emma)
cible=$1

trouve=0          # 0 = pas encore trouvé, 1 = trouvé
comparaisons=0    # combien de prénoms on a dû regarder

# On parcourt par INDICES pour pouvoir dire OÙ est le prénom
for i in "${!prenoms[@]}"; do
    (( comparaisons++ ))
    # Du texte se compare avec [[ ]].
    # (( )) est fait pour les nombres : avec lui, n'importe quel
    # prénom, même zoe, serait « trouvé » à l'indice 0.
    if [[ ${prenoms[i]} == "$cible" ]]; then
        trouve=1
        position=$i
        break      # trouvé : inutile de regarder la suite
    fi
done

if (( trouve == 1 )); then
    echo "$cible est dans la liste, à l'indice $position"
else
    echo "$cible n'est pas dans la liste"
fi
echo "Comparaisons : $comparaisons"

# Alice : 1 comparaison (en tête de liste).
# zoe : 5 comparaisons, il faut tout lire avant de pouvoir dire non.
# Sur une liste TRIÉE, la recherche dichotomique fait beaucoup mieux.
