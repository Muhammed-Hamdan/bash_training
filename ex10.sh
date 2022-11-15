#!/usr/bin/bash

# Use of trap keyword to respond to signals
# Syntax: trap <func_name> <sig1> <sig2> ..... <sign>
myclear() {

# Can be used to clear all temporary files created
echo cleared all temporary files

# To exit execution properly with a code, use exit keyword
# Syntax: exit <exit_code>
exit 1111

}

trap myclear 2

# While loop
# break -> exit loop
# continue -> next iteration
x=0
while [ $x -lt 10 ]
do
	if [ $x -eq 8 ]
	then
		echo Breaking at $x
		break
	fi
	if [ $x -eq 3 ]
	then
		echo Continuing at $x by double increment
		
		# Mathematical expression in Bash
		x=$(( $x + 1 ))
		# Or use 
		#x=`expr $x + 1`

		continue
	fi
	echo In iteration $x
	x=$(( $x + 1 ))

	# To delay/schedule execution, use sleep command
	# Syntax: sleep <sec>
	#sleep 1
done


# Getting options in the shell script

# Handle invalid (options)/(values for options) using usage function
usage() {
	echo "Usage: [-p value] [-c value] -n -a"
	exit 1
}

name=vimal
age=22
phone=9087

while getopts "np:ac:" ch
do
	case $ch in
		n)
			echo $name;;
		a)
			echo $age;;
		p)
			# Access value of option using $OPTARG variable
			echo $OPTARG;;
		c)
			echo $OPTARG;;
		*)
			usage;;
	esac
done
