#!/bin/bash
while read -r dd; do
	code=$(curl -ks "http://$dd" -w "%{http_code}" -o /dev/null)
	if [[ $code =~ 2.. ]]; then
	    printf "http://$dd\t[$code]\n"
	elif [[ $code =~ 3.. ]]; then	
	    printf "https://$dd\t[$code]\n"
		
	fi
done < $1
