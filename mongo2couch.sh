#!/bin/bash
#import technology diggs from digg.com to couchdb

if [ $# -ne 3 ]; then
 
	clear

	echo "          mongo2couch script"
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
		echo "Run file: ./ mongo2couch.sh [NAME_OF_THE_DATABASE] [NAME_OF_THE_COLLECTION]"
		echo "Example: ./ mongo2couch.sh http://localhost:5984 test diggs"
		;;

		"C" | "c" )
		echo
		echo "You pressed [C]. That means, you want to convert you mongo data to mongodb"
		echo "You run file with parameters:"
		echo "NAME OF THE DATABASE: " $db
		echo "NAME OF THE COLLECTION: " $collection

		;;
esac

else
#$1- host
#$2- db
#$3- collection
		echo "Exporting data from" $2 "database, collection: " $3
		mongoexport --db $2 --collection $3 --out mongoData.json
		
		cat mongoData.json | tr "{ "$oid" : " łańcuch2
		echo "Exporting completed. Migrating data to couchdb:" $1"/"$2
		./json2couchdb.sh $1 $2 mongoData.json
		#rm mongoData.json
fi


exit 0






