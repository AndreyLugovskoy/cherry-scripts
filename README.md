# Slurm scripts and tools.

## TODODODODO

* Make a list of fail states of processes
* Make DRUGS a list of executables {vasp,vasp-half,p{w,h}.x, and so on} 
that users usually run (ask them or what?)

## SLl_monitor.sh

Grep and echo all the processes with Sll stat on every node from slurm nodelist.

## SLl_monitor_pssh.sh

Prototype of SLl_monitor using COCAINE parallel shh, much faster no shpansy formating though.
Shits in your /tmp/

## swap_monitor.sh

Finds out, if the swap is not free on node,
and finds who occupies the node.

## swap_monitor_pssh.sh AND swapthings.sh
*this is potentially a template for further scripts

pssh verison of previous entry, also outputs job name.
Shits in your /tmp/.
Finds out, if the swap is not free on node
and finds out which and whose job is running
on node.

Warning: output will look wierd, if node is free but swap is occupied.

swapthings.sh contains the commands to be run
on node

Uses squeue instead of ssact unlike swap_func.sh 
