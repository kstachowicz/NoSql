#!/bin/bash
#import technology diggs from digg.com to mongodb



if [ $# -ne 3 ]; then


#db=$1;
#collection=$2;
#myfileName = $3;

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
			echo "Run file: ./json2mongodb.sh [NAME_OF_THE_DATABASE] [NAME_OF_THE_COLLECTION] [JSON_FILE_PATH]"
			echo "Example: ./json2mongodb.sh test diggs technology.json"
			;;

			"Q" | "q" )
			echo
			echo "Exit the script."
			
		esac
else
	echo "Inserting into '" $1 "' database collection named '" $2 "' based on data from  '" $3 "' file"
	mongoimport --host localhost --db $1 --collection $2 --type json --file $3
fi


exit 0
