#!/bin/bash
		
# checks the return statuses of pinging an IP address (which if ping returns 1 is not working) and DNS resolution ( which if it returns 1 is down)

function netcheck () {
	ping -c 3 8.8.8.8 &> /dev/null

	network=$?

	ping -c 3 google.com &> /dev/null

	dns=$?

	if [ $dns == 1 ] && [ $network == 1 ]; then
		echo "both DNS and your network are not functioning"
	elif [ $dns == 1 ]; then
		echo "The DNS server[s] are/is down"
	elif [ $dns == 0 ] && [ $network == 0 ]; then
		echo "Both your DNS and network are functional"
	else
		echo "ping failed to run"
	fi
}
