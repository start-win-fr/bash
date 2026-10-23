#!/bin/bash
# ============================================================
# TP du pendu — version complète, avec les bonus
# Usage : ./pendu_complet.sh            (mot tiré au hasard)
#         ./pendu_complet.sh boucle     (mot imposé, pour tester)
# Les corrigés étape par étape sont dans le dossier TP/ (tp_etape1 à 5).
# Cette version ajoute :
#   - le refus des saisies invalides (AB, 3, rien du tout)
#   - le refus des lettres déjà jouées, sans compter d'erreur
#   - une fonction masque pour fabriquer le mot caché
#   - le dessin du pendu
# ============================================================

mots=(algorithme boucle variable fonction tableau terminal clavier)
# Un argument impose le mot, sinon on en tire un au hasard
mot=${1:-${mots[RANDOM % ${#mots[@]}]}}
max_erreurs=7
erreurs=0
proposees=""     # toutes les lettres déjà jouées, bonnes ou mauvaises

# Fabrique le mot caché : la lettre si elle a été jouée, sinon _
masque() {
    local m="" c
    for (( i = 0; i < ${#mot}; i++ )); do
        c=${mot:i:1}
        if [[ $proposees == *"$c"* ]]; then
            m+="$c "
        else
            m+="_ "
        fi
    done
    echo "$m"
}

# Dessine le pendu : une partie de plus à chaque erreur
dessin() {
    local e=$1
    local corde=" " tete=" " corps=" " bras_g=" " bras_d=" " jambe_g=" " jambe_d=" "
    # (( condition )) && action : l'action n'a lieu que si la condition est vraie
    (( e >= 1 )) && corde="|"
    (( e >= 2 )) && tete="O"
    (( e >= 3 )) && corps="|"
    (( e >= 4 )) && bras_g="/"
    (( e >= 5 )) && bras_d="\\"     # \\ affiche un seul \
    (( e >= 6 )) && jambe_g="/"
    (( e >= 7 )) && jambe_d="\\"
    echo "  +---+"
    echo "  |   $corde"
    echo "  |   $tete"
    echo "  |  $bras_g$corps$bras_d"
    echo "  |  $jambe_g $jambe_d"
    echo "=====+"
}

while (( erreurs < max_erreurs )); do
    etat=$(masque)
    echo
    dessin "$erreurs"
    echo "Mot : $etat"
    echo "Erreurs : $erreurs/$max_erreurs   Lettres jouées : $proposees"

    # Plus aucun _ : toutes les lettres sont trouvées
    if [[ $etat != *_* ]]; then
        echo "Gagné ! Le mot était bien « $mot »."
        exit 0
    fi

    # || break : si read échoue (Ctrl+D), on sort proprement
    read -r -p "Une lettre : " lettre || break

    # =~ teste une expression régulière :
    # ^[a-z]$ = exactement UNE lettre minuscule, rien d'autre
    if [[ ! $lettre =~ ^[a-z]$ ]]; then
        echo "Une seule lettre minuscule, svp."
        continue     # retour au début de la boucle, sans erreur comptée
    fi
    if [[ $proposees == *"$lettre"* ]]; then
        echo "Déjà jouée."
        continue
    fi

    proposees+=$lettre
    if [[ $mot == *"$lettre"* ]]; then
        echo "Bien vu, il y a un « $lettre »."
    else
        (( erreurs++ ))
        echo "Raté, pas de « $lettre »."
    fi
done

echo
dessin "$erreurs"
echo "Perdu... le mot était « $mot »."
