#!/bin/bash

max=-2147483648
min=2147483647
total=100

for i in $(seq 1 $total)
do
  ARG=$(seq 1 500 | shuf | tr '\n' ' ')
  result=$(./push_swap $ARG | wc -l)
  if (( result > max )); then
    max=$result
  fi
  if (( result < min )); then
    min=$result
  fi
  progress=$(( i * 100 / total ))
  echo -ne "Progress: $progress% \r"
done

echo -e "\nLowest value: $min"
echo "Highest value: $max"