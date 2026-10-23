#!/bin/bash
# ============================================================
# M5 — PGCD d'Euclide (mardi, niveau 2)
# Usage : ./M05_pgcd.sh 84 36
# Algorithme : tant que b ne vaut pas 0,
#              (a, b) devient (b, a % b). Le résultat est a.
# Déroulé sur 84 et 36 : (84, 36) → (36, 12) → (12, 0) → 12
# ============================================================

pgcd() {
    local a=$1 b=$2 r
    while (( b != 0 )); do
        r=$(( a % b ))   # on garde le reste de côté...
        a=$b             # ...car on écrase a avec b
        b=$r             # puis b prend l'ancien reste
    done
    echo "$a"
}

echo "pgcd($1, $2) = $(pgcd "$1" "$2")"
