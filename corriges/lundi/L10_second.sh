#!/bin/bash
# ============================================================
# L10 — Le deuxième plus grand (lundi, niveau 3)
# Usage : ./L10_second.sh 14 3 27 8 27 1
# Contraintes : un seul parcours, pas de tri, valeur DISTINCTE
# ============================================================

# Deux variables vides au départ : rien n'a encore été vu
premier=""
second=""

for v in "$@"; do
    # [[ -z $premier ]] est vrai quand premier est vide (1er tour)
    if [[ -z $premier ]] || (( v > premier )); then
        # Nouveau record : l'ancien premier descend à la 2e place
        second=$premier
        premier=$v
    elif (( v != premier )) && { [[ -z $second ]] || (( v > second )); }; then
        # Pas un record, mais mieux que le second (et différent du
        # premier, pour ne pas compter deux fois le même 27)
        second=$v
    fi
done

if [[ -z $second ]]; then
    # Exemple : ./L10_second.sh 5 5 5
    echo "Pas de deuxième plus grand"
else
    echo "Deuxième plus grand : $second"
fi
