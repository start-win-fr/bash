#!/bin/bash
# ============================================================
# Exercice 7 du vendredi — Le chiffrement de César (niveau 3)
# Usage : ./7_cesar.sh bonjour 3       → erqmrxu
#         ./7_cesar.sh erqmrxu 23      → bonjour (décodage)
# Chaque lettre est décalée dans l'alphabet. Après z, on repart à a.
# Minuscules sans accents uniquement. Le reste est recopié tel quel.
# ============================================================

alphabet="abcdefghijklmnopqrstuvwxyz"

# position LETTRE : affiche la place de la lettre dans l'alphabet
# (a=0, b=1 ... z=25), ou -1 si ce n'est pas une lettre.
# C'est une recherche linéaire, comme le prénom de jeudi.
position() {
    local lettre=$1
    for (( p = 0; p < 26; p++ )); do
        if [[ ${alphabet:p:1} == "$lettre" ]]; then
            echo "$p"
            return          # trouvé : on sort de la fonction
        fi
    done
    echo -1                 # boucle finie sans trouver
}

message=$1
decalage=$2
resultat=""

# On parcourt le message lettre par lettre, comme dans le pendu
for (( i = 0; i < ${#message}; i++ )); do
    lettre=${message:i:1}
    pos=$(position "$lettre")

    if (( pos == -1 )); then
        # Espace, ponctuation... : on garde tel quel
        resultat+=$lettre
    else
        # % 26 fait repartir au début de l'alphabet :
        # z (25) + 3 = 28, et 28 % 26 = 2, c'est-à-dire c.
        # Sans le % 26, ${alphabet:28:1} serait vide et la lettre
        # disparaîtrait (zebre donnerait « heuh »).
        nouvelle=$(( (pos + decalage) % 26 ))
        resultat+=${alphabet:nouvelle:1}
    fi
done

echo "$resultat"

# Bonus : pour décoder un message chiffré avec un décalage d,
# on le chiffre à nouveau avec 26 - d (3 → 23).
