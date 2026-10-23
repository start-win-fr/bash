#!/bin/bash
# ============================================================
# V4 — Combien de coups pour Hanoï ? (support du vendredi, niveau 2)
# Usage : ./V04_hanoi_compte.sh
# ============================================================

# Variable GLOBALE : pas de local, et pas d'appel avec $( ),
# sinon le compteur serait modifié dans une copie et perdu.
coups=0

hanoi() {
    local n=$1
    if (( n == 0 )); then
        return
    fi
    hanoi $(( n - 1 ))    # déplacer les n-1 disques du dessus
    (( coups++ ))         # déplacer le plus grand
    hanoi $(( n - 1 ))    # remettre les n-1 disques par-dessus
}

echo "disques  coups"
for n in {1..10}; do
    coups=0
    hanoi "$n"
    printf '%7d  %5d\n' "$n" "$coups"
done

# La formule : 2^n - 1.
# Pour 64 disques à un coup par seconde : 18 446 744 073 709 551 615
# secondes, environ 585 milliards d'années.
# echo $(( 2**64 )) affiche 0 : le calcul dépasse les 64 bits de bash.
