#!/bin/bash
# ============================================================
# Exercice 4 du jeudi, bonus — La fonction est_present
# Usage : ./4_presents.sh bob zoe emma
# ============================================================

prenoms=(alice bob chloe david emma)

# Répond par son code de retour, comme est_palindrome :
# 0 = présent (vrai), 1 = absent (faux)
est_present() {
    local cible=$1
    for p in "${prenoms[@]}"; do
        if [[ $p == "$cible" ]]; then
            return 0    # trouvé : on sort tout de suite
        fi
    done
    return 1            # boucle finie sans rien trouver
}

for nom in "$@"; do
    if est_present "$nom"; then
        echo "$nom : présent"
    else
        echo "$nom : absent"
    fi
done
