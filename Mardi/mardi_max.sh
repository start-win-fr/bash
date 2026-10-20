#!/bin/bash

valeurs=(5 90 28 39 9910 2 39 0 8347 63 739 0 9328 7 8 9 0)

max=${valeurs[0]}

for n in "${valeurs[@]}";do
    if (( n > max )); then
        max=$n
    fi
done

echo $max