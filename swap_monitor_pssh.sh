# make a random file for node list
tmp_ndlist=/tmp/$RANDOM\.nd_list_sll

# make a list of nodes, exclude 'down' nodes
sinfo --Node | tail -n +2 | grep -v 'down' | awk '{print $1}' | sort -u >> $tmp_ndlist

echo 'Obtaining the data on swap usage..'

# -i show outout # -X -T to prevent complaining about terminal
# -I read commands from input # < /PATH/TO/SUBSCRIPT
pssh_out=`pssh -i -X -T -h $tmp_ndlist -I < /home/andrey/scripts/slurm/slurm_around/swapthings.sh`


bb=$(tput bold setaf 4)
normal=$(tput sgr0)

# global header

#TODO: add nothing to report case

printf '%15.10s %15.10s %15.10s %15.10s\n'  "Job_name" 'User'  'Node'  'Swap,Gb'


pssh_out=`echo -e "$pssh_out" | sed '/FAILURE/d' | sed '/SUCCESS/d'`

# do something with output (clean, sort, mulitply by e^x, whatever)
printf '%15.10s %15.10s %15.10s %15.10s\n' $pssh_out; 

