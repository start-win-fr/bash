#!/bin/bash
compter_lettre() {
    mot=$1
    lettre=$2
    compteur=0
    for (( i = 0; i < ${#mot}; i++ )); do
        if [[ ${mot:i:1} == "$lettre" ]]; then
            (( compteur++ ))
        fi
    done

    return $compteur
}

compter_lettre "$1" "$2"

nb=$?

echo "$nb"
echo "<<"$2">> apparaît $nb fois dans <<"$1">>"