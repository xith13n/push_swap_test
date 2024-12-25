#!/bin/bash

max=-2147483648
min=2147483647
total=100

for i in $(seq 1 $total)
do
  ARG=$(seq 1 100 | shuf | tr '\n' ' ')
  result=$(./push_swap $ARG | wc -l)
  if (( result > max )); then
    max=$result
	if (( max > 700 )); then
      echo "ARG when max > 700: $ARG"
    fi
  fi
  if (( result < min )); then
    min=$result
  fi
  progress=$(( i * 100 / total ))
  echo -ne "Progress: $progress% \r"
done

#echo -e "\nLowest value: $min"
if (( max < 700 )); then
  echo -e "\e[32mHighest value: $max\e[0m"
else
  echo -e "\e[31mHighest value: $max\e[0m"
fi

