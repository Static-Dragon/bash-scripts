	
#!/bin/bash

# A clock

function clock () {
	
 clear; while true; do echo -e \\b\\b\\b\\b\\b\\b\\b\\b`date +%T`\\c ; sleep 1; done

}
