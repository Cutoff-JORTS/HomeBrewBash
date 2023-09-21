#! /bin/bash

#Menu Script
#rudimentary menu to learn how to combine stuff
#Author: jort


#Check for existing directory with same name, check for permission to write to cd, then creates if all paramters OK.
function create_directory () {
	declare -l dirname
	read -p "Enter name of desired directory: " dirname
		if	[[ -e dirname ]]
		then	 echo "Directory $dirname already exists."
		read -p "Please re-enter name of desired directory (failure returns to menu): " dirname
		fi
	if [[ -w $PWD ]]
		then mkdir $dirname
		else echo "You do not have permissions to create directory here."
		read -sn1 -p "Press any key to exit."
		echo " "
		exit 1
	fi
}

#More UX-friendly directory navigation
function change_location () {
	declare newlocation 
	read -p "Please enter full path of desired location on your system: " newlocation
	cd $newlocation
	echo "Thank you for your paatience, you are now in: $PWD"
}

#More UX-friendly options to display directory contents
function display_contents {
	echo "Current location: $PWD. This directory contains the following: "
	echo " "
	ls -al
}

while true; do
 clear
 echo "Please choose your desired action from the following list:"
 echo "1: list users currently logged in"
 echo "2: create a new directory"
 echo "3: show current location and contents"
 echo "4: change location"
 echo "5: quit"
 read -sn1
 case "$REPLY" in 
  1) who;; 
  2) create_directory;;
  3) display_contents;;
  4) change_location;;
  5) exit 0;;
 esac

 read -sn1 -p "Press any key to continue."
done
