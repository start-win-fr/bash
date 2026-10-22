#!/bin/bash
# ============================================================
# ÉTAPE 3 — Boucle de jeu interactive (sans compteur d'erreurs)
# Objectif : while, saisie utilisateur (read), break
# ============================================================

# Mot secret à trouver
mot="boucle"

# Au départ, aucune lettre n'a été proposée
trouvees=""

# Boucle infinie : while true
# On sortira manuellement avec "break" quand le joueur a gagné
while true; do

    # À chaque tour, on reconstruit l'affichage depuis zéro
    affichage=""

    # Parcourt chaque lettre du mot secret
    for (( i = 0; i < ${#mot}; i++ )); do
        lettre=${mot:i:1}

        # Si cette lettre a déjà été proposée → on l'affiche
        if [[ $trouvees == *"$lettre"* ]]; then
            # Concaténation : ajoute la lettre à la fin de $affichage
            # Exemple : string="bonjour" ; string+=" Robin" → "bonjour Robin"
            affichage+="$lettre "
        else
            # Sinon → on masque avec un underscore
            affichage+="_ "
        fi
    done

    # Montre l'état actuel du mot (ex. : "b o _ _ _ _ ")
    echo "Mot : $affichage"

    # Condition de victoire :
    # [[ $affichage != *_* ]]  →  vrai s'il n'y a PLUS aucun "_"
    # Autrement dit : toutes les lettres ont été trouvées
    if [[ $affichage != *_* ]]; then
        echo "Gagné !"
        break   # Sort de la boucle while → fin du jeu
    fi

    # read -p "message" variable
    # Affiche le message, attend que l'utilisateur tape quelque chose,
    # puis stocke la saisie dans $choix
    read -p "Une lettre : " choix

    # On ajoute la lettre proposée à la liste des lettres trouvées
    # Même si elle est fausse : elle sera simplement ignorée à l'affichage
    trouvees+=$choix

done
# Fin du while : on arrive ici après le "break" (victoire)
