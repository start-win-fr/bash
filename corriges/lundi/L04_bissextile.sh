#!/bin/bash
# ============================================================
# L4 — Année bissextile (lundi, niveau 2)
# Usage : ./L04_bissextile.sh 2024
# Règle : divisible par 4 mais pas par 100,
#         OU divisible par 400.
# Tests utiles : 1900 (non), 2000 (oui), 2024 (oui), 2026 (non)
# ============================================================

annee=$1

# && veut dire ET, || veut dire OU.
# Les parenthèses intérieures regroupent la première règle,
# comme en maths.
if (( (annee % 4 == 0 && annee % 100 != 0) || annee % 400 == 0 )); then
    echo "$annee est bissextile"
else
    echo "$annee n'est pas bissextile"
fi
