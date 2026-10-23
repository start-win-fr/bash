#!/bin/bash
# ============================================================
# M2 — Moyenne (mardi, niveau 1)
# Usage : ./M02_moyenne_args.sh 12 8 15 10 17 9
# Les notes arrivent en arguments du script.
# ============================================================

# "$@" = tous les arguments : on en fait un tableau
notes=("$@")

somme=0
for n in "${notes[@]}"; do
    (( somme += n ))
done

echo "Somme : $somme"

# Division entière : bash coupe la partie décimale (71 / 6 = 11)
echo "Moyenne entière : $(( somme / ${#notes[@]} ))"

# Pour les décimales, on passe par awk, qui sait calculer avec.
# -v s=... crée une variable s dans awk avec la valeur de somme.
# "%.2f" = un nombre avec 2 chiffres après la virgule.
moy=$(awk -v s="$somme" -v c="${#notes[@]}" 'BEGIN { printf "%.2f", s / c }')
echo "Moyenne exacte : $moy"
