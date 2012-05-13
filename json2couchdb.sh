while read line 
do
	curl -d "$line" -X POST -H "Content-Type: application/json" "http://localhost:5984/lz/" #$host/$dbName
done < "technology.json";
