#!/bin/bash
# ============================================================
# Exercice 2 du jeudi — Compter une lettre
# Usage : ./2_lettres.sh banane a
# ============================================================

# compter_lettre MOT LETTRE : AFFICHE le nombre de fois où LETTRE
# apparaît dans MOT.
#
# Pourquoi echo et pas return ?
# return sert à répondre vrai (0) ou faux (autre chose), comme
# est_palindrome. Il ne peut renvoyer qu'un nombre entre 0 et 255,
# et tout ce qui n'est pas 0 compte comme « faux » dans un if.
# Pour renvoyer un RÉSULTAT, on l'affiche avec echo, et on le
# récupère avec $( ).
compter_lettre() {
    local mot=$1
    local lettre=$2
    local compteur=0

    # Même boucle que dans le pendu : i passe sur chaque indice du mot
    for (( i = 0; i < ${#mot}; i++ )); do
        # ${mot:i:1} = la lettre à l'indice i
        if [[ ${mot:i:1} == "$lettre" ]]; then
            (( compteur++ ))
        fi
    done

    # Le echo est APRÈS la boucle : dedans, il afficherait un
    # nombre à chaque tour
    echo "$compteur"
}

mot=$1
lettre=$2
nb=$(compter_lettre "$mot" "$lettre")
echo "« $lettre » apparaît $nb fois dans « $mot »"

# --- Bonus : toutes les voyelles --------------------------
# On réutilise la même fonction pour chaque voyelle
total=0
for v in a e i o u y; do
    n=$(compter_lettre "$mot" "$v")
    (( total += n ))
done
echo "$total voyelles dans « $mot »"
