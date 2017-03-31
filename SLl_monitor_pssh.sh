# dump it all in tmp_file
#RANDOMRANDOAMSDA*#FHQP(QHWF
tmp_ndlist=/tmp/$RANDOM\.nd_list_sll
sinfo --Node | tail -n +2 | grep -v 'down' | awk '{print $1}' | sort -u >> $tmp_ndlist

# get 
pssh_out=`pssh -h $tmp_ndlist -i 'ps aux | grep SLl | grep -v grep'`
rm $tmp_ndlist

# Only success
echo -e "$pssh_out" | sed '/FAILURE/d'


