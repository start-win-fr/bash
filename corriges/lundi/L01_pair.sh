#!/bin/bash
# ============================================================
# L1 — Pair ou impair (lundi, niveau 1)
# Usage : ./L01_pair.sh 7
# Idée : un nombre est pair quand le reste de sa division
#        par 2 vaut 0. Le reste s'obtient avec % (modulo).
# ============================================================

# $1 = le premier argument donné au script (ici 7)
n=$1

# (( )) sert à comparer des nombres
# n % 2 vaut 0 pour un nombre pair, 1 pour un impair
# Attention : == pour comparer, un seul = provoque une erreur
if (( n % 2 == 0 )); then
    echo "$n est pair"
else
    echo "$n est impair"
fi
