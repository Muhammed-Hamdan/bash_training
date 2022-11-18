#!/usr/bin/bash

# $1 is url; $2 is name to search 
# print full dirname containing keyword
extract_dirname_githubpage() {
	curl $1 -o extract_temp.txt &> /dev/null  
	#curl $1 -o extract_temp.txt
	dirname=$( grep $2 extract_temp.txt )
	dirname=${dirname##*title=\"}
	dirname=${dirname%%\"*}
	rm extract_temp.txt
	echo $dirname
}

process_record() {
	echo $1
	#link=$(echo $1 | cut -d, -f4)
	#echo $link
}

# Iterating through command output
mylist=$( awk -F, '$14==5 {print $3}' marks.csv )
echo $mylist
#for item in $mylist
#do
#	echo $item
#done
