#! /bin/bash

#_______________________________________________________________________
#JORT's manual backup script.
#Does what it says on the tin. Copies things from one place to another. 
#_______________________________________________________________________

#Establish log location
log='/jortpool/LabStorage/Personal_Vault/Jason_Safe/manual_bkup.log'
touch $log 

#Establish location of backup location:
destination='/media/fafnir/'

#Add sources, separated by space:
sourcelist=("/jortpool/LabStorage/Personal_Vault/" "/jortpool/LabStorage/Dungeons_and_Dragons/")

#Actual copy job:
for source in "${sourcelist[@]}"; do
cp -Rriv -u --preserve=all "$source" "$destination" > $log
done
