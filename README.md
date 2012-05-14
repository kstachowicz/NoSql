NoSql
=====

Dane
------------
Dane wykorzystywane w projekcie zostały pobrane z serwisu digg.com i zawierają listę 100 ostatnich wpisów (dane z 13.05.2012) nt. technologi.

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
  $ ./ mongo2couch.sh http://localhost:5984 test diggs
```
Gdzie http://localhost:5984 - adres bazy wraz z portem, test- nazwa bazy, diggs- nazwa kolekcji w MongoDB


map reduce
------------
MapReduce dla bazy MongoDB nazy uruchomić w następujący sposób:
``` bash
  $ mongo mongoMapReduce.js --shell
```
Wynik działanie sprawdzamy dzięki:
``` js
db.diggs.find()
```

Z kolei MapReduce dla bazy CouchDB wymaga zainstalowanych modułów `cradle` i `util`
``` bash
  $ node couchMapReduce.js 
```

