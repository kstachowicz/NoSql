#!/bin/bash
#import technology diggs from digg.com to mongodb

mongoimport --host localhost --db test --collection diggs --type json --file technology.json
