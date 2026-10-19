#!/bin/bash

note=$1
if (( note < 0 || note > 20 )); then
    echo "Note invalide"
elif (( note >= 16 )); then
    echo "Très bien"
elif (( note >= 12 )); then
    echo "Bien"
elif (( note >= 10 )); then
    echo "Passable"
elif ((note > 0)); then
    echo "Insuffisant"
else
    echo "Veuillez entrer un nombre valide"
fi
