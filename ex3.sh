echo -n "Enter name:"
read myname
#Use default value property '-' in {} to handle empty/undefined input
#Refer: https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html
unset myname
x=${myname:-don} 
#x=${myname:=don} 	# Same as -
#x=${myname:+don}	# Empty string "" check 
#x=${myname+don}	
echo "your name is ${x^}"	# ^ Capitalize first letter, ^^ capitalize complete, , to flip case

y=/one/two/three/four/file.ext1
echo "new extension ${y%.ext1}.ext2"
#echo "new extension ${y%.*}.ext2"	# Works for any extension
link="http://www.google.com:443/data/hello.html"
echo ${link}
echo ${link%/*}
echo ${link%/*/*}
echo ${link%:*/*/*}
