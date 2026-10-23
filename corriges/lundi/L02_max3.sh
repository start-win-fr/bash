#!/bin/bash
# ============================================================
# L2 — Le plus grand des trois (lundi, niveau 1)
# Usage : ./L02_max3.sh 4 19 7
# Idée : on suppose que le premier est le plus grand,
#        puis on le remplace dès qu'on trouve mieux.
# ============================================================

# On range les trois arguments dans des variables
a=$1
b=$2
c=$3

# On part du principe que a est le plus grand.
# Piège classique : écrire max=0. Avec trois nombres négatifs
# (-3 -8 -1), le résultat serait alors 0, qui n'est même pas dans la liste.
max=$a

# Si b est plus grand que ce qu'on a gardé, b devient le max
if (( b > max )); then
    max=$b
fi

# Même chose pour c
if (( c > max )); then
    max=$c
fi

echo "Le plus grand est $max"
