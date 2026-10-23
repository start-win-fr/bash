#!/bin/bash
# ============================================================
# J2 — Est-ce trié ? (support du jeudi, niveau 1)
# Usage : ./J02_est_trie.sh 1 3 3 8
# ============================================================

# Répond par son code de retour : 0 = trié, 1 = pas trié
est_trie() {
    local t=("$@")
    # On compare chaque case avec sa voisine de droite.
    # On s'arrête à l'avant-dernière, sinon t[i+1] n'existe pas.
    for (( i = 0; i < ${#t[@]} - 1; i++ )); do
        if (( t[i] > t[i+1] )); then
            return 1    # deux voisins dans le désordre : on arrête
        fi
    done
    return 0
}

if est_trie "$@"; then
    echo "trié"
else
    echo "pas trié"
fi
