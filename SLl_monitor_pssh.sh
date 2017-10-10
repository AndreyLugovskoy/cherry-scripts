# dump it all in tmp_file
#RANDOMRANDOAMSDA*#FHQP(QHWF
tmp_ndlist=/tmp/$RANDOM\.nd_list_sll
sinfo --Node | tail -n +2 | grep -v 'down' | awk '{print $1}' | sort -u >> $tmp_ndlist

#ps aux | grep SLl | grep -v grep

# TODO: make argument parser
# \(Z\|S\|SLl\|D...\)  \( opener, \) closer, \| delimiter
# I wish it was python

# get 
pssh_out=`pssh -h $tmp_ndlist -i "ps aux | grep '\([^\s]*\s\)\{7\}\(Z\|SLl\|S\)\s' | grep -v grep | grep 'vasp\|ph\|pw' | grep -v '\(mpirun\|mpiexec\)'"`
rm $tmp_ndlist


# Only success
echo -e "$pssh_out" | sed '/FAILURE/d'


