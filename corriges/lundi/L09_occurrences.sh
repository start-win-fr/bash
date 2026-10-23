#!/bin/bash
# ============================================================
# L9 — Compter les occurrences (lundi, niveau 1)
# Usage : ./L09_occurrences.sh 3 1 3 5 3 7 3
#         (le 1er argument est la valeur cherchée,
#          les suivants forment la liste)
# ============================================================

cible=$1

# shift retire le premier argument : il ne reste que la liste
shift

# "$@" = tous les arguments restants. On les range dans un tableau.
liste=("$@")

compte=0
for v in "${liste[@]}"; do
    if (( v == cible )); then
        (( compte++ ))
    fi
done

# ${#liste[@]} = nombre d'éléments du tableau
echo "$cible apparaît $compte fois sur ${#liste[@]} valeurs"
