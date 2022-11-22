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

check_completion_status() {
	if [ $(echo $1 | cut -d, -f$2) -eq 5 ]
	then
		return 0
	else
		return 1
	fi
}

process_record() {
	id=$(echo $1 | cut -d, -f$idcol)
	mkdir $id
	cd $id
	link=$(echo $1 | cut -d, -f$linkcol)
	dirmat=$(extract_dirname_githubpage $link matrix)
	dirline=$(extract_dirname_githubpage $link/tree/main/$dirmat line)
	svn co $link/trunk/$dirmat/$dirline line &> /dev/null
	checkcol=$(( $startcol+1 ))
	while [ $checkcol -le $endcol ]
	do
		if $(check_completion_status $1 $checkcol)
		then
			dirname=$(extract_dirname_githubpage $link/tree/main/$dirmat circle)
			svn co $link/trunk/$dirmat/$dircircle circle &> /dev/null
			checkcol=$(( $checkcol+1 ))
		fi
	done
	dirconic=$(extract_dirname_githubpage $link/tree/main/$dirmat conic)
	#echo $link
	#echo $dirmat
	#echo $dirline
	#echo $dircircle
	#echo $dirconic
	svn co $link/trunk/$dirmat/$dirconic  conic &> /dev/null
	cd ..
}

# Global variables
#linkcol=4
#idcol=2
#startcol=14
#endcol=18

# Iterating through command output
#filtlist=$( awk -F, -v checkcol="$startcol" '$checkcol==5 {print $0}' marks.csv )
#
#process_record "$(grep Hamdan marks.csv)"

# Quote variables to preserve newline
#while read -r item
#do
#	process_record "$item"
#done < <(echo "$filtlist") 

if $(test_function 40)
then
	echo success
else
	echo failure
fi
