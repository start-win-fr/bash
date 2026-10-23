#!/bin/bash
# ============================================================
# V8 — Le tri fusion (support du vendredi, niveau 3)
# Usage : ./V08_tri_fusion.sh 38 27 43 3 9 82 10
# Diviser pour régner :
#   1. couper la liste en deux moitiés
#   2. trier chaque moitié (en rappelant tri_fusion)
#   3. fusionner les deux moitiés triées (la fonction de J8)
# Complexité O(n log n), bien mieux que les tris en O(n²).
# ============================================================

# fusion : deux listes triées → une liste triée (voir J08_fusion.sh)
fusion() {
    local a=($1) b=($2) res=() i=0 j=0
    while (( i < ${#a[@]} && j < ${#b[@]} )); do
        if (( a[i] <= b[j] )); then
            res+=("${a[i]}"); (( i++ ))
        else
            res+=("${b[j]}"); (( j++ ))
        fi
    done
    res+=("${a[@]:i}" "${b[@]:j}")
    echo "${res[*]}"
}

tri_fusion() {
    # Cas de base : 0 ou 1 élément, c'est déjà trié
    if (( $# <= 1 )); then
        echo "$@"
        return
    fi
    local milieu=$(( $# / 2 )) gauche droite
    # "${@:1:milieu}" = les « milieu » premiers arguments
    # "${@:milieu+1}" = tous les suivants
    gauche=$(tri_fusion "${@:1:milieu}")
    droite=$(tri_fusion "${@:milieu+1}")
    fusion "$gauche" "$droite"
}

tri_fusion "$@"
