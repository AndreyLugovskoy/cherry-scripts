# make a random file for node list
tmp_ndlist=/tmp/$RANDOM\.nd_list_sll

# make a list of nodes, exclude 'down' nodes
sinfo --Node | tail -n +2 | grep -v 'down' | awk '{print $1}' | sort -u >> $tmp_ndlist

echo 'Obtaining the data on swap usage.'

# -i show outout # -X -T to prevent complaining about terminal
# -I read commands from input # < /PATH/TO/SUBSCRIPT
pssh_out=`pssh -i -X -T -h $tmp_ndlist -I < /home/andrey/scripts/slurm/slurm_around/swapthings.sh`

# global header
echo  'Job_name User  Node  Swap,Gb'

# do something with output (clean, sort, mulitply by e^x, whatever)
echo -e "$pssh_out" | sed '/FAILURE/d' | sed '/SUCCESS/d'

