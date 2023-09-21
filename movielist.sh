#! /bin/bash

#MovieList - creates list of movies in my repository
#Author - jort
 
# VARIABLES ------------------------------------------------------

#designated landing directory for data
destination="/jortpool/LabStorage/Media/Lists"

#designated directory to search
searchpool="/jortpool/LabStorage/Media/Movies"

#name of raw search restult log files
mkvlist="/jortpool/LabStorage/Media/Lists/.mkvlist.txt"
mp4list="/jortpool/LabStorage/Media/Lists/.mp4list.txt"

#name of finla result logs
completedlist="/jortpool/LabStorage/Media/Lists/Film_Library"

#tasks
findmkv="find $searchpool -path $searchpool*.mkv"
findmp4="find $searchpool -path $searchpool*.mp4"
filelist="ls $destination"

#user Interface
endofscript="Task completed, captain. Files are avialable, arranging them now."

# SCRIPT PROPER -------------------------------------------------
clear
touch $mkvlist $mp4list
$findmkv > $mkvlist
$findmp4 > $mp4list
echo "Full List of flims available on this system: " > $completedlist
echo "---------------------------------------------" >> $completedlist

sed -e 's/jortpool/-/; s/LabStorage/-/; s/Media/-/; s/Movies/-/;' $mkvlist >>  $completedlist
sed -e 's/jortpool/-/; s/LabStorage/-/; s/Media/-/; s/Movies/-/;' $mp4list >>  $completedlist
echo $endofscript
sleep 2


echo "Here are your results: " && sleep 1
less $completedlist

#end of program -------------------------------------------------
