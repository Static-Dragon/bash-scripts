#!/bin/bash

# Create a blank file for the purpose of creating notes in a specified directory

function mknotes() {

if [ "$#" -ne 2 ]; then 
	echo "Usage: mknotes subject filename"
	return
fi

notesdir=~/Documents/Text/notes/$1
if [ -d $notesdir ]; then
	vim $notesdir/$2	
else
	mkdir $notesdir
	vim $notesdir/$2
fi
}
