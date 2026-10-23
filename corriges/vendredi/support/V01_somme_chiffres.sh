#!/bin/bash
# ============================================================
# V1 — Somme des chiffres, en récursif (support du vendredi, niveau 1)
# Usage : ./V01_somme_chiffres.sh 4096     → 19 (4 + 0 + 9 + 6)
# ============================================================

# Une fonction récursive s'appelle elle-même sur un problème plus petit.
# Il lui faut toujours un CAS DE BASE, sinon elle ne s'arrête jamais.
somme_chiffres() {
    local n=$1
    # Cas de base : un seul chiffre, sa somme est lui-même
    if (( n < 10 )); then
        echo "$n"
        return
    fi
    # Sinon : le dernier chiffre (n % 10)
    #       + la somme des chiffres du reste (n / 10)
    #   4096 → 6 + somme_chiffres 409 → 6 + 9 + somme_chiffres 40 ...
    echo $(( n % 10 + $(somme_chiffres $(( n / 10 ))) ))
}

echo "$1 -> $(somme_chiffres "$1")"
