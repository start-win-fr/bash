#!/bin/bash
# ============================================================
# ÉTAPE 1 — Afficher chaque lettre d'un mot
# Objectif : découvrir les chaînes de caractères et la boucle for
# ============================================================

# On stocke le mot secret dans une variable
# En Bash, pas d'espace autour du =
mot="boucle"

# ${#mot} = longueur de la chaîne (nombre de caractères)
# Ici : "boucle" → 6 lettres
echo "Le mot fait ${#mot} lettres"

# Boucle "arithmétiques" : for (( initialisation ; condition ; incrément ))
# i commence à 0, continue tant que i < longueur du mot, puis i augmente de 1
# Les indices commencent à 0 en programmation :
#   i=0 → 'b', i=1 → 'o', i=2 → 'u', etc.
for (( i = 0; i < ${#mot}; i++ )); do

    # ${mot:i:1} = extraction de sous-chaîne
    # Syntaxe : ${variable:position:longueur}
    #   - position : index de départ (ici i)
    #   - longueur : nombre de caractères à prendre (ici 1 = une seule lettre)
    echo "Lettre $i : ${mot:i:1}"

done
# Fin de la boucle : on a affiché toutes les lettres une par une
