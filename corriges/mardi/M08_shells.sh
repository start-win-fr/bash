#!/bin/bash
# ============================================================
# M8 — Qui utilise quel shell ? (mardi, niveau 2)
# Usage : ./M08_shells.sh passwd_exemple.txt
#         ./M08_shells.sh                  (lit /etc/passwd)
# Équivalent en une ligne : cut -d: -f7 fichier | sort | uniq -c
# Ici, sans cut, sort ni uniq.
# ============================================================

fichier=${1:-/etc/passwd}

# Tableau associatif : l'indice est un mot (le shell) au lieu d'un
# nombre. compte[/bin/bash] contiendra le nombre de comptes bash.
declare -A compte

# Le parcours d'un tableau associatif n'a pas d'ordre garanti :
# on retient l'ordre d'apparition dans un tableau normal.
ordre=()

# while read lit le fichier ligne par ligne.
# IFS=: découpe chaque ligne sur les « : ».
# Une ligne de passwd a 7 champs, le shell est le 7e.
# Les _ servent de poubelle pour les 6 premiers.
while IFS=: read -r _ _ _ _ _ _ shell; do
    # Premier compte avec ce shell : on l'enregistre
    if [[ -z ${compte[$shell]} ]]; then
        ordre+=("$shell")
        compte[$shell]=0
    fi
    compte[$shell]=$(( ${compte[$shell]} + 1 ))
done < "$fichier"       # le fichier est envoyé dans la boucle

for s in "${ordre[@]}"; do
    printf '%3d  %s\n' "${compte[$s]}" "$s"
done
