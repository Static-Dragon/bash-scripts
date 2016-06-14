#!/bin/bash

# Generate a skeleton for a bash script

function mkbash () {

if [[ "$#" -ne 1  ]]; then
	echo "Usage: mkbash <scriptname>"
	return
fi

cat > $1.sh <<fin	
#!/bin/bash
		
function $1 () {
	

}
fin
}

