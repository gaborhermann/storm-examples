#!/bin/bash
echo REMOVING:
ssh storm@dell150.ilab.sztaki.hu '
for j in {101..142} 144 145;
do
	echo -n $j,
   	$(ssh dell$j "rm storm-dist/logs/counter/*");
done

echo 150
rm storm-dist/logs/counter/*.
rm storm-dist/logs/all_tests/counter/*
'