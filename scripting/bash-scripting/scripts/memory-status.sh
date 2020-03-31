#!/bin/bash
#
# SCRIPT: memory-status
# AUTHOR: suraj
# DATE:   26/03/2020
# REV:    1.1.A (Valid are A, B, D, T and P)
#          (For Alpha, Beta, Dev, Test and Production)
#
#
# PLATFORM: Specify which os you have written it for
# 
# PURPOSE: can be used to see memory status
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
FILE="/proc/meminfo"

DATE=$(date)

MEMTOTAL=$(grep -i "MEMTOTAL" $FILE)
MEMTOTAL=${MEMTOTAL:17}

MEMFREE=$(grep -i "MEMFREE" $FILE)
MEMFREE=${MEMFREE:17}

MEMAVAILABLE=$(grep -i "MEMAVAILABLE" $FILE)
MEMAVAILABLE=${MEMAVAILABLE:17}

SWAPTOTAL=$(grep -i "SWAPTOTAL" $FILE)
SWAPTOTAL=${SWAPTOTAL:17}

SWAPFREE=$(grep -i "SWAPFREE" $FILE)
SWAPFREE=${SWAPFREE:17}

SWAPAVAILABLE=$(grep -i "SWAPAVAILABLE" $FILE)
SWAPAVAILABLE=${SWAPAVAILABLE:17}

################################################################
################################################################
#          Define Functions here                               #
printData () {
	echo -e "Result generated on $DATE"
	echo -e "\\t\\t total\\t\\t free\\t\\t available"
	echo -e "Mem:\\t\\t$MEMTOTAL\\t$MEMFREE\\t$MEMAVAILABLE"
	echo -e "Swap:\\t\\t$SWAPTOTAL\\t$SWAPFREE\\t$SWAPAVAILABLE"
}
################################################################
################################################################
#          Beginning of Main                                   #
printData
################################################################
# End of script

