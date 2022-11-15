# Script to test if user is root (uid = 0) or not for package install
# Copy script to /tmp to test

# Concepts illustarted
# 1) -y option for automatic 'yes' in install commands
# 2) tput changes terminal settings (setaf -> set foreground color)
# 3) if-then-else-fi
# 4) condition check using 
#	'test'
#	'[ ]'
#	executing command and checking error code (line with dpkg)
# 5) Nested if using elif

myuid=$(id -u)
if [ $myuid -eq 0 ]
then
	echo "Can install software"
	read -p "Enter package name:" pack
	if dpkg -s $pack &> /dev/null
	then
		tput setaf 6
		echo "$pack already installed"
		tput setaf 7
	elif apt install $pack -y &> /dev/null 
	then
		echo "Install success"
	else
		tput setaf 1
		echo "Install fail with code"
		tput setaf 7
	fi

else
	echo "Can't install software"
fi
