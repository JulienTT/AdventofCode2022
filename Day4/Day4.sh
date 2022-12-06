#!/bin/bash

echo "Part 1"

echo "Example"

sed -e 's/-/ /g ; s/,/ /g' example > example.txt

awk -f Day4-p1.awk < example.txt

echo "Input"

sed -e 's/-/ /g ; s/,/ /g' input > input.txt

awk -f Day4-p1.awk < input.txt

echo "Example"

awk -f Day4-p2.awk < example.txt

echo "Input "

awk -f Day4-p2.awk < input.txt

