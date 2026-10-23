#!/bin/bash
# ============================================================
# J1 — Mesurer (support du jeudi, niveau 1)
# Usage : ./J01_mesurer.sh
# Lance jeudi_gauss (la boucle ET la formule) pour 3 tailles
# et affiche le temps de chacune.
# ============================================================

somme_boucle() {
    local n=$1 somme=0
    for (( i = 1; i <= n; i++ )); do
        (( somme += i ))
    done
    echo "$somme"
}

for n in 10000 100000 1000000; do
    echo "== n = $n"
    # time mesure la durée de la commande qui suit.
    # Le temps qui nous intéresse est la ligne « real ».
    time somme_boucle "$n" > /dev/null
    time echo $(( n * (n + 1) / 2 )) > /dev/null
done

# Ce qu'on observe : quand n est multiplié par 10, le temps de la
# boucle est lui aussi multiplié par 10 environ (complexité O(n),
# linéaire). La formule reste instantanée quel que soit n (O(1)).
