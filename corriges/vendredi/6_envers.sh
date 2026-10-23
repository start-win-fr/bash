#!/bin/bash
# ============================================================
# Exercice 6 du vendredi — Le tableau à l'envers (niveau 2)
# Usage : ./6_envers.sh
# ============================================================

jours=(lundi mardi mercredi jeudi vendredi)

echo "Dans l'ordre : ${jours[*]}"

# Étape 1 : afficher à l'envers.
# On parcourt les INDICES du dernier (taille - 1) au premier (0),
# exactement comme la fonction inverser parcourait les lettres.
echo -n "À l'envers :"
for (( i = ${#jours[@]} - 1; i >= 0; i-- )); do
    echo -n " ${jours[i]}"      # -n : pas de retour à la ligne
done
echo                             # le retour à la ligne final

# Étape 2 : construire un NOUVEAU tableau inversé
inverse=()                       # tableau vide
for (( i = ${#jours[@]} - 1; i >= 0; i-- )); do
    inverse+=("${jours[i]}")     # += ( ) ajoute un élément à la fin
done
echo "Tableau inversé : ${inverse[*]}"
echo "Premier élément du tableau inversé : ${inverse[0]}"
