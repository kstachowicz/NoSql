#!/bin/bash
#import technology diggs from digg.com to mongodb

hostname = $1;
db=$2;
collection=$3;
fileName = $4;

if [ $# -ne 4 ]; then

	clear

	echo "          json2mongodb script"
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
			echo "Run file: ./json2mongodb.sh [HOSTNAME] [NAME_OF_THE_DATABASE] [NAME_OF_THE_COLLECTION] [JSON_FILE_PATH]"
			echo "Example: ./json2mongodb.sh localhost test diggs technology.json"
			#echo "We assume you are working on the localhost database. Please edit the script"
			#echo "if you are using another host"
			;;

			"Q" | "q" )
			echo
			echo "Exit the script."
			
		esac
else
	#mongoimport --host localhost --db $db --collection $collection --type json --file $fileName
	mongoimport --host hostname --db $db --collection $collection --type json --file $fileName
fi


exit 0
