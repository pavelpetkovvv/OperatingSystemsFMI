#!/bin/bash

if [[ $# -ne 1 ]];
then 
	echo 'Invalid number of arguments'
	exit 1;
	fi

i=1

number_of_lines=$(wc -l $1 | cut -d ' ' -f1)

webpage_html=$(mktemp)

while [ $number_of_lines -ge $i ]
do	
if [[ $(head -$i $1 | tail -1 | cut -c1) != '#' ]];
then
	curl -s $(head -$i $1 | tail -1) > webpage_html
	j=1
	category=
	date=
	while [ $(wc -l webpage_html | cut -d ' ' -f1) -ge $j ]
	do
		if [[ $(head -$j webpage_html | tail -1 | grep 'a t e g o r' | wc -l | cut -d ' ' -f1) -eq 1 ]];
		then
			category=$(head -$j webpage_html | tail -1 | cut -d '<' -f7 | cut -d '>' -f2)
			fi

			if [[ $(head -$j webpage_html | tail -1 | grep '<tr class="Title2 TI21"><td>' | wc -l | cut -d ' ' -f1) -eq 1 ]];
			then
				date=$(head -$j webpage_html | tail -1 | cut -d '&' -f1 | cut -d '>' -f4 | cut -d ' ' -f2)
				fi

			if [[ $(head -$j webpage_html | tail -1 | grep '<tr class="ResLine' | wc -l | cut -d ' ' -f1) -eq 1 ]];
			then
				if [[ $(head -$j webpage_html | tail -1 | grep 'href' | wc -l | cut -d ' ' -f1) -eq 1 ]];
				then
				echo -n $date
				echo -n ':'
				echo -n $category
				echo -n ':'
				#place
				echo -n $(head -$j webpage_html | tail -1 | cut -d '<' -f3 | cut -d '>' -f2 | cut -d '.' -f1)
				
				echo -n ':'
				#name4
				if [[ $(head -$j webpage_html | tail -1 | cut -d '<' -f5 | cut -d '>' -f2 | grep ',' | wc -l | cut -d ' ' -f1) -eq 1 ]];
				then
					echo -n $(head -$j webpage_html | tail -1 | cut -d '<' -f5 | cut -d '>' -f2 | cut -d ' ' -f2)
					echo -n ' ' 
					echo -n $(head -$j webpage_html | tail -1 | cut -d '<' -f5 | cut -d '>' -f2 | cut -d ',' -f1)
				else
					echo -n $(head -$j webpage_html | tail -1 | cut -d '<' -f5 | cut -d '>' -f2)
				fi
				
				echo -n ':'
				#nationality
				echo -n $(head -$j webpage_html | tail -1 | cut -d '<' -f7 | cut -d '>' -f2)

				echo -n ':'
				#call
				if [[ $(head -$j webpage_html | tail -1 | cut -d '<' -f8 | cut -d '>' -f2 | grep '&nbsp;' | wc -l | cut -d ' ' -f1) -eq 0 ]];
				then
					echo -n $(head -$j webpage_html | tail -1 | cut -d '<' -f8 | cut -d '>' -f2)
					fi
				
				echo -n ':'
				#time
				echo -n $(head -$j webpage_html | tail -1 | cut -d '<' -f9 | cut -d '>' -f2)
				
				#count
				echo -n ':'
				echo -n $(head -$j webpage_html | tail -1 | cut -d '<' -f10 | cut -d '>' -f2)
				
				#starting number
				echo -n ':'
				echo $(head -$j webpage_html | tail -1 | cut -d '<' -f11 | cut -d '>' -f2)
			else
				echo -n $date
				echo -n ':'
				echo -n $category
				echo -n ':'
				#place
				echo -n $(head -$j webpage_html | tail -1 | cut -d '<' -f3 | cut -d '>' -f2 | cut -d '.' -f1)
				
				echo -n ':'
				#name
				if [[ $(head -$j webpage_html | tail -1 | cut -d '<' -f4 | cut -d '>' -f2 | grep ',' | wc -l | cut -d ' ' -f1) -eq 1 ]];
				then
					echo -n $(head -$j webpage_html | tail -1 | cut -d '<' -f4 | cut -d '>' -f2 | cut -d ' ' -f2)
					echo -n ' '
					echo -n $(head -$j webpage_html | tail -1 | cut -d '<' -f4 | cut -d '>' -f2 | cut -d ',' -f1)
				else
					echo -n $(head -$j webpage_html | tail -1 | cut -d '<' -f4 | cut -d '>' -f2)
				fi

				echo -n ':'
				#nationality
				echo -n $(head -$j webpage_html | tail -1 | cut -d '<' -f5 | cut -d '>' -f2)

				echo -n ':'
				#call
				if [[ $(head -$j webpage_html | tail -1 | cut -d '<' -f6 | cut -d '>' -f2 | grep '&nbsp;' | wc -l | cut -d ' ' -f1) -eq 0 ]];
				then
					echo -n $(head -$j webpage_html | tail -1 | cut -d '<' -f6 | cut -d '>' -f2)
					fi
				echo -n ':'
				#time
				echo -n $(head -$j webpage_html | tail -1 | cut -d '<' -f7 | cut -d '>' -f2)
				
				#count
				echo -n ':'
				echo -n $(head -$j webpage_html | tail -1 | cut -d '<' -f8 | cut -d '>' -f2)
				
				#starting number
				echo -n ':'
				echo $(head -$j webpage_html | tail -1 | cut -d '<' -f9 | cut -d '>' -f2)
				fi
				fi
		((j++))
	done
	fi
((i++))
done
rm webpage_html

exit 0
