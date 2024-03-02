#!/bin/bash

ufIsempty=$(hyprctl workspaces | grep -vA 1 "monitor $(hyprctl monitors -j | jq -r 'map(select(.focused == true)) | .[] | .name')" | grep "windows: 0")
fIsnotempty=$(hyprctl workspaces | grep -A 2 "monitor $(hyprctl monitors -j | jq -r 'map(select(.focused == true)) | .[] | .name')" | grep "windows: 0")


if [[ -z $ufIsempty ]]; then
	if [[ $1 = "--move" ]]; then 
	    hyprctl dispatch movetoworkspace empty
	else 
	    hyprctl dispatch workspace empty
	fi
else
	if [[ -z $fIsnotempty ]]; then
	    if [[ $1 = "--move" ]]; then 
		hyprctl dispatch movetoworkspace $(($(hyprctl workspaces | grep "ID [0-99]" | cut -d " " -f 3 | sort -h | tail -n 1) + 1))
	    else 
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

	    fi
	else
	    echo 'already focusing on the empty workspace of this monitor; do nothing...'
	fi
fi

