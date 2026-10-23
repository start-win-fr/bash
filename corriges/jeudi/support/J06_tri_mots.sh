#!/bin/bash
# ============================================================
# J6 — Trier des mots (tri par insertion, niveau 2)
# Usage : ./J06_tri_mots.sh poire banane kiwi abricot cerise
# Idée : comme des cartes qu'on range dans sa main. On prend
#        chaque mot et on le glisse à sa place parmi ceux d'avant.
# ============================================================

t=("$@")

for (( i = 1; i < ${#t[@]}; i++ )); do
    cle=${t[i]}          # le mot à placer
    j=$(( i - 1 ))
    # Tant que le mot à gauche est « plus grand » (plus loin dans
    # l'alphabet), on le décale d'une case vers la droite.
    # [[ a > b ]] compare des TEXTES par ordre alphabétique.
    # On teste j >= 0 en premier : le && garantit qu'on ne lit
    # jamais t[-1].
    while (( j >= 0 )) && [[ ${t[j]} > $cle ]]; do
        t[j+1]=${t[j]}
        (( j-- ))
    done
    t[j+1]=$cle          # on pose le mot dans le trou laissé
done

echo "${t[*]}"
