#!/bin/bash

current_year=2026

read -p "Votre prénom : " prenom
read -p "Votre année de naissance : " annee

age=$(( $current_year - $annee  ))

echo "Bonjour $prenom, né en $annee. Vous avez donc $age ans"