#!/bin/bash

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#SensorLogs - Logging & Audit Script
#Author - JORT
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#Set refresh time in seconds (default == 5s)
declare refresh_timer=5

#Set desired location for log file
declare log="~/"
 touch $log

#Full Logging Script:
while true; do
  date > $log #ensures overwrite previous log entries

#Basic system information
  echo "---------------------" >> $log
  echo "System Information:" >> $log
  echo "---------------------" >> $log
	echo "Hostname: $(hostname)" >> $log
	echo "Linux Version: $(uname -r)" >> $log
	echo "System Uptime: $(uptime -p)" >> $log
	  echo "~~~~~~~~~~~~~~~~" >> $log
	  echo "users logged in::" >>$log
	  echo "~~~~~~~~~~~~~~~~" >> $log
	  	who >> $log
echo " " >>$log

#Thermal Logs (requires lmsensors - install & run to configure sensors before including this section)
#Uncomment to enable
#  echo "================" >> $log
#  echo "Thermal Sensors:" >> $log
#  echo "================" >> $log
#echo " "  >> $log
#	  sensors >> $log
#echo " "  >> $log

#Network Check
  echo "----------------------------" >> $log
  echo "   Network Connectivity:" >> $log
  echo "----------------------------" >> $log
	ifconfig >>$log #uses ifconfig to ensure compatibilty with older distro/kernel builds
echo " " >>$log
  echo "*******************" >> $log
  echo "ACTIVE CONNECTIONS:" >> $log
  echo "*******************" >> $log
	sudo netstat -pano | grep ESTABLISHED | awk '{print $4, $5, $7, $8, $9}' > /tmp/ports.list ; sed -i 's/ /....../g' /tmp/ports.list && cat /tmp/ports.list >> $log
echo " " >>$log

#Check Filesystems
  echo "----------------------------" >> $log
  echo " Storage Capacity Detected:" >> $log
  echo "----------------------------" >> $log
	  df -hT >> $log

echo " " >> $log

#Add any Custom Messages here:
echo "****************" >> $log
echo "Custom Messages:" >> $log
echo "****************" >> $log

echo "<your message here>" >> $log
echo " " >> $log
echo "Thank you for running SensorLogs -JORT" >> $log


#Refresh log
sleep $refresh_timer
done

