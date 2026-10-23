#!/bin/bash
# ============================================================
# Exercice « La moyenne des notes » (mardi)
# Usage : ./moyenne.sh
# Version de base, puis les trois bonus en bas du fichier.
# ============================================================

# --- Étape 1 : le tableau ---------------------------------
notes=(12 8 15 10 17)
# Bonus 1 : ajouter une note sans toucher au reste du script
# notes+=(14)

# --- Étape 2 : la somme -----------------------------------
somme=0                         # on part de 0 AVANT la boucle
for n in "${notes[@]}"; do      # n prend chaque note, une par une
    (( somme += n ))
done

# --- Étape 3 : le nombre de notes -------------------------
# On ne tape pas 5 à la main : si on ajoute une note,
# nb se met à jour tout seul.
nb=${#notes[@]}

# --- Étape 4 : la moyenne ---------------------------------
# Dans $(( )), pas besoin du $ devant les variables
moyenne=$(( somme / nb ))

echo "Notes : ${notes[*]}"
echo "Somme : $somme"
echo "Nombre de notes : $nb"
echo "Moyenne : $moyenne"
# 62 / 5 = 12,4 mais bash affiche 12 : il ne garde que la partie entière

# --- Bonus 2 : la moyenne avec deux décimales -------------
exacte=$(awk -v s="$somme" -v n="$nb" 'BEGIN { printf "%.2f", s / n }')
echo "Moyenne exacte : $exacte"

# --- Bonus 3 : la meilleure note --------------------------
# Même idée que mardi_max.sh : on part de la première note
# et on la remplace à chaque fois qu'on trouve plus grand.
max=${notes[0]}
for n in "${notes[@]}"; do
    if (( n > max )); then
        max=$n
    fi
done
echo "Meilleure note : $max"
