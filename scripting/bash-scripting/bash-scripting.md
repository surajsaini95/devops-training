
# Let's talk with Bash !


## Scripting
It basically involves writing a series of commands that are interpreted one by one at runtime unlike programming languages that are compiled first before running.

So yes we will be talking with bash through **scripts**. 

## Bash ( Bourne-Again SHell )

Bash is one of several well known UNIX shells, its wide distribution with Linux makes it an important tool to know. 

Although Bash is primarily a command interpreter, it's also a programming language. Bash supports variables, functions and has control flow constructs, such as conditional statements and loops. .

## Shells

Shell is an environment in which we can run our commands, programs, and shell scripts. There are differen t flavors of a shell, just as there are different flavors of operating systems.

Evolution of shell

- **Bourne shell** - the first shell to appear on Unix systems

- **C shell**- _csh_, was modeled on the C programming language

- **Korn Shell** - It incorporated all the features from the c shell (csh) and tcsh(a type of shell) .It is faster than C shell.

- **Bash** - It is an improved bourne shell and incorporates useful features from the Korn shell  and the C shell .

## Lets write a script
To create a script file save it with **.sh** extension and the below code.

#!/bin/bash

echo "How are you bash?"

To execute the above script you can either use "bash my-script.sh" or " ./myscipt.sh " .Also don't forget to give execute permissions. 

The first line of every script  should provide the path to the interpreter after the Shebang (#!)

## How to use Variables 

A variable is nothing more than a pointer to the actual data. The bash enables you to create, assign, and delete variables.

Syntax
variable_name=variable_value //syntax to delcare a variable

Types of variables

i. **Local Variables** − A local variable is a variable that is present within the current instance of the shell and are declared using **local** keyword.

ii. **Environment Variables** − An environment variable is available to any child process of the shell and are declared using **export** keyword.

Example
```
#!/bin/bash
str1="Bash"	 		//declares variable
str2="Scripting"
echo "$str1 $str2"		//prints "Bash Scripting"
unset str1			//deletes a variable
unset str2
```
## Basic Operators

Bash supports the following operations
-   Arithmetic Operators
-   Relational Operators
-   Boolean Operators
-   String Operators
-   File Test Operators

## Decision Making
While writing a bash script, there may be a situation when you need to adopt one path out of the given two paths. So you need to make use of conditional statements that allow your program to make correct decisions and perform the right actions.

The following are conditional statements which are used to perform different actions based on different conditions.
- The if..elif..else statement
	- a series of _if_ statements can be written , where each _if_ is part of the _else_ clause of the previous statement. Here statement(s) are executed based on the true condition, if none of the condition is true then _else_ block is executed.
	- Example ( bash function to  compare 2 values)
	
```
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
```	

- The case...esac statement

	- used when all of the branches depend on the value of a single variable.
	
	- Example ( bash function to spell a digit)
	
	```
	spellDigit(){
	case $1 in
		0) echo "Zero" ;;
		1) echo "One"  ;;
		2) echo "Two" ;;
		3) echo "Three"	;;
		4) echo "Four" ;;
		5) echo "Five"	;;
		6) echo "Six" ;;
		7) echo "Seven"	;;
		8) echo "Eight" ;;
		9) echo "Nine"	;;
		*) echo "Unknown digit"	;;
	esac
	}
	```


## Loop - An  iterating body 

A loop is a powerful programming tool that enables you to execute a set of commands repeatedly.The types of loops available are : 
-  The **while** loop 
	- enables you to execute a set of commands repeatedly until some condition occurs.
	- Example
	```
	printNaturalNumber(){
		i=1
		while [ $i -le $1 ]
		do
		echo "$i"
		i=`expr $i + 1`
		done
	}
	```
	
  - The **for** loop
		  - for loop operates on lists of items.
		  - Example
		  
```
#!/bin/bash
printFiles(){
for FILE in $1/*
do
echo "$FILE"
done
}
printFiles .    
```
	
-   The until loop
	- execute a set of commands until a condition is true.
	- works just opposite of while loop
	- Example
```
printNaturalNumber(){
i=1
until [ $i -ge $1 ]  
do
	echo "$i"
	i=`expr $i + 1`
done
}
```

 -   The select loop
	 - The **select** loop provides an easy way to create a numbered menu from which users can select options. 
	 - It is useful when you need to ask the user to choose one or more items from a list of choices.
	 - Example
```
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
```


## Functions

Functions enable you to break down the overall functionality of a script into smaller, logical subsections, which can then be called upon to perform their individual tasks when needed.
Functions can be defined in two ways :

```
function_name () {
#commands
}

OR

function function_name {
#commands
}
```

**Pass Parameters to a Function**
```
#!/bin/bash
foo()  { 
   echo "Parameters received :  $1 $2"  
}
foo Hello Bash 
```

** Returning Values from Functions**
Based on the situation you can return any value from your function using the **return** command  which can be captured by $? from where the function is called.

```	
#!/bin/sh
add(){
	local sum=`expr $1 + $2`
	return sum
}
add 10 20
sum=$?
echo "Sum is $sum"
```

# Array in bash

Arrays provide a method of grouping a set of variables. Instead of creating a new name for each variable that is required, you can use a single array variable that stores all the other variables.

  
- Declaration syntax
    ```declare -a array_name ```
	    
    ```array_name=[value1,value2,....valueN]```

- Common usage syntax
	>arr=()   		 // Create an empty array
	>${#arr[@]}  //   Calculate array size
	>arr[0]=3   //  Overwrite 1st element
	>arr+=(4)   //  Append value(s)
	>${arr[@]:s:n}   //  Retrieve n elements starting at index s

- Example to iterate over an array 
	```#!/bin/bash
	   arr=(1 sam 3 4 5)
	   for i in ${arr[@]}
	   do
	   	 echo $i
	   done```	
	   
## Do more with Dictionaries in bash

Dictionary / associative arrays / hash map are very useful data structures and they can be created in bash.

- Syntax
	> $ declare -A dictionary_name

- Adding key-value pairs
	> $ dictionary_name[key]=value

- Retrieve key-values
	> echo ${dictionary_name[key]}

- Delete a key in a dictionary
	>unset dictionary_name[key]

- Example
```
#/bin/bash
foo-dict() {
	declare -A person
	person=([name]=sam [age]=10 [gender]=male)  
	echo ${person["name"]}  // prints sam
	echo "All values are  : ${person[@]} "
	unset person[age]  // deletes a pair
	echo "All values are  : ${person[*]} "
	echo "All keys are  : ${!person[*]} "
	unset person  // delete complete person
}
foo-dict
```



### The above discussed topics will help any beginner to understand and also to do hands-on bash scripting. 

### Keeping talking with BASH !!!
