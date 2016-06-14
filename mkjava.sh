#!/bin/bash

# Generate a skeleton java file, with args

function mkjava {

	if [ "$#" -ne 2 ] ; then
		echo "Uage: mkjava classname"
		return
	fi

	cat > $1.java <<fin

	class $1 {
		public satic void main (String[] args){
	
		}
	}
fin

}
