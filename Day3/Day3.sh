#!/bin/bash

echo "Part 1"

echo "Example"

echo "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" | awk 'BEGIN{FS=""}{for (i=1;i<=NF;i++) {print $i,i}}' > values

awk -f Day3-p1.awk < example

echo "Input"

awk -f Day3-p1.awk < input

echo "Example"

awk -f Day3-p2.awk < example

echo "Input"

awk -f Day3-p2.awk < input

