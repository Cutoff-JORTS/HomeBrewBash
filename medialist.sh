#! /bin/bash

# Automate updating list of directory contents for desired folders
	# note - Each function avialable as an existing standalone script in /home/bilbo/Github_Repositories/bash-scripts/
# Author - jort

#Global variable for log data
declare timestamp=$(date)
function TVlist {
# VARIABLES ------------------------------------------------------

#designated directory to search
TVsearch="/jortpool/LabStorage/Media/TV"

#name of raw search restult log files
rawTV="/jortpool/LabStorage/Media/Lists/.rawTV.txt"

#name of final result logs
completedTV="/jortpool/LabStorage/Media/Lists/TV_Library.txt"

# SCRIPT PROPER -------------------------------------------------
touch $rawTV $completedTV
ls $TVsearch > $rawTV

echo "Data current as of: $timestamp" > $completedTV
echo "---------------------------------------------" >> $completedTV
echo "Full List of TV Shows available on this system: " >> $completedTV
echo "---------------------------------------------" >> $completedTV

sed -e 's/jortpool/-/; s/LabStorage/-/; s/Media/-/; s/Movies/-/;' $rawTV >>  $completedTV

}

function movielist {
# VARIABLES ------------------------------------------------------

#designated directory to search
moviesearch="/jortpool/LabStorage/Media/Movies"

#name of raw search restult log files
mkvlist="/jortpool/LabStorage/Media/Lists/.mkvlist.txt"
mp4list="/jortpool/LabStorage/Media/Lists/.mp4list.txt"

#name of final result logs
completedMovies="/jortpool/LabStorage/Media/Lists/Film_Library.txt"

#tasks
findmkv="find $moviesearch -path $moviesearch*.mkv"
findmp4="find $moviesearch -path $moviesearch*.mp4"

# SCRIPT PROPER -------------------------------------------------
clear
touch $mkvlist $mp4list
$findmkv > $mkvlist
$findmp4 > $mp4list

echo "Data current as of: $timestamp" > $completedMovies
echo "---------------------------------------------" >> $completedMovies
echo "Full List of flims available on this system: " >> $completedMovies
echo "---------------------------------------------" >> $completedMovies

sed -e 's/jortpool/-/; s/LabStorage/-/; s/Media/-/; s/Movies/-/;' $mkvlist >>  $completedMovies
sed -e 's/jortpool/-/; s/LabStorage/-/; s/Media/-/; s/Movies/-/;' $mp4list >>  $completedMovies

}

function gamelist {
#designated directory to search
gamesearch="/jortpool/LabStorage/Media/Games/"

#name of raw search restult log files
rawgames="/jortpool/LabStorage/Media/Lists/.rawlistgames.txt"


#name of final result logs
completedgames="/jortpool/LabStorage/Media/Lists/Game_Library.txt"
touch $rawgames $completedgames

echo "searching..."

tree $gamesearch > $rawgames

echo "Data current as of: $timestamp" > $completedgames
echo "---------------------------------------------" >> $completedgames
echo "Full List of game ROMs available on this system: " >> $completedgames
echo "---------------------------------------------" >> $completedgames

sed -e 's/jortpool/-/; s/LabStorage/-/; s/Media/-/; s/Games/-/;' $rawgames >>  $completedgames
}

TVlist
movielist
gamelist
exit 0
