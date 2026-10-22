#!/bin/bash
# ============================================================
# ÉTAPE 4 — Ajouter un compteur d'erreurs (7 essais max)
# Objectif : compteur, (( )), conditions de défaite
# ============================================================

# Mot secret
mot="boucle"

# Compteur d'erreurs : commence à 0, max autorisé = 7
erreurs=0

# Lettres déjà proposées par le joueur
trouvees=""

# Boucle tant que le joueur a moins de 7 erreurs
# (( erreurs < 7 )) : comparaison arithmétique (nombres)
while (( erreurs < 7 )); do

    # Reconstruction de l'affichage à chaque tour
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

    # Affiche le mot + le score d'erreurs
    echo "Mot : $affichage (erreurs : $erreurs/7)"

    # Victoire : plus aucun "_" dans l'affichage
    if [[ $affichage != *_* ]]; then
        echo "Gagné !"
        exit   # Quitte le script immédiatement (code de sortie 0)
    fi

    # Demande une lettre au joueur
    read -p "Une lettre : " choix

    # Mémorise la proposition
    trouvees+=$choix

    # La lettre est-elle dans le mot secret ?
    if [[ $mot == *"$choix"* ]]; then
        echo "Bien vu !"
    else
        echo "Raté !"
        # (( erreurs++ )) : incrémente le compteur de 1
        # Équivalent à : erreurs=$((erreurs + 1))
        (( erreurs++ ))
    fi

done

# Si on sort du while sans avoir gagné → 7 erreurs atteintes
echo "Perdu ! Le mot était : $mot"
