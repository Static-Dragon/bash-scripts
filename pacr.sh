#!/bin/bash

# remove a package, disable systemd service, and remove configs, very much WIP USE AT OWN RISK!

function pacr() {
	
	if [[ "$#" -ne 1 ]] ; then
		echo "Usage: ar <packagename>"
		return
	fi

	if hash $1 2>/dev/null; then
		if [[ $1 =~ /(systemd)|(getty)|(linux)|[?]|[*]|\s]|[\*]\[\\]/   ]] ; then # use regex to check variable's sanity
			echo "Illegal value, do not use any wildcard or system package"
			return
		else
			if [ -f /usr/lib/systemd/system/$1.service ]; then #disable systemd service 1st if it exists, typically it will stay enabled, but this should fix that issue
				sudo systemctl disable $1.service
			fi
			sudo pacman -R $1
			# removing configs is an optional step, but it frees disk space
			if [[ -d ~/.config/$1 ]]; then
				rm -rf ~/.config/$1
			fi
			if [[ -d /etc/$1 ]]; then
				sudo rm -rf /etc/$1
			fi
		fi
	else
		echo "$1 not installed"
		return
	fi
}
