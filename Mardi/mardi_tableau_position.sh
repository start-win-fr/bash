#!/bin/bash

valeurs=(5 90 28 39 9910 2 39 0 8347 63 739 0 9328 7 8 9 0)

max=${valeurs[0]}
pos=0

# ${!valeurs[@]} permet de récupérer l'index de chaque element du tableau
# Donc 0 puis 1 puis 2 etc jusqu'a 16
for i in "${!valeurs[@]}";do
    if (( valeurs[i] > max)); then
        max=${valeurs[i]}
        pos=$i
    fi
done


echo "La valeur la plus haute est $max, trouvé à l'index $pos"