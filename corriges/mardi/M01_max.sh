#!/bin/bash
# ============================================================
# M1 — max2 et max3 (mardi, niveau 1)
# Usage : ./M01_max.sh
# Contrainte : max3 doit utiliser max2, sans aucun if
# ============================================================

# max2 AFFICHE le plus grand des deux nombres reçus
max2() {
    if (( $1 > $2 )); then
        echo "$1"
    else
        echo "$2"
    fi
}

# Le plus grand de trois = le plus grand entre
# (le plus grand des deux premiers) et le troisième.
# $(max2 "$1" "$2") récupère ce que max2 affiche, et on le
# donne directement comme premier argument au second appel.
max3() {
    max2 "$(max2 "$1" "$2")" "$3"
}

echo "max2 4 9     -> $(max2 4 9)"
echo "max3 4 9 2   -> $(max3 4 9 2)"
echo "max3 12 9 2  -> $(max3 12 9 2)"
