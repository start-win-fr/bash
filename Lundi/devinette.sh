#!/bin/bash

secret=${1:-$(( RANDOM % 100 + 1 ))}
essais=0
max_essais=7

#for (( essais = 0; essais < max_essais; essais++ )); do

while (( essais < max_essais )); do
    #echo "Votre propostion : "
    #read prop
    read -p "Votre proposition : " prop
    (( essais++ ))

    if (( prop < secret )); then #si condition
        echo "C'est plus"
    elif (( prop > secret )); then # sinon si
        echo "C'est moins"
    else # sinon (dans tous les autres cas)
        echo "Trouvé en $essais essais !"
        exit
    fi
done
echo "Perdu, c'était $secret"