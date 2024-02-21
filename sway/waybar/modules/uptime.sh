#!/bin/bash

get_uptime() {
	uptime -p | sed 's/up //'
}

while true; do
	uptime=$(get_uptime)
	echo "Uptime: $uptime"
	sleep 60
done
