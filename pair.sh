#!/bin/bash

n=$1

if (( n % 2 == 0 )); then
    echo "$n est pair"
else
    echo "$n est impair"
fi