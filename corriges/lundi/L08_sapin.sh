#!/bin/bash
# ============================================================
# L8 bonus — Le sapin centré (lundi)
# Usage : ./L08_sapin.sh 4
# Ligne i : (h - i) espaces, puis (2i - 1) étoiles
#   i=1 : 3 espaces, 1 étoile
#   i=4 : 0 espace,  7 étoiles
# ============================================================

h=$1

for (( i = 1; i <= h; i++ )); do
    # printf '%*s' N '' affiche N espaces
    printf '%*s' $(( h - i )) ''
    for (( j = 1; j <= 2 * i - 1; j++ )); do
        printf '*'
    done
    echo
done
