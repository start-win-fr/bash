#!/bin/bash
# ============================================================
# Exercice 1 du vendredi — Le compte à rebours (niveau 1)
# Usage : ./1_rebours.sh 5
# ============================================================

# ${1:-10} : l'argument s'il existe, sinon 10
depart=${1:-10}

# Boucle à l'envers : on part de depart, on continue tant que
# i >= 1, et i-- retire 1 à chaque tour.
# Attention : for i in {$depart..1} ne marche pas, les accolades
# n'acceptent pas de variable (bash afficherait « {5..1} »).
for (( i = depart; i >= 1; i-- )); do
    echo "$i"
    # Bonus : décommentez la ligne suivante pour attendre 1 seconde
    # sleep 1
done
echo "Décollage !"
