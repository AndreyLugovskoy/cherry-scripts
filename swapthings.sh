#!/bin/bash


sw=$(free -g | tail -1  | awk '{print $3}')
us=$(squeue -h -w `hostname` | awk '{ print $3 "\t" $4 }')

if [ $sw -ne 0 ]; then echo $us `hostname` $sw ; fi
