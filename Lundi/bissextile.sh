#!/bin/bash

annee=$1

if (( (annee % 4 == 0 && annee % 100 != 0) || annee % 400 == 0 ));then
    echo "$annee est bissextile"
else
    echo "$annee n'est pas bissextile"
fi