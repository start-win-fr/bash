#!/bin/bash
notes=(12 8 15 10 17 6 11)
admis=0

for n in "${notes[@]}"; do
    if (( n >= 16 )); then
        mention="trés bien"
    elif (( n >= 12 )); then
        mention="bien"
    elif (( n >= 10 )); then
        mention="passable"
    else
        mention="recalé"
    fi
    
    printf "%2d : %s\n" "$n" "$mention"
done