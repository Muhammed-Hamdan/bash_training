#!/usr/bin/bash

# $1 is url; $2 is name to search;
# print full dirname containing keyword
extract_dirname_githubpage() {
	curl $1 -o extract_temp.txt &> /dev/null  
	dirname=$( grep -i $2 extract_temp.txt)
	dirname=${dirname##*title=\"}
	dirname=${dirname%%\"*}
	rm extract_temp.txt
	echo $dirname
}

# $1 record
# $2 column no
# $3 equality value
check_field_equals() {
	if [ $(echo $1 | cut -d, -f$2) == $3 ]
	then
		return 0
	else
		return 1
	fi
}

process_record() {
	id=$(echo $1 | cut -d, -f$idcol)
	#id=FWC22025
	mkdir $id
	cd $id


	# Preprocessing on links
	link=$(echo $1 | cut -d, -f$linkcol)
	#link="https://github.com/madind5668/FWC/tree/main/FWC - 1"
	#link="https://github.com/ManojChavva/FWC"
	link=$(echo $link | sed "s/ /%20/g" )
	link=${link%%.git*}
	if [ $(echo $link | grep "/tree/main" | wc -l) -ne 0 ]
	then
		link_suffix=""
	else
		link_suffix="/tree/main"
	fi

	all_complete=1
	topdirname=""
	for counter in ${!lowdir[@]}
	do
		if $(check_field_equals "$1" $(( $startcol + $counter )) $completed_entry)
		then
			if [ $(echo $topdirname | grep -i ${topdir[$counter]} | wc -l) -eq 0 ]
			then
				topdirname=$(extract_dirname_githubpage $link ${topdir[$counter]} | sed "s/ /%20/g")
			fi
			lowdirname=$(extract_dirname_githubpage $link$link_suffix/$topdirname ${lowdir[$counter]} | sed "s/ /%20/g")
			echo $topdirname : $lowdirname
			#svn co $link/trunk/$topdirname/$lowdirname ${lowdir[$counter]} &> /dev/null
		else
			echo $id completed upto ${topdir[$(( $counter - 1 ))]}:${lowdir[$(( $counter - 1 ))]}
			all_complete=0
			break
		fi
	done
	
	if [ $all_complete -eq 1 ]
	then
		echo $id completed all
	fi

	cd ..
	rm -rf $id
}

# Global variables
linkcol=4
idcol=2
startcol=14
topdir=("matrices" "matrices" "matrices" "optimization" "optimization")
lowdir=("line" "circle" "conic" "basic" "advanced")
completed_entry=5

# Iterating through command output
#filtlist=$( awk -F, -v checkcol="$startcol" '$checkcol==5 {print $0}' marks.csv )
#
process_record "$(grep Hamdan marks.csv)"
#process_record "$(grep -i chavva marks.csv)"
#process_record "$(grep FWC22025 marks.csv)"

# Quote variables to preserve newline
#while read -r item
#do
#	process_record "$item"
#done < <(echo "$filtlist") 

# Function tester code
#if $(check_field_equals "$(grep Hamdan marks.csv)" 16 98)
#then
#	echo success
#else
#	echo failure
#fi
