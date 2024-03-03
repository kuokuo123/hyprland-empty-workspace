#!/bin/bash

numbers=($(hyprctl workspaces | grep "ID [0-99]" | cut -d " " -f 3 | sort -h | tr '\n' ' '))
calculated_num=0

for number in "${numbers[@]}"; do
	if (( calculated_num != 0 && number != calculated_num + 1 )); then
		hyprctl dispatch workspace $((calculated_num + 1))
		exit 0
	fi
	calculated_num=$number
done  

hyprctl dispatch workspace $((calculated_num + 1))
