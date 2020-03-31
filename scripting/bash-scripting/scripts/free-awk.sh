#!/bin/bash
#
# SCRIPT: free-awk
# AUTHOR: Suraj Saini
# DATE:   26/03/2020
# REV:    1.1.A (Valid are A, B, D, T and P)
#          (For Alpha, Beta, Dev, Test and Production)
#
#
# PLATFORM: Ubuntu
# 
# PURPOSE: To find memory consumption information through awk.
# REV LIST:
#    DATE        : Date of revision
#    BY          : AUTHOR OF MODIFICATION
#    MODIFICATION: Describe the chages made. What do they enhance.
# 
# set -n   # Uncomment to check script syntax, without execution.
#          # NOTE: Do forget comment it back as it won't allow the 
#          # the script to execute.
#
set +x   # Uncomment this for debugging this shell script.
#
#
################################################################
#          Define Files and Variables here                     #
################################################################

fileName="/proc/meminfo"
totalMemory=$(awk '/MemTotal/{print}' $fileName)
freeMemory=$(awk '/MemFree/{print}' $fileName)
availableMemory=$(awk '/MemAvailable/{print}' $fileName)
buffers=$(awk '/Buffers/{print}' $fileName)
cached=$(awk '/^Cached/{print}' $fileName)
				
################################################################
#          Define Functions here                               #
################################################################

print_memory_info(){

	arg=$1
	case ${arg} in 

		free)
			flagValue=$2
			case ${flagValue} in
				-m) echo "You chose free -m"
					echo -e "The Total memory available is \t : $totalMemory"
					echo -e "The Free memory available is \t : $freeMemory"
					echo -e "The memory available is \t : $availableMemory"
					echo -e "The buffer available is \t : $buffers"
					echo -e "The cache memory available is \t : $cached"
				;;

				-h) echo "You chose free -h"
					echo -e "The Total memory available is \t : $totalMemory"
					echo -e "The Free memory available is \t : $freeMemory"
					echo -e "The memory available is \t : $availableMemory"
					echo -e "The buffer available is \t : $buffers"
					echo -e "The cache memory available is \t : $cached"
				;;

				-g) echo "You chose free -g"
					echo -e "The Total memory available is \t : $totalMemory/10000000"
					echo -e "The Free memory available is \t : $freeMemory/10000000"
					echo -e "The memory available is \t : $availableMemory/10000000"
					echo -e "The buffer available is \t : ${buffers}/10000000"
					echo -e "The cache memory available is \t : $cached/10000000"
				;;
				*) 
				echo "You didn't choose a valid free tag."
				;;

			esac
		;;

		*) 
		echo "You didn't choose anything."
		;;

	esac
}

################################################################
#          Beginning of Main                                   #
################################################################

print_memory_info $1 $2

# End of script
