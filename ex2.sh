read -p "enter the file name : " myfile
#test -e $myfile && echo "file already exists" || touch $myfile
[ -e $myfile ] && echo "file already exists" || touch $myfile
