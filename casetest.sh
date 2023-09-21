#! /bin/bash

while true; do
	read -p "Please enter your response: " var
	echo " "
case "$var" in
	yes) echo "good, we agree." && exit ;;
	no) echo "well fuck you then." && exit ;;
	*) echo "Invalid response, try again dick-for-brains." && echo " ";;
esac
done
