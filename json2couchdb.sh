#!/bin/bash
#import technology diggs from digg.com to couchdb

db=$1;


clear

echo "          json2couchdb script"
echo "          ------- ----"
echo "Choose one of the following options (press the letter):" 
echo
echo "[H]elp, for information how to use the script"
echo "[C]onvert json data to couchdb (DB:" $db ")"
echo "[Q]uit"
echo

read option

case "$option" in


  "H" | "h" )
  echo
  echo "You pressed [H]. That means, you want to know more about using the script"
  echo "Run file: ./json2couchdb.sh [NAME_OF_THE_DATABASE]"
  echo "We assume you are working on the localhost database. Please edit the script"
  echo "if you are using another host"
  ;;

   "C" | "c" )
  echo
  echo "You pressed [C]. That means, you want to convert you json data to mongodb"
  echo "You run file with parameters:"
  echo "NAME OF THE DATABASE: " $db

 if [ $# -ne 1 ]; then
	echo "Invalid start of the file. Please check [H]elp option for more details";

else
echo "Deleting the database: $dbName "
curl -X DELETE  "http://localhost:5984/"$db

echo "Creating new database: $dbName "
curl -X PUT  "http://localhost:5984/"$db

while read line 
do
	curl -d "$line" -X POST -H "Content-Type: application/json" "http://localhost:5984/"$db #$host/$dbName
done < "technology.json";

fi
;;
esac

exit 0


