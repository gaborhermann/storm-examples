#!/bin/bash
toDir=$1
echo COPYING:
if [ -d "${toDir}" ] ; then
	ssh storm@dell150.ilab.sztaki.hu '
	for j in {101..142} 144 145;
	do
		echo -n $j,;
		for i in $(ssh dell$j "ls storm-dist/logs/counter/");
			do scp storm@dell$j:storm-dist/logs/counter/$i storm-dist/logs/all_tests/counter/$i-$j.csv;
		done
	done
	for i in $(ls storm-dist/logs/counter/);
		do cp storm-dist/logs/counter/$i storm-dist/logs/all_tests/counter/$i-150.csv;
	done
	'
	echo 150
	scp storm@dell150.ilab.sztaki.hu:storm-dist/logs/all_tests/counter/* $toDir/counter/
else
	echo "USAGE:"
	echo "run <directory>"
fi