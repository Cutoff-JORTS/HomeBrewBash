#! /bin/bash

#_______________________________________________________________________
#JORT's manual backup script.
#Does what it says on the tin. Copies things from one place to another. 
#_______________________________________________________________________

#Establish log location
log='/jortpool/LabStorage/Jason_Safe/manual_bkup.log'
touch $log 

#Establish location of backup location:
destination='/media/fafnir/'


#!/usr/bin/env bash

sourcelist=("$/jortpool/LabStorage/Personal_Vault/" "$/jortpool/LabStorage/Dungeons_and_Dragons/")

for source in "${sourcelist[@]}"; do
    echo "$source"
done



#Establish directories to copy - duplicate up to source<n> as needed.
#cp -furv <source> <source> <dest> >> $log