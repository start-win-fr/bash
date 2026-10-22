#!/bin/bash
# ============================================================
# ÉTAPE 5 — Mot aléatoire parmi une liste (version finale)
# Objectif : tableaux, RANDOM, jeu complet du pendu
# ============================================================

# Tableau (array) de mots possibles
# Syntaxe : nom=(élément1 élément2 élément3 ...)
# Accès : ${mots[0]} → "algorithme", ${mots[1]} → "boucle", etc.
# ${#mots[@]} → nombre d'éléments dans le tableau (ici 6)
mots=(algorithme boucle variable fonction tableau terminal)

# RANDOM : variable spéciale Bash qui donne un entier aléatoire (0 à 32767)
# % ${#mots[@]} : modulo → reste de la division → nombre entre 0 et 5
# Exemple : si RANDOM=42 et 6 mots → 42 % 6 = 0 → premier mot
indice=$(( RANDOM % ${#mots[@]} ))

# On récupère le mot secret à l'indice tiré au hasard
mot=${mots[indice]}

# Compteur d'erreurs (max 7)
erreurs=0

# Lettres déjà proposées
trouvees=""

# Boucle de jeu : continue tant qu'il reste des essais
while (( erreurs < 7 )); do

    # Reconstruction de l'affichage
    affichage=""

    for (( i = 0; i < ${#mot}; i++ )); do
        lettre=${mot:i:1}

        if [[ $trouvees == *"$lettre"* ]]; then
            # Concaténation : ajoute la lettre trouvée
            # Exemple : string="bonjour" ; string+=" Robin" → "bonjour Robin"
            affichage+="$lettre "
        else
            affichage+="_ "
        fi
    done

    echo "Mot : $affichage (erreurs : $erreurs/7)"

    # Victoire si plus aucun underscore
    if [[ $affichage != *_* ]]; then
        echo "Gagné !"
        exit
    fi

    # Saisie d'une lettre
    read -p "Une lettre : " choix
    trouvees+=$choix

    # Bonne ou mauvaise lettre ?
    if [[ $mot == *"$choix"* ]]; then
        echo "Bien vu !"
    else
        echo "Raté !"
        (( erreurs++ ))   # +1 erreur
    fi

done

# Défaite : 7 erreurs sans avoir trouvé le mot
echo "Perdu ! Le mot était : $mot"
