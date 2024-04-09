#! /bin/bash

#Name: JORTclam
#Purpose: Simple scan tool (requires clamAV's clamscan)
#Author: jort
#------------------------------------------------------

#Checks to ensure ClamAV is installed. Will instruct user to install & quit on failure.
sanitycheck="$(which clamscan)"
if [ -z "$sanitycheck" ]; then
        echo "please install ClamAV via package manager for $(uname -r). Thank you"
	exit 1
fi


#Grab target directory from user
clear
echo "Welcome to JORTclam: a clunky-yet-functional script to quickly scan directory contents for viruses with rudimentary logging"
echo " "
read -p "Please enter full path to directory to scan: " scan_target
echo "Thank you. "
read -p "Please enter the name of your desired log file for this scan:" mylog
	log_file="long_$mylog"
	summary="summary_$mylog"
		touch $log_file $summary
		echo "Scan run by: $(whoami) on $(date)" > $log_file
		echo "---------------------------------------------" >> $log_file

echo "Thank you. Your log file will be available in $(pwd) following exit of this command."
echo "For your convenience, this script will display a summary of the results on-screen upon completion."

sleep 1

sudo clamscan -o -i --bell --alert-broken-media=yes -r -l $log_file $scan_target

head -n 2 $log_file > $summary
tail -n 12 $log_file >> $summary

echo "your full logs are located at:"
echo "-- Detail Log:$(pwd)/$log_file"
echo "-- Summary:$(pwd)/$summary"

