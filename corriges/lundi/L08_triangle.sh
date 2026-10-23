#!/bin/bash
# ============================================================
# L8 — Triangle d'étoiles (lundi, niveau 2)
# Usage : ./L08_triangle.sh 4
# ============================================================

h=$1

# Boucle extérieure : une ligne par tour (i = numéro de ligne)
for (( i = 1; i <= h; i++ )); do
    ligne=""
    # Boucle intérieure : la ligne i contient i étoiles
    for (( j = 1; j <= i; j++ )); do
        ligne+="*"      # += ajoute à la fin de la chaîne
    done
    echo "$ligne"
done
