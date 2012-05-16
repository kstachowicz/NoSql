var cradle = require("cradle")
, util = require("util");


var dbName = "test";

var connection = new(cradle.Connection)("localhost", 5984);

var db = connection.database(dbName);

db.save('_design/mr', {
      diggs: {
          map: 

function(doc)
{
  emit(doc.diggs, 1);
},
      
       reduce:
function(key, values, rereduce) {
	return sum(values);
}

}}, function (err, res) {

  db.view('mr/diggs', { group: true }, function (err, res) {
      var resok = JSON.parse(res);
      resok.forEach(function (row) {
	        console.log("%s: %s", row.key, row.value);
      });
  });

});
