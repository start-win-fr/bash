#!/bin/bash

# Je récupère l'argument donné avec le script "./table.sh 10"
n=$1 #ici, $1 vaut 10

# Ensuite, on fait une boucle, allant de 1 à 10, afin d'afficher la table de multiplication
for (( i = 1; i <= 10; i++ )); do
    # On calcule le résultat a chaque itération de la boucle 
    resultat=$((n * i))

    # On affiche les résultats, les %d permettent de mettre des blancs qu'on remplacera par les variables ensuite
    # Donc nous avons 3 blancs qui seront remplacé par $n, $i, $resultat (dans l'ordre)
    # Le chiffre entre % et d signifie le nombre minimum de caractères à afficher
    # Donc si je met %2d, que j'affiche le chiffre 1, alors il ajoutera un espace avant pour avoir 2 caractères
    printf '%2d x %2d = %3d\n' "$n" "$i" "$resultat"

# On termine toujours une boucle par done
done

# ici, $i vaut 11, car au dernier tour de boucle, i++ a fait passer i de 10 a 11, ce qui le fait sortir de la condition
echo "Bonjour $i"