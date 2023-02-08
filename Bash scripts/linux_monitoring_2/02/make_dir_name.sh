function make_dir_name {
	n_dir_ch=${#dir_ch}
	average=$((248/$n_dir_ch))
	for (( i = 0; i < $n_dir_ch; i++ ))
	do
		rand_y=`random "1" "$average"`
		for (( y = 0; y < $rand_y; y++ ))
		do	
			d_result="${d_result}${dir_ch:$i:1}"
		done
	done
	if [[ ${#d_result} -lt 4 ]]
	then
		make_dir_name
	fi
	echo ${d_result}_${date}
}
