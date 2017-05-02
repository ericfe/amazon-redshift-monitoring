#!/bin/bash

ver=1.2


if [ ! -d dist ]; then
	mkdir dist
fi

ARCHIVE=redshift-advanced-monitoring-$ver.zip

# add required dependencies
if [ ! -d lib/pg8000 ]; then
	pip install pg8000 -t lib
fi

# bin the old zipfile
if [ -f dist/$ARCHIVE ]; then
	echo "Removed existing Archive ../dist/$ARCHIVE"
	rm -Rf dist/$ARCHIVE
fi

cmd="zip -r dist/$ARCHIVE lambda_function.py monitoring-queries.json user-queries.json lib/"

if [ $# -eq 1 ]; then
	cmd=`echo $cmd`
fi

echo $cmd

eval $cmd

echo "Generated new Lambda Archive dist/$ARCHIVE"