#!/bin/bash
# ============================================================
# ÉTAPE 2 — Afficher le mot avec lettres trouvées / masquées
# Objectif : conditions (if) + construction d'une chaîne d'affichage
# ============================================================

# Le mot à deviner
mot="boucle"

# Lettres déjà "trouvées" (ici on les simule pour tester)
# Plus tard (étape 3), le joueur les saisira lui-même
trouvees="bo"

# Chaîne vide qui servira à construire l'affichage final
# Exemple attendu avec trouvees="bo" : "b o _ _ _ _ "
affichage=""

echo "Le mot fait ${#mot} lettres"

# On parcourt chaque lettre du mot, une par une
for (( i = 0; i < ${#mot}; i++ )); do

    # On extrait la lettre à la position i
    lettre=${mot:i:1}

    # Test : la lettre courante est-elle dans la chaîne $trouvees ?
    # [[ $trouvees == *"$lettre"* ]]
    #   *          = n'importe quoi avant
    #   "$lettre"  = la lettre cherchée
    #   *          = n'importe quoi après
    # → vrai si la lettre apparaît quelque part dans $trouvees
    if [[ $trouvees == *"$lettre"* ]]; then

        # Concaténation : += ajoute du texte à la fin d'une chaîne
        # Exemple :
        #   string="bonjour"
        #   string+=" Robin"
        #   echo $string  →  "bonjour Robin"
        # Ici on ajoute la lettre + un espace pour l'affichage
        affichage+="$lettre "

    else
        # Lettre pas encore trouvée → on affiche un underscore
        affichage+="_ "
    fi

done

# Affiche le résultat construit lettre par lettre
echo "Mot : $affichage"
