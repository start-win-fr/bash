#!/bin/bash
# ============================================================
# Exercice « Le palindrome » (mardi)
# Usage : ./palindrome.sh kayak bash Radar 'Esope reste ici et se repose'
# Les phrases avec des espaces doivent être entre apostrophes.
# ============================================================

# nettoyer : met en minuscules et retire les espaces
#   "Esope reste ici" → "esoperesteici"
nettoyer() {
    echo "$1" | tr 'A-Z' 'a-z' | tr -d ' '
}

# inverser : renvoie le mot à l'envers en partant de la dernière lettre
#   "bash" → "hsab"
inverser() {
    local string=$1
    local reverse=""

    for (( i = ${#string} - 1; i >= 0 ;i-- )); do
        reverse+=${string:i:1}
    done

    echo "$reverse"
}

# est_palindrome : VRAI si le mot est égal à son inverse
#   kayak => kayak : vrai     bash => hsab : faux
# Elle n'affiche rien : elle répond avec son code de retour,
# comme est_pair dans mardi_fonctions.sh. C'est ce qui permet
# d'écrire « if est_palindrome "kayak"; then ».
est_palindrome() {
    local mot=$1
    # $( ) récupère ce que la fonction inverser affiche
    local inverse=$(inverser "$mot")
    # Une fonction renvoie le code de sa dernière commande :
    # le [[ ]] répond 0 (vrai) ou 1 (faux), et la fonction aussi.
    [[ $mot == "$inverse" ]]
    # Version longue équivalente :
    # if [[ $mot == "$inverse" ]]; then
    #     return 0
    # else
    #     return 1
    # fi
}

# Programme principal : on teste chaque argument du script.
# Les guillemets autour de "$@" gardent les phrases entières.
nb_palindromes=0
for phrase in "$@"; do
    propre=$(nettoyer "$phrase")        # on teste la version nettoyée...
    if est_palindrome "$propre"; then
        echo "« $phrase » est un palindrome"   # ...mais on affiche l'originale
        (( nb_palindromes++ ))
    else
        echo "« $phrase » n'est pas un palindrome"
    fi
done

# Bonus 1 : le compteur
echo "$nb_palindromes palindromes sur $#"
