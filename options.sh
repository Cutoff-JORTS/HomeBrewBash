
#Options Practice
#This is a script written to learn how to iterate optional arguments into my scripts
#Author - jort

#------------------------------------------------------------------

while getopts ':cd' opt
do

 while (( $# )); do 
  if ! [[ $1 =~ ^- ]] ; then 
   username=$1
  fi
 shift
 done
	case "$opt" in
		c) sudo useradd -m "$username"
		 break ;;
		d) sudo userdel -r "$username"
		 break ;;
		*) echo "Required Syntax: $0 [-c|-d] desired_name_here" ;;

	esac

done
