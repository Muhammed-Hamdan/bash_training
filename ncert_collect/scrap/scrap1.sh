#!/usr/bin/bash

# $1 is url; $2 is name to search 
# print full dirname containing keyword
extract_dirname_githubpage() {
	curl $1 -o extract_temp.txt &> /dev/null  
	dirname=$( grep $2 extract_temp.txt )
	dirname=${dirname##*title=\"}
	dirname=${dirname%%\"*}
	rm extract_temp.txt
	echo $dirname
}

process_record() {
	id=$(echo $1 | cut -d, -f$idcol)
	mkdir $idcol
	cd $idcol
	link=$(echo $1 | cut -d, -f$linkcol)
	dirmat=$(extract_dirname_githubpage $link matrix)
	dirline=$(extract_dirname_githubpage $link/tree/main/$dirmat line)
	svn co $link/trunk/$dirmat/$dirline line
}

# Iterating through command output
linkcol=4
idcol=2
startcol=14
filtlist=$( awk -F, -v checkcol="$startcol" '$checkcol==5 {print $0}' marks.csv )

process_record "$(grep ")"

# Quote variables to preserve newline
#while read -r item
#do
#	process_record "$item"
#done < <(echo "$filtlist") 
