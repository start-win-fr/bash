#!/bin/bash
# ============================================================
# M4 — Palindrome sans fabriquer l'inverse (mardi, niveau 2)
# Usage : ./M04_palindrome_indices.sh kayak bash 'Esope reste ici et se repose'
# Idée : deux indices. i part du début, j part de la fin,
#        ils avancent l'un vers l'autre.
# ============================================================

# La fonction ne fait aucun echo : elle répond par son code
# de retour (0 = vrai, 1 = faux), pour s'utiliser dans un if.
est_palindrome() {
    local s=$1
    # Deux variables dans la même boucle, séparées par des virgules
    for (( i = 0, j = ${#s} - 1; i < j; i++, j-- )); do
        # Dès que deux lettres en miroir diffèrent : ce n'est pas un palindrome
        if [[ ${s:i:1} != "${s:j:1}" ]]; then
            return 1
        fi
    done
    # Toutes les paires sont identiques
    return 0
}

# Bonus : minuscules et sans espaces
#   tr 'A-Z' 'a-z' passe en minuscules, tr -d ' ' supprime les espaces
nettoyer() {
    echo "$1" | tr 'A-Z' 'a-z' | tr -d ' '
}

for mot in "$@"; do
    if est_palindrome "$(nettoyer "$mot")"; then
        echo "« $mot » est un palindrome"
    else
        echo "« $mot » n'est pas un palindrome"
    fi
done
