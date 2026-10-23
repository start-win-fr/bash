#!/bin/bash
# ============================================================
# L3 — Table de multiplication (lundi, niveau 1)
# Usage : ./L03_table.sh 7
# ============================================================

n=$1

# Boucle de 1 à 10 : (( départ ; condition pour continuer ; pas ))
for (( i = 1; i <= 10; i++ )); do
    # printf remplace chaque %d par un nombre, dans l'ordre :
    #   1er %2d → n, 2e %2d → i, %3d → le résultat
    # Le chiffre (2 ou 3) est la largeur minimale : printf complète
    # avec des espaces, ce qui aligne les colonnes.
    printf '%2d x %2d = %3d\n' "$n" "$i" $(( n * i ))
done
