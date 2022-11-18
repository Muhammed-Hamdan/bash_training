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

#wget --output-file="log_mark.csv" "https://docs.google.com/spreadsheets/d/1yx7iYVfK_Xuua1v_W7R4UHRJ_rW-1u1sPxXXEtWxIhU/export?format=csv&gid=0" -O "marks.csv"
#wget --output-file="log_question.csv" "https://docs.google.com/spreadsheets/d/1yx7iYVfK_Xuua1v_W7R4UHRJ_rW-1u1sPxXXEtWxIhU/export?format=csv&gid=1780577471" -O "questions.csv"

link="https://github.com/Muhammed-Hamdan/iith-fwc-2022-23"
dirsrch="matrix"



receive=$( extract_dirname_githubpage $link $dirsrch )
svn co $link/trunk/$receive $user
