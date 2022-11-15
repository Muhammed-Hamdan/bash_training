# Items seperated by space treated as different entities in shell scripting
# All items together form a list
# Can use for loop on list
# Ex: count num of char in each word of list
for x in vimal daga police theif cake
do
	echo -n $x :
	#echo $x | wc -c
# To print one char less, use 'expr' command
# 'expr' command can evaluate mathematical expressions
	len=`echo $x | wc -c`
	echo `expr $len - 1` 
done

# Script to print all user's names
cat /etc/passwd | cut -d: -f1

# Script to print all user's names who can login
echo users who can login:
cat /etc/passwd | grep bash | cut -d: -f1
# mature version to account for 'bash' occurance in uname
cat /etc/passwd | grep bash$ | cut -d: -f1

# Making above task as a function
#myuser()
#{
#	cat /etc/passwd | grep bash$ | cut -d: -f1
#}
# Function can also be defined as below (end each line with semicolon) 
myuser() { cat /etc/passwd | grep bash$ | cut -d: -f1; echo hi from myuser; }

echo calling function first time
myuser
echo calling function second time
myuser
echo calling function third time
myuser

# Passing arguements to function same as 'passing arguements to shell script'
myuserim(){
cat /etc/passwd | grep ${1}$ | cut -d: -f1
}

echo Calling improved function with nologin
myuserim nologin
echo Calling improved function with halt
myuserim halt
echo Calling improved function with bash
myuserim bash

# Standard IO redirection:
# '>' for overwrite, '>>' for append
# '1>' => Output, '2>' => Error, '&>' => Both
mynettest() {
	#ping -c 1 www.google.com 
	ping -c 1 www.google.com > /dev/null 
	# Alternate syntax for test
	[ $? == 0 ] && echo "net connected!" || echo "issue with net"
}

mynettest
