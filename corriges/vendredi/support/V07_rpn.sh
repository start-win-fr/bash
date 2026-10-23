#!/bin/bash
# ============================================================
# V7 — Calculatrice polonaise inverse (support du vendredi, niveau 3)
# Usage : ./V07_rpn.sh '3 4 + 2 *'          → 14
# L'opérateur vient APRÈS ses deux nombres. Une pile suffit :
#   un nombre → on l'empile
#   un opérateur → on dépile deux nombres, on calcule, on empile
# ============================================================

# Sans set -f, le * serait remplacé par la liste des fichiers du
# dossier quand la boucle for découpe l'expression.
set -f

pile=()
for jeton in $1; do
    case $jeton in
        '+'|'-'|'*'|'/')
            if (( ${#pile[@]} < 2 )); then
                echo "Erreur : il manque un nombre avant « $jeton »"
                exit 1
            fi
            # L'ordre compte pour - et / :
            # le PREMIER dépilé est le SECOND nombre (b dans a - b)
            b=${pile[${#pile[@]}-1]}; unset "pile[${#pile[@]}-1]"
            a=${pile[${#pile[@]}-1]}; unset "pile[${#pile[@]}-1]"
            pile+=( $(( a $jeton b )) )
            ;;
        *)
            pile+=("$jeton")
            ;;
    esac
done

echo "$1 = ${pile[0]}"
