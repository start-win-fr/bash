#!/usr/bin/env bash

a=5
b=9

# Si on utilise [] pour comparer des nombres, alors on utilise -gt, -lt, -ge, -le, -eq, -ne
if [ $a -gt $b ]; then
echo "[] pense que A est supérieur à B"
fi

# Si on utilise > dans [], alors il va créer un fichier
if [ $a > $b ]; then
echo "un fichier 9 à été crée"
fi

if [[ -f $b ]]; then
echo "Un fichier 9 à été crée"
fi

# Si on utilise (()) alors on utilise les symboles >, <, ==, !=, >=, <=
if (( $a > $b )); then
echo "(()) pense que A est supérieur à B"
fi