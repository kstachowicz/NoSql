#!/bin/bash
#import technology diggs from digg.com to mongodb

db=$1;
collection=$2;


clear

echo "          json2mongodb script"
echo "          ------- ----"
echo "Choose one of the following options (press the letter):" 
echo
echo "[H]elp, for information how to use the script"
echo "[C]onvert json data to mongodb (DB:" $db " COLLECTION:" $collection ")"
echo "[Q]uit"
echo

read option

case "$option" in


  "H" | "h" )
  echo
  echo "You pressed [H]. That means, you want to know more about using the script"
  echo "Run file: ./json2mongodb.sh [NAME_OF_THE_DATABASE] [NAME_OF_THE_COLLECTION]"
  echo "We assume you are working on the localhost database. Please edit the script"
  echo "if you are using another host"
  ;;

   "C" | "c" )
  echo
  echo "You pressed [C]. That means, you want to convert you json data to mongodb"
  echo "You run file with parameters:"
  echo "NAME OF THE DATABASE: " $db
  echo "NAME OF THE COLLECTION " $collection
 if [ $# -ne 2 ]; then
	echo "Invalid start of the file. Please check [H]elp option for more details";

else
mongoimport --host localhost --db $db --collection $collection --type json --file technology.json
fi
;;
esac

exit 0
