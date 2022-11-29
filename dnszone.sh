#!/bin/bash

for server in $(host -t ns $1 | cut -d " " -f 4)
do
	dnszone=$(host -l -a $1 $server)
	if [[ $(grep "Received" <<< "$dnszone") ]]
	then
		echo -e "$dnszone"
	fi
done
