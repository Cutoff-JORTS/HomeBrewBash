#!/bin/bash

touch /home/bilbo/SensorLogs.txt
declare log="/home/bilbo/SensorLogs.txt"

while true; do
  date > $log
  echo "---------------------" >> $log
  echo " "
  echo "================" >>$log
  echo "Thermal Sensors:" >>$log
  echo "================" >>$log
  echo " "
	  sensors >> $log
  echo "----------------------------" >>$log
  echo "   Network Connectivity:" >>$log
  echo "----------------------------" >>$log
	ifconfig >>$log
 echo " "
  echo "----------------------------" >> $log
  echo "*****ACTIVE CONNECTIONS*****:" >>$log
  echo "----------------------------" >>$log
	sudo netstat -pano | grep ESTABLISHED | awk '{print $4, $5, $7, $8, $9}' > /tmp/ports.list ; sed -i 's/ /....../g' /tmp/ports.list && cat /tmp/ports.list >> $log
 echo " "
  echo "----------------------------" >> $log
  echo " Storage Capacity Detected:" >>$log
  echo "----------------------------" >>$log
	  df -hT >>$log
 echo " "
 echo "List of new files added to server can be found here: /jortpool/LabStorage/Personal_Vault/Nightly-Backup-Log.txt" >> $log
	sleep 5
done

