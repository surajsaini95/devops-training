#!/bin/bash
#
# SCRIPT: session-demo
# AUTHOR: suraj
# DATE:   30-03-2020
# REV:    1.1.A (Valid are A, B, D, T and P)
#          (For Alpha, Beta, Dev, Test and Production)
#
#
# PLATFORM: Specify which os you have written it for
# 
# PURPOSE: its purpose
# REV LIST:
#    DATE        : Date of revision
#    BY          : AUTHOR OF MODIFICATION
#    MODIFICATION: Describe the chages made. What do they enhance.
# 
# set -n   # Uncomment to check script syntax, without execution.
#          # NOTE: Do forget comment it back as it won't allow the 
#          # the script to execute.
#
# set +x   # Uncomment this for debugging this shell script.
#
#
################################################################
#          Define Files and Variables here                     #

################################################################
################################################################
#          Define Functions here                               #
add(){
	res=`expr $1 + $2`
	echo "Sum = $res"
}
sub(){
	res=`expr $1 - $2`
	echo "Diff = $res"
}
mul(){
	res=`expr $1 \* $2`
	echo "Mul = $res"
}
div(){
	res=`expr $1 / $2`
	echo "Div = $res"
}
# if
equal(){
	if [ $1 -eq $2 ]
	then
		echo "Equal"
	elif [ $1 -gt $2 ]
	then
		echo "$1 is big"
	elif [ $1 -lt $2 ]
	then
		echo "$2 is big"
	fi
}
# case
spellDigit(){
	case $1 in
		1) echo "One"	;;
		2) echo "Two" ;;
		3) echo "Three"	;;
		4) echo "Four" ;;
		5) echo "Five"	;;
		6) echo "Six" ;;
		7) echo "Seven"	;;
		8) echo "Eight" ;;
		9) echo "Nine"	;;
		0) echo "Zero" ;;
		*) echo "Unknown digit"	;;
	esac
}
# readArgumentWithFlag(){
	
# 	for i in "$@"; do
# 		case $i in
# 			ps ) ;;
			
# 		esac
# 	done
# }
# readflags()
# {
# 	rf=$1
# 	case $rf in 
# 		-h | --help) echo "You chose help" ;;
# 		free) rf2=$2
# 			case $rf2 in
# 				-m) echo "You chose free -m" ;;​
# 				-h) echo "You chose free -h" ;;​
# 				-g) echo "You chose free -g" ;;
# 				 *) echo "You didn't choose a valid free tag." ;;
# 			esac
# 		*) echo "You didn't choose anything." ;;
# 	esac
# }
printWhile(){
	i=1
	while [ $i -le $1 ]  # 2 < 7
	do
		echo "$i"
		i=`expr $i + 1`
	done
}
printUntil(){
	i=1
	until [ $i -ge $1 ]  # 2 > 7
	do
		echo "$i"
		i=`expr $i + 1`
	done
}

printFor(){
	for (( i = 1; i < $1; i++ )); do
		echo $i
	done
}

printForIn(){
	for FILE in $1/*
	do
		echo "$FILE"
	done
}

printSelect(){
	HISTORY=Start
	select PAGE in Home Login Admin Student Faculty Exam Result Close
	do
		HISTORY=$HISTORY-\>$PAGE
		if [[ $PAGE = Close ]]
		then
			break
		else
			echo "Currently you are on $PAGE page."
		fi
	done
	echo "Your browsing history is : $HISTORY"
}
# break continue
demo(){
	for var1 in 1 2 3 4 5 
		do
		   for var2 in 1 2 3 4 5
		   do
		      if [ $var1 -eq $var2 ]
		      then
		      	 echo "continue"	
		         continue 2
		      else
		         echo "$var1 $var2"
		      fi
		   done
		done
}
demo1(){
	
	DATE=`date`
	
	#DATE=$(date)
	
	echo "Date is : $DATE:-'Not Available"
}

arrays(){
	arr=(1 sam 3 4 5 6 7 4 sdns)
	for i in ${arr[@]}
	do
		echo $i
	done

	echo "Size : ${#arr[@]}"

	echo "4 Element from index 1 : ${arr[@]:1:4}"

	echo "Element at index 0 : ${arr[0]}"
}

associativeArray(){

	declare -A person

	person=([name]=sam [age]=10 [gender]=male)

	echo ${person["name"]}  # prints sam

	echo ${person["age"]} # prints 10

	echo "All values are  : ${person[@]} "

	unset person[age]  # deletes a pair

	echo "All values are  : ${person[*]} "

	echo "All keys are  : ${!person[*]} "

	for key in ${!person[@]} 
	do
		echo "key=$key value=${person[$key]}"
	done

	unset person  # delete complete person

	echo "All values are  : ${person[@]} "
}
################################################################
################################################################
#          Beginning of Main                                   #
# add $1 $2
# sub $1 $2
# mul $1 $2
# div $1 $2
# equal $1 $2
# spellDigit $1
# readArgumentWithFlag "$@"
# readFlags $1 $2 
# printWhile $1
# printUntil $1
 # printFor $1
# printForIn $1
# printSelect
# demo
# demo1
# arrays
associativeArray
################################################################
# End of script

