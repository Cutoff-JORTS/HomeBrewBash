#! /bin/bash

#TV List - creates list of TV shows in my repository
#Author - jort
 
# VARIABLES ------------------------------------------------------

#designated landing directory for data
destination="/jortpool/LabStorage/Media/Lists"

#designated directory to search
searchpool="/jortpool/LabStorage/Media/TV"

#name of raw search restult log files
rawlist="/jortpool/LabStorage/Media/Lists/.rawlist.txt"

#name of finla result logs
completedlist="/jortpool/LabStorage/Media/Lists/TV_Library.txt"

#user Interface
endofscript="Task completed, captain. Files are avialable, arranging them now."

# SCRIPT PROPER -------------------------------------------------
clear
touch $rawlist $completedlist
ls $searchpool > $rawlist

echo "Full List of TV Shows available on this system: " > $completedlist
echo "---------------------------------------------" >> $completedlist

sed -e 's/jortpool/-/; s/LabStorage/-/; s/Media/-/; s/Movies/-/;' $rawlist >>  $completedlist

echo $endofscript
sleep 2


echo "Here are your results: " && sleep 1
less $completedlist

#end of program -------------------------------------------------
