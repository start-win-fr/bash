#!/bin/bash
# ============================================================
# Exercice 4 du vendredi — Le mot le plus long (niveau 2)
# Usage : ./4_plus_long.sh
# Même méthode que la température la plus chaude, mais on
# compare des LONGUEURS : ${#mot} = nombre de lettres.
# ============================================================

mots=(chat elephant souris ane hippopotame girafe)

plus_long=${mots[0]}        # on suppose que le premier est le plus long
for mot in "${mots[@]}"; do
    # Le if doit être DANS la boucle. Placé après, il ne verrait
    # que le dernier mot, et le résultat serait girafe.
    if (( ${#mot} > ${#plus_long} )); then
        plus_long=$mot
    fi
done
echo "Le mot le plus long est $plus_long (${#plus_long} lettres)"

# Le plus court : même chose avec <
plus_court=${mots[0]}
for mot in "${mots[@]}"; do
    if (( ${#mot} < ${#plus_court} )); then
        plus_court=$mot
    fi
done
echo "Le mot le plus court est $plus_court (${#plus_court} lettres)"
