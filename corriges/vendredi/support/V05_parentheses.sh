#!/bin/bash
# ============================================================
# V5 — Parenthèses équilibrées (support du vendredi, niveau 2)
# Usage : ./V05_parentheses.sh '(a[b]{c})' '(]' '((x)'
# Outil : une PILE. Le dernier symbole ouvert doit être
# le premier fermé.
# ============================================================

equilibre() {
    local s=$1 pile=() c haut
    for (( i = 0; i < ${#s}; i++ )); do
        c=${s:i:1}
        case $c in
            '('|'['|'{')
                # Une ouvrante : on l'empile
                pile+=("$c")
                ;;
            ')'|']'|'}')
                # Une fermante sans ouvrante en attente : raté
                if (( ${#pile[@]} == 0 )); then
                    return 1
                fi
                # On dépile le sommet (le dernier élément)
                haut=${pile[${#pile[@]}-1]}
                unset "pile[${#pile[@]}-1]"
                # Le couple ouvrante + fermante doit correspondre
                case $haut$c in
                    '()'|'[]'|'{}') ;;    # ça correspond, on continue
                    *) return 1 ;;        # ( fermée par ], etc.
                esac
                ;;
        esac
        # Les autres caractères (lettres...) sont ignorés
    done
    # À la fin, plus rien ne doit rester ouvert
    (( ${#pile[@]} == 0 ))
}

for expr in "$@"; do
    if equilibre "$expr"; then
        echo "$expr : OK"
    else
        echo "$expr : déséquilibré"
    fi
done
