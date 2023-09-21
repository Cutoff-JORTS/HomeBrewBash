#! /bin/bash

#DirectoryMaker
#it...makes directories and brings you to them.
#Author: jort


#Variables--------
declare -l DIRname

#Code------
echo "Please enter desired directory (full path please):"
read DIRname

if
	[[ -e $DIRname ]]
then	echo "Directory called $DIRname already exists, dingus. Now closing program."
	 exit 1
else
	if
		[[ -w $PWD ]]
	then
		mkdir $DIRname && cd $DIRname
			echo "Great job, dingus. Directory created."
	else
		echo "You do not have permission to create directories here, dingus. now closing program."
		exit 2
	fi
fi

#final check for end user-------

echo "Here is your current location, you brilliant ray of sunshine: " && pwd
