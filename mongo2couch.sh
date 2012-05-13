#!/bin/bash
#import technology diggs from digg.com to couchdb

hostname = $1;
db=$2;
collection=$3;

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
  #echo "We assume you are working on the localhost database. Please edit the script"
  #echo "if you are using another host"
  ;;

   "C" | "c" )
  echo
  echo "You pressed [C]. That means, you want to convert you mongo data to mongodb"
  echo "You run file with parameters:"
  echo "NAME OF THE DATABASE: " $db
  echo "NAME OF THE COLLECTION: " $collection

 if [ $# -ne 2 ]; then
	echo "Invalid start of the file. Please check [H]elp option for more details";

else
mongoexport --db $db --collection $collection --out mongoData.json

./json2couchdb.sh http://localhost:5984 $db mongoData.json
rm mongoData.json
fi
;;
esac

exit 0






