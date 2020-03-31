#!/bin/bash
#
# SCRIPT: export-fuction1
# AUTHOR: suraj
# DATE:   
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
str='hello world'
################################################################
################################################################
#          Define Functions here                               #
foo(){
	echo "This is foo"
}
################################################################
################################################################
#          Beginning of Main                                   #
export str
export -f foo
./export-fuction2.sh
################################################################
# End of script

