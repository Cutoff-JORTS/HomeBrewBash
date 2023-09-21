#! /bin/bash

#SeasonChecker
#Tells you what season it is.
#Author: jort

#Setting Variables---------
declare -l month=$(date +%b)

case $month in
 ( dec | jan | feb )
	echo "It is Winter, turn up the heat!";;
 ( mar | apr | may )
	echo "It is Springtime, look at the birds!";;
 ( jun | jul | aug )
	echo "It is summertime, turn up the AC!";;
 ( sep | oct | nov )
	echo "It is autum, grab your flannel!";;
esac
