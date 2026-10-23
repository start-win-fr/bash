#!/bin/bash
# ============================================================
# L6 — FizzBuzz (lundi, niveau 2)
# Usage : ./L06_fizzbuzz.sh 15     (100 par défaut)
# ============================================================

# ${1:-100} : la valeur de $1 si elle existe, sinon 100
max=${1:-100}

for (( i = 1; i <= max; i++ )); do
    # L'ordre des tests compte : on teste 15 (3 ET 5) EN PREMIER.
    # Si on testait 3 d'abord, 15 afficherait Fizz et on ne
    # passerait jamais par la branche FizzBuzz.
    if (( i % 15 == 0 )); then
        echo -n "FizzBuzz "
    elif (( i % 3 == 0 )); then
        echo -n "Fizz "
    elif (( i % 5 == 0 )); then
        echo -n "Buzz "
    else
        echo -n "$i "
    fi
done
# echo -n n'ajoute pas de retour à la ligne : on en met un à la fin
echo
