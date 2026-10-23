#!/bin/bash
# ============================================================
# Exercice 1 du jeudi — La météo de la semaine
# Usage : ./1_meteo.sh
# Trouver la température la plus haute, la plus basse, l'écart,
# et (bonus) le jour le plus chaud.
# ============================================================

temperatures=(12 15 9 21 18 7 14)
jours=(lundi mardi mercredi jeudi vendredi samedi dimanche)

echo "Températures : ${temperatures[*]}"
echo "Nombre de jours : ${#temperatures[@]}"

# --- La plus chaude ---------------------------------------
# On ne connaît pas encore le max : on suppose que c'est la 1re valeur
max=${temperatures[0]}
for t in "${temperatures[@]}"; do
    # Le if doit être DANS la boucle (entre do et done).
    # Placé après la boucle, il ne verrait que la dernière
    # valeur (14), et max vaudrait 14.
    if (( t > max )); then
        max=$t
    fi
done

# --- La plus froide : même chose, seul le signe change ----
min=${temperatures[0]}
for t in "${temperatures[@]}"; do
    if (( t < min )); then
        min=$t
    fi
done

echo "Plus chaude : $max"
echo "Plus froide : $min"
echo "Écart : $(( max - min ))"

# --- Bonus : quel jour ? ----------------------------------
# On garde l'INDICE de la plus haute température, pas sa valeur.
# Avec l'indice, on peut lire les deux tableaux à la même place.
imax=0
# ${!temperatures[@]} donne les indices : 0, 1, 2 ... 6
for i in "${!temperatures[@]}"; do
    if (( temperatures[i] > temperatures[imax] )); then
        imax=$i
    fi
done
echo "La plus chaude : ${temperatures[imax]} degrés, ${jours[imax]}"
