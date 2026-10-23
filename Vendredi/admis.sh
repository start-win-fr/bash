#!/bin/bash

# notes est une liste de chiffre
# Chaque chiffre a l'interieur a un index
# par exemple :
# index 0 -> 12
# index 1 -> 8
# index 2 -> 15
# index 3 -> 10
# index 4 -> 17

#notes=(12 8 15 10 17 6 11)
#echo "derniere note : ${notes[4]}"
#echo "Toutes les notes : ${notes[*]}"
#echo "Nombre d'élément du tableau : ${#notes[@]}"

compter_admis() {
	notes=$1
#	cpt_Admis=0
#	cpt_Recalé=0
	somme=0

	for n in "${notes[@]}";do
	    Admission="admis"

		if (( n>=16 )); then
			Mention="très bien"
		elif (( n>=12 )); then
			Mention="bien"

        elif (( n>=10 )); then
			Mention="passable"
		else
			Mention="recalé"
			Admission="recalé"
		fi

        if [[ $Admission == "admis" ]]; then
            (( somme++ )) 
        fi

		printf "%-2d : %-6s : %-9s\n" "$n" "$Admission" "$Mention"


	done
    echo "$somme admis sur ${#notes[@]}"
}

notes=("$@")
compter_admis $notes
