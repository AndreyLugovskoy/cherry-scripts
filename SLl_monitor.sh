#!/bin/bash

# Get names of all nodes but the ones, that down using sinfo:
node_list=`sinfo --Node | tail -n +2 | grep -v 'down' | awk '{print $1}' | sort -u`

echo -e "Seatch for sleeping processes on running nodes:\n"

for node in $node_list 
do
	# grep for processes with SLl STAT is ps, then exclude grep process from the list:
	sll=`ssh $node 'ps aux | grep SLl | grep -v grep'`
	echo -ne "Working with $node\r"
	
	# this shoulde be a function:
		
	#report, if grep returned something
	if [ -n "$sll" ]
	then
		echo ======================$node========================
		echo "$sll"
		echo ======================next========================

	# sll is an empty string, report the clean node
	else
		echo -ne "$node has no SLl processes\r"
	fi
done

echo -e "\n"
echo 'Done'


