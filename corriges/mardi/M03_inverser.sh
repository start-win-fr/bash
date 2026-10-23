#!/bin/bash
# ============================================================
# M3 — Inverser une chaîne (mardi, niveau 2)
# Usage : ./M03_inverser.sh bonjour
# Interdit : la commande rev
# ============================================================

inverser() {
    local s=$1
    local r=""
    # On part de la DERNIÈRE lettre (indice longueur - 1)
    # et on recule jusqu'à la première (indice 0).
    #   bonjour : b=0 o=1 n=2 j=3 o=4 u=5 r=6 → on part de 6
    for (( i = ${#s} - 1; i >= 0; i-- )); do
        r+=${s:i:1}     # ${s:i:1} = 1 lettre à partir de l'indice i
    done
    echo "$r"
}

inverser "$1"
