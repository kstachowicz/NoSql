m = function() {
	emit(this.diggs, 1);
};

r = function(key, values) {
	var sum = 0;
	values.forEach(function(count) {
		sum += count;
	});
	return sum;
};	 

result = db.links8.mapReduce(m, r, {out: "res"});
printjson(result);
