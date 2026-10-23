#!/bin/bash
# ============================================================
# J8 — Fusionner deux tableaux triés (niveau 3)
# Usage : ./J08_fusion.sh '1 4 9 12' '2 3 10'
# Contrainte : sans retrier. Un seul passage sur les deux listes.
# ============================================================

# a=($1) SANS guillemets : bash découpe la chaîne sur les espaces,
# ce qui donne un tableau. C'est voulu ici.
a=($1)
b=($2)
i=0       # position dans a
j=0       # position dans b
res=()

# Tant qu'il reste des éléments dans les DEUX listes, on prend
# le plus petit des deux éléments en tête.
while (( i < ${#a[@]} && j < ${#b[@]} )); do
    if (( a[i] <= b[j] )); then
        res+=("${a[i]}")
        (( i++ ))
    else
        res+=("${b[j]}")
        (( j++ ))
    fi
done

# Une des deux listes est vide : on recopie d'un coup ce qui
# reste de l'autre. ${a[@]:i} = les éléments de a à partir de i.
res+=("${a[@]:i}" "${b[@]:j}")

echo "${res[*]}"
