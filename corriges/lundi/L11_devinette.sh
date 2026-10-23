#!/bin/bash
# ============================================================
# L11 — Le juste prix (lundi, niveau 3)
# Usage : ./L11_devinette.sh        (nombre tiré au hasard)
#         ./L11_devinette.sh 42     (nombre imposé, pour tester)
# ============================================================

# RANDOM donne un nombre au hasard entre 0 et 32767.
# % 100 le ramène entre 0 et 99, + 1 entre 1 et 100.
secret=${1:-$(( RANDOM % 100 + 1 ))}
essais=0
max_essais=7

while (( essais < max_essais )); do
    read -p "Votre proposition : " prop
    (( essais++ ))

    if (( prop < secret )); then
        echo "C'est plus"
    elif (( prop > secret )); then
        echo "C'est moins"
    else
        echo "Trouvé en $essais essais !"
        exit    # exit et pas break : sinon on afficherait « Perdu »
    fi
done

echo "Perdu, c'était $secret"

# Pourquoi 7 essais suffisent toujours ? En proposant à chaque fois
# le milieu de l'intervalle restant (50, puis 25 ou 75...), on élimine
# la moitié des nombres à chaque essai. 2^7 = 128, plus que 100.
