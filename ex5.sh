# Arrays/List in bash shell
# Declare using ()
# Seperate items using space
# Start index 0
# Access items using [] inside {}
list=(item1 item2 item3 police theif)
echo $list
echo ${list[0]}
echo ${list[-1]}
echo ${list[@]}	# All elements referred using @
echo ${#list[-1]}	# Count number of elements

# Passing arguments/parameters to script stored in variable named <arg_no> i.e 1,2,3,...
#name=${1:-xxxx}
#age=${2:-xx}
#remark=${3:-xxxx}

# To stop executing script and print error if argument not passed used ? in {} after :
name=${1:?"Error name not entered"}
age=${2:?"Error age not entered"}
remark=${3:?"Error remark not entered"}
echo Your name in $name with age $age ur remark is ${remark^^}

# Script name stored in variable 0
echo Script $0 executed successfully

# Special variable @ store argument list completely
# Variable # store number of arguements
echo $@
echo Length of argument list is ${#@}
echo Length of argument list is $#
