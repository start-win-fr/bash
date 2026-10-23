#!/bin/bash
# ============================================================
# Exercice 3 du jeudi, bonus — Les mentions
# Usage : ./3_mentions.sh
# ============================================================

notes=(12 8 15 10 17 6 11)

for n in "${notes[@]}"; do
    # On commence par la mention la plus haute.
    # Dans l'autre sens, 17 serait d'abord >= 10 et s'arrêterait
    # sur « Passable » : bash prend la PREMIÈRE condition vraie.
    if (( n >= 16 )); then
        mention="Très bien"
    elif (( n >= 12 )); then
        mention="Bien"
    elif (( n >= 10 )); then
        mention="Passable"
    else
        mention="Recalé"
    fi
    # %2d : la note sur 2 caractères, %s : un texte
    printf '%2d : %s\n' "$n" "$mention"
done
