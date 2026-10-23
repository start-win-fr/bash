#!/bin/bash
# ============================================================
# L7 — Nombre premier (lundi, niveau 2)
# Usage : ./L07_premier.sh 97
# Un nombre premier n'a que deux diviseurs : 1 et lui-même.
# ============================================================

n=$1

# 0 et 1 ne sont pas premiers : on règle ce cas tout de suite
if (( n < 2 )); then
    echo "$n n'est pas premier"
    exit
fi

# On cherche un diviseur d entre 2 et la racine carrée de n.
# Pourquoi s'arrêter à la racine ? Si n = a x b avec a <= b,
# alors a x a <= n. Donc s'il existe un diviseur, il y en a un
# avant la racine. La condition d * d <= n évite de calculer
# une racine (bash ne sait pas faire).
# Pour 7919 : 87 tours au lieu de 7917.
for (( d = 2; d * d <= n; d++ )); do
    if (( n % d == 0 )); then
        echo "$n n'est pas premier (divisible par $d)"
        exit    # inutile de chercher plus loin
    fi
done

# Si on arrive ici, aucun diviseur n'a été trouvé
echo "$n est premier"
