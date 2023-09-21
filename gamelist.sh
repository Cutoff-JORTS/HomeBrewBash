#! /bin/bash

#Game List - creates list of emulator ROMs in my repository
#Author - jort
 
# VARIABLES ------------------------------------------------------

#designated landing directory for data
destination="/jortpool/LabStorage/Media/Lists"

#designated directory to search
searchpool="/jortpool/LabStorage/Media/Games/"

#name of raw search restult log files
rawlist="/jortpool/LabStorage/Media/Lists/.rawlistgames.txt"


#name of final result logs
completedlist="/jortpool/LabStorage/Media/Lists/Game_Library.txt"


#user Interface
endofscript="Task completed, captain. Files are avialable, arranging them now."

# SCRIPT PROPER -------------------------------------------------
clear
touch $rawlist $completedlist

echo "searching..."

tree $searchpool > $rawlist

echo "Full List of game ROMs available on this system: " > $completedlist
echo "---------------------------------------------" >> $completedlist

sed -e 's/jortpool/-/; s/LabStorage/-/; s/Media/-/; s/Games/-/;' $rawlist >>  $completedlist

echo $endofscript
sleep 2

echo "Here are your results: " && sleep 1
less $completedlist

#end of program -------------------------------------------------
