#!/bin/bash
# ============================================================
# V6 — Le crible d'Ératosthène (support du vendredi, niveau 2)
# Usage : ./V06_crible.sh 100
# On raye les multiples de chaque nombre premier.
# Ce qui n'est jamais rayé est premier.
# ============================================================

max=${1:-100}

# Au départ, tout le monde est candidat (1 = premier, 0 = rayé)
est_premier=()
for (( i = 2; i <= max; i++ )); do
    est_premier[i]=1
done

for (( i = 2; i * i <= max; i++ )); do
    if (( est_premier[i] )); then
        # On raye les multiples de i à partir de i x i : les plus
        # petits ont déjà été rayés par un facteur plus petit
        # (2 x 3 a été rayé quand on traitait 2).
        for (( k = i * i; k <= max; k += i )); do
            est_premier[k]=0
        done
    fi
done

premiers=()
for (( i = 2; i <= max; i++ )); do
    if (( est_premier[i] )); then
        premiers+=("$i")
    fi
done

echo "${premiers[*]}"
echo "${#premiers[@]} nombres premiers jusqu'à $max"
