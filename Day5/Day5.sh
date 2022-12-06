#!/bin/bash


echo "Example"

sed -e 's/    / 0  /g' example > example-2

awk -f Day5-p1-example.awk < example-2

echo "Input"

sed -e 's/    / 0  /g' input > input-2

awk -f Day5-p1.awk < input-2

echo "Input "

awk -f Day5-p2.awk < input-2

