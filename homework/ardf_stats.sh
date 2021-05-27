#!/bin/bash

if [[ $# -ne 5 ]];
then
	if [[ $# -ne 3 ]];
	then
		echo "Invalid number of arguments"
		exit 1
	fi
	fi

	if [[ $2 == 'top_places' ]];
	then
	grep -i "$3" $1 | sort -n -t ':' -k3 | cut -d ':' -f3- | grep '^[0-9]' | awk -F : -v x="$4" '$1<=x' | cut -d ':' -f2 | sort | uniq -c | sort -r -k1 | head -$5 
	exit 0;
	fi

	if [[ $2 == 'parts' ]];
	then
		parts=$(mktemp)
		grep "$3" $1 | cut -d ':' -f1-2 | sed 's/:/ /g' | awk '{ print $2 "." $1 }' | sort -t '.' -k1,1 -k4,4 -k3,3 -k2,2 > parts
		
		category=

		length=$(wc -l parts | cut -d ' ' -f1) 
		i=1
		while [[ $length -ge $i ]]
		do
			if [[ $category == $(head -$i parts | tail -1 | cut -d '.' -f1) ]];
			then
				echo -n ', '
				echo -n $(head -$i parts | tail -1 | cut -d '.' -f2-4)
			 else
				 if [[ $i -ne 1 ]];
				 then
				 	echo ' '
					fi
				 category=$(head -$i parts | tail -1 | cut -d '.' -f1)
				 echo -n "$category "
				 echo -n $(head -$i parts | tail -1 | cut -d '.' -f2-4)
				 fi
				 ((i++))
				 
		done

		echo ' '
		
		rm parts
	
		exit 0;
		fi
	echo 'Invalid command'
	exit 2

