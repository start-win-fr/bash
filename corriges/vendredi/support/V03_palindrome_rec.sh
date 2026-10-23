#!/bin/bash
# ============================================================
# V3 — Palindrome récursif (support du vendredi, niveau 2)
# Usage : ./V03_palindrome_rec.sh kayak radar bash
# Un mot est un palindrome si sa 1re et sa dernière lettre sont
# identiques ET si ce qu'il y a entre les deux est un palindrome.
# ============================================================

est_palindrome() {
    local s=$1
    # Cas de base : 0 ou 1 lettre, c'est forcément un palindrome
    if (( ${#s} <= 1 )); then
        return 0
    fi
    # ${s: -1} = la dernière lettre (l'espace avant le - est obligatoire)
    if [[ ${s:0:1} != "${s: -1}" ]]; then
        return 1
    fi
    # On rappelle la fonction sur le milieu du mot :
    # à partir de l'indice 1, longueur - 2 lettres.
    #   kayak → aya → y → vrai
    est_palindrome "${s:1:${#s}-2}"
}

for mot in "$@"; do
    if est_palindrome "$mot"; then
        echo "$mot : oui"
    else
        echo "$mot : non"
    fi
done
