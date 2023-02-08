function check_mem {
	space=`df / | awk 'NR==2{print $4}'`
	if [[ $space -lt 1000000 ]]
	then
		echo "Out of memory"
		exit 1	
	fi
}
