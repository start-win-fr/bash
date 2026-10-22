#!/bin/bash

nettoyer() { # minuscules, sans espaces
    echo "$1" | tr 'A-Z' 'a-z' | tr -d ' '
}

inverser() {
    local string=$1
    local reverse=""

    for (( i = ${#string} - 1; i >= 0 ;i-- )); do
        reverse+=${string:i:1}
    done

    echo "$reverse"
}

est_palindrome() {
    # kayak => kayak
}