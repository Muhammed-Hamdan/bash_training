echo number{1..10}	# Range of numbers using {<start_no>..<end_no>..<step>}
echo number{20..-4..2}

#String slicing ${<var_name>:<start_index>:<num_char>}
x="Hello world forever"
echo ${x:6:7}

#Constant variable => use 'readonly'
readonly const=64
const=80
echo exit status of changing readonly:$?

#Get complete path of file in variable => use $(pwd)
pat=$(pwd)/filename.ext
echo $pat

#String strip from suffix use % in {}
#String strip from suffix till last occurence use %% in {}
#String strip from prefix use # in {}
#String strip from prefix till last occurence use ## in {}
echo ${pat%/*}
echo ${pat#/*/*}
echo ${pat%%/bash*}

link="http://www.google.com:443/data/hi.html"
echo ${link}
echo ${link%/*}
echo ${link%%/*}
echo ${link%%:*}
echo ${link#*http}
echo ${link#*http:}
echo ${link#*http://}
echo ${link##*/}
echo ${link##*.com}
# H/w cut out domain name from https link (www.___________.com)
domain_name=${link##*www.}
domain_name=${domain_name%%.com*}
echo Domain name:$domain_name

#Counting length of variable, use # before varname in {}
readonly str="Thus is a string"
echo $str
echo Length is:${#str}
