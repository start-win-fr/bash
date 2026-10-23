#!/bin/bash
# ============================================================
# J7 — L'ordinateur joue au juste prix (niveau 2)
# Usage : ./J07_devine_ordi.sh 73
# Stratégie : la recherche dichotomique. On propose toujours le
# milieu de l'intervalle encore possible.
# ============================================================

secret=${1:-$(( RANDOM % 100 + 1 ))}
bas=1
haut=100
essais=0

while true; do
    prop=$(( (bas + haut) / 2 ))     # le milieu
    (( essais++ ))
    echo "Essai $essais : $prop"
    if (( prop < secret )); then
        bas=$(( prop + 1 ))     # le secret est au-dessus : on garde la moitié haute
    elif (( prop > secret )); then
        haut=$(( prop - 1 ))    # au-dessous : on garde la moitié basse
    else
        echo "Trouvé $secret en $essais essais"
        break
    fi
done

# Bonus : le pire cas sur tous les nombres de 1 à 100 est 7 essais,
# car 2^7 = 128 >= 100. À chaque essai, la moitié des possibilités
# disparaît.
