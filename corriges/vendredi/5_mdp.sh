#!/bin/bash
# ============================================================
# Exercice 5 du vendredi — Mot de passe valide ? (niveau 2)
# Usage : ./5_mdp.sh 'Mot@passe1'
# Mettez le mot de passe entre apostrophes : sinon le terminal
# interprète lui-même des caractères comme ! ou $.
# ============================================================

mdp=$1
problemes=0       # nombre de règles non respectées

# Règle 1 : au moins 8 caractères
if (( ${#mdp} < 8 )); then
    echo "Trop court : ${#mdp} caractères, il en faut au moins 8"
    (( problemes++ ))
fi

# Règle 2 : au moins un chiffre
# *[0-9]* = « n'importe quoi, un chiffre, n'importe quoi ».
# On veut réagir quand il n'y en a PAS : d'où le !=
if [[ $mdp != *[0-9]* ]]; then
    echo "Il manque un chiffre"
    (( problemes++ ))
fi

# Règle 3 : au moins une majuscule
if [[ $mdp != *[A-Z]* ]]; then
    echo "Il manque une majuscule"
    (( problemes++ ))
fi

# Bonus, règle 4 : au moins un caractère spécial parmi ! ? @ # $
# Les \ empêchent bash de donner un sens spécial à ces caractères
if [[ $mdp != *[\!\?@#\$]* ]]; then
    echo "Il manque un caractère spécial (! ? @ # \$)"
    (( problemes++ ))
fi

# Aucune règle cassée : le mot de passe est bon
if (( problemes == 0 )); then
    echo "Mot de passe valide"
fi
