#!/bin/bash

temperatures=(12 15 9 21 18 7 14)
jours=(lundi mardi mercredi jeudi vendredi samedi dimanche)

echo "Températures : ${temperatures[*]}"
echo "Nombre de jours : ${#temperatures[@]}"
# max=${temperatures[0]}

# for t in "${temperatures[@]}"; do
#     if (( t > max )); then
#         max=$t
#     fi
# done

# min=${temperatures[0]}

# for t in "${temperatures[@]}"; do
#     if (( t < min )); then
#         min=$t
#     fi
# done


imax=0
imin=0
# 0 => 12
# 1 => 15
# 2 => 9
# 3 => 21
# 4 => 18
# 5 => 7
# 6 => 17
# temperatures[i] permet d'aller chercher la valeur (la temperature) correspondant à l'emplacement i
# La boucle commence i = 0 et augmente de 1 à chaque tour de boucle

for i in "${!temperatures[@]}";do
    if (( temperatures[i] > temperatures[imax] )); then
        imax=$i
    elif (( temperatures[i] < temperatures[imin] )); then
        imin=$i
    fi
done

echo "Plus chaude : ${temperatures[imax]}"
echo "Plus froide : ${temperatures[imin]}"
echo "Écart : $(( ${temperatures[imax]} - ${temperatures[imin]} ))"

echo "Le jour le plus chaud est ${jours[imax]} avec ${temperatures[imax]} degrés"