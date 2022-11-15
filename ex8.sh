#!/usr/bin/bash
# Hash-bang/shebang to tell location of bash program

tput setaf 6
echo -e "\t\t\tWelcome to chat program"
tput setaf 7

echo "Enter task to perform:"
echo "Press 1: Start chat"
echo "Press 2: Manage script externally"
echo "Press 3: Send remote log to support team"
read -p "Enter your choice:" ch

if [ $ch -eq 1 ]
then
	read -p "Enter the port number to start chat:" myport
	echo "Chat started at # nc $(hostname -i) $myport	..."
	nc -l $myport
elif [ $ch -eq 2 ]
then
	echo "Manage script"
elif [ $ch -eq 3 ]
then
	echo "Enter port number to transfer log:" myport
	echo "Log transfer at # nc $(hostname -i) $myport	..."
	nc -l $myport > support.txt
fi
