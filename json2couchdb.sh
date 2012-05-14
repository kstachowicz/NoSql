#!/bin/bash
#import technology diggs from digg.com to couchdb


if [ $# -ne 3 ]; then


	clear

	echo "          json2couchdb script"
	echo "          ------- ----"
	echo "Conversion is not possible, because of invalid script run. "
	echo "Choose one of the following options (press the letter):" 
	echo
	echo "[H]elp, for information how to use the script"
	echo "[Q]uit"
	echo

	read option

		case "$option" in


			"H" | "h" )
			echo
			echo "You pressed [H]. That means, you want to know more about using the script"
			echo "Run file: ./json2couchdb.sh [HOSTNAME] [NAME_OF_THE_DATABASE] [JSON_FILE_PATH]"
			echo "Example: ./json2couchdb.sh http://localhost:5984 test technology.json"
			;;

			"Q" | "q" )
			echo
			echo "Exit the script"
			;;
			esac
else

#$1-host
#$2-db
#$3-filename

	echo "Deleting the database: " $1"/"$2

	curl -X DELETE  $1"/"$2


	echo "Creating new database: "$1"/"$2
	curl -X PUT  $1"/"$2

	while read line 
	do
		curl -d "$line" -X POST -H "Content-Type: application/json" $1"/"$2 
	done < $3;

fi


exit 0


