#! /bin/bash

# Automate updating list of directory contents for desired folders
	# note - Each function avialable as an existing standalone script in /home/bilbo/Github_Repositories/bash-scripts/
# Author - jort

#-----------------------------------------------------------------
#Global Variables:
#User-added libraries go here (please replace filepath with master folder for each type of media)
declare -g TVsearch="/jortpool/LabStorage/Media/TV"
declare -g moviesearch="/jortpool/LabStorage/Media/Movies"
declare -g gamesearch="/jortpool/LabStorage/Media/Games/"
#Log-related variables here. User only needs to update for their desired log path
declare -g LogPath="/jortpool/LabStorage/Media/Lists"
	declare -g rawTV="$LogPath/.rawTV.txt"
	declare -g completedTV="$LogPath/TV_LibraryGLOBAL_VARIABLES_BABY.txt"
	declare -g completedMovies="$LogPath/Film_LibraryGLOBAL_VARIABLES_BABY.txt"
	declare -g completedgames="$LogPath/Game_LibraryGLOBAL_VARIABLES_BABY.txt"
	declare -g mkvlist="$LogPath/.mkvlist.txt"
	declare -g mp4list="$LogPath/.mp4list.txt"
	declare -g rawgames="$LogPath/.rawlistgames.txt"
#---------------------------------------------------------------

function TVlist {
	touch $rawTV $completedTV
	ls $TVsearch > $rawTV

	echo "Full List of TV Shows available on this system: " > $completedTV #Overwrites old data
	echo "---------------------------------------------" >> $completedTV

	sed -e 's/jortpool/-/; s/LabStorage/-/; s/Media/-/; s/Movies/-/;' $rawTV >>  $completedTV

}

function movielist {
	#tasks
	findmkv="find $moviesearch -path $moviesearch*.mkv"
	findmp4="find $moviesearch -path $moviesearch*.mp4"

	# SCRIPT PROPER -------------------------------------------------
	clear
	touch $mkvlist $mp4list
	$findmkv > $mkvlist
	$findmp4 > $mp4list
	echo "Full List of flims available on this system: " > $completedMovies #Overwrites old data
	echo "---------------------------------------------" >> $completedMovies

	sed -e 's/jortpool/-/; s/LabStorage/-/; s/Media/-/; s/Movies/-/;' $mkvlist >>  $completedMovies
	sed -e 's/jortpool/-/; s/LabStorage/-/; s/Media/-/; s/Movies/-/;' $mp4list >>  $completedMovies

}

function gamelist {
	touch $rawgames $completedgames
	tree $gamesearch > $rawgames

	echo "Full List of game ROMs available on this system: " > $completedgames #Overwrites old data
	echo "---------------------------------------------" >> $completedgames

	sed -e 's/jortpool/-/; s/LabStorage/-/; s/Media/-/; s/Games/-/;' $rawgames >>  $completedgames
}

TVlist
movielist
gamelist

cls
echo "it worked! do you want a cookie or something?"