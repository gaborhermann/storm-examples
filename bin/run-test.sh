#!/bin/bash
toDir=$1
if [ -d "${toDir}" ] ; then
	for testParams in ${@:2};
	do
		echo "removing files"
		./remove-files.sh

		paramsWithSpace="${testParams//_/ }"

		rm -r $toDir/$testParams/*;
		mkdir $toDir/$testParams;
		mkdir $toDir/$testParams/counter;

		ssh -n storm@dell150.ilab.sztaki.hu "./storm-dist/bin/storm jar storm-dist/lib/storm-examples-0.1-SNAPSHOT.jar hu.sztaki.storm.examples.wordcount.WordCountTopology ${paramsWithSpace}"
		
		echo "waiting..."
		sleep 1m
		echo "1 min"
		sleep 1m
		echo "2 min"
		sleep 1m
		echo "3 min"
		sleep 1m
		echo "4 min"
		sleep 1m
		echo "5 min"
		echo "copying"
		./copy-files.sh $toDir/$testParams
	done
else
	echo "USAGE:"
	echo "run <directory> <test params separated by _>"
fi