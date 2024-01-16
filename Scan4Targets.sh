#! /bin/bash

# Search4Targets
#   Author: jort
# does what it says on the tin

read -p "Please enter the IP address of your target network (ex: 192.168.50.0): " TargetNetwork


$TargetList='/tmp/jortscan/targets.list'

echo "Thank you. Now scanning: $TargetNetwork/24 (all addresses in range 0 - 255)..."

nmap -n -sn $TargetNetwork/24 | grep "Nmap scan" | cut -d" " -f5 > /tmp/jortscan/targets.list

echo "Succesful scan. Target list available in $TargetList ."
echo "-----------------------------------------------"
echo "File Details: "
ls -al /tmp/jortscan/ | grep targets.list
