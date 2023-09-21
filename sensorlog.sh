#!/bin/bash

touch /home/bilbo/SensorLogs.txt
declare log="/home/bilbo/SensorLogs.txt"

while true; do
  date > $log
  echo "---------------------" > $log
  sensors > $log
  sleep 1
done

