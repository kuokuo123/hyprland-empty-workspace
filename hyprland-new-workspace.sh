#!/bin/bash

fIsnotempty=$(hyprctl workspaces | grep -A 2 "monitor $(hyprctl monitors -j | jq -r 'map(select(.focused == true)) | .[] | .name')" | grep "windows: 0")

if [[ -z $fIsnotempty ]]; then
    numbers=($(hyprctl workspaces | grep "ID [0-99]" | cut -d " " -f 3 | sort -h | tr '\n' ' '))
    calculated_num=0

    for number in "${numbers[@]}"; do
	if (( calculated_num != 0 && number != calculated_num + 1 )); then
	    if [[ $1 = "--move" ]]; then 
		hyprctl dispatch movetoworkspace $((calculated_num + 1))
	    else
		hyprctl dispatch workspace $((calculated_num + 1))
	    fi
	    exit 0
	fi
	calculated_num=$number
    done  

    if [[ $1 = "--move" ]]; then 
	hyprctl dispatch movetoworkspace $((calculated_num + 1))
    else
	hyprctl dispatch workspace $((calculated_num + 1))
    fi

else
    echo "Alreading focusing an empty workspace. aborting.."
fi

