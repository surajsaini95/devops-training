#!/bin/bash
#
# SCRIPT: nginx-get-request-log
# AUTHOR: Suraj Saini
# DATE:   26/03/2020
# REV:    1.1.A (Valid are A, B, D, T and P)
#          (For Alpha, Beta, Dev, Test and Production)
#
#
# PLATFORM: Ubuntu 18.04
# 
# PURPOSE: can be used to extract all the logs for GET request of nginx
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
NGINX_LOG_LOCATION="/var/log/nginx/access.log.1"
GET_REQUEST_LOGS=$(grep "GET" $NGINX_LOG_LOCATION)
OUTPUT_LOGFILE="nginx-get-request.log"
################################################################
################################################################
#          Define Functions here                               #
startNginx () {
	systemctl start nginx
}
writeLogsToFile () {
	echo "Creating log file as $OUTPUT_LOGFILE in current directory."
	echo $GET_REQUEST_LOGS > $OUTPUT_LOGFILE
}
getAllSourceIP () {
	echo "IP which made GET request on nginx are below : "
	cat $OUTPUT_LOGFILE | grep -o -E "[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}" | sort -u
}
################################################################
################################################################
#          Beginning of Main                                   #
startNginx
writeLogsToFile
getAllSourceIP
################################################################
# End of script