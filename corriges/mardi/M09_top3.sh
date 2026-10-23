#!/bin/bash
# ============================================================
# M9 — Les trois plus gros fichiers (mardi, niveau 3)
# Usage : ./M09_top3.sh /var/log
# Contraintes : un seul parcours, pas de sort.
# C'est le « deuxième plus grand » (L10) avec un podium à 3 places.
# ============================================================

dossier=${1:-/var/log}

# Le podium : taille[0] est la 1re place. -1 = place vide.
taille=(-1 -1 -1)
nom=("" "" "")

for f in "$dossier"/*; do
    # On ignore les sous-dossiers : -f = « est un fichier »
    [[ -f $f ]] || continue

    # stat -c %s donne la taille en octets
    t=$(stat -c %s "$f")

    if (( t > taille[0] )); then
        # Nouveau premier : l'ancien 1er passe 2e, l'ancien 2e passe 3e
        taille=("$t" "${taille[0]}" "${taille[1]}")
        nom=("$f" "${nom[0]}" "${nom[1]}")
    elif (( t > taille[1] )); then
        # Nouveau deuxième : l'ancien 2e passe 3e
        taille=("${taille[0]}" "$t" "${taille[1]}")
        nom=("${nom[0]}" "$f" "${nom[1]}")
    elif (( t > taille[2] )); then
        # Nouveau troisième : seule la 3e place change
        taille[2]=$t
        nom[2]=$f
    fi
done

for i in 0 1 2; do
    # Un dossier de moins de 3 fichiers laisse des places vides
    if [[ -n ${nom[i]} ]]; then
        printf '%8d  %s\n' "${taille[i]}" "${nom[i]}"
    fi
done
