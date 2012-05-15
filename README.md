NoSql
=====

Dane
------------
Dane wykorzystywane w projekcie zostały pobrane z serwisu digg.com i zawierają listę 100 ostatnich wpisów (dane z 13.05.2012) nt. technologii.

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
Funkcja MapReduce zwraca statystyki dotyczące ilości powtórzeń liczby wykopów na stronie.

MapReduce dla bazy MongoDB nazy uruchomić w następujący sposób:
``` bash
  $ mongo mongoMapReduce.js --shell
```
Wynik działanie sprawdzamy dzięki:
``` js
db.res.find()
```

Z kolei MapReduce dla bazy CouchDB uruchamiamy przy pomocy node
``` bash
  $ node couchMapReduce.js 
```

Wyniki MapReduce wyglądają następująco:
```
1: 47
2: 13
3: 5
4: 8
5: 6
6: 3
7: 3
20: 1
21: 1
40: 1
41: 1
58: 1
60: 1
65: 1
72: 1
73: 1
74: 1
75: 1
76: 1
95: 1
383: 1
```
Link mający 1 digg wystąpił 1 raz, a mający 2 diggi wystąpił 13 razy, itd.
