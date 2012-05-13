#!/bin/bash
#import technology diggs from digg.com to couchdb

hostname = $1;
db=$2;
fileName = $3;

if [ $# -ne 1 ]; then

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
			
			#echo "We assume you are working on the localhost database. Please edit the script"
			#echo "if you are using another host"
			;;

			"Q" | "q" )
			echo
			echo "Exit the script"
			;;
			esac
else
	echo "Deleting the database: $dbName "
	#curl -X DELETE  "http://localhost:5984/"$db
	curl -X DELETE  $hostname/$db

	echo "Creating new database: $dbName "
	curl -X PUT  $hostname/$db

	while read line 
	do
		curl -d "$line" -X POST -H "Content-Type: application/json" $hostname/$db 
	done < $fileName;

fi


exit 0


