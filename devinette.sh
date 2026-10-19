#!/bin/bash

secret=${1:-$(( RANDOM % 100 + 1 ))}
echo "$secret"
essais=0
max_essais=7
while (( essais < max_essais )); do


done