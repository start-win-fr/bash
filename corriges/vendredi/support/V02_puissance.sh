#!/bin/bash
# ============================================================
# V2 — Puissance, simple et rapide (support du vendredi, niveau 1)
# Usage : ./V02_puissance.sh 3 13
# ============================================================

# Version simple : a^0 = 1 et a^n = a x a^(n-1)
# Pour 3^13 : 14 appels (n = 13, 12, ..., 0)
puissance() {
    local a=$1 n=$2
    if (( n == 0 )); then
        echo 1
        return
    fi
    echo $(( a * $(puissance "$a" $(( n - 1 ))) ))
}

# Version rapide : si n est pair, a^n = (a^(n/2))².
# On divise n par 2 à chaque appel.
# Pour 3^13 : 5 appels seulement (n = 13, 6, 3, 1, 0)
puissance_rapide() {
    local a=$1 n=$2 m
    if (( n == 0 )); then
        echo 1
        return
    fi
    m=$(puissance_rapide "$a" $(( n / 2 )))
    if (( n % 2 == 0 )); then
        echo $(( m * m ))
    else
        echo $(( m * m * a ))      # n impair : il reste un a en trop
    fi
}

echo "simple : $1^$2 = $(puissance "$1" "$2")"
echo "rapide : $1^$2 = $(puissance_rapide "$1" "$2")"
