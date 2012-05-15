NoSql
=====

Dane
------------
Dane wykorzystywane w projekcie zostały pobrane z serwisu digg.com i zawierają listę 100 ostatnich wpisów (dane z 13.05.2012) nt. technologii. Dane te zostały pobrane przy pomocy programu napisanego w języku c# i zduplikowane dziesięciokrotnie, aby zwiększyć liczbę informacji w bazie (łącznie ~1000).

import
------------
a) Aby uruchomić  plik importu pliku *.json do bazy MongoDB z danymi testowymi należy wpisać:

``` bash
  $ ./json2mongodb.sh test diggs technology.json
```
Gdzie test- nazwa bazy, diggs- nazwa kolekcji

b) Aby uruchomić  plik importu pliku *.json do bazy CouchDB z danymi testowymi należy wpisać:

``` bash
  $ ./json2couchdb.sh http://localhost:5984 test technology.json
```
Gdzie http://localhost:5984 - adres bazy wraz z portem, test- nazwa bazy


export
------------
Import danych z bazy MongoDB do CouchDB znajduje się w pliku `mongo2couch.sh`

``` bash
  $ ./mongo2couch.sh http://localhost:5984 test diggs
```
Gdzie http://localhost:5984 - adres bazy wraz z portem, test- nazwa bazy, diggs- nazwa kolekcji w MongoDB

przykład rekordu json
------------
```json
{
    "diggs":7,
    "status":"upcoming",
    "container":{
        "name":"Technology",
        "short_name":"technology"
    },
    "description":"With a digital camera we easily record beauties and exciting ...",
    "title":"Digital Camera Cleaning and Maintenance-Written by ComeToDeal online store",
    "submit_date":1334743149,
    "media":0,
    "comments":1,
    "thumbnail":{
        "src":"http://cdn3.diggstatic.com/story/digital_camera_cleaning_and_maintenance_written_by_cometodeal_online_store/t.png",
        "contentType":"image/png",
        "originalheight":300,
        "height":62,
        "width":62,
        "originalwidth":300
    },
    "topic":{
        "name":"Technology",
        "short_name":"technology"
    },
    "shorturl":{
        "short_url":"http://digg.com/news/technology/digital_camera_cleaning_and_maintenance_written_by_cometodeal_online_store",
        "view_count":0
    },
    "promote_date":null,
    "link":"http://cometodeal.wordpress.com/2012/04/18/digital-camera-cleaning-and-maintenance-written-by-cometodeal-online-store/",
    "href":"http://digg.com/news/technology/digital_camera_cleaning_and_maintenance_written_by_cometodeal_online_store",
    "id":"20120418095909:b7720394-e9e6-46ed-b6c2-912af258b15c"
}
```

map reduce
------------
Funkcja MapReduce zwraca statystyki dotyczące ilości powtórzeń liczby wykopów na stronie.

MapReduce dla bazy MongoDB nazy uruchomić w następujący sposób:
``` bash
  $ mongo mongoMapReduce.js --shell
```
Wyniki mp sprawdzamy przy pomocy:
``` js
db.res.find()
```
Wyniki:
```json
{
	"result" : "res",
	"timeMillis" : 116,
	"counts" : {
		"input" : 101,
		"emit" : 101,
		"output" : 21
	},
	"ok" : 1,
}
> db.res.find()
{ "_id" : 1, "value" : 47 }
{ "_id" : 2, "value" : 14 }
{ "_id" : 3, "value" : 5 }
{ "_id" : 4, "value" : 8 }
{ "_id" : 5, "value" : 6 }
{ "_id" : 6, "value" : 4 }
{ "_id" : 7, "value" : 3 }
{ "_id" : 20, "value" : 1 }
{ "_id" : 21, "value" : 1 }
has more

```

Z kolei MapReduce dla bazy CouchDB uruchamiamy przy pomocy node
``` bash
  $ node couchMapReduce.js 
```

Wyniki dla couchMapReduce wyglądają następująco:
```
1: 47
2: 14
3: 5
4: 8
5: 6
6: 4
7: 3
20: 1
21: 1
40: 1
[...]
```
Link mający 1 digg wystąpił 47 razy, a mający 2 diggi wystąpił 14 razy, itd.
