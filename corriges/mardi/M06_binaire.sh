#!/bin/bash
# ============================================================
# M6 — Décimal vers binaire (mardi, niveau 2)
# Usage : ./M06_binaire.sh 13       → 1101
# Méthode : on divise par 2 tant que c'est possible et on note
#           les restes. Lus à l'envers, ils donnent le binaire.
#   13 → reste 1, 6 → reste 0, 3 → reste 1, 1 → reste 1  : 1101
# Vérification : echo $(( 2#1101 )) affiche 13
# ============================================================

n=$1
bin=""
while (( n > 0 )); do
    # On colle le reste DEVANT la chaîne : ça évite d'avoir
    # à l'inverser à la fin
    bin="$(( n % 2 ))$bin"
    (( n /= 2 ))         # même chose que n=$(( n / 2 ))
done

# ${bin:-0} : si bin est vide (cas de 0), on affiche 0
echo "$1 en binaire : ${bin:-0}"
