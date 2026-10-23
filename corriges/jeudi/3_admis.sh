#!/bin/bash
# ============================================================
# Exercice 3 du jeudi — Admis ou recalé
# Usage : ./3_admis.sh
# ============================================================

notes=(12 8 15 10 17 6 11)

# Le compteur est créé AVANT la boucle.
# Dans la boucle, il repartirait à 0 à chaque tour.
admis=0

for n in "${notes[@]}"; do
    # >= : « 10 ou plus ». Avec > tout court, 10 serait recalé.
    if (( n >= 10 )); then
        echo "$n : admis"
        (( admis++ ))
    else
        echo "$n : recalé"
    fi
done

echo "$admis admis sur ${#notes[@]}"
